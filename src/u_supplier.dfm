object F_supplier: TF_supplier
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Supplier'
  ClientHeight = 275
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel2: TsLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Kode Supplier'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel1: TsLabel
    Left = 8
    Top = 34
    Width = 69
    Height = 13
    Caption = 'Nama Supplier'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel3: TsLabel
    Left = 8
    Top = 60
    Width = 73
    Height = 13
    Caption = 'Alamat Supplier'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel4: TsLabel
    Left = 8
    Top = 86
    Width = 63
    Height = 13
    Caption = 'Kota Supplier'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel5: TsLabel
    Left = 8
    Top = 113
    Width = 92
    Height = 13
    Caption = 'Telephone Supplier'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel6: TsLabel
    Left = 8
    Top = 139
    Width = 75
    Height = 13
    Caption = 'Kontak Supplier'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel7: TsLabel
    Left = 8
    Top = 165
    Width = 39
    Height = 13
    Caption = 'Website'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel8: TsLabel
    Left = 8
    Top = 192
    Width = 29
    Height = 13
    Caption = 'E-Mail'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object ed_nama: TEdit
    Left = 120
    Top = 34
    Width = 177
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ed_alamat: TEdit
    Left = 120
    Top = 60
    Width = 297
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ed_kota: TEdit
    Left = 120
    Top = 86
    Width = 129
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object ed_telp: TEdit
    Left = 120
    Top = 113
    Width = 129
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object ed_kontak: TEdit
    Left = 120
    Top = 139
    Width = 249
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object ed_web: TEdit
    Left = 120
    Top = 165
    Width = 249
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object ed_mail: TEdit
    Left = 120
    Top = 192
    Width = 249
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object B_new: TsButton
    Left = 248
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Baru'
    TabOrder = 9
    OnClick = B_newClick
    SkinData.SkinSection = 'BUTTON_BIG'
  end
  object B_save: TsButton
    Left = 336
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 10
    OnClick = B_saveClick
    SkinData.SkinSection = 'BUTTON_BIG'
  end
  object ed_kode: TEdit
    Left = 120
    Top = 8
    Width = 129
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object b_auto: TsButton
    Left = 256
    Top = 8
    Width = 89
    Height = 21
    Caption = '&Auto Kode'
    TabOrder = 1
    OnClick = b_autoClick
    SkinData.SkinSection = 'BUTTON'
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
    Top = 8
  end
end
