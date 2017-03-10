unit u_edit_harga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, sEdit, sLabel, sCurrEdit, sCurrencyEdit, ComCtrls,
  sStatusBar, ExtCtrls, DBCtrls, UFungsi, Buttons, sBitBtn, sComboBox, sTooledit,
  cxControls, sGroupBox, StdCtrls, Mask, sMaskEdit, sCustomComboEdit;

type
  THarga = record
    Harga3: Extended;
    Harga2: Extended;
    Harga1: Extended;
    Awal: TDateTime;
    Ahir: TDateTime;
  end;

  TF_ubah_harga = class(TForm)
    sSkinProvider1: TsSkinProvider;
    Ed_Plu: TsEdit;
    Ed_deskripsi: TsEdit;
    ed_pokok: TsCurrencyEdit;
    ed_marginP: TsCurrencyEdit;
    ed_marginRp: TsCurrencyEdit;
    Ed_harga1: TsCurrencyEdit;
    ed_harga2: TsCurrencyEdit;
    ed_harga3: TsCurrencyEdit;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    ed_qty1: TsCurrencyEdit;
    ed_qty2: TsCurrencyEdit;
    sCurrencyEdit3: TsCurrencyEdit;
    Ed_sat1: TsEdit;
    Ed_sat2: TsEdit;
    Ed_sat3: TsEdit;
    sb: TsStatusBar;
    btn_simpan: TsBitBtn;
    sBitBtn2: TsBitBtn;
    Ed_macam: TsEdit;
    cb_macam: TsComboBox;
    sLabel7: TsLabel;
    g_1: TsGroupBox;
    de_awal: TsDateEdit;
    l_1: TsLabel;
    de_ahir: TsDateEdit;
    l_2: TsLabel;
    ed_discP: TsCurrencyEdit;
    l_3: TsLabel;
    l_4: TsLabel;
    ed_discRp: TsCurrencyEdit;
    g_2: TsGroupBox;
    ed_harga3New: TsCurrencyEdit;
    ed_harga2New: TsCurrencyEdit;
    l_5: TsLabel;
    l_6: TsLabel;
    l_7: TsLabel;
    ed_harga1New: TsCurrencyEdit;
    ed_marginPNew: TsCurrencyEdit;
    ed_marginRpNew: TsCurrencyEdit;
    l_8: TsLabel;
    l_9: TsLabel;
    procedure btn_simpanClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cb_macamChange(Sender: TObject);
    procedure ed_harga3Exit(Sender: TObject);
    procedure cb_periodikClick(Sender: TObject);
    procedure ed_harga2Exit(Sender: TObject);
    procedure ed_marginRpExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ed_harga1Exit(Sender: TObject);
    procedure de_ahirExit(Sender: TObject);
    procedure ed_discRpExit(Sender: TObject);
  private
    procedure ubahHarga(perusahaan: string);
    procedure UbahJenis(Jenis: Byte);
    procedure harga_baru;
    { Private declarations }
  public
    procedure ubah(APID, AJenis: string);
    { Public declarations }
  end;

var
  F_ubah_harga: TF_ubah_harga;
  HargaAsli, HargaBaru: THarga;

implementation

uses
  u_dm, u_utama;

{$R *.dfm}

procedure TF_ubah_harga.harga_baru;
begin
//merubah harga baru setelah diskon
  if ed_harga3.Value <> 0 then
    ed_discP.Value := (ed_discRp.Value / ed_harga3.Value) * 100
  else
    ed_discP.Value := 0;

  ed_harga3New.Value := ed_harga3.Value - ed_discRp.Value;

  ed_marginRpNew.Value := ed_harga3New.Value - ed_pokok.Value;
  if ed_pokok.Value <> 0 then
    ed_marginPNew.Value := (ed_marginrpNew.Value / ed_pokok.Value) * 100
  else
    ed_marginPNew.Value := 0;
  ed_harga2New.Value := ed_harga2.Value - (ed_discRp.Value * ed_qty2.Value);
  ed_harga1New.Value := ed_harga1.Value - (ed_discRp.Value * ed_qty2.Value *
    ed_qty1.Value);
end;

procedure TF_ubah_harga.ubah(APID, AJenis: string);
var
  sat1, sat2, sat3: string;
begin
  ed_plu.Text := APID;

  fungsi.SQLExec(dm.Q_temp, Format('SELECT n_barang, Qty1, Qty2, kd_sat1, ' +
    'kd_sat2, kd_sat3, hpp_ahir from tb_barang where kd_barang="%s" and ' +
    ' kd_perusahaan="%s"', [Ed_Plu.Text, dm.kd_perusahaan]), true);
  ed_pokok.Value := dm.Q_temp.fieldbyname('hpp_ahir').AsCurrency;

  cb_macam.ItemIndex := cb_macam.Items.IndexOf(AJenis);

  if cb_macam.ItemIndex = -1 then
    cb_macam.ItemIndex := 0;

  ed_DESKRIPSI.Text := dm.Q_temp.FieldByName('n_barang').AsString;

  ed_qty1.Text := dm.Q_temp.FieldByName('Qty1').AsString;
  ed_qty2.Text := dm.Q_temp.FieldByName('Qty2').AsString;
  sat1 := dm.Q_temp.FieldByName('kd_sat1').AsString;
  fungsi.SQLExec(dm.Q_Exe, 'select * from tb_satuan where kd_satuan="' + sat1 +
    '"', true);
  ed_sat1.Text := dm.Q_Exe.FieldByName('n_singkat').AsString;
  sat2 := dm.Q_temp.FieldByName('kd_sat2').AsString;
  fungsi.SQLExec(dm.Q_Exe, 'select * from tb_satuan where kd_satuan="' + sat2 +
    '"', true);
  ed_sat2.Text := dm.Q_Exe.FieldByName('n_singkat').AsString;
  sat3 := dm.Q_temp.FieldByName('kd_sat3').AsString;
  fungsi.SQLExec(dm.Q_Exe, 'select * from tb_satuan where kd_satuan="' + sat3 +
    '"', true);
  ed_sat3.Text := dm.Q_Exe.FieldByName('n_singkat').AsString;

  UbahJenis(cb_macam.ItemIndex);
end;

procedure TF_ubah_harga.btn_simpanClick(Sender: TObject);
var
  i: integer;
begin
  HargaBaru.Harga3 := ed_harga3New.Value;
  HargaBaru.Harga2 := ed_harga2New.Value;
  HargaBaru.Harga1 := ed_harga1New.Value;
  HargaBaru.Awal := de_awal.Date;
  HargaBaru.Ahir := de_ahir.Date;

  if (HargaAsli.Harga3 = HargaBaru.Harga3) and (HargaAsli.Harga2 = HargaBaru.Harga2)
    and (HargaAsli.Harga1 = HargaBaru.Harga1) and (HargaAsli.Awal = HargaBaru.Awal)
    and (HargaAsli.Ahir = HargaBaru.Ahir) then
  begin
    Self.ModalResult := mrCancel;
    Exit;
  end;

  dm.db_conn.StartTransaction;
  try
    ubahHarga(dm.kd_perusahaan);
    if F_utama.sb.Panels[8].Text = 'PUSAT' then
    begin
      for i := 0 to cabang.Count - 1 do
      begin
        ubahHarga(cabang[i]);
      end;
    end;

    dm.db_conn.Commit;
    Self.ModalResult := mrOk;
    showmessage('proses ubah harga berhasil');

  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      messagedlg('proses ubah harga gagal '#10#13'' + e.Message, mterror, [mbOk], 0);
    end;
  end;
end;

procedure TF_ubah_harga.ubahHarga(perusahaan: string);
begin
  fungsi.SQLExec(dm.q_temp,
    'select COUNT(kd_barang) as jumlah from tb_barang_harga where kd_perusahaan="' +
    perusahaan + '" and kd_barang="' + ed_plu.Text + '" and kd_macam_harga="' +
    cb_macam.Text + '"', true);

  if dm.q_temp.FieldByName('jumlah').AsInteger = 0 then
  begin
    fungsi.SQLExec(dm.Q_Exe,
      'insert into tb_barang_harga(kd_perusahaan,kd_macam_harga,kd_barang,laba,harga_jual1, ' +
      'harga_jual2,harga_jual3,kode_user,awal,ahir,`update`,diskon) values ("' +
      perusahaan + '","' + cb_macam.Text + '","' + ed_plu.Text + '","' +
      ed_marginrp.Text + '","' + ed_harga1.Text + '","' + ed_harga2.Text + '","'
      + ed_harga3.Text + '","' + dm.kd_pengguna + '","' + formatdatetime('yyyy-MM-dd',
      de_awal.date) + '","' + formatdatetime('yyyy-MM-dd', de_ahir.Date) +
      '",CURRENT_TIMESTAMP,"' + ed_discRp.Text + '")', false)
  end
  else
  begin
    fungsi.SQLExec(dm.Q_Exe, 'update tb_barang_harga set laba="' + ed_marginRP.Text
      + '",harga_jual1="' + ed_harga1.Text + '",harga_jual2="' + ed_harga2.Text
      + '",harga_jual3="' + ed_harga3.Text + '",kode_user="' + dm.kd_pengguna +
      '",`update`=CURRENT_TIMESTAMP,awal="' + formatdatetime('yyyy-MM-dd',
      de_awal.Date) + '",ahir="' + formatdatetime('yyyy-MM-dd', de_ahir.Date) +
      '",diskon="' + ed_discRp.Text + '" where kd_barang="' + ed_plu.Text +
      '" and kd_macam_harga="' + cb_macam.Text + '" and kd_perusahaan="' +
      perusahaan + '"', false);
  end;
end;

procedure TF_ubah_harga.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    close;
end;

procedure TF_ubah_harga.cb_macamChange(Sender: TObject);
begin
  UbahJenis(cb_macam.ItemIndex);
end;

procedure TF_ubah_harga.ed_harga3Exit(Sender: TObject);
begin
  ed_marginRp.Value := ed_harga3.Value - ed_pokok.Value;
  if ed_pokok.Value <> 0 then
    ed_marginP.Value := (ed_marginrp.Value / ed_pokok.Value) * 100
  else
    ed_marginP.Value := 0;

  ed_harga2.Value := ed_harga3.Value * ed_qty2.Value;
  ed_harga1.Value := ed_harga2.Value * ed_qty1.Value;
  harga_baru;
end;

procedure TF_ubah_harga.cb_periodikClick(Sender: TObject);
begin
  de_awal.Clear;
  de_ahir.Clear;
  de_awal.Enabled := not (de_awal.Enabled);
  de_ahir.Enabled := not (de_ahir.Enabled);
end;

procedure TF_ubah_harga.ed_harga2Exit(Sender: TObject);
begin
  ed_harga1.Value := ed_harga2.Value * ed_qty1.Value;
  harga_baru;
end;

procedure TF_ubah_harga.ed_marginRpExit(Sender: TObject);
begin
  if ed_pokok.Value <> 0 then
    ed_marginp.Value := (ed_marginrp.Value / ed_pokok.Value) * 100
  else
    ed_marginP.Value := 0;

  ed_harga3.Value := ed_pokok.Value + ed_marginrp.Value;
  ed_harga2.Value := ed_harga3.Value * ed_qty2.Value;
  ed_harga1.Value := ed_harga2.Value * ed_qty1.Value;
  harga_baru;
end;

procedure TF_ubah_harga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  F_ubah_harga := nil;
end;

procedure TF_ubah_harga.Ed_harga1Exit(Sender: TObject);
begin
  harga_baru;
end;

procedure TF_ubah_harga.de_ahirExit(Sender: TObject);
begin
  if de_ahir.Date < de_awal.Date then
    de_ahir.Date := de_awal.Date;
end;

procedure TF_ubah_harga.UbahJenis(Jenis: Byte);
begin
  if Jenis = 1 then
    ed_macam.Text := 'HARGA GROSIR'
  else
    ed_macam.Text := 'HARGA ECERAN';

  fungsi.SQLExec(dm.Q_temp, 'select * from tb_barang_harga where kd_barang = "'
    + ed_plu.Text + '"and kd_macam_harga = "' + cb_macam.Text + '"', true);

  ed_harga1.Value := dm.Q_temp.FieldByName('harga_jual1').AsCurrency;
  ed_harga2.Value := dm.Q_temp.FieldByName('harga_jual2').AsCurrency;
  ed_harga3.Value := dm.Q_temp.FieldByName('harga_jual3').AsCurrency;
  ed_marginRp.Value := ed_harga3.Value - ed_pokok.Value;

  if ed_pokok.Value <> 0 then
    ed_marginP.Value := (ed_marginrp.Value / ed_pokok.Value) * 100
  else
    ed_marginP.Value := 0;

  de_awal.date := dm.Q_temp.FieldByName('awal').AsDateTime;
  de_ahir.date := dm.Q_temp.FieldByName('ahir').AsDateTime;
  ed_discRp.Value := dm.Q_temp.FieldByName('diskon').AsCurrency;

  sb.SimpleText := 'Updated at: ' + dm.Q_temp.FieldByName('update').AsString +
    ' by: ' + dm.Q_temp.FieldByName('kode_user').AsString;

  harga_baru;

  HargaAsli.Harga3 := ed_harga3New.Value;
  HargaAsli.Harga2 := ed_harga2New.Value;
  HargaAsli.Harga1 := ed_harga1New.Value;
  HargaAsli.Awal := de_awal.Date;
  HargaAsli.Ahir := de_ahir.Date;
end;

procedure TF_ubah_harga.ed_discRpExit(Sender: TObject);
begin
  harga_baru;
end;

end.


