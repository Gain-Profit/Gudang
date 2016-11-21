object F_barang_property: TF_barang_property
  Left = 195
  Top = 159
  BorderStyle = bsDialog
  Caption = 'Property Barang'
  ClientHeight = 454
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gb_detail: TsGroupBox
    Left = 0
    Top = 65
    Width = 760
    Height = 343
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object grid: TcxGrid
      Left = 2
      Top = 21
      Width = 756
      Height = 320
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LevelTabs.CaptionAlignment = taLeftJustify
      LevelTabs.Style = 10
      LookAndFeel.Kind = lfOffice11
      RootLevelOptions.DetailTabsPosition = dtpTop
      object t_data_plano: TcxGridDBTableView
        OnKeyDown = t_data_planoKeyDown
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = ds_plano
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Data Kosong>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Inactive = dm.cxstyl1
        Styles.Selection = dm.cxstyl1
        object dt_rak: TcxGridDBColumn
          Caption = 'Rak'
          DataBinding.FieldName = 'no_rak'
          Options.IncSearch = False
          Width = 38
        end
        object dt_shelving: TcxGridDBColumn
          Caption = 'Shelving'
          DataBinding.FieldName = 'no_shelving'
          Options.IncSearch = False
          Width = 51
        end
        object dt_urut: TcxGridDBColumn
          Caption = 'No'
          DataBinding.FieldName = 'no_urut'
          Options.IncSearch = False
          Width = 44
        end
        object dt_KK: TcxGridDBColumn
          DataBinding.FieldName = 'KK'
          Options.IncSearch = False
          Width = 61
        end
        object dt_DB: TcxGridDBColumn
          DataBinding.FieldName = 'DB'
          Options.IncSearch = False
          Width = 65
        end
        object dt_AB: TcxGridDBColumn
          DataBinding.FieldName = 'AB'
          Options.IncSearch = False
          Width = 58
        end
        object dt_Kapasitas: TcxGridDBColumn
          Caption = 'Kap'
          DataBinding.FieldName = 'kapasitas'
          Options.IncSearch = False
          Width = 65
        end
        object dt_display: TcxGridDBColumn
          Caption = 'Min Dis'
          DataBinding.FieldName = 'min_display'
          Options.IncSearch = False
          Width = 61
        end
      end
      object t_supplier: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = ds_supp
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<Data Kosong>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Inactive = dm.cxstyl1
        Styles.Selection = dm.cxstyl1
        object dt__supplierkd_suplier: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'kd_suplier'
          Width = 101
        end
        object dt__suppliern_supp: TcxGridDBColumn
          Caption = 'Nama Supplier'
          DataBinding.FieldName = 'n_supp'
          Width = 164
        end
        object dt__suppliertelp: TcxGridDBColumn
          Caption = 'Telp'
          DataBinding.FieldName = 'telp'
          Width = 154
        end
        object dt__supplieremail: TcxGridDBColumn
          Caption = 'Email'
          DataBinding.FieldName = 'email'
          Width = 265
        end
      end
      object t_mutasi_barang: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = ds_mutasi
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DateTimeHandling.DateFormat = 'dd'
        Filtering.ColumnMRUItemsList = False
        OptionsBehavior.PostponedSynchronization = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<Data Kosong>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Inactive = dm.cxstyl1
        Styles.Selection = dm.cxstyl1
        object t_tgl: TcxGridDBColumn
          Caption = 'Tgl'
          DataBinding.FieldName = 'tgl'
          Options.Editing = False
        end
        object t_awal: TcxGridDBColumn
          Caption = 'Awal'
          DataBinding.FieldName = 'stok_awal'
          Options.Editing = False
        end
        object t_receipt: TcxGridDBColumn
          Caption = 'Receipt'
          DataBinding.FieldName = 'stok_receipt'
          Options.Editing = False
        end
        object t_return: TcxGridDBColumn
          Caption = 'Return'
          DataBinding.FieldName = 'stok_return'
          Options.Editing = False
        end
        object t_sales: TcxGridDBColumn
          Caption = 'Sales'
          DataBinding.FieldName = 'stok_sales'
          Options.Editing = False
        end
        object t_return_jual: TcxGridDBColumn
          Caption = 'Return Jual'
          DataBinding.FieldName = 'stok_return_jual'
          Options.Editing = False
        end
        object t_kirim: TcxGridDBColumn
          Caption = 'Kirim'
          DataBinding.FieldName = 'stok_kirim'
          Options.Editing = False
        end
        object t_return_kirim: TcxGridDBColumn
          Caption = 'Return Kirim'
          DataBinding.FieldName = 'stok_return_kirim'
          Options.Editing = False
        end
        object t_koreksi: TcxGridDBColumn
          Caption = 'Koreksi'
          DataBinding.FieldName = 'stok_koreksi'
          Options.Editing = False
        end
        object t_ahir: TcxGridDBColumn
          Caption = 'Ahir'
          DataBinding.FieldName = 'stok_ahir'
          Options.Editing = False
        end
      end
      object t_mutasi_harga: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = ds_mutasi
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DateTimeHandling.DateFormat = 'dd'
        Filtering.ColumnMRUItemsList = False
        OptionsBehavior.PostponedSynchronization = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<Data Kosong>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Inactive = dm.cxstyl1
        Styles.Selection = dm.cxstyl1
        object dt__mutasi_hargatgl: TcxGridDBColumn
          Caption = 'Tgl'
          DataBinding.FieldName = 'tgl'
          Options.Editing = False
        end
        object dt__mutasi_hargauang_awal: TcxGridDBColumn
          Caption = 'Awal'
          DataBinding.FieldName = 'uang_awal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object dt__mutasi_hargauang_receipt: TcxGridDBColumn
          Caption = 'Receipt'
          DataBinding.FieldName = 'uang_receipt'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object dt__mutasi_hargauang_return: TcxGridDBColumn
          Caption = 'Return'
          DataBinding.FieldName = 'uang_return'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object dt__mutasi_hargauang_sales: TcxGridDBColumn
          Caption = 'Sales'
          DataBinding.FieldName = 'uang_sales'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object t_mutasi_return_jual: TcxGridDBColumn
          Caption = 'Return Jual'
          DataBinding.FieldName = 'uang_return_jual'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object t_mutasi_kirim: TcxGridDBColumn
          Caption = 'Kirim'
          DataBinding.FieldName = 'uang_kirim'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object t_mutasi_return_kirim: TcxGridDBColumn
          Caption = 'Return Kirim'
          DataBinding.FieldName = 'uang_return_kirim'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object dt__mutasi_hargauang_koreksi: TcxGridDBColumn
          Caption = 'Koreksi'
          DataBinding.FieldName = 'uang_koreksi'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
        object dt__mutasi_hargauang_ahir: TcxGridDBColumn
          Caption = 'Ahir'
          DataBinding.FieldName = 'uang_ahir'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Options.Editing = False
        end
      end
      object l_data_plano: TcxGridLevel
        Caption = 'Planogram     '
        GridView = t_data_plano
      end
      object l_supplier: TcxGridLevel
        Caption = 'Supplier     '
        GridView = t_supplier
      end
      object l_mutasi_barang: TcxGridLevel
        Caption = 'Mutasi Barang     '
        GridView = t_mutasi_barang
      end
      object l_mutasi_harga: TcxGridLevel
        Caption = 'Mutasi Harga     '
        GridView = t_mutasi_harga
      end
    end
    object cb_periode: TsComboBox
      Left = 616
      Top = 20
      Width = 137
      Height = 22
      Alignment = taLeftJustify
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'COMBOBOX'
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS SANS SERIF'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = -1
      ParentFont = False
      TabOrder = 1
      OnChange = cb_periodeChange
    end
  end
  object p_barang: TsPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 65
    Align = alTop
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
  end
  object panelBawah: TsPanel
    Left = 0
    Top = 408
    Width = 760
    Height = 46
    Align = alBottom
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object btnMutasiHrg: TsButton
      Left = 528
      Top = 8
      Width = 123
      Height = 25
      Caption = 'Preview Mutasi'
      TabOrder = 0
      OnClick = btnMutasiHrgClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnClose: TsButton
      Left = 672
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = btnCloseClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object ds_mutasi: TDataSource
    DataSet = Q_mutasi
    Left = 376
    Top = 56
  end
  object Q_mutasi: TmySQLQuery
    Database = dm.db_conn
    Left = 312
    Top = 56
  end
  object q_supp: TmySQLQuery
    Database = dm.db_conn
    Filtered = True
    Left = 8
    Top = 112
  end
  object ds_supp: TDataSource
    DataSet = q_supp
    Left = 72
    Top = 112
  end
  object ds_plano: TDataSource
    DataSet = Q_plano
    Left = 72
    Top = 168
  end
  object Q_plano: TmySQLQuery
    Database = dm.db_conn
    RequestLive = True
    SQL.Strings = (
      '')
    Left = 8
    Top = 168
  end
  object Q_temp: TmySQLQuery
    Database = dm.db_conn
    Left = 8
    Top = 72
  end
end
