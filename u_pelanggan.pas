unit u_pelanggan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit, sLabel,UFungsi, Buttons, 
  sSkinProvider, Mask, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit;

type
  Tf_cust = class(TForm)
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel7: TsLabel;
    ed_kode: TsEdit;
    ed_nama: TsEdit;
    ed_rekening: TsEdit;
    ed_alamat: TsEdit;
    ed_alamat_kirim: TsEdit;
    B_new: TsButton;
    B_save: TsButton;
    ed_telp: TsEdit;
    sLabel6: TsLabel;
    sSkinProvider1: TsSkinProvider;
    ED_LIMIT: TsCurrencyEdit;
    b_auto: TsButton;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_autoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_cust: Tf_cust;
  supp_baru:boolean;

implementation

uses u_dm, u_cari, u_utama;

{$R *.dfm}

procedure Tf_cust.baru;
begin
ed_kode.Clear;
ed_alamat.Clear;
ed_rekening.Clear;
ed_nama.Clear;
ed_alamat_kirim.Clear;
ed_telp.Clear;
ed_limit.Clear;

supp_baru:= true;
end;

procedure Tf_cust.ubah;
begin
ed_kode.ReadOnly:= true;
b_auto.Enabled:=False;

ed_kode.Text:= f_cari.q_cari.FieldByName('kd_pelanggan').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_pelanggan where kd_pelanggan="'+
ed_kode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
ed_alamat.Text:= dm.Q_temp.FieldByName('alamat').AsString;
ed_alamat_kirim.Text:= dm.Q_temp.FieldByName('alamat_kirim').AsString;
ed_rekening.Text:= dm.Q_temp.FieldByName('no_rekening').AsString;
ed_nama.Text:= dm.Q_temp.FieldByName('n_pelanggan').AsString;
ed_telp.Text:= dm.Q_temp.FieldByName('telephone').AsString;
ed_limit.Text:= dm.Q_temp.FieldByName('limit').AsString;

supp_baru:= false;
end;

procedure Tf_cust.B_newClick(Sender: TObject);
begin
baru;
end;

procedure Tf_cust.B_saveClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
if supp_baru=true then
fungsi.SQLExec(dm.Q_Exe,'insert into tb_pelanggan (kd_perusahaan,kd_pelanggan,no_rekening,n_pelanggan,alamat, '+
'telephone,alamat_kirim,`limit`,`update`)values ("'+f_utama.sb.Panels[3].Text+'","'+ed_kode.Text+'","'+ed_rekening.Text+'","'+
ed_nama.Text+'","'+ed_alamat.Text+'","'+ed_telp.Text+'","'+
ed_alamat_kirim.Text+'","'+ed_limit.Text+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false) else
fungsi.SQLExec(dm.Q_Exe,'update tb_pelanggan set `update`="'+formatdatetime('yyyy-MM-dd', date())+'",alamat="'+
ed_alamat.Text+'",no_rekening="'+ed_rekening.Text+'",alamat_kirim="'+
ed_alamat_kirim.Text+'",`limit`="'+ed_limit.Text+'",n_pelanggan="'+ed_nama.Text+'",telephone="'+
ed_telp.Text+'" where kd_pelanggan="'+ed_kode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'" ',false);

dm.db_conn.Commit;
showmessage('penyimpanan data sukses....');
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;
close;
end;

procedure Tf_cust.FormClose(Sender: TObject; var Action: TCloseAction);
begin
f_cari.q_cari.Close;
f_cari.q_cari.Open;
end;

procedure Tf_cust.b_autoClick(Sender: TObject);
var x:Integer;
pid,pid_temp:string;
begin
  fungsi.SQLExec(dm.Q_temp,'select kd_pelanggan from tb_pelanggan where kd_perusahaan="'+
  f_utama.sb.Panels[3].text+'" and kd_pelanggan like "CU-%" order by kd_pelanggan',true);

  dm.Q_temp.First;

  for x:=1 to 10000 do
  begin
  if x<10    then pid:= 'CU-000' else
  if x<100   then pid:= 'CU-00' else
  if x<1000  then pid:= 'CU-0' else
  if x<10000 then pid:= 'CU-';

  pid_temp:= pid+inttostr(x);

  if dm.Q_temp.fieldbyname('kd_pelanggan').AsString=pid_temp then
  dm.Q_temp.Next else break;
  end;
  ed_kode.Text:= pid_temp;
end;

end.
