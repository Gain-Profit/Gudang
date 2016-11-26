object f_emp: Tf_emp
  Left = 420
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Set Up User'
  ClientHeight = 255
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pUser: TsPanel
    Left = 0
    Top = 225
    Width = 464
    Height = 30
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object B_save: TsButton
      Left = 384
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = B_saveClick
      SkinData.SkinSection = 'BUTTON_BIG'
    end
  end
  object pc_user: TsPageControl
    Left = 0
    Top = 0
    Width = 464
    Height = 225
    ActivePage = ts_general
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object ts_general: TsTabSheet
      Caption = 'General'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sLabel4: TsLabel
        Left = 8
        Top = 92
        Width = 97
        Height = 13
        Caption = 'Konfirmasi Password'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel3: TsLabel
        Left = 8
        Top = 65
        Width = 46
        Height = 13
        Caption = 'Password'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel2: TsLabel
        Left = 8
        Top = 11
        Width = 50
        Height = 13
        Caption = 'Kode User'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel1: TsLabel
        Left = 8
        Top = 38
        Width = 53
        Height = 13
        Caption = 'Nama User'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object l_1: TsLabel
        Left = 8
        Top = 160
        Width = 77
        Height = 13
        Caption = 'Hak Akses User'
      end
      object gambar: TcxImage
        Left = 304
        Top = 8
        Properties.Stretch = True
        TabOrder = 9
        Height = 150
        Width = 150
      end
      object ed_pass2: TsEdit
        Left = 120
        Top = 92
        Width = 177
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 3
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
      object ed_pass: TsEdit
        Left = 120
        Top = 65
        Width = 177
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 2
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
      object ed_nama: TsEdit
        Left = 120
        Top = 38
        Width = 177
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
      object ed_kode: TsEdit
        Left = 120
        Top = 11
        Width = 177
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
      object cb_server: TsCheckBox
        Left = 120
        Top = 176
        Width = 76
        Height = 20
        Caption = 'Server POS'
        TabOrder = 7
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object cb_kasir: TsCheckBox
        Left = 208
        Top = 176
        Width = 43
        Height = 20
        Caption = 'Kasir'
        TabOrder = 8
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object cb_gudang: TsCheckBox
        Left = 120
        Top = 152
        Width = 58
        Height = 20
        Caption = 'Gudang'
        TabOrder = 5
        OnClick = cb_gudangClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object cb_akun: TsCheckBox
        Left = 208
        Top = 152
        Width = 67
        Height = 20
        Caption = 'Akuntansi'
        TabOrder = 6
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object btnpass: TsButton
        Left = 176
        Top = 120
        Width = 120
        Height = 25
        Caption = 'Ubah Password'
        TabOrder = 4
        OnClick = btnpassClick
        SkinData.SkinSection = 'BUTTON_BIG'
      end
      object cb_admin: TsCheckBox
        Left = 304
        Top = 177
        Width = 49
        Height = 20
        Caption = 'Admin'
        TabOrder = 10
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object ts_gudang: TsTabSheet
      Caption = 'Hak Akses Gudang'
      PopupMenu = pmUser
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object gb_master: TsGroupBox
        Left = 0
        Top = 0
        Width = 456
        Height = 41
        Align = alTop
        Caption = '| Master |'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object cb_master: TsCheckBox
          Left = 8
          Top = 16
          Width = 78
          Height = 20
          Caption = 'Data Master'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_Setting: TsCheckBox
          Left = 192
          Top = 16
          Width = 100
          Height = 20
          Caption = 'Setting Inventory'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object gb_Inv: TsGroupBox
        Left = 0
        Top = 41
        Width = 456
        Height = 64
        Align = alTop
        Caption = '| Inventory |'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object cb_Barang: TsCheckBox
          Left = 8
          Top = 16
          Width = 54
          Height = 20
          Caption = 'Barang'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_Harga: TsCheckBox
          Left = 192
          Top = 16
          Width = 49
          Height = 20
          Caption = 'Harga'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_Plano: TsCheckBox
          Left = 192
          Top = 40
          Width = 70
          Height = 20
          Caption = 'Planogram'
          TabOrder = 3
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_BrgSupp: TsCheckBox
          Left = 8
          Top = 40
          Width = 95
          Height = 20
          Caption = 'Barang Supplier'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_brgUpdate: TsCheckBox
          Left = 328
          Top = 16
          Width = 79
          Height = 20
          Caption = 'Update data'
          TabOrder = 4
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object gb_Transaksi: TsGroupBox
        Left = 0
        Top = 105
        Width = 456
        Height = 88
        Align = alTop
        Caption = '| Transaksi |'
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object cb_PO: TsCheckBox
          Left = 8
          Top = 16
          Width = 118
          Height = 20
          Caption = 'Purchase Order (PO)'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_RO: TsCheckBox
          Left = 8
          Top = 40
          Width = 111
          Height = 20
          Caption = 'Receipt Order (RO)'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_Return: TsCheckBox
          Left = 8
          Top = 64
          Width = 52
          Height = 20
          Caption = 'Return'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_ReturnKirim: TsCheckBox
          Left = 192
          Top = 40
          Width = 77
          Height = 20
          Caption = 'Return Kirim'
          TabOrder = 4
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object cb_kirim: TsCheckBox
          Left = 192
          Top = 16
          Width = 79
          Height = 20
          Caption = 'Kirim Barang'
          TabOrder = 3
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
    end
    object ts_server: TsTabSheet
      Caption = 'Hak Akses Server POS '
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object gb_md: TsGroupBox
        Left = 0
        Top = 0
        Width = 456
        Height = 41
        Align = alTop
        Caption = '| Admin |'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object cb_md: TsCheckBox
          Left = 8
          Top = 16
          Width = 110
          Height = 20
          Caption = 'Merchandiser (MD)'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
    end
  end
  object t_upd: TmySQLUpdateSQL
    Left = 400
    Top = 176
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 368
    Top = 176
  end
  object pmUser: TPopupMenu
    Left = 428
    Top = 32
    object mniall: TMenuItem
      Caption = 'Akses Penuh'
      OnClick = mniallClick
    end
    object mniNotAll: TMenuItem
      Caption = 'Tanpa Akses'
      OnClick = mniNotAllClick
    end
  end
end
