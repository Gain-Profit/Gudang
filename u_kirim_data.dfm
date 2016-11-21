object F_kirim_data: TF_kirim_data
  Left = 422
  Top = 150
  BorderStyle = bsDialog
  Caption = 'EXPORT IMPORT DATA'
  ClientHeight = 440
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sg_load: TsGauge
    Left = 0
    Top = 0
    Width = 476
    Height = 25
    Align = alTop
    Visible = False
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    Progress = 0
    Suffix = '%'
  end
  object pc_1: TsPageControl
    Left = 0
    Top = 25
    Width = 476
    Height = 415
    ActivePage = ts_1
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object ts_1: TsTabSheet
      Caption = 'Kirim Data'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object l_1: TsLabel
        Left = 8
        Top = 8
        Width = 449
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'DATA KEBUTUHAN AWAL'
        FocusControl = lv_data_awal
      end
      object l_2: TsLabel
        Left = 8
        Top = 144
        Width = 449
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'DATA HARIAN'
      end
      object lv_data_awal: TsListView
        Left = 6
        Top = 24
        Width = 451
        Height = 113
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        Checkboxes = True
        Columns = <
          item
            Caption = 'Nama Tabel'
            MinWidth = 150
            Width = 150
          end
          item
            Caption = 'Deskripsi'
            MinWidth = 100
            Width = 150
          end
          item
            Caption = 'Keterangan'
            MinWidth = 100
            Width = 100
          end>
        Items.Data = {
          FE000000050000000000000000000000FFFFFFFF02000000000000000974625F
          73617475616E0D53617475616E20426172616E67000000000000000000FFFFFF
          FF02000000000000000874625F6A656E69730B4A656E6920426172616E670000
          00000000000000FFFFFFFF02000000000000000B74625F676F6C6F6E67616E0F
          476F6C6F6E67616E20426172616E67000000000000000000FFFFFFFF02000000
          000000000B74625F6B617465676F72690F4B617465676F726920426172616E67
          000000000000000000FFFFFFFF02000000000000000774625F6D65726B0B4D65
          726B20426172616E6700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        MultiSelect = True
        RowSelect = True
        PopupMenu = pm_awal
        ShowWorkAreas = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object lv_harian: TsListView
        Left = 8
        Top = 160
        Width = 449
        Height = 177
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        Checkboxes = True
        Columns = <
          item
            Caption = 'Nama Tabel'
            MinWidth = 100
            Width = 150
          end
          item
            Caption = 'Deskripsi'
            MinWidth = 100
            Width = 150
          end
          item
            Caption = 'Keterangan'
            MinWidth = 100
            Width = 100
          end>
        Items.Data = {
          DA0100000900000000000000FFFFFFFFFFFFFFFF02000000000000000974625F
          626172616E670B4461746120426172616E670000000000FFFFFFFFFFFFFFFF02
          000000000000000F74625F626172616E675F6861726761114461746120486172
          676120426172616E670000000000FFFFFFFFFFFFFFFF02000000000000000C74
          625F706C616E6F6772616D0E4461746120506C616E6F6772616D0000000000FF
          FFFFFFFFFFFFFF02000000000000000774625F737570700D4461746120537570
          706C6965720000000000FFFFFFFFFFFFFFFF02000000000000000E74625F6261
          72616E675F737570700F426172616E6720537570706C6965720000000000FFFF
          FFFFFFFFFFFF02000000000000000C74625F70656C616E6767616E0E44617461
          2050656C616E6767616E0000000000FFFFFFFFFFFFFFFF020000000000000007
          74625F75736572094461746120557365720000000000FFFFFFFFFFFFFFFF0200
          0000000000000974625F687574616E67114461746120487574616E6720557361
          68610000000000FFFFFFFFFFFFFFFF02000000000000000A74625F7069757461
          6E6712446174612050697574616E6720557361686100FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        MultiSelect = True
        RowSelect = True
        PopupMenu = pm_harian
        ShowWorkAreas = True
        TabOrder = 1
        ViewStyle = vsReport
      end
      object spnl1: TsPanel
        Left = 0
        Top = 346
        Width = 468
        Height = 41
        Align = alBottom
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object l_3: TsLabel
          Left = 8
          Top = 19
          Width = 103
          Height = 13
          Caption = 'Tanggal Data di Load'
          FocusControl = lv_data_awal
        end
        object edt_kirim: TsDateEdit
          Left = 128
          Top = 11
          Width = 129
          Height = 21
          AutoSize = False
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
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
        object b_kirim: TsButton
          Left = 342
          Top = 7
          Width = 115
          Height = 25
          Caption = 'SIMPAN'
          TabOrder = 1
          OnClick = b_kirimClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
    object ts_2: TsTabSheet
      Caption = 'Terima Data'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object edt_terima: TsDateEdit
        Left = 8
        Top = 320
        Width = 129
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
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
      object zv_load: TAbZipView
        Left = 0
        Top = 33
        Width = 468
        Height = 280
        Align = alTop
        Attributes = [vaItemName, vaPacked, vaRatio, vaFileSize, vaPath]
        Colors.Selected = clHighlight
        Colors.SelectedText = clHighlightText
        Colors.Alternate = clAqua
        Colors.AlternateText = clRed
        Colors.Deleted = clYellow
        Colors.DeletedText = clNavy
        Headings.Strings = (
          'File name'
          'Packed'
          'Method'
          'Ratio (%)'
          'CRC32'
          'Attributes'
          'Format'
          'Encrypted'
          'Time stamp'
          'Size'
          'Version Made'
          'Version Needed'
          'Path')
        DefaultColWidth = 150
        DefaultRowHeight = 17
        DisplayOptions = [doColSizing, doMultiSelect, doShowIcons, doThumbTrack]
        HeaderRowHeight = 19
        SortAttributes = [saItemName, saPacked, saRatio, saTimeStamp, saFileSize]
        TabOrder = 1
        ZipComponent = zk_load
        ColWidths = (
          120
          78
          50
          85
          120)
        RowHeights = (
          19
          17)
      end
      object spnl_load: TsPanel
        Left = 0
        Top = 0
        Width = 468
        Height = 33
        Align = alTop
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
      end
      object spnl2: TsPanel
        Left = 0
        Top = 346
        Width = 468
        Height = 41
        Align = alBottom
        TabOrder = 3
        SkinData.SkinSection = 'PANEL'
        object sButton1: TsButton
          Left = 8
          Top = 8
          Width = 121
          Height = 25
          Caption = 'Load From Date'
          TabOrder = 0
          OnClick = sButton1Click
          SkinData.SkinSection = 'BUTTON'
        end
        object sButton2: TsButton
          Left = 136
          Top = 8
          Width = 129
          Height = 25
          Caption = 'Load From File'
          TabOrder = 1
          OnClick = sButton2Click
          SkinData.SkinSection = 'BUTTON'
        end
        object sButton3: TsButton
          Left = 275
          Top = 8
          Width = 188
          Height = 25
          Caption = '&Simpan Data ke Dalam Database'
          TabOrder = 2
          OnClick = sButton3Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
    object ts_dafta: TsTabSheet
      Caption = 'Daftar Export Import'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object panel: TsPanel
        Left = 0
        Top = 346
        Width = 468
        Height = 41
        Align = alBottom
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object l_4: TsLabel
          Left = 104
          Top = 12
          Width = 59
          Height = 13
          Caption = 'Data Terahir'
        end
        object SbSegarkan: TsSpeedButton
          Tag = 1
          Left = 8
          Top = 9
          Width = 24
          Height = 24
          ParentShowHint = False
          ShowHint = True
          OnClick = SbSegarkanClick
          SkinData.SkinSection = 'SPEEDBUTTON'
          ImageIndex = 6
          Images = dm.gambar
        end
        object edtHari: TsDecimalSpinEdit
          Left = 40
          Top = 8
          Width = 57
          Height = 21
          TabOrder = 0
          Text = '10'
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
          Increment = 1.000000000000000000
          Value = 10.000000000000000000
          DecimalPlaces = 0
        end
        object cbJenis: TsComboBox
          Left = 304
          Top = 8
          Width = 145
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
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 1
          Text = 'Gudang ke Toko'
          OnChange = cbJenisChange
          Items.Strings = (
            'Gudang ke Toko'
            'Toko ke Gudang')
        end
      end
      object grid: TcxGrid
        Left = 0
        Top = 0
        Width = 468
        Height = 346
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        object grid_data: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsExport
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '###,###,##0;(###,###,##0);0'
              Kind = skSum
            end
            item
              Format = '###,###,##0;(###,###,##0);0'
              Kind = skSum
            end
            item
              Format = '0 Data'
              Kind = skCount
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object t_datatanggal: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'tanggal'
            Options.Editing = False
            Width = 217
          end
          object t_datadata: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'data'
            Options.Editing = False
            Width = 287
          end
          object t_dataket: TcxGridDBColumn
            Caption = 'Keterangan'
            DataBinding.FieldName = 'ket'
            Options.Editing = False
            Width = 163
          end
        end
        object l_data: TcxGridLevel
          GridView = grid_data
        end
      end
    end
  end
  object zk_load: TAbZipKit
    AutoSave = False
    DOSMode = False
    ExtractOptions = []
    Left = 184
  end
  object od_load: TsOpenDialog
    Left = 220
  end
  object pm_awal: TPopupMenu
    Left = 320
    Top = 128
    object N5: TMenuItem
      Caption = 'Check All'
      OnClick = N5Click
    end
    object utupSemuaKecualiini1: TMenuItem
      Caption = 'Uncheck All'
      OnClick = utupSemuaKecualiini1Click
    end
  end
  object pm_harian: TPopupMenu
    Left = 400
    Top = 304
    object MenuItem4: TMenuItem
      Caption = 'Check All'
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = 'Uncheck All'
      OnClick = MenuItem5Click
    end
  end
  object Q_export: TmySQLQuery
    Database = dm.db_conn
    SQL.Strings = (
      'select * from tb_export_import'
      'order by `data` desc, tanggal desc')
    Left = 84
    Top = 129
  end
  object dsExport: TDataSource
    DataSet = Q_export
    Left = 148
    Top = 129
  end
end
