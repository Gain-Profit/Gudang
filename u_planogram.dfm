object f_planogram: Tf_planogram
  Left = 229
  Top = 91
  BorderStyle = bsDialog
  Caption = 'Set Up Planogram'
  ClientHeight = 512
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pc_plano: TsPageControl
    Left = 0
    Top = 0
    Width = 820
    Height = 512
    ActivePage = ts_rak
    Align = alClient
    TabOrder = 0
    OnChange = pc_planoChange
    SkinData.SkinSection = 'PAGECONTROL'
    OnPageChanging = pc_planoPageChanging
    object ts_rak: TsTabSheet
      Caption = 'Berdasar Rak'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sb_cari: TsSpeedButton
        Tag = 9
        Left = 776
        Top = 80
        Width = 24
        Height = 21
        OnClick = sb_cariClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        ImageIndex = 0
        Images = dm.gambar
      end
      object grid_plano: TcxGrid
        Left = 8
        Top = 104
        Width = 793
        Height = 377
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object t_data_plano: TcxGridDBTableView
          OnKeyDown = t_data_planoKeyDown
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = ds_planoRak
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0 Item'
              Kind = skCount
              Column = dt_nama
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Inactive = dm.cxstyl1
          Styles.IncSearch = dm.cxstyl1
          Styles.Selection = dm.cxstyl1
          object dt_No: TcxGridDBColumn
            Caption = 'No'
            DataBinding.FieldName = 'no_urut'
            Options.IncSearch = False
            Width = 28
          end
          object dt_PID: TcxGridDBColumn
            Caption = 'PID'
            DataBinding.FieldName = 'kd_barang'
            Options.Editing = False
            Width = 69
          end
          object dt_barcode: TcxGridDBColumn
            Caption = 'Barcode'
            DataBinding.FieldName = 'barcode3'
            Options.Editing = False
            Width = 128
          end
          object dt_nama: TcxGridDBColumn
            Caption = 'Deskripsi'
            DataBinding.FieldName = 'n_barang'
            Options.Editing = False
            Width = 411
          end
          object dt_kk: TcxGridDBColumn
            DataBinding.FieldName = 'KK'
            Options.IncSearch = False
            Width = 43
          end
          object dt_db: TcxGridDBColumn
            DataBinding.FieldName = 'DB'
            Options.IncSearch = False
            Width = 41
          end
          object dt_ab: TcxGridDBColumn
            DataBinding.FieldName = 'AB'
            Options.IncSearch = False
            Width = 43
          end
          object dt_kap: TcxGridDBColumn
            Caption = 'Kap'
            DataBinding.FieldName = 'kapasitas'
            Options.IncSearch = False
            Width = 42
          end
          object dt_display: TcxGridDBColumn
            Caption = 'Min Dis'
            DataBinding.FieldName = 'min_display'
            Options.IncSearch = False
            Width = 42
          end
          object t_data_planoColumn1: TcxGridDBColumn
            Caption = 'UPDATE'
            DataBinding.FieldName = 'update'
            Options.Editing = False
          end
        end
        object l_data_plano: TcxGridLevel
          GridView = t_data_plano
        end
      end
      object ed_masuk: TsEdit
        Left = 9
        Top = 80
        Width = 760
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyDown = ed_masukKeyDown
        OnKeyPress = ed_masukKeyPress
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
      object p1: TsPanel
        Left = 0
        Top = 0
        Width = 812
        Height = 73
        Align = alTop
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object l_1: TsLabel
          Left = 8
          Top = 8
          Width = 20
          Height = 13
          Caption = 'Rak'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object l_2: TsLabel
          Left = 8
          Top = 40
          Width = 41
          Height = 13
          Caption = 'Shelving'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object l_set: TsLabel
          Left = 352
          Top = 8
          Width = 78
          Height = 13
          Cursor = crHandPoint
          Caption = 'Sudah di Setting'
          ParentFont = False
          OnClick = l_setClick
          OnMouseEnter = l_setMouseEnter
          OnMouseLeave = l_setMouseLeave
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object l_notset: TsLabel
          Left = 352
          Top = 40
          Width = 76
          Height = 13
          Cursor = crHandPoint
          Caption = 'Belum di Setting'
          OnClick = l_notsetClick
          OnMouseEnter = l_setMouseEnter
          OnMouseLeave = l_setMouseLeave
        end
        object se_rak: TsSpinEdit
          Left = 56
          Top = 8
          Width = 73
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnChange = se_rakChange
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
          MaxValue = 0
          MinValue = 0
          Value = 0
        end
        object se_shelving: TsSpinEdit
          Left = 56
          Top = 40
          Width = 73
          Height = 21
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0'
          OnChange = se_shelvingChange
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
          MaxValue = 0
          MinValue = 0
          Value = 0
        end
        object b_cetak: TsButton
          Left = 136
          Top = 40
          Width = 201
          Height = 25
          Caption = 'Cetak &Semua Planogram'
          TabOrder = 3
          OnClick = b_cetakClick
          SkinData.SkinSection = 'BUTTON'
        end
        object sButton1: TsButton
          Left = 136
          Top = 8
          Width = 201
          Height = 25
          Caption = '&Cetak Planogram per Rak'
          TabOrder = 2
          OnClick = sButton1Click
          SkinData.SkinSection = 'BUTTON'
        end
        object ce_set: TsCurrencyEdit
          Left = 456
          Top = 8
          Width = 80
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
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
          DisplayFormat = '### ### ##0;-### ### ##0;0'
        end
        object ce_notset: TsCurrencyEdit
          Left = 456
          Top = 40
          Width = 80
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
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
          DisplayFormat = '### ### ##0;-### ### ##0;0'
        end
      end
    end
    object ts_barang: TsTabSheet
      Caption = 'Berdasar Barang'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object SbBarang: TsSpeedButton
        Tag = 9
        Left = 776
        Top = 8
        Width = 24
        Height = 21
        OnClick = sb_cariClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        ImageIndex = 0
        Images = dm.gambar
      end
      object cxGrid: TcxGrid
        Left = 8
        Top = 32
        Width = 793
        Height = 449
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object TvPlanoBarang: TcxGridDBTableView
          OnKeyDown = TvPlanoBarangKeyDown
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = ds_plano
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0 Item'
              Kind = skCount
              Column = cxGridDBColumn4
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Inactive = dm.cxstyl1
          Styles.IncSearch = dm.cxstyl1
          Styles.Selection = dm.cxstyl1
          object tPlanoBarangColumn1: TcxGridDBColumn
            Caption = 'Rak'
            DataBinding.FieldName = 'no_rak'
            Width = 31
          end
          object tPlanoBarangColumn2: TcxGridDBColumn
            Caption = 'Shv'
            DataBinding.FieldName = 'no_shelving'
            Width = 26
          end
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'No'
            DataBinding.FieldName = 'no_urut'
            Options.IncSearch = False
            Width = 28
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'PID'
            DataBinding.FieldName = 'kd_barang'
            Options.Editing = False
            Width = 49
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Barcode'
            DataBinding.FieldName = 'barcode3'
            Options.Editing = False
            Width = 94
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Deskripsi'
            DataBinding.FieldName = 'n_barang'
            Options.Editing = False
            Width = 302
          end
        end
        object LvPlanoBarang: TcxGridLevel
          GridView = TvPlanoBarang
        end
      end
      object edBarang: TsEdit
        Left = 9
        Top = 8
        Width = 760
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edBarangKeyDown
        OnKeyPress = edBarangKeyPress
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
    object ts_Double: TsTabSheet
      Caption = 'Plano Double'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object spltrD1: TsSplitter
        Left = 0
        Top = 261
        Width = 812
        Height = 2
        Cursor = crVSplit
        Align = alBottom
        SkinData.SkinSection = 'SPLITTER'
      end
      object GridBarangD: TcxGrid
        Left = 0
        Top = 0
        Width = 812
        Height = 261
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object t_BarangD: TcxGridDBTableView
          OnKeyDown = t_data_planoKeyDown
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = t_BarangDFocusedRecordChanged
          DataController.DataSource = ds_BarangD
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0 Item'
              Kind = skCount
              Column = cxGridDBColumn8
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Inactive = dm.cxstyl1
          Styles.IncSearch = dm.cxstyl1
          Styles.Selection = dm.cxstyl1
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'PID'
            DataBinding.FieldName = 'kd_barang'
            Options.Editing = False
            Width = 59
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Deskripsi'
            DataBinding.FieldName = 'n_barang'
            Options.Editing = False
            Width = 283
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Barcode 3'
            DataBinding.FieldName = 'barcode3'
            Options.Editing = False
            Width = 118
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = 'Barcode 2'
            DataBinding.FieldName = 'barcode2'
            Options.Editing = False
            Options.IncSearch = False
            Width = 107
          end
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = 'Barcode 1'
            DataBinding.FieldName = 'barcode1'
            Options.Editing = False
            Options.IncSearch = False
            Width = 117
          end
        end
        object LvBarangD: TcxGridLevel
          GridView = t_BarangD
        end
      end
      object GridPlanoD: TcxGrid
        Left = 0
        Top = 263
        Width = 812
        Height = 180
        Align = alBottom
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        object t_PlanoD: TcxGridDBTableView
          OnKeyDown = t_PlanoDKeyDown
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = ds_PlanoD
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.Inactive = dm.cxstyl1
          Styles.IncSearch = dm.cxstyl1
          Styles.Selection = dm.cxstyl1
          object cxGridDBColumn15: TcxGridDBColumn
            Caption = 'Rak'
            DataBinding.FieldName = 'no_rak'
            Options.Editing = False
            Options.IncSearch = False
            Width = 60
          end
          object cxGridDBColumn16: TcxGridDBColumn
            Caption = 'Shelving'
            DataBinding.FieldName = 'no_shelving'
            Options.Editing = False
            Width = 77
          end
          object cxGridDBColumn17: TcxGridDBColumn
            Caption = 'No'
            DataBinding.FieldName = 'no_urut'
            Options.Editing = False
            Width = 72
          end
          object cxGridDBColumn19: TcxGridDBColumn
            DataBinding.FieldName = 'KK'
            Options.Editing = False
            Options.IncSearch = False
            Width = 78
          end
          object cxGridDBColumn20: TcxGridDBColumn
            DataBinding.FieldName = 'DB'
            Options.Editing = False
            Options.IncSearch = False
            Width = 76
          end
          object cxGridDBColumn21: TcxGridDBColumn
            DataBinding.FieldName = 'AB'
            Options.Editing = False
            Options.IncSearch = False
            Width = 65
          end
          object cxGridDBColumn22: TcxGridDBColumn
            Caption = 'Kap'
            DataBinding.FieldName = 'kapasitas'
            Options.Editing = False
            Options.IncSearch = False
            Width = 80
          end
          object cxGridDBColumn23: TcxGridDBColumn
            Caption = 'Min Dis'
            DataBinding.FieldName = 'min_display'
            Options.Editing = False
            Options.IncSearch = False
            Width = 76
          end
          object cxGridDBColumn24: TcxGridDBColumn
            Caption = 'UPDATED'
            DataBinding.FieldName = 'update'
            Options.Editing = False
            Width = 100
          end
        end
        object LvPlanoD: TcxGridLevel
          GridView = t_PlanoD
        end
      end
      object pPlanoD: TsPanel
        Left = 0
        Top = 443
        Width = 812
        Height = 41
        Align = alBottom
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object btnRefresh: TsButton
          Left = 728
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Refresh'
          TabOrder = 0
          OnClick = btnRefreshClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btnHapus: TsButton
          Left = 640
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Hapus'
          TabOrder = 1
          OnClick = btnHapusClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
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
    Left = 832
    Top = 32
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 832
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
  object ds_plano: TDataSource
    DataSet = Q_plano
    Left = 56
    Top = 56
  end
  object Q_plano: TmySQLQuery
    Database = dm.My_conn
    RequestLive = True
    SQL.Strings = (
      '')
    Left = 16
    Top = 56
  end
  object Q_barangD: TmySQLQuery
    Database = dm.My_conn
    RequestLive = True
    SQL.Strings = (
      'Select * from vw_planogram_double')
    Left = 736
    Top = 56
  end
  object ds_BarangD: TDataSource
    DataSet = Q_barangD
    Left = 776
    Top = 56
  end
  object Q_PlanoD: TmySQLQuery
    Database = dm.My_conn
    RequestLive = True
    SQL.Strings = (
      'select * from tb_planogram')
    Left = 736
    Top = 360
  end
  object ds_PlanoD: TDataSource
    DataSet = Q_PlanoD
    Left = 776
    Top = 360
  end
  object ds_planoRak: TDataSource
    DataSet = Q_planoRak
    Left = 64
    Top = 216
  end
  object Q_planoRak: TmySQLQuery
    Database = dm.My_conn
    RequestLive = True
    SQL.Strings = (
      '')
    Left = 24
    Top = 216
  end
end
