unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TForm1 = class(TForm)
    StringGrid: TStringGrid;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

procedure TForm1.StringGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
showmessage('event');
end;

end.
