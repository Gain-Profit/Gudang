object FGroupBarang: TFGroupBarang
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = 'Group Barang'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 530
    Top = 0
    Width = 150
    Height = 442
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sb_2: TsSpeedButton
      Left = 0
      Top = 90
      Width = 150
      Height = 90
      Cursor = crHandPoint
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
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 8
      Images = dm.image
      Reflected = True
    end
    object sb_1: TsSpeedButton
      Left = 0
      Top = 0
      Width = 150
      Height = 90
      Cursor = crHandPoint
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
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 7
      Images = dm.image
      Reflected = True
    end
    object p1: TsPanel
      Left = 0
      Top = 328
      Width = 150
      Height = 114
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object btnBaru: TsButton
        Left = 8
        Top = 8
        Width = 137
        Height = 25
        Caption = 'Baru'
        TabOrder = 0
        SkinData.SkinSection = 'BUTTON'
      end
      object btnEdit: TsButton
        Left = 8
        Top = 40
        Width = 137
        Height = 25
        Caption = 'Edit'
        TabOrder = 1
        SkinData.SkinSection = 'BUTTON'
      end
      object btnHapus: TsButton
        Left = 8
        Top = 72
        Width = 137
        Height = 25
        Caption = 'Hapus'
        TabOrder = 2
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 530
    Height = 442
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object t_data: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
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
        Width = 67
      end
      object tvDeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi Group'
        Width = 303
      end
      object tvJumlahItem: TcxGridDBColumn
        Caption = 'Jumlah Item'
        Width = 95
      end
      object tvJumlahQty: TcxGridDBColumn
        Caption = 'Jumlah Qty'
        Width = 96
      end
      object tvTotalHarga: TcxGridDBColumn
        Caption = 'Harga Total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Width = 123
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 24
  end
end
