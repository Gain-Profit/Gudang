object FGroupBarang: TFGroupBarang
  Left = 0
  Top = 0
  Caption = 'Group Barang'
  ClientHeight = 425
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 591
    Top = 0
    Width = 150
    Height = 425
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    ExplicitLeft = -30
    ExplicitHeight = 0
    object sb_2: TsSpeedButton
      Left = 0
      Top = 90
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Refresh'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_2Click
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.image
      ImageIndex = 8
      Reflected = True
    end
    object sb_1: TsSpeedButton
      Left = 0
      Top = 0
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Selesai'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_1Click
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.image
      ImageIndex = 7
      Reflected = True
    end
    object p1: TsPanel
      Left = 0
      Top = 311
      Width = 150
      Height = 114
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      ExplicitTop = -114
      object btnBaru: TsButton
        Left = 8
        Top = 8
        Width = 137
        Height = 25
        Caption = 'Baru'
        TabOrder = 0
        OnClick = btnBaruClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btnEdit: TsButton
        Left = 8
        Top = 40
        Width = 137
        Height = 25
        Caption = 'Edit'
        TabOrder = 1
        OnClick = btnEditClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btnHapus: TsButton
        Left = 8
        Top = 72
        Width = 137
        Height = 25
        Caption = 'Hapus'
        TabOrder = 2
        OnClick = btnHapusClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 591
    Height = 425
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    ExplicitWidth = 530
    ExplicitHeight = 0
    object t_data: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = dsGroupBarang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object tvKodeGroup: TcxGridDBColumn
        Caption = 'Kode Group'
        DataBinding.FieldName = 'id_group'
        Width = 67
      end
      object tvDeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi Group'
        DataBinding.FieldName = 'deskripsi'
        Width = 303
      end
      object tvJumlahItem: TcxGridDBColumn
        Caption = 'Jumlah Item'
        DataBinding.FieldName = 'jumlah_item'
        Width = 95
      end
      object tvJumlahQty: TcxGridDBColumn
        Caption = 'Jumlah Qty'
        DataBinding.FieldName = 'jumlah_qty'
        Width = 96
      end
      object tvDiskon: TcxGridDBColumn
        DataBinding.FieldName = 'Diskon'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        Properties.EditFormat = '###,###,##0.00;(###,###,##0.00);0.00'
        Width = 96
      end
      object tvJenis: TcxGridDBColumn
        DataBinding.FieldName = 'Jenis'
        Width = 50
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 24
  end
  object QGroupBarang: TMyQuery
    Connection = dm.db_conn
    Left = 56
    Top = 24
  end
  object dsGroupBarang: TDataSource
    DataSet = QGroupBarang
    Left = 88
    Top = 24
  end
end
