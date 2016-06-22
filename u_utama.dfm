object f_utama: Tf_utama
  Left = 16
  Top = 123
  Width = 1019
  Height = 480
  AlphaBlend = True
  Caption = 'Central of Profit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sg_update: TsGauge
    Left = 0
    Top = 367
    Width = 1003
    Height = 30
    Align = alBottom
    Visible = False
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    MaxValue = 70
    Progress = 0
    Suffix = ' %'
  end
  object sb: TsStatusBar
    Left = 0
    Top = 397
    Width = 1003
    Height = 25
    Panels = <
      item
        Alignment = taCenter
        Text = 'USER'
        Width = 50
      end
      item
        Alignment = taCenter
        Text = 'NAMA USER'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'koneksi'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'CO'
        Width = 60
      end
      item
        Alignment = taCenter
        Text = 'nama CO'
        Width = 200
      end
      item
        Alignment = taCenter
        Text = 'senin'
        Width = 100
      end
      item
        Alignment = taCenter
        Text = '01 mei 2013'
        Width = 100
      end
      item
        Alignment = taCenter
        Text = '00:00:00'
        Width = 100
      end
      item
        Alignment = taCenter
        Text = 'PST'
        Width = 100
      end
      item
        Text = 'versi'
        Width = 50
      end>
    SkinData.SkinSection = 'STATUSBAR'
  end
  object pc: TsPageControl
    Left = 0
    Top = 0
    Width = 1003
    Height = 113
    ActivePage = ts_1
    Align = alTop
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MultiLine = True
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    SkinData.SkinSection = 'TABRIGHT'
    TabPadding = 12
    object ts_master: TsTabSheet
      Caption = 'Inventory'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel2: TsPanel
        Left = 0
        Top = 0
        Width = 995
        Height = 81
        Align = alTop
        BorderWidth = 5
        ParentBackground = True
        ParentColor = True
        TabOrder = 0
        SkinData.SkinSection = 'TOOLBAR'
        object sSpeedButton12: TsSpeedButton
          Left = 843
          Top = 6
          Width = 146
          Height = 69
          Cursor = crHandPoint
          Action = Action1
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alRight
          SkinData.SkinSection = 'TOOLBUTTON'
          DisabledGlyphKind = []
          ImageIndex = 6
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton13: TsSpeedButton
          Left = 6
          Top = 6
          Width = 91
          Height = 69
          Cursor = crHandPoint
          Action = ac_barang
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 14
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton14: TsSpeedButton
          Left = 97
          Top = 6
          Width = 89
          Height = 69
          Cursor = crHandPoint
          Action = ac_harga
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 16
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton15: TsSpeedButton
          Left = 186
          Top = 6
          Width = 111
          Height = 69
          Cursor = crHandPoint
          Action = ac_planogram
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 15
          Images = dm.image
          Reflected = True
        end
        object sb_kirim_data: TsSpeedButton
          Left = 568
          Top = 6
          Width = 120
          Height = 69
          Cursor = crHandPoint
          Action = ac_kirim_data
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 2
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton2: TsSpeedButton
          Left = 297
          Top = 6
          Width = 151
          Height = 69
          Cursor = crHandPoint
          Action = ac_barang_supp
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 4
          Images = dm.image
          Reflected = True
        end
        object sb_lap: TsSpeedButton
          Left = 448
          Top = 6
          Width = 120
          Height = 69
          Cursor = crHandPoint
          Action = ac_lap
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 12
          Images = dm.image
          Reflected = True
        end
        object sb_update_barang_harga: TsSpeedButton
          Left = 688
          Top = 6
          Width = 120
          Height = 69
          Cursor = crHandPoint
          Action = ac_update
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 0
          Images = dm.image
          Reflected = True
        end
      end
    end
    object ts_transaksi: TsTabSheet
      Caption = 'Transaksi'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel3: TsPanel
        Left = 0
        Top = 0
        Width = 995
        Height = 81
        Align = alTop
        BorderWidth = 5
        ParentBackground = True
        ParentColor = True
        TabOrder = 0
        SkinData.SkinSection = 'TOOLBAR'
        object sSpeedButton18: TsSpeedButton
          Left = 843
          Top = 6
          Width = 146
          Height = 69
          Cursor = crHandPoint
          Action = Action1
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alRight
          SkinData.SkinSection = 'TOOLBUTTON'
          DisabledGlyphKind = []
          ImageIndex = 6
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton19: TsSpeedButton
          Left = 6
          Top = 6
          Width = 75
          Height = 69
          Cursor = crHandPoint
          Action = ac_purchase
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 17
          Images = dm.image
          Reflected = True
        end
        object sb_return_kirim: TsSpeedButton
          Left = 353
          Top = 6
          Width = 136
          Height = 69
          Cursor = crHandPoint
          Action = ac_return_kirim
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 20
          Images = dm.image
          Reflected = True
        end
        object spdbtnac_return: TsSpeedButton
          Left = 156
          Top = 6
          Width = 75
          Height = 69
          Cursor = crHandPoint
          Action = ac_return
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 19
          Images = dm.image
          Reflected = True
        end
        object spdbtnkirim: TsSpeedButton
          Left = 231
          Top = 6
          Width = 122
          Height = 69
          Cursor = crHandPoint
          Action = ac_kirim
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 8
          Images = dm.image
          Reflected = True
        end
        object sb_receipt: TsSpeedButton
          Left = 81
          Top = 6
          Width = 75
          Height = 69
          Cursor = crHandPoint
          Action = ac_receipt
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 18
          Images = dm.image
          Reflected = True
        end
        object sb_realCard: TsSpeedButton
          Left = 489
          Top = 6
          Width = 112
          Height = 69
          Cursor = crHandPoint
          Action = ac_realcard
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 10
          Images = dm.image
          Reflected = True
        end
        object sb_Barcode: TsSpeedButton
          Left = 601
          Top = 6
          Width = 104
          Height = 69
          Cursor = crHandPoint
          Action = ac_barcode
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 15
          Images = dm.image
          Reflected = True
        end
      end
    end
    object ts_1: TsTabSheet
      Caption = 'Daftar Transaksi'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object spnl1: TsPanel
        Left = 0
        Top = 0
        Width = 995
        Height = 81
        Align = alTop
        BorderWidth = 5
        ParentBackground = True
        ParentColor = True
        TabOrder = 0
        SkinData.SkinSection = 'TOOLBAR'
        object sb_list_receipt: TsSpeedButton
          Left = 113
          Top = 6
          Width = 96
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_receipt
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
        object sb_Action1: TsSpeedButton
          Left = 843
          Top = 6
          Width = 146
          Height = 69
          Cursor = crHandPoint
          Action = Action1
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alRight
          SkinData.SkinSection = 'TOOLBUTTON'
          DisabledGlyphKind = []
          ImageIndex = 6
          Images = dm.image
          Reflected = True
        end
        object sb_list_purchase: TsSpeedButton
          Left = 6
          Top = 6
          Width = 107
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_purchase
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
        object sb_list_return1: TsSpeedButton
          Left = 209
          Top = 6
          Width = 104
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_return
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
        object sb_list_kirim1: TsSpeedButton
          Left = 705
          Top = 6
          Width = 104
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_so
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
        object sb_list_kirim: TsSpeedButton
          Left = 497
          Top = 6
          Width = 104
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_kirim
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
        object sb_list_return_kirim: TsSpeedButton
          Left = 601
          Top = 6
          Width = 104
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_return_kirim
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
        object sb_list_sales: TsSpeedButton
          Left = 313
          Top = 6
          Width = 80
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_sales
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
        object btnRetunJual: TsSpeedButton
          Left = 393
          Top = 6
          Width = 104
          Height = 69
          Cursor = crHandPoint
          Action = ac_list_return_jual
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          Images = dm.image
          Reflected = True
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 'Master Data'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sCoolBar1: TsPanel
        Left = 0
        Top = 0
        Width = 995
        Height = 81
        Align = alTop
        BorderWidth = 5
        ParentBackground = True
        ParentColor = True
        TabOrder = 0
        SkinData.SkinSection = 'TOOLBAR'
        object sBitBtn1: TsSpeedButton
          Left = 843
          Top = 6
          Width = 146
          Height = 69
          Cursor = crHandPoint
          Action = Action1
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alRight
          SkinData.SkinSection = 'TOOLBUTTON'
          DisabledGlyphKind = []
          ImageIndex = 6
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton1: TsSpeedButton
          Left = 6
          Top = 6
          Width = 123
          Height = 69
          Cursor = crHandPoint
          Action = ac_company
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 3
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton3: TsSpeedButton
          Left = 129
          Top = 6
          Width = 112
          Height = 69
          Cursor = crHandPoint
          Action = Ac_supplier
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 1
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton4: TsSpeedButton
          Left = 241
          Top = 6
          Width = 114
          Height = 69
          Cursor = crHandPoint
          Action = ac_cust
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 4
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton23: TsSpeedButton
          Left = 355
          Top = 6
          Width = 142
          Height = 69
          Cursor = crHandPoint
          Action = ac_user
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 5
          Images = dm.image
          Reflected = True
        end
        object SbubahPassword: TsSpeedButton
          Left = 497
          Top = 6
          Width = 142
          Height = 69
          Cursor = crHandPoint
          Caption = 'Ubah Password'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          OnClick = SbubahPasswordClick
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 5
          Images = dm.image
          Reflected = True
        end
        object SbGroupBarang: TsSpeedButton
          Left = 639
          Top = 6
          Width = 142
          Height = 69
          Cursor = crHandPoint
          Caption = 'Group Barang'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          OnClick = SbGroupBarangClick
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 9
          Images = dm.image
          Reflected = True
        end
      end
    end
    object ts_set_inv: TsTabSheet
      Caption = 'Setting Inventory'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel1: TsPanel
        Left = 0
        Top = 0
        Width = 995
        Height = 81
        Align = alTop
        BorderWidth = 5
        ParentBackground = True
        ParentColor = True
        TabOrder = 0
        SkinData.SkinSection = 'TOOLBAR'
        object sSpeedButton5: TsSpeedButton
          Left = 506
          Top = 6
          Width = 114
          Height = 69
          Cursor = crHandPoint
          Action = Ac_satuan
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 13
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton6: TsSpeedButton
          Left = 843
          Top = 6
          Width = 146
          Height = 69
          Cursor = crHandPoint
          Action = Action1
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alRight
          SkinData.SkinSection = 'TOOLBUTTON'
          DisabledGlyphKind = []
          ImageIndex = 6
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton7: TsSpeedButton
          Left = 6
          Top = 6
          Width = 114
          Height = 69
          Cursor = crHandPoint
          Action = ac_jenis
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 9
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton8: TsSpeedButton
          Left = 241
          Top = 6
          Width = 151
          Height = 69
          Cursor = crHandPoint
          Action = ac_kategori
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 11
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton9: TsSpeedButton
          Left = 120
          Top = 6
          Width = 121
          Height = 69
          Cursor = crHandPoint
          Action = ac_golongan
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 10
          Images = dm.image
          Reflected = True
        end
        object sSpeedButton10: TsSpeedButton
          Left = 392
          Top = 6
          Width = 114
          Height = 69
          Cursor = crHandPoint
          Action = ac_merk
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 12
          Images = dm.image
          Reflected = True
        end
      end
    end
  end
  object tc_child: TsTabControl
    Left = 0
    Top = 113
    Width = 1003
    Height = 24
    Cursor = crHandPoint
    Align = alTop
    PopupMenu = pm1
    TabOrder = 2
    Visible = False
    OnChange = tc_childChange
    SkinData.SkinSection = 'PAGECONTROL'
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
    Top = 296
  end
  object MainMenu1: TMainMenu
    OwnerDraw = True
    Left = 72
    Top = 296
    object SetUpDefaultCompany1: TMenuItem
      Caption = '&Pengaturan'
      object UbahSkin1: TMenuItem
        Caption = 'Ubah Skin'
        ShortCut = 45
        OnClick = UbahSkin1Click
      end
      object HidePanelControl1: TMenuItem
        Caption = 'Hide Panel Control'
        RadioItem = True
        ShortCut = 8237
        OnClick = HidePanelControl1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object DefaultCompany1: TMenuItem
        Caption = 'Default Company'
        ShortCut = 16452
        OnClick = DefaultCompany1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object LogOut1: TMenuItem
        Caption = 'Log Out'
        ShortCut = 16465
        OnClick = LogOut1Click
      end
    end
    object Inventory1: TMenuItem
      Caption = '&Inventory'
      object Barang1: TMenuItem
        Action = ac_barang
        ShortCut = 16450
      end
      object Harga1: TMenuItem
        Action = ac_harga
        ShortCut = 16456
      end
      object Planogram1: TMenuItem
        Action = ac_planogram
        ShortCut = 16464
      end
      object BarangSupplier1: TMenuItem
        Action = ac_barang_supp
        ShortCut = 16466
      end
      object Laporan1: TMenuItem
        Action = ac_lap
        ShortCut = 16460
      end
    end
    object ransaksi1: TMenuItem
      Caption = '&Transaksi'
      object PO1: TMenuItem
        Action = ac_purchase
        ShortCut = 16496
      end
      object RO1: TMenuItem
        Action = ac_receipt
        ShortCut = 16497
      end
      object Return1: TMenuItem
        Action = ac_return
        ShortCut = 16498
      end
      object KirimData1: TMenuItem
        Action = ac_kirim
      end
      object ReturnKirim1: TMenuItem
        Action = ac_return_kirim
      end
      object RealCard1: TMenuItem
        Action = ac_realcard
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object DaftarPurchaseOrderPO1: TMenuItem
        Action = ac_list_purchase
        ShortCut = 16500
      end
      object DaftarReceiptOrderRO1: TMenuItem
        Action = ac_list_receipt
        ShortCut = 16501
      end
      object DaftarReturnPembelian1: TMenuItem
        Action = ac_list_return
        ShortCut = 16502
      end
      object DaftarKirimBarang1: TMenuItem
        Action = ac_list_kirim
        ShortCut = 16503
      end
      object DaftarReturnKirim1: TMenuItem
        Action = ac_list_return_kirim
      end
      object DaftarPenjualan1: TMenuItem
        Action = ac_list_sales
      end
      object DaftarStokOpnameSO1: TMenuItem
        Action = ac_list_so
      end
    end
    object MasterData1: TMenuItem
      Caption = '&Master Data'
      object Company1: TMenuItem
        Action = ac_company
        ShortCut = 16455
      end
      object Supplier1: TMenuItem
        Action = Ac_supplier
        ShortCut = 16467
      end
      object Pelanggan1: TMenuItem
        Action = ac_cust
        ShortCut = 49232
      end
      object User1: TMenuItem
        Action = ac_user
        ShortCut = 16469
      end
    end
    object SettingInventori1: TMenuItem
      Caption = '&Setting Inventory'
      object Jenis1: TMenuItem
        Action = ac_jenis
        ShortCut = 16458
      end
      object Golongan1: TMenuItem
        Action = ac_golongan
        ShortCut = 16455
      end
      object Kategori1: TMenuItem
        Action = ac_kategori
        ShortCut = 16459
      end
      object Merk1: TMenuItem
        Action = ac_merk
        ShortCut = 16461
      end
      object Satuan1: TMenuItem
        Action = Ac_satuan
        ShortCut = 49235
      end
    end
    object Pertolongan1: TMenuItem
      Caption = 'Pertolongan'
      object CentralofProfitHelp1: TMenuItem
        Caption = 'Central of Profit Help'
        ShortCut = 112
        OnClick = CentralofProfitHelp1Click
      end
      object mniN6: TMenuItem
        Caption = '-'
      end
      object mniCekUpdateProgram1: TMenuItem
        Action = ac_cekUpdate
        ShortCut = 16496
      end
    end
  end
  object AL: TActionList
    Images = dm.image
    Left = 40
    Top = 296
    object ac_barang: TAction
      Caption = 'Barang'
      ImageIndex = 14
      OnExecute = ac_barangExecute
    end
    object ac_harga: TAction
      Caption = 'Harga'
      ImageIndex = 16
      OnExecute = ac_hargaExecute
    end
    object ac_receipt: TAction
      Caption = 'RO'
      ImageIndex = 18
      OnExecute = ac_receiptExecute
    end
    object ac_return: TAction
      Caption = 'Return'
      ImageIndex = 19
      OnExecute = ac_returnExecute
    end
    object ac_return_kirim: TAction
      Caption = 'Return Kirim'
      ImageIndex = 20
      OnExecute = ac_return_kirimExecute
    end
    object ac_company: TAction
      Tag = 8
      Caption = 'Company'
      ImageIndex = 3
      OnExecute = ac_companyExecute
    end
    object ac_jenis: TAction
      Tag = 1
      Caption = 'Jenis'
      ImageIndex = 9
      OnExecute = ac_jenisExecute
    end
    object ac_golongan: TAction
      Tag = 2
      Caption = 'Golongan'
      ImageIndex = 10
      OnExecute = ac_golonganExecute
    end
    object ac_kategori: TAction
      Tag = 4
      Caption = 'Kategori'
      ImageIndex = 11
      OnExecute = ac_kategoriExecute
    end
    object ac_merk: TAction
      Tag = 3
      Caption = 'Merk'
      ImageIndex = 12
      OnExecute = ac_merkExecute
    end
    object Ac_supplier: TAction
      Tag = 9
      Caption = 'Supplier'
      ImageIndex = 1
      OnExecute = Ac_supplierExecute
    end
    object Ac_satuan: TAction
      Tag = 5
      Caption = 'Satuan'
      ImageIndex = 13
      OnExecute = Ac_satuanExecute
    end
    object ac_purchase: TAction
      Caption = 'PO'
      ImageIndex = 17
      OnExecute = ac_purchaseExecute
    end
    object ac_barang_supp: TAction
      Caption = 'Barang Supplier'
      ImageIndex = 4
      OnExecute = ac_barang_suppExecute
    end
    object ac_planogram: TAction
      Caption = 'Planogram'
      ImageIndex = 15
      OnExecute = ac_planogramExecute
    end
    object ac_cust: TAction
      Caption = 'Pelanggan'
      ImageIndex = 4
      OnExecute = ac_custExecute
    end
    object ac_user: TAction
      Caption = 'User'
      ImageIndex = 5
      OnExecute = ac_userExecute
    end
    object ac_realcard: TAction
      Caption = 'Real Card'
      ImageIndex = 10
      OnExecute = ac_realcardExecute
    end
    object ac_barcode: TAction
      Caption = 'Barcode'
      ImageIndex = 15
      OnExecute = ac_barcodeExecute
    end
    object ac_list_purchase: TAction
      Caption = 'Daftar Purchase Order (PO)'
      OnExecute = ac_list_purchaseExecute
    end
    object ac_list_receipt: TAction
      Caption = 'Daftar Receipt Order (RO)'
      OnExecute = ac_list_receiptExecute
    end
    object ac_list_so: TAction
      Caption = 'Daftar Stok Opname (SO)'
      OnExecute = ac_list_soExecute
    end
    object ac_list_return: TAction
      Caption = 'Daftar Return Pembelian'
      OnExecute = ac_list_returnExecute
    end
    object ac_list_return_kirim: TAction
      Caption = 'Daftar Return Kirim'
      OnExecute = ac_list_return_kirimExecute
    end
    object ac_list_sales: TAction
      Caption = 'Daftar Penjualan'
      OnExecute = ac_list_salesExecute
    end
    object ac_list_kirim: TAction
      Caption = 'Daftar Kirim'#13#10'Barang'
      OnExecute = ac_list_kirimExecute
    end
    object Action1: TAction
      Caption = 'Keluar'
      ImageIndex = 6
      OnExecute = Action1Execute
    end
    object ac_lap: TAction
      Caption = 'Laporan'
      ImageIndex = 12
      OnExecute = ac_lapExecute
    end
    object ac_kirim: TAction
      Caption = 'Kirim Barang'
      ImageIndex = 8
      OnExecute = ac_kirimExecute
    end
    object ac_kirim_data: TAction
      Caption = 'Tukar Data'
      ImageIndex = 2
      Visible = False
      OnExecute = ac_kirim_dataExecute
    end
    object ac_update: TAction
      Caption = 'Update Data'
      ImageIndex = 0
      Visible = False
      OnExecute = ac_updateExecute
    end
    object ac_cekUpdate: TAction
      Caption = 'Cek Update Aplikasi'
      OnExecute = ac_cekUpdateExecute
    end
    object ac_list_return_jual: TAction
      Caption = 'Daftar Return'#13#10'Penjualan'
      OnExecute = ac_list_return_jualExecute
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 104
    Top = 296
  end
  object time_out: TTimer
    Enabled = False
    Interval = 500
    OnTimer = time_outTimer
    Left = 16
    Top = 328
  end
  object animasi: TTimer
    Enabled = False
    Interval = 20
    OnTimer = animasiTimer
    Left = 48
    Top = 328
  end
  object pm1: TPopupMenu
    Left = 16
    Top = 120
    object utup1: TMenuItem
      Caption = 'Tutup'
      OnClick = utup1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object utupSemua1: TMenuItem
      Caption = 'Tutup Semua'
      OnClick = utupSemua1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object utupSemuaKecualiini1: TMenuItem
      Caption = 'Tutup Semua Kecuali ini'
      OnClick = utupSemuaKecualiini1Click
    end
  end
  object Q_time: TmySQLQuery
    Database = dm.My_conn
    Left = 56
    Top = 192
  end
end
