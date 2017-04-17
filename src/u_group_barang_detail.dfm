object FGroupBarangDetail: TFGroupBarangDetail
  Left = 0
  Top = 0
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
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TsPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 121
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      680
      121)
    object sLabel1: TsLabel
      Left = 8
      Top = 10
      Width = 57
      Height = 13
      Caption = 'Kode Group'
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 34
      Width = 75
      Height = 13
      Caption = 'Deskripsi Group'
    end
    object sBevel1: TsBevel
      Left = 1
      Top = 88
      Width = 678
      Height = 32
      Align = alBottom
    end
    object sb_cari: TsSpeedButton
      Tag = 9
      Left = 652
      Top = 94
      Width = 24
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      OnClick = sb_cariClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      Images = dm.gambar
      ImageIndex = 0
    end
    object lblDiskon: TsLabel
      Left = 8
      Top = 60
      Width = 33
      Height = 13
      Caption = 'Diskon'
    end
    object edKodeGroup: TEdit
      Left = 96
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 0
    end
    object edDeskripsiGroup: TEdit
      Left = 96
      Top = 32
      Width = 577
      Height = 21
      TabOrder = 1
    end
    object ed_code: TEdit
      Left = 8
      Top = 94
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
      TabOrder = 4
      OnKeyDown = ed_codeKeyDown
      OnKeyPress = ed_codeKeyPress
    end
    object edDiskon: TsCurrencyEdit
      Left = 96
      Top = 58
      Width = 137
      Height = 20
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      SkinData.CustomColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      DisplayFormat = '###,###,##0;(###,###,##0);0'
    end
    object btnDiskon: TsButton
      Left = 42
      Top = 58
      Width = 50
      Height = 20
      Caption = 'Rupiah'
      TabOrder = 2
      OnClick = btnDiskonClick
      SkinData.SkinSection = 'BUTTON'
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
    object l_2: TsLabel
      Left = 120
      Top = 4
      Width = 121
      Height = 13
      Caption = 'ubah Qty -> angka+ (11+)'
    end
    object l_1: TsLabel
      Left = 96
      Top = 4
      Width = 22
      Height = 13
      Caption = 'Ket :'
    end
    object l_5: TsLabel
      Left = 120
      Top = 20
      Width = 130
      Height = 13
      Caption = 'Hapus Baris -> Ctrl + Delete'
    end
    object btnSimpan: TsButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = btnSimpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnKeluar: TsButton
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = '&keluar'
      TabOrder = 1
      OnClick = btnKeluarClick
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
  object Grid: TcxGrid
    Left = 0
    Top = 121
    Width = 680
    Height = 279
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object TableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Append.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Total'
          Kind = skCount
          Column = vwKode
          DisplayText = 'Total'
        end
        item
          Format = '0 Item Barang'
          Kind = skCount
          Column = vwDeskripsi
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = vwQty
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
      object vwKode: TcxGridColumn
        Caption = 'PID'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 58
      end
      object vwDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 232
      end
      object vwBarcode: TcxGridColumn
        Caption = 'Barcode'
        Options.Editing = False
      end
      object vwQty: TcxGridColumn
        Caption = 'Qty'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        Properties.EditFormat = '###,###,##0;(###,###,##0);0'
        Properties.MinValue = 1.000000000000000000
        FooterAlignmentHorz = taCenter
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Options.IncSearch = False
        Width = 58
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 120
  end
end
