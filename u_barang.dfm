object F_barang: TF_barang
  Left = 194
  Top = 148
  Width = 889
  Height = 567
  Caption = 'Daftar Barang'
  Color = clBtnFace
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel2: TsPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 528
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object grid: TcxGrid
      Left = 0
      Top = 33
      Width = 723
      Height = 495
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TvData: TcxGridDBTableView
        OnKeyDown = TvDataKeyDown
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = TvDataCellDblClick
        DataController.DataSource = ds_barang
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            Position = spFooter
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '###,##0 Item'
            Kind = skCount
            Column = TvDatan_barang
          end
          item
            Format = '###,##0;(###,##0);0'
            Kind = skSum
            Column = tDataColumn3
          end
          item
            Format = '###,##0;(###,##0);0'
            Kind = skSum
            Column = tDataColumn4
          end
          item
            Format = '###,##0;(###,##0);0'
            Kind = skSum
            Column = tDataColumn5
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.DragDropText = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.NoDataToDisplayInfoText = '<TIDAK ADA DATA YANG DAPAT DITAMPILKAN>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object TvDatakd_barang: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'kd_barang'
          Width = 65
        end
        object vDataColumn1: TcxGridDBColumn
          Caption = 'Barcode 2'
          DataBinding.FieldName = 'barcode2'
          Visible = False
        end
        object vDataColumn2: TcxGridDBColumn
          Caption = 'Barcode 1'
          DataBinding.FieldName = 'barcode1'
          Visible = False
        end
        object TvDatabarcode3: TcxGridDBColumn
          Caption = 'Barcode'
          DataBinding.FieldName = 'barcode3'
          Width = 90
        end
        object TvDatan_barang: TcxGridDBColumn
          Caption = 'Deskripsi'
          DataBinding.FieldName = 'n_barang'
          SortIndex = 0
          SortOrder = soAscending
          Width = 265
        end
        object TvDataN_Jenis: TcxGridDBColumn
          Caption = 'Jenis'
          DataBinding.FieldName = 'N_Jenis'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
        end
        object TvDataN_golbrg: TcxGridDBColumn
          Caption = 'Golongan'
          DataBinding.FieldName = 'N_golbrg'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
        end
        object TvDataN_merk: TcxGridDBColumn
          Caption = 'Merk'
          DataBinding.FieldName = 'N_merk'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Width = 101
        end
        object TvDatan_kategori: TcxGridDBColumn
          Caption = 'TAG'
          DataBinding.FieldName = 'kd_kategori'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Width = 46
        end
        object TvDataminstok: TcxGridDBColumn
          Caption = 'Min S'
          DataBinding.FieldName = 'minstok'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 36
        end
        object TvDatamaxstok: TcxGridDBColumn
          Caption = 'Max S'
          DataBinding.FieldName = 'maxstok'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 37
        end
        object TvDataminor: TcxGridDBColumn
          Caption = 'MinOr'
          DataBinding.FieldName = 'minor'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 39
        end
        object TvDataleadtime: TcxGridDBColumn
          Caption = 'LT'
          DataBinding.FieldName = 'leadtime'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 24
        end
        object TvDataaktif: TcxGridDBColumn
          Caption = 'Aktif'
          DataBinding.FieldName = 'aktif'
        end
        object tDataColumn3: TcxGridDBColumn
          Caption = 'Stok'
          DataBinding.FieldName = 'stok_OH'
          Visible = False
        end
        object tDataColumn4: TcxGridDBColumn
          Caption = 'HPP (aktif)'
          DataBinding.FieldName = 'hpp_aktif'
          Visible = False
        end
        object tDataColumn5: TcxGridDBColumn
          Caption = 'Total HPP'
          DataBinding.FieldName = 'tot_HPP'
          Visible = False
        end
      end
      object lvData: TcxGridLevel
        GridView = TvData
      end
    end
    object pnlheader: TPanel
      Left = 0
      Top = 0
      Width = 723
      Height = 33
      Align = alTop
      TabOrder = 1
      object Ed_Cari: TsEdit
        Left = 81
        Top = 1
        Width = 406
        Height = 31
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = Ed_CariKeyDown
        Align = alClient
        SkinData.SkinSection = 'EDIT'
      end
      object pnlcheck: TPanel
        Left = 487
        Top = 1
        Width = 235
        Height = 31
        Align = alRight
        TabOrder = 1
        object CkSemua: TCheckBox
          Left = 8
          Top = 2
          Width = 225
          Height = 29
          Caption = 'Tampilkan Semua Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = CkSemuaClick
        end
      end
      object pnlFilter: TPanel
        Left = 1
        Top = 1
        Width = 80
        Height = 31
        Align = alLeft
        Caption = 'Filter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object sPanel1: TsPanel
    Left = 723
    Top = 0
    Width = 150
    Height = 528
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
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
      Images = dm.image
      ImageIndex = 7
      Reflected = True
    end
    object spnl1: TsPanel
      Left = 0
      Top = 351
      Width = 150
      Height = 137
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        150
        137)
      object B_tambah: TsButton
        Left = 6
        Top = 8
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Tambah Data'
        TabOrder = 0
        OnClick = B_tambahClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_edit: TsButton
        Left = 6
        Top = 40
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Ubah Data'
        TabOrder = 1
        OnClick = b_editClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_hapus: TsButton
        Left = 6
        Top = 72
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Hapus Data'
        TabOrder = 2
        OnClick = b_hapusClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_duplikat: TsButton
        Left = 6
        Top = 104
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Duplikat Data'
        TabOrder = 3
        OnClick = b_duplikatClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object p1: TsPanel
      Left = 0
      Top = 488
      Width = 150
      Height = 40
      Align = alBottom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        150
        40)
      object B_property: TsButton
        Left = 6
        Top = 7
        Width = 136
        Height = 25
        Anchors = [akBottom]
        Caption = '&Property'
        TabOrder = 0
        OnClick = B_propertyClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 40
  end
  object ds_barang: TDataSource
    DataSet = Q_barang
    Left = 80
    Top = 40
  end
  object Q_barang: TMyQuery
    Connection = dm.db_conn
    Left = 48
    Top = 40
  end
end
