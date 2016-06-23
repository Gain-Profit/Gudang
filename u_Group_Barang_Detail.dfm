object FGroupBarangDetail: TFGroupBarangDetail
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Detail Group Barang'
  ClientHeight = 441
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TcxGrid
    Left = 0
    Top = 97
    Width = 680
    Height = 303
    Align = alClient
    TabOrder = 2
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
        Caption = 'Kode'
        DataBinding.FieldName = 'id_group'
        Width = 66
      end
      object vwDeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        Width = 295
      end
      object vwBarcode: TcxGridDBColumn
        Caption = 'Barcode'
        DataBinding.FieldName = 'deskripsi'
        Width = 105
      end
      object vwQty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Integer'
        HeaderAlignmentHorz = taCenter
        Width = 104
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object pnlTop: TsPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 97
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      680
      97)
    object sLabel1: TsLabel
      Left = 8
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Kode Group'
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 32
      Width = 75
      Height = 13
      Caption = 'Deskripsi Group'
    end
    object sBevel1: TsBevel
      Left = 1
      Top = 64
      Width = 678
      Height = 32
      Align = alBottom
    end
    object sb_cari: TsSpeedButton
      Tag = 9
      Left = 652
      Top = 70
      Width = 24
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 0
      Images = dm.gambar
    end
    object edKodeGroup: TsEdit
      Left = 96
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 0
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edDeskripsiGroup: TsEdit
      Left = 96
      Top = 32
      Width = 577
      Height = 21
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object ed_code: TsEdit
      Left = 8
      Top = 70
      Width = 640
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      SkinData.CustomColor = True
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object pnlBottom: TsPanel
    Left = 0
    Top = 400
    Width = 680
    Height = 41
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object btnSimpan: TsButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Simpan'
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object btnKeluar: TsButton
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = '&keluar'
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
    object btnBaru: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Group Baru'
      TabOrder = 2
      OnClick = btnBaruClick
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
    Left = 8
    Top = 120
  end
end
