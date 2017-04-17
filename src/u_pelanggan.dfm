object F_cust: TF_cust
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Set Up Pelanggan'
  ClientHeight = 261
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel2: TsLabel
    Left = 8
    Top = 3
    Width = 79
    Height = 13
    Caption = 'Kode Pelanggan'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel1: TsLabel
    Left = 8
    Top = 30
    Width = 82
    Height = 13
    Caption = 'Nama Pelanggan'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel3: TsLabel
    Left = 8
    Top = 57
    Width = 63
    Height = 13
    Caption = 'No Rekening'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel4: TsLabel
    Left = 8
    Top = 84
    Width = 86
    Height = 13
    Caption = 'Alamat Pelanggan'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel5: TsLabel
    Left = 8
    Top = 111
    Width = 55
    Height = 13
    Caption = 'alamat kirim'
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
    Width = 59
    Height = 13
    Caption = 'Limit Hutang'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel6: TsLabel
    Left = 8
    Top = 138
    Width = 21
    Height = 13
    Caption = 'Telp'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object ed_kode: TsEdit
    Left = 120
    Top = 3
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
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object ed_nama: TsEdit
    Left = 120
    Top = 30
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
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object ed_rekening: TsEdit
    Left = 120
    Top = 57
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
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object ed_alamat: TsEdit
    Left = 120
    Top = 84
    Width = 297
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object ed_alamat_kirim: TsEdit
    Left = 120
    Top = 111
    Width = 297
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object B_new: TsButton
    Left = 256
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Baru'
    TabOrder = 9
    OnClick = B_newClick
    SkinData.SkinSection = 'BUTTON_BIG'
  end
  object B_save: TsButton
    Left = 344
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 8
    OnClick = B_saveClick
    SkinData.SkinSection = 'BUTTON_BIG'
  end
  object ed_telp: TsEdit
    Left = 120
    Top = 138
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
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object ED_LIMIT: TsCurrencyEdit
    Left = 120
    Top = 162
    Width = 137
    Height = 24
    AutoSize = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
    SkinData.CustomColor = True
    SkinData.SkinSection = 'EDIT'
    GlyphMode.Blend = 0
    GlyphMode.Grayed = False
    DecimalPlaces = 0
    DisplayFormat = '###,###,##0;-###,###,##0;0'
  end
  object b_auto: TsButton
    Left = 256
    Top = 3
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
