unit u_emp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sLabel, Buttons, UFungsi,  sEdit,
  sCheckBox, cxControls, cxContainer, cxEdit, cxImage, ExtDlgs, sDialogs,mySQLDbTables,db,
  sSkinProvider, ExtCtrls, sPanel, cxPC, sGroupBox, ComCtrls, sPageControl,
  Menus;

type
  Tf_emp = class(TForm)
    t_upd: TmySQLUpdateSQL;
    sSkinProvider1: TsSkinProvider;
    pUser: TsPanel;
    B_save: TsButton;
    pc_user: TsPageControl;
    ts_general: TsTabSheet;
    sLabel4: TsLabel;
    sLabel3: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    l_1: TsLabel;
    gambar: TcxImage;
    ed_pass2: TsEdit;
    ed_pass: TsEdit;
    ed_nama: TsEdit;
    ed_kode: TsEdit;
    cb_server: TsCheckBox;
    cb_kasir: TsCheckBox;
    cb_gudang: TsCheckBox;
    cb_akun: TsCheckBox;
    ts_gudang: TsTabSheet;
    gb_master: TsGroupBox;
    cb_master: TsCheckBox;
    cb_Setting: TsCheckBox;
    gb_Inv: TsGroupBox;
    cb_Barang: TsCheckBox;
    cb_Harga: TsCheckBox;
    cb_Plano: TsCheckBox;
    cb_BrgSupp: TsCheckBox;
    cb_brgUpdate: TsCheckBox;
    gb_Transaksi: TsGroupBox;
    cb_PO: TsCheckBox;
    cb_RO: TsCheckBox;
    cb_Return: TsCheckBox;
    cb_ReturnKirim: TsCheckBox;
    cb_kirim: TsCheckBox;
    btnpass: TsButton;
    pmUser: TPopupMenu;
    mniall: TMenuItem;
    mniNotAll: TMenuItem;
    cb_admin: TsCheckBox;
    ts_server: TsTabSheet;
    gb_md: TsGroupBox;
    cb_md: TsCheckBox;
    procedure baru;
    procedure ubah;
    procedure B_saveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cb_gudangClick(Sender: TObject);
    procedure btnpassClick(Sender: TObject);
    procedure updateprivasi;
    procedure mniallClick(Sender: TObject);
    procedure mniNotAllClick(Sender: TObject);
    procedure hakgudang(boleh: Boolean);
    procedure hakToko(boleh: Boolean);
    procedure cb_serverClick(Sender: TObject);
  private
    { Private declarations }
    function ubahCB(checkbox: TsCheckBox): string;
  public
    { Public declarations }
  end;

var
  f_emp: Tf_emp;
  supp_baru:boolean;
  kdUser:string;

implementation

uses u_dm, u_cari, u_utama;

{$R *.dfm}

procedure Tf_emp.baru;
begin
btnpass.Visible:= False;
ts_gudang.tabVisible:= False;
ts_server.TabVisible:= False;

ed_kode.Clear;
ed_nama.Clear;
ed_pass.Clear;
ed_pass2.Clear;

cb_gudang.Checked:= false;
cb_server.Checked:= false;
cb_akun.Checked:= false;
cb_kasir.Checked:=false;

supp_baru:= true;
end;

procedure Tf_emp.ubah;
begin
f_emp.Width:=483;
ed_kode.ReadOnly:= true;
btnpass.Visible:= True;
kdUser:= ed_kode.Text;

fungsi.SQLExec(dm.Q_temp,'select * from tb_user where kd_user="'+kdUser+'"',true);
ed_nama.Text:= dm.Q_temp.FieldByName('n_user').AsString;

if FileExists(dm.AppPath+'image/'+ed_kode.Text+'.jpg') then
gambar.Picture.LoadFromFile(dm.AppPath+'image/'+ed_kode.Text+'.jpg')else
gambar.Clear;

fungsi.SQLExec(dm.Q_temp,'select * from tb_user_company where ' +
'kd_user="'+kdUser+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);

cb_gudang.Checked       := dm.Q_temp.FieldByName('gudang').AsBoolean;
cb_akun.Checked         := dm.Q_temp.FieldByName('akun').AsBoolean;
cb_kasir.Checked        := dm.Q_temp.FieldByName('kasir').AsBoolean;
cb_server.Checked       := dm.Q_temp.FieldByName('toko').AsBoolean;
cb_admin.Checked        := dm.Q_temp.FieldByName('admin').AsBoolean;

ts_gudang.tabVisible:= cb_gudang.Checked;
ts_server.TabVisible:= cb_server.Checked;

cb_Barang.Checked		    := dm.Q_temp.FieldByName('gdInvBarang').AsBoolean;
cb_Harga.Checked  		  := dm.Q_temp.FieldByName('gdInvHarga').AsBoolean;
cb_Plano.Checked	  	  := dm.Q_temp.FieldByName('gdInvPlano').AsBoolean;
cb_BrgSupp.Checked		  := dm.Q_temp.FieldByName('gdInvBrgSupp').AsBoolean;
cb_brgUpdate.Checked 	  := dm.Q_temp.FieldByName('gdInvBrgUpdate').AsBoolean;
cb_PO.Checked	      	  := dm.Q_temp.FieldByName('gdTrPO').AsBoolean;
cb_RO.Checked	      	  := dm.Q_temp.FieldByName('gdTrRO').AsBoolean;
cb_Return.Checked	  	  := dm.Q_temp.FieldByName('gdTrReturn').AsBoolean;
cb_kirim.Checked	  	  := dm.Q_temp.FieldByName('gdTrKirim').AsBoolean;
cb_ReturnKirim.Checked  := dm.Q_temp.FieldByName('gdTrReturnKirim').AsBoolean;
cb_master.Checked	  	  := dm.Q_temp.FieldByName('gdMaster').AsBoolean;
cb_Setting.Checked		  := dm.Q_temp.FieldByName('gdSetting').AsBoolean;

cb_md.Checked           := dm.Q_temp.FieldByName('tkAdmin').AsBoolean;
supp_baru:= false;
end;

function Tf_emp.ubahCB(checkbox: TsCheckBox): string;
begin
    if checkbox.Checked= true then
    result:= 'Y' else result:='N';
end;

procedure Tf_emp.B_saveClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
if supp_baru=true then
begin
  if (ed_pass.Text='') or (ed_pass2.Text='') then
  begin
  showmessage('password tidak boleh kosong....');
  exit;
  end;

if ed_pass.Text<>ed_pass2.Text then
begin
showmessage('password dan konfirmasi tidak sama');
exit;
end;

fungsi.SQLExec(dm.Q_Exe,'insert into tb_user (kd_user,n_user,password,`update`)values ("'+
ed_kode.Text+'","'+ed_nama.Text+'",md5("'+ed_pass.Text+'"),"'+
formatdatetime('yyyy-MM-dd', date())+'")',false);
updateprivasi;
end else
begin
fungsi.SQLExec(dm.Q_Exe,'update tb_user set `update`="'+formatdatetime('yyyy-MM-dd', date())+'",n_user="'+
ed_nama.Text+'",kd_user="'+ed_kode.Text+'" where kd_user="'+kdUser+'"',false);
updateprivasi;
end;

dm.db_conn.Commit;
showmessage('penyimpanan data sukses....');
close;
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;  
end;


procedure Tf_emp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
f_cari.refresh;
end;

procedure Tf_emp.FormShow(Sender: TObject);
begin
pc_user.ActivePage:= ts_general;
end;

procedure Tf_emp.cb_gudangClick(Sender: TObject);
begin
ts_gudang.tabVisible:= cb_gudang.Checked;
end;

procedure Tf_emp.btnpassClick(Sender: TObject);
begin
  if (ed_pass.Text='') or (ed_pass2.Text='') then
  begin
  showmessage('password tidak boleh kosong....');
  exit;
  end;

if ed_pass.Text<>ed_pass2.Text then
begin
showmessage('password dan konfirmasi tidak sama');
exit;
end;

fungsi.SQLExec(dm.Q_Exe,'update tb_user set `update`="'+formatdatetime('yyyy-MM-dd', date())
+'",password=md5("'+ed_pass.Text+'") where kd_user="'+ed_kode.Text+'"',false);
showmessage('Proses Pengubahan Password sukses....');
end;

procedure Tf_emp.updateprivasi;
var
  sql : String;
begin
  kdUser := ed_kode.Text;
  if not(cb_gudang.Checked) then
  hakgudang(False);

  if not(cb_server.Checked) then
  hakToko(False);
  
  sql := Format('REPLACE INTO tb_user_company (kd_perusahaan, ' +
  'kd_user, admin, gudang, akun, toko, kasir, gdInvBarang, gdInvHarga, ' +
  'gdInvPlano, gdInvBrgSupp, gdInvBrgUpdate, gdTrPO, gdTrRO, gdTrReturn, ' +
  'gdTrKirim, gdTrReturnKirim, gdMaster, gdSetting, tkAdmin, `update`) VALUES '+
  '("'+f_utama.sb.Panels[3].text+'","'+kdUser+'", "%s", "%s", "%s", "%s", ' +
  '"%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", ' +
  '"%s", "%s", date(now()))', [ubahCB(cb_admin),ubahCB(cb_gudang),ubahCB(cb_akun),
  ubahCB(cb_server),ubahCB(cb_kasir),ubahCB(cb_Barang),ubahCB(cb_Harga),
  ubahCB(cb_Plano),ubahCB(cb_BrgSupp),ubahCB(cb_brgUpdate),ubahCB(cb_PO),
  ubahCB(cb_RO),ubahCB(cb_Return),ubahCB(cb_kirim),ubahCB(cb_ReturnKirim),
  ubahCB(cb_master),ubahCB(cb_Setting),ubahCB(cb_md)]);
  fungsi.SQLExec(dm.Q_Exe,sql,False);
end;

procedure Tf_emp.mniallClick(Sender: TObject);
begin
  hakgudang(True);
end;

procedure Tf_emp.mniNotAllClick(Sender: TObject);
begin
  hakgudang(False);
end;

procedure Tf_emp.hakgudang(boleh: Boolean);
var i: integer;
begin
  for i:= 0 to ComponentCount -1 do
  begin
    if (Components[i] is TsCheckBox) then
      if (TsTabSheet(TsCheckBox(Components[i]).Parent.Parent).Name) = 'ts_gudang' then
          TsCheckBox(Components[i]).Checked:= boleh;
  end;
end;

procedure Tf_emp.cb_serverClick(Sender: TObject);
begin
ts_server.TabVisible:= cb_server.Checked;
end;

procedure Tf_emp.hakToko(boleh: Boolean);
var i: integer;
begin
  for i:= 0 to ComponentCount -1 do
  begin
    if (Components[i] is TsCheckBox) then
      if (TsTabSheet(TsCheckBox(Components[i]).Parent.Parent).Name) = 'ts_server' then
          TsCheckBox(Components[i]).Checked:= boleh;
  end;
end;

end.
