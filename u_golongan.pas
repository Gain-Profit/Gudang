unit u_golongan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sLabel, sButton, Buttons, 
  sComboBox, U_fungsi, sSkinProvider;

type
  Tf_golongan = class(TForm)
    sLabel1: TsLabel;
    ed_kode: TsEdit;
    sLabel2: TsLabel;
    ed_desk: TsEdit;
    sLabel3: TsLabel;
    B_new: TsButton;
    B_save: TsButton;
    cb_jenis: TsComboBox;
    sSkinProvider1: TsSkinProvider;
    cb_1: TsComboBox;
    procedure baru;
    procedure ubah;
    procedure cb_jenisChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_golongan: Tf_golongan;
  fungsi:TFungsi;
  kd_jenis:string;
  gol_baru:boolean;

implementation

uses u_dm, u_cari, u_barang_det;

{$R *.dfm}

procedure Tf_golongan.baru;
begin
  ed_kode.Enabled:= True;
  cb_jenis.Enabled:= True;

  fungsi.SQLExec(dm.q_temp,'select * from tb_golongan where kd_jenis="'+u_barang_det.kd_jenis+'"',true);
  if Length(IntToStr(dm.Q_temp.recordcount+1))<> 1 then
  ed_kode.Text:= inttostr(dm.Q_temp.recordcount+1) else
  ed_kode.Text:= '0'+inttostr(dm.Q_temp.recordcount+1);

  ed_desk.Clear;
  gol_baru:= true;
end;

procedure Tf_golongan.ubah;
begin
  ed_kode.Enabled:= False;
  cb_jenis.Enabled:= False;

  ed_kode.Text:= f_cari.q_cari.FieldByName('kd_golbrg').AsString;
  cb_jenis.ItemIndex:= cb_1.Items.IndexOf(f_cari.q_cari.FieldByName('kd_jenis').AsString);
  ed_desk.text:= f_cari.q_cari.FieldByName('n_golbrg').AsString;
  gol_baru:= false;
end;

procedure Tf_golongan.cb_jenisChange(Sender: TObject);
begin
  fungsi.SQLExec(dm.q_temp,'select * from tb_golongan where kd_jenis="'+cb_1.Items.Strings[cb_jenis.Itemindex]+'"',true);
  if Length(IntToStr(dm.Q_temp.recordcount+1))<> 1 then
  ed_kode.Text:= inttostr(dm.Q_temp.recordcount+1) else
  ed_kode.Text:= '0'+inttostr(dm.Q_temp.recordcount+1);
end;

procedure Tf_golongan.FormCreate(Sender: TObject);
var x: integer;
begin
  fungsi.SQLExec(dm.Q_temp,'SELECT * from tb_jenis',true);
  for x:= 1 to dm.Q_temp.RecordCount do
  begin
    cb_jenis.AddItem(dm.Q_temp.fieldbyname('n_jenis').AsString,sender);
    cb_1.AddItem(dm.Q_temp.fieldbyname('kd_jenis').AsString,sender);
    dm.Q_temp.Next;
  end;
end;

procedure Tf_golongan.B_newClick(Sender: TObject);
begin
  baru;
end;

procedure Tf_golongan.B_saveClick(Sender: TObject);
begin
  dm.My_Conn.StartTransaction;
  try
    if gol_baru=true then
      fungsi.SQLExec(dm.Q_Exe,'insert into tb_golongan (kd_jenis, kd_golbrg,n_golbrg,`update`)values ("'+
      cb_1.Items.Strings[cb_jenis.Itemindex]+'","'+ed_kode.Text+'","'+ed_desk.Text+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false) else
      fungsi.SQLExec(dm.Q_Exe,'update tb_golongan set n_golbrg="'+ed_desk.Text+'",`update`="'+
      formatdatetime('yyyy-MM-dd', date())+'" where kd_golbrg="'+ed_kode.Text+'" and kd_jenis="'+cb_1.Items.Strings[cb_jenis.Itemindex]+'"',false);

{      fungsi.SQLExec(dm.Q_Exe,'insert into tb_golongan (kd_jenis, kd_golbrg,n_golbrg,`update`)values ("'+
      inttostr(cb_jenis.ItemIndex+1)+'","'+ed_kode.Text+'","'+ed_desk.Text+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false) else
      fungsi.SQLExec(dm.Q_Exe,'update tb_golongan set n_golbrg="'+ed_desk.Text+'",`update`="'+
      formatdatetime('yyyy-MM-dd', date())+'" where kd_golbrg="'+ed_kode.Text+'" and kd_jenis="'+inttostr(cb_jenis.ItemIndex+1)+'"',false);
}
    dm.My_conn.Commit;
    showmessage('penyimpanan data sukses....');
  except on e:exception do begin
    dm.My_conn.Rollback;
    showmessage('penyimpanan data gagal '#10#13'' +e.Message);
    end;
  end;
  
  f_cari.q_cari.Close;
  f_cari.q_cari.Open;

  f_cari.clm1.caption:='No';
  f_cari.clm2.caption:='Deskripsi';
  close;
end;

end.
