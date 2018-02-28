object fNewBus: TfNewBus
  Left = 560
  Top = 348
  BorderStyle = bsDialog
  Caption = 'Tambah Bus'
  ClientHeight = 164
  ClientWidth = 281
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object lblNewBus: TLabel
    Left = 16
    Top = 16
    Width = 149
    Height = 18
    Caption = 'Masukkan plat nomor bus'
  end
  object dbBus: TDBEdit
    Left = 16
    Top = 40
    Width = 249
    Height = 26
    DataField = 'busplate'
    DataSource = Form1.dsBuses
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 40
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 168
    Top = 88
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
