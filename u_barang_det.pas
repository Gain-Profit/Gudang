unit u_barang_det;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, sLabel, sGroupBox, sEdit, UFungsi,
  Buttons, sSpeedButton, 
  sCurrEdit, sCurrencyEdit, sButton, sCheckBox, 
  sSkinProvider, sDialogs,cxStyles,
  cxGraphics, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxCurrencyEdit, Mask, sMaskEdit, sCustomComboEdit;

type
  TF_barang_det = class(TForm)
    ed_nama: TsEdit;
    ed_pid: TsEdit;
    sGroupBox4: TsGroupBox;
    ed_bar1: TsEdit;
    ed_bar2: TsEdit;
    ed_bar3: TsEdit;
    sGroupBox3: TsGroupBox;
    ed_sat1: TsEdit;
    ed_sat2: TsEdit;
    ed_sat3: TsEdit;
    gb_stok: TsGroupBox;
    sLabel6: TsLabel;
    sLabel9: TsLabel;
    sLabel8: TsLabel;
    sLabel7: TsLabel;
    Ed_Jenis: TsEdit;
    Ed_Kategori: TsEdit;
    Ed_Merk: TsEdit;
    Ed_golongan: TsEdit;
    sLabel16: TsLabel;
    sLabel15: TsLabel;
    sLabel14: TsLabel;
    sLabel4: TsLabel;
    sLabel3: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sLabel10: TsLabel;
    sLabel25: TsLabel;
    sb_jenis: TsSpeedButton;
    sb_gol: TsSpeedButton;
    sb_merk: TsSpeedButton;
    sb_tag: TsSpeedButton;
    sb_sat1: TsSpeedButton;
    sb_sat2: TsSpeedButton;
    sb_sat3: TsSpeedButton;
    ed_qty1: TsCurrencyEdit;
    ed_Qty2: TsCurrencyEdit;
    ed_minstok: TsCurrencyEdit;
    ed_maxstok: TsCurrencyEdit;
    ed_minor: TsCurrencyEdit;
    ed_time: TsCurrencyEdit;
    b_new: TsButton;
    b_save: TsButton;
    b_auto: TsButton;
    sSkinProvider1: TsSkinProvider;
    cb_aktif: TsCheckBox;
    t_load: TTimer;
    procedure baru;
    procedure tampil;
    procedure duplikat;
    procedure b_newClick(Sender: TObject);
    procedure b_autoClick(Sender: TObject);
    procedure sb_sat1Click(Sender: TObject);
    procedure sb_jenisClick(Sender: TObject);
    procedure sb_golClick(Sender: TObject);
    procedure sb_merkClick(Sender: TObject);
    procedure sb_tagClick(Sender: TObject);
    procedure b_saveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_bar1Change(Sender: TObject);
    procedure ed_bar1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure t_loadTimer(Sender: TObject);
    procedure ed_pidExit(Sender: TObject);
    procedure SimpanDatabase(perusahaan:string;b_aktif:string;status_simpan:Boolean);
  private
    kd_jenis,kd_merk,kd_gol,kd_tag: string;
    kd_sat: array[1..3] of string;
    status_simpan:boolean;
    urutan,urut_berat : Integer;
  public
  end;

var
  F_barang_det: TF_barang_det;

implementation

uses u_dm, u_cari, u_utama;

{$R *.dfm}

procedure TF_barang_det.baru;
begin
ed_pid.ReadOnly:= False;

b_auto.Enabled:=true;

ed_pid.Clear;
ed_nama.Clear;

status_simpan:= true;
Caption:= 'Inventory Barang - Barang Baru';
end;

procedure TF_barang_det.tampil;
begin
status_simpan:= false;

ed_pid.ReadOnly:= True;
b_auto.Enabled:=false;


ed_pid.Text:= dm.Q_barang.FieldByName('kd_barang').AsString;
ed_nama.Text:= dm.Q_barang.FieldByName('n_barang').AsString;


t_load.Enabled := True;

Caption:= 'Inventory Barang - Edit Barang';
end;

procedure TF_barang_det.duplikat;
begin
status_simpan:= True;

b_auto.Enabled:=True;
Caption:= 'Inventory Barang - Barang Baru';

ed_pid.Clear;
ed_nama.Clear;

t_load.Enabled := True;

cb_aktif.Checked:=true;
end;


procedure TF_barang_det.b_newClick(Sender: TObject);
begin
baru;
end;

procedure TF_barang_det.b_autoClick(Sender: TObject);
var x:integer;
    pid_temp,pid:string;
begin
if status_simpan=false then
exit;

ed_pid.SetFocus;
if (kd_jenis='') or (kd_gol='') then
begin
showmessage('Jenis dan Golongan harus diisi terlebih dahulu, '#10#13' karena '+
'auto PID diambil dari jenis dan golongan...');
exit;
end;
fungsi.SQLExec(dm.Q_Exe,'select kd_barang from tb_barang where kd_perusahaan="'+
dm.kd_perusahaan+'" and LEFT(kd_barang,'+inttostr(length(kd_jenis))+')="'+
kd_jenis+'" and MID(kd_barang,'+inttostr(length(kd_jenis)+1)+','+inttostr(length(kd_gol))+')="'+kd_gol+'" order by kd_barang',true);
dm.Q_Exe.first;

for x:=1 to 10000 do
begin
  if x<10     then pid:= kd_jenis+kd_gol+'000' else
  if x<100    then pid:= kd_jenis+kd_gol+'00' else
  if x<1000   then pid:= kd_jenis+kd_gol+'0' else
  if x<10000  then pid:= kd_jenis+kd_gol;
  pid_temp:= pid+inttostr(x);

  if dm.Q_Exe.fieldbyname('kd_barang').AsString=pid_temp then
  dm.Q_Exe.Next else break;
end;
ed_pid.Text:= pid_temp;
end;

procedure TF_barang_det.sb_sat1Click(Sender: TObject);
begin
  TsEdit(FindComponent(StringReplace(TsSpeedButton(Sender).Name,'sb_sat','ed_sat',[]))).SetFocus;

  application.CreateForm(tf_cari, f_cari);
  F_cari._SQLi:= 'select kd_satuan,n_satuan,n_singkat from tb_satuan';
  F_cari.tblcap[0]:= 'No';
  F_cari.tblCap[1]:= 'Deskripsi';
  F_cari.tblCap[2]:= 'Singkatan';
  F_cari.tampil_button(true,True);
  if F_cari.ShowModal = mrOk then
    begin
       kd_sat[strtoint(StringReplace(TsSpeedButton(Sender).Name,'sb_sat','',[]))]:= F_cari.TblVal[0];
       TsEdit(FindComponent(StringReplace(TsSpeedButton(Sender).Name,'sb_sat','ed_sat',[]))).Text:=F_cari.Tblval[1];
    end;
end;

procedure TF_barang_det.sb_jenisClick(Sender: TObject);
begin
Ed_Jenis.SetFocus;
  
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_jenis,n_jenis from tb_jenis';
    tblcap[0]:= 'No';
    tblCap[1]:= 'Deskripsi';
    cariT:= 1;
    tampil_button(true,True);
    if ShowModal = mrOk then
    begin
        kd_jenis:=TblVal[0];
        Ed_Jenis.Text:=TblVal[1];
        kd_gol:='';
        Ed_golongan.Clear;
    end;
  finally
  close;
  end;
end;

procedure TF_barang_det.sb_golClick(Sender: TObject);
begin
Ed_golongan.SetFocus;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_jenis, kd_golbrg, n_golbrg from tb_golongan where kd_jenis="'+kd_jenis+'"';
    tblCap[0]:= 'Kd Jenis';
    tblcap[1]:= 'Kd Gol';
    tblCap[2]:= 'Deskripsi';
    cariT:= 2;
    tampil_button(true,True);
    if ShowModal = mrOk then
    begin
        kd_gol:=TblVal[0];
        Ed_golongan.Text:=TblVal[1];
    end;
  finally
  close;
  end;
end;

procedure TF_barang_det.sb_merkClick(Sender: TObject);
begin
Ed_Merk.SetFocus;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_merk,n_merk from tb_merk';
    tblcap[0]:= 'No';
    tblCap[1]:= 'Deskripsi';
    cariT:= 3;
    tampil_button(true,True);
    if ShowModal = mrOk then
    begin
        kd_merk:=TblVal[0];
        Ed_Merk.Text:=TblVal[1];
    end;
  finally
  close;
  end;
end;

procedure TF_barang_det.sb_tagClick(Sender: TObject);
begin
Ed_Kategori.SetFocus;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select tag,n_kategori from tb_kategori';
    tblcap[0]:= 'No';
    tblCap[1]:= 'Deskripsi';
    cariT:= 4;
    tampil_button(true,True);
    if ShowModal = mrOk then
    begin
        kd_tag:=TblVal[0];
        Ed_Kategori.Text:=TblVal[1];
    end;
  finally
  close;
  end;
end;

procedure TF_barang_det.b_saveClick(Sender: TObject);
var b_aktif: string;
posisi,i:integer;
begin
if (ed_bar1.Color=clred) or (ed_bar2.Color=clred) or (ed_bar3.Color=clred) then
begin
showmessage('Satu macam barang tidak boleh mempunyai 2 atau 3 barcode yang sama....');
if ed_bar2.Color=clred then ed_bar2.SetFocus;
if ed_bar1.Color=clred then ed_bar1.SetFocus;
exit;
end;

if (ed_bar1.Color=clblue) or (ed_bar2.Color=clblue) or (ed_bar3.Color=clblue) then
begin
showmessage('Barcode yang berwarna biru sudah terdaftar dengan barang lain....');
if ed_bar3.Color=clblue then ed_bar3.SetFocus;
if ed_bar2.Color=clblue then ed_bar2.SetFocus;
if ed_bar1.Color=clblue then ed_bar1.SetFocus;
exit;
end;

posisi:= dm.Q_barang.RecNo;

if ed_pid.Text='' then
begin
showmessage('isi PID terlebih dahulu dengan menekan tombol Auto PID...');
b_auto.SetFocus;
exit;
end;

if (ed_sat1.Text='') or (ed_sat2.Text='') or (ed_sat3.Text='') then
begin
showmessage('Satuan tidak boleh ada yang kosong...');
ed_sat3.SetFocus;
exit;
end;

if cb_aktif.Checked=true then
b_aktif:='Y' else b_aktif:= 'N';

dm.db_conn.StartTransaction;
try
SimpanDatabase(dm.kd_perusahaan,b_aktif,status_simpan);

if F_utama.sb.Panels[8].Text='PUSAT' then
begin
  for i:=0 to cabang.Count -1 do
  begin
    SimpanDatabase(cabang[i],b_aktif,status_simpan);

    fungsi.SQLExec(dm.Q_Exe,'INSERT IGNORE INTO tb_barang_supp(kd_perusahaan,kd_suplier,kd_barang,`update`) values ("'+
    cabang[i]+'","'+dm.kd_perusahaan+'","'+ed_pid.Text+'",date(now()))',False);
  end;
end;

dm.Q_barang.Close;
dm.Q_barang.Open;
dm.Q_barang.RecNo := posisi;

status_simpan:= false;
b_auto.Enabled:= False;
Caption:= 'Inventory Barang - Edit Barang';

dm.db_conn.Commit;
showmessage('penyimpanan data sukses....');
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;
end;

procedure TF_barang_det.SimpanDatabase(perusahaan:string;b_aktif:string;status_simpan:Boolean);
begin
  if status_simpan=true then
  begin
    //simpan data
    fungsi.SQLExec(dm.Q_Exe,'insert into tb_barang (kd_perusahaan,kd_barang,n_barang,kd_jenis,kd_kategori, '+
    'kd_golbrg,kd_merk,kd_sat1,kd_sat2,kd_sat3,barcode1,barcode2,barcode3,Qty1,Qty2,minstok,maxstok, '+
    'leadtime,aktif,minor,`update`)values ("'+perusahaan+'","'+ed_pid.Text+'","'+ed_nama.Text+'","'+kd_jenis+'","'+
    kd_tag+'","'+kd_gol+'","'+kd_merk+'","'+kd_sat[1]+'","'+kd_sat[2]+'","'+kd_sat[3]+'","'+
    ed_bar1.Text+'","'+ed_bar2.Text+'","'+ed_bar3.Text+'","'+ed_qty1.Text+'","'+
    ed_qty2.Text+'","'+ed_minstok.Text+'","'+ed_maxstok.Text+'","'+ed_time.Text+'","'+
    b_aktif+'","'+ed_minor.Text+'",CURRENT_TIMESTAMP)',false);
  end else
  begin
    //ubah data
    fungsi.SQLExec(dm.Q_Exe,'update tb_barang set n_barang="'+ed_nama.Text+'",kd_jenis="'+kd_jenis+'",kd_kategori="'+
    kd_tag+'",kd_golbrg="'+kd_gol+'",kd_merk="'+kd_merk+'",kd_sat1="'+kd_sat[1]+'",kd_sat2="'+kd_sat[2]+'",kd_sat3="'+
    kd_sat[3]+'",barcode1="'+ed_bar1.Text+'",barcode2="'+ed_bar2.Text+'",barcode3="'+ed_bar3.Text
    +'",Qty1="'+ed_qty1.Text+'",Qty2="'+ed_qty2.Text+'",minstok="'+ed_minstok.Text+'",maxstok="'+
    ed_maxstok.Text+'",leadtime="'+ed_time.Text+'",aktif="'+b_aktif+'",minor="'+
    ed_minor.Text+'",`update`=CURRENT_TIMESTAMP where kd_perusahaan="'+perusahaan+'" and kd_barang="'+ed_pid.Text+'"',false);
  end;
end;

procedure TF_barang_det.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if key=vk_return then
  begin
    if ed_jenis.Focused=true then
      sb_jenisClick(Sender);
    if ed_golongan.Focused=true then
      sb_golClick(Sender);
    if ed_merk.Focused=true then
      sb_merkClick(Sender);
    if ed_kategori.Focused=true then
      sb_tagClick(Sender);
    if ed_sat1.Focused=true then
      sb_sat1Click(sb_sat1);
    if ed_sat2.Focused=true then
      sb_sat1Click(sb_sat2);
    if ed_sat3.Focused=true then
      sb_sat1Click(sb_sat3);
  end;

// control+a auto pid
if (shift=[ssctrl]) and (key=65) then
b_autoClick(Sender);
// control+b Baru
if (shift=[ssctrl]) and (key=66) then
baru;
// control+S simpan
if (shift=[ssctrl]) and (key=83) then
b_saveClick(Sender);
                         
if key=vk_escape then close;
end;

procedure TF_barang_det.ed_bar1Change(Sender: TObject);
begin

if status_simpan then
begin
fungsi.SQLExec(dm.Q_temp,'select kd_barang, n_barang, barcode1,barcode2,barcode3 from tb_barang where kd_perusahaan = "'+
dm.kd_perusahaan+'" and barcode3="'+
TsEdit(sender).Text+'" or barcode2="'+TsEdit(sender).Text+'" or barcode1="'+TsEdit(sender).Text+'"',true);
if (dm.Q_temp.RecordCount>0) and (TsEdit(sender).Text<>'') then
    TsEdit(sender).Color:=clblue else
    TsEdit(sender).Color:=clwhite;
end else
begin
fungsi.SQLExec(dm.Q_temp,'select kd_barang, n_barang, barcode1,barcode2,barcode3 from tb_barang where  kd_perusahaan = "'+
dm.kd_perusahaan+'" and kd_barang<>"'+ed_pid.Text+'" and (barcode3="'+
TsEdit(sender).Text+'" or barcode2="'+TsEdit(sender).Text+'" or barcode1="'+TsEdit(sender).Text+'")',true);
if (dm.Q_temp.RecordCount>0) and (TsEdit(sender).Text<>'') then
    TsEdit(sender).Color:=clblue else
    TsEdit(sender).Color:=clwhite;
end;
end;

procedure TF_barang_det.ed_bar1Exit(Sender: TObject);
begin
if (ed_bar1.Text=ed_bar2.Text) then
begin
if ed_bar1.Color<>clblue then ed_bar1.Color:= clred;
if ed_bar2.Color<>clblue then ed_bar2.Color:= clred;
end;
if (ed_bar2.Text=ed_bar3.Text) then
begin
if ed_bar2.Color<>clblue then ed_bar2.Color:= clred;
if ed_bar3.Color<>clblue then ed_bar3.Color:= clred;
end;
if (ed_bar3.Text=ed_bar1.Text) then
begin
if ed_bar1.Color<>clblue then ed_bar1.Color:= clred;
if ed_bar3.Color<>clblue then ed_bar3.Color:= clred;
end;

if (ed_bar1.Text<>ed_bar2.Text) and (ed_bar1.Text<>ed_bar3.Text) then
if ed_bar1.Color<>clblue then ed_bar1.Color:= clwhite;
if (ed_bar2.Text<>ed_bar1.Text) and (ed_bar2.Text<>ed_bar3.Text) then
if ed_bar2.Color<>clblue then ed_bar2.Color:= clwhite;
if (ed_bar3.Text<>ed_bar1.Text) and (ed_bar3.Text<>ed_bar2.Text) then
if ed_bar3.Color<>clblue then ed_bar3.Color:= clwhite;

if ed_bar1.Text='' then ed_bar1.Color:= clwhite;
if ed_bar2.Text='' then ed_bar2.Color:= clwhite;
if ed_bar3.Text='' then ed_bar3.Color:= clwhite;
end;

procedure TF_barang_det.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
F_barang_det:=nil;
end;

procedure TF_barang_det.FormShow(Sender: TObject);
begin
urutan:= 0;
urut_berat:=0;

 if f_utama.sb.Panels[8].Text='PUSAT' then
 begin
  ed_nama.Enabled:=True;
  sb_jenis.Enabled:=True;
  sb_gol.Enabled:=True;
  sb_tag.Enabled:=True;
  sb_merk.Enabled:=True;
  Ed_Jenis.Enabled:=True;
  Ed_golongan.Enabled:=True;
  Ed_Merk.Enabled:=True;
  Ed_Kategori.Enabled:=True;
  sGroupBox3.Enabled:=True;
  sGroupBox4.Enabled:=True;

  b_new.Enabled:=True;
 end else
 begin
  b_auto.Enabled:=False;
  ed_nama.Enabled:=False;
  sb_jenis.Enabled:=False;
  sb_gol.Enabled:=False;
  sb_tag.Enabled:=False;
  sb_merk.Enabled:=False;
  Ed_Jenis.Enabled:=False;
  Ed_golongan.Enabled:=False;
  Ed_Merk.Enabled:=False;
  Ed_Kategori.Enabled:=False;
  sGroupBox3.Enabled:=False;
  sGroupBox4.Enabled:=False;

  b_new.Enabled:=False;
 end;
end;

procedure TF_barang_det.t_loadTimer(Sender: TObject);
begin
//load berkala
urutan := urutan +1;

if urutan = 1 then
begin
kd_jenis :=dm.Q_barang.fieldbyname('kd_jenis').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_jenis where kd_jenis="'+kd_jenis+'"',true);
ed_jenis.Text:= dm.Q_temp.fieldbyname('n_jenis').AsString;
end;

if urutan = 2 then
begin
kd_gol   :=dm.Q_barang.fieldbyname('kd_golbrg').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_golongan where kd_golbrg="'+
kd_gol+'" and kd_jenis="'+kd_jenis+'"',true);
ed_golongan.Text:= dm.Q_temp.fieldbyname('n_golbrg').AsString;
end;

if urutan = 3 then
begin
kd_merk  :=dm.Q_barang.fieldbyname('kd_merk').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_merk where kd_merk="'+kd_merk+'"',true);
ed_merk.Text:= dm.Q_temp.fieldbyname('n_merk').AsString;
end;

if urutan = 4 then
begin
kd_tag   :=dm.Q_barang.fieldbyname('kd_kategori').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_kategori where tag="'+kd_tag+'"',true);
ed_kategori.Text:= dm.Q_temp.fieldbyname('n_kategori').AsString;
end;

if urutan = 5 then
begin
kd_sat[1]  :=dm.Q_barang.fieldbyname('kd_sat1').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_satuan where kd_satuan="'+kd_sat[1]+'"',true);
ed_sat1.Text:= dm.Q_temp.fieldbyname('n_satuan').AsString;
end;

if urutan = 6 then
begin
kd_sat[2]  :=dm.Q_barang.fieldbyname('kd_sat2').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_satuan where kd_satuan="'+kd_sat[2]+'"',true);
ed_sat2.Text:= dm.Q_temp.fieldbyname('n_satuan').AsString;
end;

if urutan = 7 then
begin
kd_sat[3]  :=dm.Q_barang.fieldbyname('kd_sat3').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_satuan where kd_satuan="'+kd_sat[3]+'"',true);
ed_sat3.Text:= dm.Q_temp.fieldbyname('n_satuan').AsString;
end;

if urutan = 8 then
ed_qty1.Text:= dm.Q_barang.FieldByName('qty1').AsString;
if urutan = 9 then
ed_qty2.Text:= dm.Q_barang.FieldByName('qty2').AsString;
if urutan = 10 then
ed_bar1.Text:= dm.Q_barang.FieldByName('barcode1').AsString;
if urutan = 11 then
ed_bar2.Text:= dm.Q_barang.FieldByName('barcode2').AsString;
if urutan = 12 then
ed_bar3.Text:= dm.Q_barang.FieldByName('barcode3').AsString;
if urutan = 13 then
ed_minstok.Text:= dm.Q_barang.FieldByName('minstok').AsString;
if urutan = 14 then
ed_maxstok.Text:= dm.Q_barang.FieldByName('maxstok').AsString;
if urutan = 15 then
ed_minor.Text:= dm.Q_barang.FieldByName('minor').AsString;
if urutan = 16 then
ed_time.Text:= dm.Q_barang.FieldByName('leadtime').AsString;

if urutan = 17 then
if dm.Q_barang.FieldByName('aktif').AsString='Y' then cb_aktif.Checked:=true else cb_aktif.Checked:=false;

if urutan = 18 then
begin
t_load.Enabled:= False;
end;

end;

procedure TF_barang_det.ed_pidExit(Sender: TObject);
begin
if status_simpan = True then
begin
  fungsi.SQLExec(dm.Q_temp,'select kd_barang from tb_barang where kd_barang="'+ed_pid.Text+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
  if not(dm.Q_temp.Eof) then
  begin
    ShowMessage('PID ini sudah ada dalam database....');
    ed_pid.Clear;
    ed_pid.SetFocus;
  end;
end;
end;

end.
