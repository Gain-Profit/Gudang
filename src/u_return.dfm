object F_return: TF_return
  Left = 0
  Top = 0
  Caption = 'Return (New)'
  ClientHeight = 411
  ClientWidth = 854
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 870
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panel4: TsPanel
    Left = 704
    Top = 0
    Width = 150
    Height = 411
    Align = alRight
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sSpeedButton18: TsSpeedButton
      Left = 1
      Top = 1
      Width = 148
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
      OnClick = sSpeedButton18Click
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.image
      ImageIndex = 7
      Reflected = True
    end
    object sPanel2: TsPanel
      Left = 1
      Top = 336
      Width = 148
      Height = 74
      Align = alBottom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object b_simpan_file: TsButton
        Left = 8
        Top = 9
        Width = 129
        Height = 25
        Caption = 'Simpan &File'
        TabOrder = 0
        OnClick = b_simpan_fileClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_load: TsButton
        Left = 8
        Top = 41
        Width = 129
        Height = 25
        Caption = '&Load File'
        TabOrder = 1
        OnClick = b_loadClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object spnl1: TsPanel
      Left = 1
      Top = 91
      Width = 148
      Height = 97
      Align = alTop
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object b_print: TsButton
        Left = 8
        Top = 64
        Width = 129
        Height = 25
        Caption = '&Print Preview'
        Enabled = False
        TabOrder = 2
        OnClick = b_printClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_new: TsButton
        Left = 8
        Top = 34
        Width = 129
        Height = 25
        Caption = '&Baru'
        TabOrder = 1
        OnClick = b_newClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_simpan: TsButton
        Left = 8
        Top = 4
        Width = 129
        Height = 25
        Caption = '&Simpan'
        TabOrder = 0
        OnClick = b_simpanClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 411
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Grid: TcxGrid
      Left = 1
      Top = 161
      Width = 702
      Height = 177
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TableView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Append.Visible = False
        OnFocusedRecordChanged = TableViewFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total'
            Kind = skCount
            Column = view_PID
            DisplayText = 'Total'
          end
          item
            Format = '0 Item Barang'
            Kind = skCount
            Column = view_deskripsi
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = t_view_Qty
          end
          item
            Format = '###,###,##0.00;(###,###,##0.00);0.00'
            Kind = skSum
            OnGetText = TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
            Column = view_total_harga
          end
          item
            Format = '###,###,##0.00;(###,###,##0.00);0.00'
            Kind = skSum
            OnGetText = TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
            Column = t_view_diskon
          end
          item
            Format = '###,###,##0.00;(###,###,##0.00);0.00'
            Kind = skSum
            Column = view_harga
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Belum ada Data>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 10
        Styles.Inactive = dm.cxstyl1
        object view_PID: TcxGridColumn
          Caption = 'PID'
          GroupSummaryAlignment = taCenter
          Options.Editing = False
          Width = 58
        end
        object view_deskripsi: TcxGridColumn
          Caption = 'Deskripsi'
          GroupSummaryAlignment = taCenter
          Options.Editing = False
          Width = 232
        end
        object t_view_Qty: TcxGridColumn
          Caption = 'Qty'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Properties.MinValue = 1.000000000000000000
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Options.IncSearch = False
          Width = 58
        end
        object view_harga: TcxGridColumn
          Caption = 'Harga'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          GroupSummaryAlignment = taRightJustify
          HeaderAlignmentHorz = taRightJustify
        end
        object view_total_harga: TcxGridColumn
          Caption = 'Total Harga'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          GroupSummaryAlignment = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.IncSearch = False
          Width = 81
        end
        object t_view_diskon: TcxGridColumn
          Caption = 'Diskon'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          GroupSummaryAlignment = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.IncSearch = False
          Width = 83
        end
        object t_view_barcode: TcxGridColumn
          Caption = 'Barcode'
          Visible = False
          Options.Editing = False
        end
      end
      object Level: TcxGridLevel
        GridView = TableView
      end
    end
    object panel1: TsPanel
      Left = 1
      Top = 1
      Width = 702
      Height = 73
      Align = alTop
      Enabled = False
      TabOrder = 3
      SkinData.SkinSection = 'PANEL'
      object Mm_nama: TsMemo
        Left = 1
        Top = 1
        Width = 320
        Height = 71
        Align = alClient
        Alignment = taCenter
        Color = 15263976
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
      end
      object ce_harga: TsCurrencyEdit
        Left = 321
        Top = 1
        Width = 380
        Height = 71
        Align = alRight
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 15263976
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -59
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 3
        DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
      end
    end
    object panel2: TsPanel
      Left = 1
      Top = 74
      Width = 702
      Height = 87
      Align = alTop
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        702
        87)
      object sLabel6: TsLabel
        Left = 481
        Top = 1
        Width = 220
        Height = 54
        Align = alRight
        Alignment = taRightJustify
        Caption = 'RETURN'
        Constraints.MinWidth = 220
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'ARIAL'
        Font.Style = []
        ExplicitLeft = 616
        ExplicitHeight = 60
      end
      object sBevel1: TsBevel
        Left = 1
        Top = 55
        Width = 700
        Height = 31
        Align = alBottom
        ExplicitWidth = 835
      end
      object sLabel1: TsLabel
        Left = 232
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Faktur Return'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel3: TsLabel
        Left = 8
        Top = 64
        Width = 39
        Height = 13
        Caption = 'Tanggal'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel4: TsLabel
        Left = 8
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Supplier'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sb_supplier: TsSpeedButton
        Tag = 9
        Left = 200
        Top = 6
        Width = 24
        Height = 21
        OnClick = sb_supplierClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = dm.gambar
        ImageIndex = 0
      end
      object sb_cari: TsSpeedButton
        Tag = 9
        Left = 228
        Top = 62
        Width = 24
        Height = 21
        OnClick = sb_cariClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = dm.gambar
        ImageIndex = 0
      end
      object L_supp: TsLabel
        Left = 56
        Top = 32
        Width = 69
        Height = 13
        Caption = 'Nama Supplier'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel5: TsLabel
        Left = 232
        Top = 32
        Width = 70
        Height = 13
        Caption = 'Faktur Receipt'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object ed_no_faktur: TsEdit
        Left = 312
        Top = 8
        Width = 169
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = ed_no_fakturChange
        OnKeyDown = ed_no_fakturKeyDown
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object ed_tgl: TsDateEdit
        Left = 56
        Top = 62
        Width = 169
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DefaultToday = True
      end
      object ed_supplier: TsEdit
        Left = 56
        Top = 6
        Width = 137
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = ed_supplierChange
        OnKeyDown = ed_supplierKeyDown
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object ed_code: TsEdit
        Left = 256
        Top = 62
        Width = 442
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyDown = ed_codeKeyDown
        OnKeyPress = ed_codeKeyPress
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object ed_fak_receipt: TsEdit
        Left = 312
        Top = 32
        Width = 169
        Height = 21
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = ed_fak_receiptChange
        OnKeyPress = ed_fak_receiptKeyPress
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object b_auto: TsButton
        Left = 488
        Top = 8
        Width = 73
        Height = 21
        Caption = '&Auto Kode'
        TabOrder = 2
        OnClick = b_autoClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object panel3: TsPanel
      Left = 1
      Top = 338
      Width = 702
      Height = 72
      Align = alBottom
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object sLabel2: TsLabel
        Left = 8
        Top = 4
        Width = 46
        Height = 13
        Caption = 'Sub Total'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel7: TsLabel
        Left = 8
        Top = 34
        Width = 33
        Height = 13
        Caption = 'Diskon'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel9: TsLabel
        Left = 120
        Top = 35
        Width = 8
        Height = 13
        Caption = '%'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object l_1: TsLabel
        Left = 240
        Top = 4
        Width = 22
        Height = 13
        Caption = 'Ket :'
      end
      object l_2: TsLabel
        Left = 264
        Top = 4
        Width = 121
        Height = 13
        Caption = 'ubah Qty -> angka+ (11+)'
      end
      object l_3: TsLabel
        Left = 264
        Top = 20
        Width = 144
        Height = 13
        Caption = 'ubah Harga -> angka/ (1000/)'
      end
      object l_4: TsLabel
        Left = 264
        Top = 36
        Width = 144
        Height = 13
        Caption = 'ubah Diskon -> angka- (1000-)'
      end
      object l_5: TsLabel
        Left = 264
        Top = 52
        Width = 130
        Height = 13
        Caption = 'Hapus Baris -> Ctrl + Delete'
      end
      object ed_sub_total: TsCurrencyEdit
        Left = 72
        Top = 4
        Width = 161
        Height = 20
        AutoSize = False
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = ed_sub_totalChange
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 3
        DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
      end
      object ce_diskonpr: TsCurrencyEdit
        Left = 72
        Top = 34
        Width = 41
        Height = 20
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 1
        OnExit = ce_diskonprExit
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DisplayFormat = '##0.00;(##0.00);0.00'
      end
      object ce_diskonrp: TsCurrencyEdit
        Left = 136
        Top = 34
        Width = 97
        Height = 20
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnExit = ce_diskonrpExit
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 3
        DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
      end
      object ed_nilai_faktur: TsCurrencyEdit
        Left = 281
        Top = 1
        Width = 420
        Height = 70
        Align = alRight
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkFlat
        Color = 15263976
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -59
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 3
        DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 8
  end
  object od: TsOpenDialog
    DefaultExt = '.srb'
    Filter = 'RB File|*.srb'
    Left = 883
    Top = 240
  end
  object sd: TsSaveDialog
    DefaultExt = '.srb'
    Filter = 'RB File|*.srb'
    Left = 851
    Top = 240
  end
end
