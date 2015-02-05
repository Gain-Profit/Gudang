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
    Top = 366
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
    Top = 396
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
          Glyph.Data = {
            660F0000424D660F000000000000360000002800000024000000240000000100
            180000000000300F000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFB00FBD30D
            D7AD2ABA8A70AC5F968D48AD7D40B7774BB97F48BA7D40B6784DA781698F9393
            63B1B51CBEDF09E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFC00FCD216D98C59A7639C9151BA836DC89893D6B3AFE0C6B8E4CDC3E6D4C1
            E7D3B7E4CCA8DCC28BD3AD64C49152B4856C92989A44AFE30BE6FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFEA02EB9843AC59A68A59C18A92D5B2D1EDDEEBF5F1F7
            F8F9FFFDFFFFFDFFFFFCFFFFFDFFFFFDFFFDFAFEF5F9F8E7F4EEC4E6D580CEA5
            57BB88639691AF26BBF301F3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD614DD777D9D52B8838ED4AFD8
            EFE3FAFBFBFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFE
            FFFEFFFFFEFFFFFCFEF6FBF9C8E9D97ACDA151AF828F64ADE907EBFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC41CCD68
            91925EC28DB6E1CBF5FAF7FFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFF
            F6F9F8E7F5EFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFEAF4F09EDA
            BB55BC877D74A0DA0BDDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFD514DB62968F65C592CAE9DAFDFAFDFFFCFFFEFCFEFDFAFDFEFCFE
            FEFCFEFDFAFDFFFDFFF6F9F8B2E1CBAADFC6FEFCFEFDFAFDFEFCFEFEFCFEFDFA
            FDFEFCFEFEFCFEFFFBFEF8FAFAB2E1C855BE857C75A0E907EBFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFDE09E1718A9A62C38FCEEBDCFFFEFFFEFCFE
            FFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEF0F9F5ABE1C86ECBA0A5E0C4FFFE
            FFFFFCFFFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFCFDFDB2E1C854
            BD868F64ADF401F4FF00FFFF00FFFF00FFFF00FFFF00FFF500F58D49A354BA85
            BEE4D1FEFDFEFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFEDF6F3A2DF
            C376D0A771CDA494DABBBDE8D5C7EADBE4F5EEFAFCFCFEFCFEFFFEFFFFFEFFFE
            FCFEFFFEFFFFFEFFF9FAFA9EDABB50AE83AE26BAFE00FEFF00FFFF00FFFF00FF
            FF00FFC623D150AE8499D7B6F7F8F9FEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFA
            FDFDFCFDE3F3EC9BD9BF77D0AA78D0AA78CFAA7BD2AC7BD1AC7DD0AC83D4B0A0
            DDC2D9EEE6FAFBFCFFFCFFFDFAFDFEFCFEFEFCFEFFFBFEEAF5F07ACDA0639690
            E30BE6FF00FFFF00FFFF00FFF501F6786F9A6AC794E0F2E9FFFCFFFFFEFFFFFE
            FFFEFCFEFFFEFFFFFEFFFFFCFFF6FBFAA7E1C878D1AA7BD3AE7DD4AF7ED2AF7D
            D4B07CD4AE7BD1AC78D2AB76D1A981D3AEBBE7D3F3F9F7FEFCFEFFFEFFFFFEFF
            FEFCFEFFFEFFC9E9D858BB899A44AFFE00FEFF00FFFF00FFC61DCF57AC89A3DB
            BEFDFDFDFEFCFEFFFEFFFFFEFFFEFCFEE8F6F0D3EFE2F8FAFAFCFDFDD2EFE493
            DABD80D5B181D5B282D4B384D6B485D7B582D4B27ED4B07AD3AD77D0AA79D2AA
            AFE2CBF5F9F9FFFEFFFFFEFFFEFCFEFFFEFFF7FAF980CFA56C9298E008E2FF00
            FFFE00FE8C42A05EC28EE0F1E9FEFCFEFDFAFDFEFCFEFEFCFEF4F7F8A8DFC77E
            D2ADC2E7D9F9FAFBFDFCFDE1F1EC9DDDC487D6B784D4B5ADE2CEEAF6F2D3EDE3
            A8E0CA84D5B47CD0AD78D0AA79D0A9C1E6D6FCFBFDFEFCFEFDFAFDFEFCFEFEFC
            FEC4E6D551B485B61CBEFF00FFE806EA73879B80CFA5FAFCFBFFFEFFFEFCFEFF
            FEFFFEFDFEC9EADC78D1A975D1A983D4B3D0EEE2FFFEFFFEFCFEE9F6F2AEE4CF
            89D7BAB9E7D6FFFEFFFEFCFEF7FBFACAEDDF89D6B77AD3AD75D1A985D4B1E1F4
            EBFFFEFFFEFCFEFFFEFFFFFEFFE7F4EE64C4919463B2FF00FFC710CC5BA48BAD
            DFC5FDFDFDFFFEFFFEFCFEFFFEFFF6FBF992D8B973D0A778D2AC88D6B6D9F1E8
            FFFEFFFEFCFEFFFEFFEEF9F5B8E6D6BDE9D9FFFEFFFEFCFEFFFEFFFDFDFDC3E9
            DA7FD4B178D2AC74CEA6AFE3CBFDFDFEFEFCFEFFFEFFFFFEFFF5F9F88BD3AD69
            8F93FF00FFB216B94EB482CFEADCFEFCFEFEFCFEFDFAFDFEFCFEDAF0E77ED0AB
            75CFA87DD2AEB2E2D0FBFBFCFEFCFEFDFAFDFEFCFEFFFDFFF2F7F7E4F4EFFEFC
            FEFDFAFDFEFCFEFEFCFEF0F6F59EDDC37BD1AC74CDA791D8B8EBF5F2FEFBFEFE
            FCFEFEFCFEFDFAFDA9DCC24DA780FF00FFA81AB048BD7FDEF1E8FFFEFFFFFEFF
            FEFCFEFFFEFFC1E9D778CFA877D2AB80D5B1DBF1E9FFFEFFFFFEFFFEFCFEFFFE
            FFFFFEFFFEFCFEFEFEFFFFFEFFFEFCFEFFFEFFFFFEFFFCFBFDC1EADA7BD3AE77
            D0A982D4AFDAF1E7FFFDFFFFFEFFFFFEFFFFFDFFB7E3CC3FB677FF00FFA71AAF
            56C288E3F2EBFFFEFFFFFEFFFEFCFEFFFEFFB7E5D075CFA678D2AB84D6B4EAF5
            F2FFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFF
            FEFFFFFDFFCEEEE17BD3AE78D1AA7DD3ADD6F0E5FFFDFFFFFEFFFFFEFFFFFDFF
            C0E7D347BA7DFF00FFA819AF5BC28BE4F1ECFEFCFEFEFCFEFDFAFDFEFCFEB9E5
            D176CDA779D0AA86D5B4EAF4F1FEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFE
            FCFEFEFCFEFDFAFDFEFCFEFEFCFEFEFBFECEECE07CD1AD77CFAA7ED1ACD5EEE4
            FEFBFEFEFCFEFEFCFEFEFBFEC3E6D54BBA80FF00FFA71AAF49BE80DFF1E9FFFE
            FFFFFEFFFEFCFEFFFEFFBEE8D576CFA777D2AA80D5B1E1F3ECFFFEFFFFFEFFFE
            FCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFDFCFEC7ECDD
            7BD3AE77D0A980D3AED8F0E6FFFDFFFFFEFFFFFEFFFFFDFFB8E4CD3FB777FF00
            FFAF18B64DB881D5EDE1FFFEFFFFFEFFFEFCFEFFFEFFD2EEE27BD1AA75D1A87D
            D3AEBEE7D7FEFDFEFFFEFFFEFCFEFFFEFFFDFDFEECF6F4FDFDFEFFFEFFFEFCFE
            FFFEFFFFFEFFF5F9F9A8E2CA7AD3AD75CFA78CD8B6E6F5EFFFFDFFFFFEFFFFFE
            FFFFFCFFAFE0C649AD7DFF00FFBF12C557A988B7E2CCFDFCFDFEFCFEFDFAFDFE
            FCFEF1F7F589D4B273CEA67AD1AB91D7BBE7F4F0FFFCFFFDFAFDFEFCFEFAFAFC
            B3E3D3D8F0E8FBFBFDFEFBFEFEFCFEFDFCFED1ECE284D4B37AD1AC72CDA6A5DE
            C5FAFAFCFDFAFDFEFCFEFEFCFEF7F8F994D5B35F968DFF00FFE009E36E90998B
            D3ADFBFCFCFFFEFFFEFCFEFFFEFFFDFDFDBBE5D374D0A676D1AA7CD1ADA4E0C7
            E9F6F1FEFCFEFFFEFFFBFDFD9FDEC696DCC1CCEDE0F9FAFBFFFEFFFCFDFDAFE3
            CE7BD3AD76D1A97ED2ADD4F0E3FFFEFFFEFCFEFFFEFFFFFEFFEBF5F16DC8988A
            71ACFF00FFFB00FB7F569965C691EBF6F1FFFEFFFEFCFEFFFEFFFFFEFFEDF6F3
            96DABC72CFA679D0AB7DD4AF99DDC0CBECDFEFF8F5F8FBFA9ADCC386D7B88FDA
            BCBFE8D8F8FBFBFFFDFFE7F4EF9CDDC175D0A7AEE1CBF9FBFBFFFEFFFEFCFEFF
            FEFFFFFEFFD1EBDE51B884AD2ABAFF00FFFF00FFB327BF56B389B4E0CAFEFCFE
            FDFAFDFEFCFEFEFCFEFDFBFEDAF0E789D5B373CDA679D0AB7BD1AC84D3B391D9
            BB95DBBE86D4B582D4B381D4B285D3B4B2E3CFEEF7F4FEFBFEE4F3EEB6E4CFEA
            F4F1FEFCFEFEFCFEFDFAFDFEFCFEFAFBFC91D5B1629D91D40CD7FF00FFFF00FF
            EE04F069829176CA9DEBF6F1FFFCFFFFFEFFFFFEFFFEFCFEFEFEFED9F1E693D9
            BA75D0A776D1AA7AD1AB7AD3AD7BD3AE7ED2AE7ED4B07DD4B07CD1AD7BD3ADBF
            E8D8FCFBFDFFFEFFFDFDFEFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFD8EFE35BBE8B
            8C59A7FA00FAFF00FFFF00FFFF00FFB435C44EB883AEE0C5FCFBFCFFFEFFFFFE
            FFFEFCFEFFFEFFFFFEFFE8F5F0B2E4CD80D4AF76CFA876D1A977D2AB79D0AB78
            D2AB77D2AA78D0AA9BDDC0E0F3ECFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFF
            FFFCFEF4FAF78DD4AF5AA68AD215D9FF00FFFF00FFFF00FFFF00FFED03EE796A
            995DC08BD4EBE0FFFDFFFEFCFEFDFAFDFEFCFEFEFCFEFEFBFEF9FAFBE5F3EEC3
            E7D8A8DFC79FDDC27ACFAA71CEA475CFA7A0DBC1ECF6F3FEFCFEFDFAFDFEFCFE
            FEFCFEFDFAFDFEFCFEFEFCFEFDFBFDB6E1CB52B7849843ACFC00FCFF00FFFF00
            FFFF00FFFF00FFFF00FFCF0FD3619B9074CA9CE2F2EAFFFEFFFEFCFEFFFEFFFF
            FEFFFEFCFEFFFEFFFFFEFFFDFBFDFCFDFDF7FBFA82D2AE6FCDA2ACE2C9F0F7F5
            FFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFCBE9D95EC28C787D
            9DEA02EAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFE00FEBD2BCA55A9867C
            CDA2E1F3EAFFFCFFFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFF9FCFB
            89D4B0B4E4CEF3FAF7FEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFEFD
            FECEECDC65C592689193D614DCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFC00FCA839B954A88673CA9CD3EBDFFCFBFDFFFDFFFDFAFDFEFCFE
            FEFCFEFDFAFDFEFCFEFBFBFCD0EADFF8FAFAFFFCFFFDFAFDFEFCFEFEFCFEFDFA
            FDFEFCFEFFFDFFF7F8F9BEE5D161C39062968FC31CCCFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFC00FCBC2CC9609D8E5CC28B
            AEE0C5EBF6F1FFFCFFFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFDFCFDFFFEFFFFFE
            FFFEFCFEFFFEFFFFFEFFFFFCFFFEFDFEE1F2E999D6B653BB8574879CD613DCFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFC00FCCC10D1796A994FB88375CB9DB4E2CAEBF6F1FCFDFCFDFCFDFFFE
            FFFFFEFFFFFCFFFFFEFFFFFEFFFFFCFEFEFDFEFAFCFCE0F1E9A3DCBD69C89450
            AE848D49A3E009E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEE03EFB436C469839157B2
            8963C7918BD3ACB7E3CBD5EEE1E0F1E9E4F1ECE4F2EBDFF1E8CEEADCAEE0C580
            CFA55DC28E58AC8A78709AC723D1F600F6FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFEE04F0B427C084539D6E909956A9874BBA804ABE805AC48B56
            C28949BD7F4EB5825BA48B73879B8C42A0C61ECFF501F6FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFD00FDE009E3BF
            13C5AE18B5A71AAFA71AAFA71AAFA71AAFB217B9C710CCE806EAFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF}
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
        object sb_kembang: TsSpeedButton
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
          Glyph.Data = {
            660F0000424D660F000000000000360000002800000024000000240000000100
            180000000000300F000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFDB0BDF7A7B9F42B1783CB3743CB6743EB67641B6
            7942B97A44B97B46B97D47BB7E47BB7F48BA7F47BB7E46BB7E45B87D43B97B41
            B8793FB5773CB6743BB5733BB3733BB5733BB5733BB3733BB5733BB5733CB273
            679193C51DCDFF00FFFF00FFFF00FFFF00FFFF00FFFB00FB825E9F55C187A1DA
            BBB5E1CAB6E3CBB7E3CCB7E2CCB9E4CEBAE4CEBAE3CEBBE5D0BBE5D0BAE4CFBB
            E5D0BBE5CFB9E3CEB9E4CEB9E4CDB7E2CCB6E3CBB5E2CAB4E0C9B5E2CAB5E2CA
            B4E0C9B5E2CAB5E2CAACDEC367C592669192FF00FFFF00FFFF00FFFF00FFFF00
            FFE909EB5998888BD1ACFCFBFDFFFCFFFFFDFFFFFDFFFFFCFFFFFDFFFFFDFFFF
            FCFFFFFDFFFFFDFFFFFCFFFFFDFFFFFDFFFFFCFFFFFDFFFFFDFFFFFCFFFFFDFF
            FFFDFFFFFCFFFFFDFFFFFDFFFFFCFFFFFDFFFFFDFFFFFCFFB6E1CB47B67AFF00
            FFFF00FFFF00FFFF00FFFF00FFDA13E05CA68CA5DCBFFFFEFFFEFCFEFFFEFFFF
            FEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFE
            FFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFE
            FFFFFDFFC8E9D84DBC7FFF00FFFF00FFFF00FFFF00FFFF00FFD913DF5FA88FA8
            DEC1FFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFF
            FEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFE
            FFFFFEFFFEFCFEFFFEFFFFFEFFFFFDFFC8E9D84EBC80FF00FFFF00FFFF00FFFF
            00FFFF00FFDB13E063A893AADDC3FEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFE
            FEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFA
            FDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFEFBFEC7E7D74E
            BA80FF00FFFF00FFFF00FFFF00FFFF00FFDA13E067AB97ACE0C5FFFEFFFEFCFE
            FFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFE
            FFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFF
            FEFFFFFEFFFFFDFFC8E9D84EBC80FF00FFFF00FFFF00FFFF00FFFF00FFDB14E0
            6BAD9AAEE1C7FFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFE
            FFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFE
            FCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFFFDFFC8E9D84EBC80FF00FFFF00FF
            FF00FFFF00FFFF00FFDD13E26EAE9DAFE0C8FEFCFEFDFAFDFEFCFEFEFCFEFDFA
            FDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFE
            FCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFEFBFE
            C7E7D74EBA80FF00FFFF00FFFF00FFEF04F1ED05EED123DB6FB09DB1E3CBFFFE
            FFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFF
            FEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFF
            FEFCFEFFFEFFFFFEFFFFFDFFC8E9D84EBC80F202F3B723C28560A27E85A68089
            A77B93A564BC95B3E3CCFDFDFDFBFBFCFCFDFDFCFDFDFBFBFCFCFDFDFCFDFDFB
            FBFCFCFDFDFCFDFDFBFBFCFCFDFDFCFDFDFBFBFCFCFDFDFCFDFDFBFBFCFCFDFD
            FCFDFDFBFBFCFCFDFDFBFDFCFAFAFBFBFCFCFBFCFCFCFCFDC8E9D84EBC809754
            B156A9875BC38B66C5936CC99970CB9D66C696B6E3CDC4E8D89EDABFA4DEC6A7
            E0C8AADFCAADE2CDB0E3CFB1E2D0B3E4D3B4E4D3B3E3D3B3E4D3B2E4D2AFE2CF
            AEE2CEABE2CCA8DFC9A5DFC7A1DDC49EDABF98D9BC95D7B791D3B38CD3AF86D1
            AA9CD6B8C4E6D54EBA8046A97B71C99AE4F3ECF9FAFAF9FCFBF4FAF77DCFA7B6
            E5CFA7E0C76FCDA378D2AC7DD4B082D4B387D7B78BD8BB8ED8BD92DBC193DCC2
            93DAC292DBC190DBBF8CD8BB88D8B984D6B580D3B07AD3AD75D0A86FCCA268CB
            9C61C7965BC28F54C18A4BBD826AC696C3E7D44EBC8042B6789CD9B8FFFEFFFE
            FCFEFFFEFFF9FCFB7FD0A9B7E5CFA8E1C771CEA57AD3AD7FD4B183D5B489D8B9
            8ED9BD92D9C096DCC498DDC698DCC697DDC594DCC28FD9BE8BD9BB86D7B781D4
            B27CD3AF77D1AA71CDA36ACB9D63C8975DC39055C28B4CBE836BC697C3E7D44E
            BC8049B67CA4DABEFEFCFEFDFAFDFEFCFEF8FAFA80CFAAB7E3CFA6DEC76FCCA4
            79D0AB7ED2B082D3B387D6B98DD8BD92D8C196DBC59BDCC89CDCC999DCC794DB
            C38FD7BE89D7BB84D5B67FD1B17BD1AD76CFA96FCBA368C99C61C69659C18F53
            BF884ABB8068C495C2E6D34EBA8048B87CA4DCBEFFFEFFFEFCFEFFFEFFF9FCFB
            80D1AAB6E5CFCAECDDA7E0C8AEE3CDB1E4D0B4E4D2B8E7D5BBE8D8BDE7DAC1EB
            DDC4EBE0C4EAE0C2EBDFBFEADBBBE7D8B9E7D7B6E6D3B2E4D0AFE4CEACE3CBA7
            DFC7A4DFC3A0DDC09AD9BB97D9B891D7B3A4DBBFC5E8D54EBC8048B87CA4DCBE
            FFFEFFFEFCFEFFFEFFF9FCFB80D1A9B5E5CEFFFEFFFFFCFFFFFEFFFFFEFFFFFC
            FFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFFFF
            FEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFFFDFFFFFEFFFFFEFFFFFDFF
            C8EAD84EBC8048B67BA3DABDFEFCFEFDFAFDFEFCFEF8FAFA82D0ABB3E2CDFFFC
            FFFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFE
            FCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFEFDFAFDFEFCFEFEFCFE
            FDFAFDFEFCFEFEFCFEFEFBFEC6E7D64BBA7E48B87CA4DCBEFFFEFFFEFCFEFFFE
            FFFDFDFD9EDBBE9FDCBFF9FCFBFFFDFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFF
            FCFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFF
            FFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFEFCFEA9DEC143B17848B8
            7CA4DCBEFFFEFFFEFCFEF7FBF9CBEBDC90D5B475CEA3A1DEC1B8E4D1BCE8D5C0
            E9D8C0E8D8C3EADAC4EBDCC5EADCC7ECDEC8ECDEC7EADEC7ECDEC7ECDEC4EADC
            C3EADBC2EAD9BFE7D7BEE8D6BBE7D4B7E4D0B5E4CEB3E3CCB0E1C8ADE0C7AADF
            C495D6B45DC28C797B9F48B67BA3DABDFEFCFEFEFBFED0EBDFBEE5D2E6F2EECC
            EADD9EDBBF8BD4B38DD7B784D4B391D7BA98DBC09BDCC29DDBC49FDEC6A0DEC7
            A1DCC69FDEC69EDDC59CDBC299DBC197DABE93D7BC8FD8B98AD5B487D2AF7ACF
            A663C4966DB29D6BAC9A65AA955F9A8D835D9FDC0BE048B87CA4DCBEFFFEFFFF
            FDFFB8E4CDB9E4CEFFFDFFFFFEFFFCFDFDF9FAFBFAFCFCACE3CBE0F2EBFAFCFC
            FBFCFCFAFAFBFBFCFCFBFCFCFAFAFBFBFCFCFBFCFCFAFAFBFAFCFCFAFCFCF9FA
            FBFAFCFCFAFCFCFAFBFBCCECDD69C099C128CDDC13E1DA14E0E909ECFB00FBFF
            00FF48B87CA4DCBEFFFEFFFFFDFFB6E4CCB6E4CCFFFDFFFFFEFFFFFEFFFEFCFE
            FFFEFFABE2C9E3F3EDFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFDFDFEFBFC
            FCFBFBFCFFFEFFFCFDFDF9FAFBFCFDFDFFFEFFFFFDFFD0EDDF67BB94D704D9FF
            00FFFF00FFFF00FFFF00FFFF00FF48B67BA3DABDFEFCFEFEFBFEB8E2CDB9E3CD
            FFFCFFFFFDFFFFFDFFFFFBFFFFFDFFABE0C9E2F1ECFEFCFEFEFCFEFDFAFDFEFC
            FEFEFCFEF7F8F9D4EEE4BEE7D6C5E7DADAF0E6C9EADCB5E2CFC2E8D7EEF6F3FF
            FBFECEEBDD64B792D704D9FF00FFFF00FFFF00FFFF00FFFF00FF48B87CA4DCBE
            FFFEFFFFFDFFDAF0E4B3E1C9C7E8D8CAEADACBEBDBCCEADCCEECDEBEE7D4F0F7
            F5FFFEFFFFFEFFFEFCFEFFFEFFFDFDFED0ECE1D6F0E5FAFCFCE6F4EFABE1C9E1
            F4ECFAFBFCDEF2E8C0E7D4F7F9F9CEECDD5FB78FD605D8FF00FFFF00FFFF00FF
            FF00FFFF00FF48B87CA4DCBEFFFEFFFEFCFEFBFCFCD8EFE3C7E8D7CAEADACBEB
            DBCCEADCCFEDDFE8F6F0FDFBFDFFFEFFFFFEFFFEFCFEFFFEFFFAFCFBB3E3CEF9
            FCFBFFFEFFEAF5F1C0E8D6FFFEFFFEFCFEFFFEFFB6E3CDEAF5F0CEECDC5CB58B
            D604D8FF00FFFF00FFFF00FFFF00FFFF00FF48B67BA3DABDFEFCFEFDFAFDFEFC
            FEFFFDFFFFFBFFFFFDFFFFFDFFFFFBFFFFFDFFFFFDFFFDFAFDFEFCFEFEFCFEFD
            FAFDFEFCFEFAFBFBB9E3D1EDF6F2FFFDFFEAF4F1B4E2CDF7F9F9FFFBFFF6F9F8
            B5E2CCEDF5F2CBE9DA58B287D704D9FF00FFFF00FFFF00FFFF00FFFF00FF48B8
            7CA4DCBEFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFF
            FEFFFEFCFEFFFEFFFFFEFFFEFCFEFFFEFFFEFEFEE5F3EDC3E8D7D2EEE0C8E9DA
            B6E4CEC4E9D7D0EBDFC1E7D4D5EFE2FDFCFECAEAD955B183D604D8FF00FFFF00
            FFFF00FFFF00FFFF00FF42B6789AD8B7FFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFF
            FEFFFFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFFFFFCFFFFFEFFFFFEFF
            FFFCFEE8F6F0D4EFE2D9EFE5F5FAF8DFF2E9D1EBDFDEF2E8FDFDFDFFFDFFBFE6
            D149AD7BD604D8FF00FFFF00FFFF00FFFF00FFFF00FF53A0856AC694D0EBDDE7
            F2EDE8F4EEE8F4EEE7F2EDE8F4EEE8F4EEE7F2EDE8F4EEE8F4EEE7F2EEE9F4EF
            E9F4EFE8F3EFE9F5EFE9F5F0E8F3EFEBF5F1ECF5F1EBF3F0EAF5F0EBF5F0EAF3
            F0EAF5F0E8F4EEDCEEE685D0A7589986E003E1FF00FFFF00FFFF00FFFF00FFFF
            00FFB232C16691914DBD805EC18C61C38E61C38E60C28D61C38E61C38E60C28D
            61C38E62C38F64C49166C69367C69468C6956AC7966AC7976AC7966AC79669C7
            9668C69467C69365C59263C38F61C38E60C38E51BD8358A68AAC36BCFA00FAFF
            00FFFF00FFFF00FFFF00FFFF00FFFB00FBD40CD8A937BA9B5CB6985DB4985DB4
            995BB4985DB4985DB4995BB4985DB4985DB49A5BB5995DB59B5DB69C5CB79C5E
            B79C5EB89D5DB89C5EB79C5EB79B5CB79A5DB6995DB5995BB5985DB4985DB5A4
            47BAC612CBF700F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFB00FBFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00
            FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA00FAFA
            00FAFA00FAFA00FAFA00FAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          Align = alLeft
          SkinData.SkinSection = 'TOOLBUTTON'
          ImageIndex = 10
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
