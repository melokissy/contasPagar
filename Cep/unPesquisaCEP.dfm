object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pesquisa de CEP'
  ClientHeight = 221
  ClientWidth = 506
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
    Left = 32
    Top = 24
    Width = 74
    Height = 16
    Caption = 'Digite o CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 288
    Top = 21
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 392
    Top = 21
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = -8
    Top = 72
    Width = 513
    Height = 153
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtCEP: TEdit
    Left = 112
    Top = 23
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object dsCEPPesquisa: TDataSource
    Left = 440
    Top = 120
  end
end
