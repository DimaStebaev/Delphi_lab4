unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus;

type
  TForm1 = class(TForm)
    StringGrid: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridKeyPress(Sender: TObject; var Key: Char);
    procedure StringGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Recalc();
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    mas: array of array of double;
    lastRBC: TGridCoord;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Recalc;
var
table: Tstringgrid;
i, j: integer;
sum, x: double;
begin
table := stringgrid;
for i:=table.FixedRows to table.RowCount-2 do
begin
    sum := 0;
    for j:=table.FixedCols to table.RowCount-2 do
      if tryStrToFloat(Table.Cells[j,i], x) then
        sum:=sum+x
      else Table.Cells[j,i] := '0';
    table.Cells[table.ColCount-1, i] := FloatToStr(sum);
end;
for j:=Table.FixedCols to table.ColCount-1 do
begin
    sum:=0;
    for i:=table.FixedRows to table.RowCount-2 do
      if tryStrToFloat(Table.Cells[j,i], x) then
        sum:=sum+x
      else Table.Cells[j,i] := '0';
    table.Cells[j, table.RowCount-1] := FloatToStr(sum);
end;
end;

procedure TForm1.StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if ( Acol>=stringgrid.FixedCols)and (ARow >=stringgrid.FixedRows) and
  ((Acol = stringgrid.ColCount -1) or
   (Arow = stringgrid.rowCount -1)) then
begin
  StringGrid.Canvas.Brush.Color := clGray;
  StringGrid.Canvas.Font.Color := clBlack;
  StringGrid.Canvas.FillRect(Rect);
  StringGrid.Canvas.TextOut(Rect.Left, Rect.Top, StringGrid.Cells[ACol, ARow]);
end;
end;

procedure TForm1.StringGridKeyPress(Sender: TObject; var Key: Char);
var
r,c: integer;
begin
r := stringgrid.Row;
c := stringgrid.Col;
if (r<0) or (c<0) then exit;
if key = char(vk_return) then
begin
  Recalc;
  exit;
end;
if (key in [',','.']) then key:=decimalseparator;
if not (key in ['0'..'9', decimalseparator, '-', char(vk_Back)]) then key:=#0
else if (key = DecimalSeparator) and (pos(decimalseparator, stringgrid.Cells[c,r])>0) then key:=#0
else if (key = '-') and (pos('-', stringgrid.Cells[c,r])>0) then key:=#0;
end;

procedure TForm1.StringGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
Recalc;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Recalc;
end;

procedure TForm1.N1Click(Sender: TObject);
var
i, j: integer;
begin
if (lastRBC.X >=0) and (lastRBC.Y>=1) and (lastRBC.Y<stringgrid.RowCount-1) then
begin
  for i:=lastRBC.Y to stringgrid.RowCount-2 do
    for j:=0 to stringgrid.ColCount-1 do
      stringgrid.Cells[j,i] := stringgrid.Cells[j,i+1];
  stringgrid.RowCount:=stringgrid.RowCount-1;
end;
end;

procedure TForm1.StringGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button = mbRight then
  lastRBC := stringgrid.MouseCoord(x,y);
end;

procedure TForm1.N3Click(Sender: TObject);
var
i, j: integer;
begin
if (lastRBC.X >=1) and (lastRBC.Y>=0) and (lastRBC.X<stringgrid.ColCount-1) then
begin
  for i:=0 to stringgrid.RowCount-1 do
    for j:=lastRBC.X to stringgrid.ColCount-2 do
      stringgrid.Cells[j,i] := stringgrid.Cells[j+1,i];
  stringgrid.ColCount:=stringgrid.ColCount-1;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
i, j: integer;
begin
if stringgrid.RowCount = 11 then
begin
    messagedlg('Максимальное число строк - 11', mtInformation, [mbok], 0);
    exit;
end;
if (lastRBC.X >=0) and (lastRBC.Y>=0)and (lastRBC.Y<stringgrid.RowCount-1) then
begin
  stringgrid.RowCount:=stringgrid.RowCount+1;
  for i:=stringgrid.RowCount-2 downto lastRBC.Y+1 do
    for j:=0 to stringgrid.ColCount-1 do
      stringgrid.Cells[j,i+1] := stringgrid.Cells[j,i];
  for j:=stringgrid.FixedCols to stringgrid.ColCount-1 do
      stringgrid.Cells[j,lastRBC.Y+1] := '0';
end;
end;

procedure TForm1.N4Click(Sender: TObject);
var
i, j: integer;
begin
if stringgrid.ColCount = 11 then
begin
    messagedlg('Максимальное число столбцов - 11', mtInformation, [mbok], 0);
    exit;
end;
if (lastRBC.X >=0) and (lastRBC.Y>=0)and (lastRBC.X<stringgrid.ColCount-1) then
begin
  stringgrid.ColCount:=stringgrid.ColCount+1;
  for i:=stringgrid.ColCount-2 downto lastRBC.X+1 do
    for j:=0 to stringgrid.RowCount-1 do
      stringgrid.Cells[i+1,j] := stringgrid.Cells[i,j];
  for j:=stringgrid.FixedRows to stringgrid.RowCount-1 do
      stringgrid.Cells[lastRBC.X+1,j] := '0';
end;
end;

end.
