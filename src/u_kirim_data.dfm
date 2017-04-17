object F_kirim_data: TF_kirim_data
  Left = 0
  Top = 0
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
        BoundLabel.ParentFont = False
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
        Items.ItemData = {
          05A6010000050000000000000000000000FFFFFFFF02000000FFFFFFFF000000
          0009740062005F00730061007400750061006E000D530061007400750061006E
          00200042006100720061006E0067000000000000000000000000000000000000
          FFFFFFFF02000000FFFFFFFF0000000008740062005F006A0065006E00690073
          000B4A0065006E006900200042006100720061006E0067000000000000000000
          000000000000000000FFFFFFFF02000000FFFFFFFF000000000B740062005F00
          67006F006C006F006E00670061006E000F47006F006C006F006E00670061006E
          00200042006100720061006E0067000000000000000000000000000000000000
          FFFFFFFF02000000FFFFFFFF000000000B740062005F006B0061007400650067
          006F00720069000F4B0061007400650067006F00720069002000420061007200
          61006E0067000000000000000000000000000000000000FFFFFFFF02000000FF
          FFFFFF0000000007740062005F006D00650072006B000B4D00650072006B0020
          0042006100720061006E006700000000000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
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
        BoundLabel.ParentFont = False
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
        Items.ItemData = {
          05260300000900000000000000FFFFFFFFFFFFFFFF02000000FFFFFFFF000000
          0009740062005F0062006100720061006E0067000B4400610074006100200042
          006100720061006E00670000000000000000000000000000FFFFFFFFFFFFFFFF
          02000000FFFFFFFF000000000F740062005F0062006100720061006E0067005F
          0068006100720067006100114400610074006100200048006100720067006100
          200042006100720061006E00670000000000000000000000000000FFFFFFFFFF
          FFFFFF02000000FFFFFFFF000000000C740062005F0070006C0061006E006F00
          6700720061006D000E4400610074006100200050006C0061006E006F00670072
          0061006D0000000000000000000000000000FFFFFFFFFFFFFFFF02000000FFFF
          FFFF0000000007740062005F0073007500700070000D44006100740061002000
          53007500700070006C0069006500720000000000000000000000000000FFFFFF
          FFFFFFFFFF02000000FFFFFFFF000000000E740062005F006200610072006100
          6E0067005F0073007500700070000F42006100720061006E0067002000530075
          00700070006C0069006500720000000000000000000000000000FFFFFFFFFFFF
          FFFF02000000FFFFFFFF000000000C740062005F00700065006C0061006E0067
          00670061006E000E44006100740061002000500065006C0061006E0067006700
          61006E0000000000000000000000000000FFFFFFFFFFFFFFFF02000000FFFFFF
          FF0000000007740062005F007500730065007200094400610074006100200055
          0073006500720000000000000000000000000000FFFFFFFFFFFFFFFF02000000
          FFFFFFFF0000000009740062005F0068007500740061006E0067001144006100
          74006100200048007500740061006E0067002000550073006100680061000000
          0000000000000000000000FFFFFFFFFFFFFFFF02000000FFFFFFFF000000000A
          740062005F00700069007500740061006E006700124400610074006100200050
          0069007500740061006E00670020005500730061006800610000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF}
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
          Images = dm.gambar
          ImageIndex = 6
        end
        object edtHari: TsDecimalSpinEdit
          Left = 40
          Top = 8
          Width = 57
          Height = 21
          TabOrder = 0
          Text = '10'
          SkinData.SkinSection = 'EDIT'
          Increment = 1.000000000000000000
          Value = 10.000000000000000000
          DecimalPlaces = 0
        end
        object cbJenis: TsComboBox
          Left = 304
          Top = 8
          Width = 145
          Height = 21
          Alignment = taLeftJustify
          SkinData.SkinSection = 'COMBOBOX'
          VerticalAlignment = taAlignTop
          Style = csDropDownList
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
        LookAndFeel.NativeStyle = False
        object grid_data: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
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
  object Q_export: TMyQuery
    Connection = dm.db_conn
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
