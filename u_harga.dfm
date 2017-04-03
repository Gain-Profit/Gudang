object F_Edit_Harga: TF_Edit_Harga
  Left = 309
  Top = 165
  Width = 930
  Height = 485
  Caption = 'Edit Harga'
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
  OnShow = T
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSide: TsPanel
    Left = 764
    Top = 0
    Width = 150
    Height = 446
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
  end
  object pnlMain: TsPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object grid: TcxGrid
      Left = 0
      Top = 33
      Width = 764
      Height = 413
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object t_data: TcxGridDBTableView
        OnKeyDown = t_dataKeyDown
        Navigator.Buttons.CustomButtons = <>
        OnCellDblClick = t_dataCellDblClick
        DataController.DataSource = Ds_harga
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '###,##0 Item'
            Kind = skCount
            Column = t_datan_barang
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.NoDataToDisplayInfoText = '< TIDAK ADA DATA YANG DAPAT DITAMPILKAN>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Inactive = dm.cxstyl1
        Styles.Selection = dm.cxstyl1
        object t_datakd_barang: TcxGridDBColumn
          Caption = 'PID'
          DataBinding.FieldName = 'kd_barang'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 53
        end
        object t_databarcode3: TcxGridDBColumn
          Caption = 'Barcode'
          DataBinding.FieldName = 'barcode3'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 57
        end
        object t_datan_barang: TcxGridDBColumn
          Caption = 'Deskripsi Barang'
          DataBinding.FieldName = 'n_barang'
          SortIndex = 0
          SortOrder = soAscending
          Width = 175
        end
        object t_datan_macam_harga: TcxGridDBColumn
          Caption = 'Macam Harga'
          DataBinding.FieldName = 'kd_macam_harga'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'HARGA ECERAN'
              ImageIndex = 0
              Value = 'HETK'
            end
            item
              Description = 'HARGA GROSIR'
              Value = 'HGTK'
            end>
          Width = 75
        end
        object t_dataHppLama: TcxGridDBColumn
          Caption = 'Hpp Lama'
          DataBinding.FieldName = 'hpp_lama'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          HeaderAlignmentHorz = taRightJustify
        end
        object t_dataHppNew: TcxGridDBColumn
          Caption = 'HPP Baru'
          DataBinding.FieldName = 'Hpp_ahir'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          HeaderAlignmentHorz = taRightJustify
          Width = 59
        end
        object t_dataharga_pokok: TcxGridDBColumn
          Caption = 'Harga Pokok'
          DataBinding.FieldName = 'hpp_aktif'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          Visible = False
          HeaderAlignmentHorz = taRightJustify
          Width = 47
        end
        object t_dataharga_jual3: TcxGridDBColumn
          Caption = 'Harga 3'
          DataBinding.FieldName = 'harga_jual3'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          HeaderAlignmentHorz = taRightJustify
          Width = 46
        end
        object t_dataharga_jual2: TcxGridDBColumn
          Caption = 'Harga 2'
          DataBinding.FieldName = 'harga_jual2'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          HeaderAlignmentHorz = taRightJustify
          Width = 55
        end
        object t_dataharga_jual1: TcxGridDBColumn
          Caption = 'Harga 1'
          DataBinding.FieldName = 'harga_jual1'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0.00;(###,###,##0.00);0.00'
          HeaderAlignmentHorz = taRightJustify
          Width = 74
        end
        object t_datauser: TcxGridDBColumn
          Caption = 'User'
          DataBinding.FieldName = 'kode_user'
          Width = 66
        end
        object t_dataColumn1: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'natur'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.DefaultImageIndex = 0
          Properties.Images = dm.gambar
          Properties.Items = <
            item
              Description = 'Naik'
              ImageIndex = 4
              Value = 1
            end
            item
              Description = 'Sama'
              ImageIndex = 5
              Value = 0
            end
            item
              Description = 'Turun'
              ImageIndex = 3
              Value = -1
            end>
          Properties.ShowDescriptions = False
          HeaderAlignmentHorz = taCenter
          Width = 47
        end
      end
      object l_data: TcxGridLevel
        GridView = t_data
      end
    end
    object pnlheader: TPanel
      Left = 0
      Top = 0
      Width = 764
      Height = 33
      Align = alTop
      TabOrder = 1
      object Ed_Cari: TsEdit
        Left = 81
        Top = 1
        Width = 447
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
        Left = 528
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
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 56
  end
  object Q_harga: TMyQuery
    Connection = dm.db_conn
    Left = 8
    Top = 216
  end
  object Ds_harga: TDataSource
    DataSet = Q_harga
    Left = 72
    Top = 216
  end
end
