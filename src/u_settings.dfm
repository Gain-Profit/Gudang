object FrmSetting: TFrmSetting
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Setting'
  ClientHeight = 288
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 247
    Width = 384
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      384
      41)
    object btnBatal: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Batal'
      ModalResult = 7
      TabOrder = 1
    end
    object btnSimpan: TButton
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Simpan'
      ModalResult = 6
      TabOrder = 0
      OnClick = btnSimpanClick
    end
  end
end
