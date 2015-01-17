unit u_jenis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sEdit, sButton, U_fungsi, sSkinProvider;

type
  Tf_jenis = class(TForm)
    B_new: TsButton;
    ed_kode: TsEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    ed_desc: TsEdit;
    B_save: TsButton;
    sSkinProvider1: TsSkinProvider;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_jenis: Tf_jenis;
  fungsi:tfungsi;
  jenis_baru:boolean;
implementation

uses u_dm, u_cari;

{$R *.dfm}

procedure Tf_jenis.baru;
begin
ed_kode.Enabled:= True;
fungsi.SQLExec(dm.q_temp,'select * from tb_jenis',true);

  if Length(IntToStr(dm.Q_temp.recordcount+1))<> 1 then
  ed_kode.Text:= inttostr(dm.Q_temp.recordcount+1) else
  ed_kode.Text:= '0'+inttostr(dm.Q_temp.recordcount+1);

ed_desc.Clear;
jenis_baru:= true;
end;

procedure Tf_jenis.ubah;
begin
ed_kode.Enabled:= False;
ed_kode.Text:= f_cari.q_cari.FieldByName('kd_jenis').AsString;
ed_desc.text:= f_cari.q_cari.FieldByName('n_jenis').AsString;
jenis_baru:= false;
end;

procedure Tf_jenis.B_newClick(Sender: TObject);
begin
baru;
end;

procedure Tf_jenis.B_saveClick(Sender: TObject);
begin
dm.My_Conn.StartTransaction;
try
if jenis_baru=true then
fungsi.SQLExec(dm.Q_Exe,'insert into tb_jenis (kd_jenis,n_jenis,`update`)values ("'+
ed_kode.Text+'","'+ed_desc.Text+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false) else
fungsi.SQLExec(dm.Q_Exe,'update tb_jenis set n_jenis="'+ed_desc.Text+'",`update`="'+
formatdatetime('yyyy-MM-dd', date())+'" where kd_jenis="'+ed_kode.Text+'"',false);

dm.My_conn.Commit;
showmessage('penyimpanan data sukses....');
except on e:exception do begin
  dm.My_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;
f_cari.q_cari.Close;
f_cari.q_cari.Open;

f_cari.clm1.Caption:='No';
f_cari.clm2.caption:='Deskripsi';
close;
end;

end.
