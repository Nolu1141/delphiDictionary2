object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 530
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 35
    Width = 35
    Height = 13
    Caption = #1057#1083#1086#1074#1086':'
  end
  object Label2: TLabel
    Left = 256
    Top = 35
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object ButtonFindWord: TButton
    Left = 56
    Top = 88
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1089#1083#1086#1074#1086
    TabOrder = 0
    OnClick = ButtonFindWordClick
  end
  object FindWithIp: TButton
    Left = 56
    Top = 128
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1087#1086' '#1080#1087
    TabOrder = 1
    OnClick = FindWithIpClick
  end
  object Edit1: TEdit
    Left = 56
    Top = 32
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object DeleteWord: TButton
    Left = 358
    Top = 168
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = DeleteWordClick
  end
  object Edit2: TEdit
    Left = 315
    Top = 32
    Width = 313
    Height = 21
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 272
    Top = 256
    Width = 377
    Height = 249
    Lines.Strings = (
      '')
    TabOrder = 5
  end
  object AddWord: TButton
    Left = 256
    Top = 168
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = AddWordClick
  end
  object FindWithPart: TButton
    Left = 56
    Top = 168
    Width = 137
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1087#1086' '#1095#1072#1089#1090#1080' '#1089#1083#1086#1074#1072
    TabOrder = 7
    OnClick = FindWithPartClick
  end
  object GetAllWords: TButton
    Left = 56
    Top = 208
    Width = 129
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1074#1089#1077' '#1089#1083#1086#1074#1072
    TabOrder = 8
    OnClick = GetAllWordsClick
  end
  object ListBox1: TListBox
    Left = 56
    Top = 256
    Width = 177
    Height = 249
    ItemHeight = 13
    Sorted = True
    TabOrder = 9
    OnClick = ListBox1Click
  end
  object Button1: TButton
    Left = 256
    Top = 88
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 10
    OnClick = Button1Click
  end
  object EditButton: TButton
    Left = 256
    Top = 208
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 11
    OnClick = EditButtonClick
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 600
    Top = 64
  end
end
