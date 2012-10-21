object Form1: TForm1
  Left = 192
  Top = 114
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid: TStringGrid
    Left = 0
    Top = 0
    Width = 862
    Height = 606
    Align = alClient
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDrawCell = StringGridDrawCell
    OnKeyPress = StringGridKeyPress
    OnMouseDown = StringGridMouseDown
    OnSelectCell = StringGridSelectCell
  end
  object PopupMenu1: TPopupMenu
    Left = 520
    Top = 224
    object N1: TMenuItem
      Caption = #1059#1085#1080#1095#1090#1086#1078#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1089#1090#1088#1086#1082#1091
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1087#1086#1089#1083#1077' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1081
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1059#1085#1080#1095#1090#1086#1078#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1081' '#1089#1090#1086#1083#1073#1080#1082
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1087#1086#1089#1083#1077' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086
      OnClick = N4Click
    end
  end
end
