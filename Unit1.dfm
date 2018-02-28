object Form1: TForm1
  Left = 361
  Top = 143
  Width = 500
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Manajemen Bus'
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lblDaftarBusTersedia: TLabel
    Left = 24
    Top = 16
    Width = 73
    Height = 20
    Caption = 'Daftar Bus'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblBusPlate: TLabel
    Left = 184
    Top = 40
    Width = 60
    Height = 16
    Alignment = taRightJustify
    Caption = 'Nomor polisi'
  end
  object lblBusNo: TLabel
    Left = 188
    Top = 72
    Width = 52
    Height = 16
    Alignment = taRightJustify
    Caption = 'Nomor bus'
  end
  object lblDriver: TLabel
    Left = 187
    Top = 128
    Width = 55
    Height = 16
    Alignment = taRightJustify
    Caption = 'Nama supir'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 447
    Width = 492
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object lstAvailBuses: TListBox
    Left = 24
    Top = 40
    Width = 145
    Height = 185
    ItemHeight = 16
    PopupMenu = mnBus
    TabOrder = 1
    OnClick = lstAvailBusesClick
  end
  object grpPilih: TRadioGroup
    Left = 24
    Top = 232
    Width = 153
    Height = 73
    ItemIndex = 1
    Items.Strings = (
      'Tersedia'
      'Semuanya')
    TabOrder = 2
    OnClick = grpPilihClick
  end
  object dbBusPlate: TDBEdit
    Left = 248
    Top = 40
    Width = 121
    Height = 24
    DataField = 'busplate'
    DataSource = dsBuses
    TabOrder = 3
  end
  object dbBusNo: TDBEdit
    Left = 248
    Top = 72
    Width = 89
    Height = 24
    DataField = 'busno'
    DataSource = dsBuses
    TabOrder = 4
  end
  object chkAvail: TDBCheckBox
    Left = 248
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Tersedia'
    DataField = 'avail'
    DataSource = dsBuses
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object btnSimpan: TButton
    Left = 248
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = btnSimpanClick
  end
  object dbDriver: TDBLookupComboBox
    Left = 248
    Top = 128
    Width = 185
    Height = 24
    DataField = 'drivenby'
    DataSource = dsBuses
    KeyField = 'driverid'
    ListField = 'drivername'
    ListSource = dsDrivers
    TabOrder = 7
  end
  object btnDelDriver: TButton
    Left = 432
    Top = 126
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 8
    OnClick = btnDelDriverClick
  end
  object conn1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\buses.mdb;Persist' +
      ' Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    AfterConnect = conn1AfterConnect
    Left = 192
    Top = 312
  end
  object qryBuses: TADOQuery
    Connection = conn1
    CursorType = ctStatic
    AfterOpen = qryBusesAfterOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tbBuses')
    Left = 248
    Top = 312
  end
  object dsBuses: TDataSource
    DataSet = qryBuses
    Left = 296
    Top = 312
  end
  object qryBus: TADOQuery
    Connection = conn1
    DataSource = dsBuses
    Parameters = <>
    Left = 256
    Top = 352
  end
  object qryDrivers: TADOQuery
    Connection = conn1
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tbDrivers')
    Left = 264
    Top = 392
  end
  object dsDrivers: TDataSource
    DataSet = qryDrivers
    Left = 296
    Top = 392
  end
  object mnBus: TPopupMenu
    Left = 120
    Top = 136
    object ambahbus1: TMenuItem
      Caption = 'Tambah bus'
      OnClick = ambahbus1Click
    end
  end
end
