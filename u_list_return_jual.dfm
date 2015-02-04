object f_list_return_jual: Tf_list_return_jual
  Left = 191
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Daftar Return Jual'
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
    Left = 762
    Top = 0
    Width = 150
    Height = 441
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
      Top = 311
      Width = 150
      Height = 130
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object l_1: TsLabel
        Left = 4
        Top = 45
        Width = 31
        Height = 13
        Caption = 'Mulai :'
      end
      object l_2: TsLabel
        Left = 4
        Top = 85
        Width = 41
        Height = 13
        Caption = 'Sampai :'
      end
      object de_mulai: TsDateEdit
        Left = 4
        Top = 61
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnChange = de_sampaiChange
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object de_sampai: TsDateEdit
        Left = 4
        Top = 101
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnChange = de_sampaiChange
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object b_cetak: TsButton
        Left = 8
        Top = 8
        Width = 129
        Height = 25
        Caption = '&Cetak Return Jual'
        TabOrder = 2
        OnClick = b_cetakClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 762
    Height = 441
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object grid_data: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = grid_dataCellDblClick
      DataController.DataSource = dm.ds_list_return_jual
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Data'
          Kind = skCount
          Column = clmn_dataColumn1
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = clmn_dataColumn5
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object clmn_dataColumn1: TcxGridDBColumn
        Caption = 'Kode Return Jual'
        DataBinding.FieldName = 'kd_return_jual'
      end
      object clmn_dataColumn2: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl_return_jual'
      end
      object clmn_dataColumn4: TcxGridDBColumn
        Caption = 'Pelanggan'
        DataBinding.FieldName = 'n_pelanggan'
      end
      object clmn_dataColumn5: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'nilai_faktur'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Properties.EditFormat = '###,###,##0;-###,###,##0;0'
        HeaderAlignmentHorz = taRightJustify
      end
      object clmn_dataColumn6: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
      end
      object clmn_dataColumn7: TcxGridDBColumn
        Caption = 'Pengawas'
        DataBinding.FieldName = 'pengawas'
      end
      object grid_dataColumn1: TcxGridDBColumn
        Caption = 'waktu simpan'
        DataBinding.FieldName = 'simpan_pada'
        Options.Editing = False
      end
    end
    object t_child: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dm.ds_child_sales
      DataController.DetailKeyFieldNames = 'no_transaksi'
      DataController.KeyFieldNames = 'no_transaksi'
      DataController.MasterKeyFieldNames = 'kd_transaksi'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object dt__child1urut: TcxGridDBColumn
        Caption = 'No'
        DataBinding.FieldName = 'urut'
        Width = 41
      end
      object dt__child1kd_barang: TcxGridDBColumn
        Caption = 'PID'
        DataBinding.FieldName = 'kd_barang'
        Width = 91
      end
      object dt__child1n_barang: TcxGridDBColumn
        Caption = 'Deskripsi Barang'
        DataBinding.FieldName = 'n_barang'
        Width = 292
      end
      object dt__child1Qty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 49
      end
      object dt__child1hpp: TcxGridDBColumn
        Caption = 'hpp/qty'
        DataBinding.FieldName = 'hpp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 23
      end
      object dt__child1harga_pokok: TcxGridDBColumn
        Caption = 'Harga Pokok'
        DataBinding.FieldName = 'harga_pokok'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 24
      end
      object dt__child1harga_jual: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga_jual'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 46
      end
      object dt__child1discountP: TcxGridDBColumn
        Caption = 'Diskon (%)'
        DataBinding.FieldName = 'discountP'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        Width = 24
      end
      object dt__child1discountRp: TcxGridDBColumn
        Caption = 'Diskon (Rp)'
        DataBinding.FieldName = 'discountRp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 49
      end
      object dt__child1harga_netto: TcxGridDBColumn
        Caption = 'Netto'
        DataBinding.FieldName = 'harga_netto'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 48
      end
      object dt__child1total_harga: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total_harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 47
      end
      object dt__child1laba: TcxGridDBColumn
        Caption = 'Laba'
        DataBinding.FieldName = 'laba'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 49
      end
      object dt__child1void_barang: TcxGridDBColumn
        Caption = 'Void'
        DataBinding.FieldName = 'void_barang'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        Width = 23
      end
      object dt__child1ket: TcxGridDBColumn
        Caption = 'keterangan'
        DataBinding.FieldName = 'ket'
        Visible = False
        Width = 570
      end
    end
    object l_data: TcxGridLevel
      GridView = grid_data
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
