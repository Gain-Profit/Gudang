unit u_cari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFungsi, sEdit, sButton, ExtCtrls, DBCtrls, sSkinProvider,
  cxCustomData, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxStyles, MyAccess, cxFilter,
  cxData, MemDS, DBAccess, StdCtrls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

type
  NewControl = class(TControl);

  TF_cari = class(TForm)
    b_baru: TsButton;
    b_ubah: TsButton;
    b_hapus: TsButton;
    sSkinProvider1: TsSkinProvider;
    Ed_cari: TEdit;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    clm1: TcxGridDBColumn;
    clm2: TcxGridDBColumn;
    clm3: TcxGridDBColumn;
    clm4: TcxGridDBColumn;
    l_data: TcxGridLevel;
    ds_cari: TDataSource;
    Q_cari: TMyQuery;
    b_keluar: TsButton;
    B_Ambil: TsButton;
    procedure tampil_button(lihatA, lihatB: boolean);
    procedure b_baruClick(Sender: TObject);
    procedure b_ubahClick(Sender: TObject);
    procedure b_hapusClick(Sender: TObject);
    procedure Ed_cariChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure t_dataDblClick(Sender: TObject);
    procedure Ed_cariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure t_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure B_AmbilClick(Sender: TObject);
    procedure refresh;
  private
    kondisi, nm_tabel: string;
    { Private declarations }
  public
    _SQLi: string;
    TblCap: array[0..3] of string;
    TblVal: array[0..3] of string;
    CariT: Integer;
    { Public declarations }
  end;

var
  F_cari: TF_cari;
  TblTemp: TStringList;

implementation

uses
  u_dm, u_jenis, u_golongan, u_satuan, u_kategori, u_merk, u_company, u_supplier,
  u_pelanggan, u_pengguna;

{$R *.dfm}

function cari_tabel(sql: string): string;
var
  nPos, npos2, npos3: integer;
begin
  nPos := Pos('from', LowerCase(sql));
  delete(sql, 1, npos + 4);

  npos2 := pos(' ', sql);
  npos3 := length(sql);
  delete(sql, npos2, npos3);

  result := sql;
end;

function cari_kondisi(sql: string): string;
var
  nPos: integer;
begin
  nPos := Pos('where', LowerCase(sql));
  if nPos <> 0 then
    delete(sql, 1, npos + 5)
  else
    sql := '';

  result := sql;
end;

procedure TF_cari.b_baruClick(Sender: TObject);
begin
  case CariT of
    1: //jenis barang_det
      begin
        application.CreateForm(TF_jenis, F_Jenis);
        F_jenis.baru;
        F_jenis.ShowModal;
      end;
    2: //golongan barang_det
      begin
        application.CreateForm(TF_Golongan, F_Golongan);
        F_golongan.baru;
        F_Golongan.ShowModal;
      end;
    3: //merk barang_det
      begin
        application.CreateForm(TF_merk, F_merk);
        F_merk.baru;
        F_merk.ShowModal;
      end;
    4: //kategori barang_det
      begin
        application.CreateForm(TF_kategori, F_kategori);
        F_kategori.baru;
        F_kategori.ShowModal;
      end;
    8: //perusahaan
      begin
        application.CreateForm(TF_comp, F_comp);
        F_comp.baru;
        F_comp.ShowModal;
      end;
    9: //supplier
      begin
        application.CreateForm(TF_supplier, F_supplier);
        F_supplier.baru;
        F_supplier.ShowModal;
      end;
    11: //pelanggan
      begin
        application.CreateForm(TF_cust, F_cust);
        F_cust.baru;
        F_cust.ShowModal;
      end;
    12: //user
      begin
        application.CreateForm(TF_emp, F_emp);
        F_emp.baru;
        F_emp.ShowModal;
      end;
  else //sat
    begin
      application.CreateForm(TF_satuan, F_satuan);
      F_satuan.baru;
      F_satuan.ShowModal;
    end;
  end;
end;

procedure TF_cari.b_ubahClick(Sender: TObject);
begin
  case CariT of
    1: //jenis barang_det
      begin
        application.CreateForm(TF_jenis, F_jenis);
        F_jenis.ubah;
        F_jenis.ShowModal;
      end;
    2: //golongan barang_det
      begin
        application.CreateForm(TF_Golongan, F_Golongan);
        F_golongan.ubah;
        F_Golongan.ShowModal;
      end;
    3: //merk barang_det
      begin
        application.CreateForm(TF_merk, F_merk);
        F_merk.ubah;
        F_merk.ShowModal;
      end;
    4: //kategori barang_det
      begin
        application.CreateForm(TF_kategori, F_kategori);
        F_kategori.ubah;
        F_kategori.ShowModal;
      end;
    8: //perusahaan
      begin
        application.CreateForm(TF_comp, F_comp);
        F_comp.ubah;
        F_comp.ShowModal;
      end;
    9: //supplier
      begin
        if q_cari.fieldbyname('kode').AsString = 'SU-0001' then
        begin
          ShowMessage('Supplier Umum Tidak Bisa di Edit...');
          Exit;
        end;
        application.CreateForm(TF_supplier, F_supplier);
        F_supplier.ubah;
        F_supplier.ShowModal;
      end;
    11: //Pelanggan
      begin
        if q_cari.fieldbyname('kd_pelanggan').AsString = 'CU-0001' then
        begin
          ShowMessage('Pelanggan Umum Tidak Bisa di Edit...');
          Exit;
        end;

        application.CreateForm(TF_cust, F_cust);
        F_cust.ubah;
        F_cust.ShowModal;
      end;
    12: //User
      begin
        application.CreateForm(TF_emp, F_emp);
        F_emp.ed_kode.Text := q_cari.FieldByName('kd_user').AsString;
        F_emp.ubah;
        F_emp.ShowModal;
      end;
  else
    begin  //satuan
      application.CreateForm(TF_satuan, F_satuan);
      F_satuan.ubah;
      F_satuan.ShowModal;
    end;
  end;
end;

procedure TF_cari.b_hapusClick(Sender: TObject);
begin
  if MessageDlg('Yakinkah, akan menghapus data ini?...', mtConfirmation, [mbYes,
    mbNo], 0) = mrYes then
  begin
    case CariT of
      1: //jenis barang_det
        begin
          fungsi.SQLExec(dm.Q_Exe, 'delete from tb_jenis where kd_jenis="' +
            q_cari.fieldbyname('kd_jenis').AsString + '"', false);
        end;
      2: //golongan barang_det
        begin
          fungsi.SQLExec(dm.Q_Exe, 'delete from tb_golongan where kd_golbrg= "'
            + q_cari.fieldbyname('kd_golbrg').AsString + '" and kd_jenis="' +
            q_cari.fieldbyname('kd_jenis').AsString + '"', false);
        end;
      3: //merk barang_det
        begin
          fungsi.SQLExec(dm.Q_Exe, 'delete from tb_merk where kd_merk="' +
            q_cari.fieldbyname('kd_merk').AsString + '"', false);
        end;
      4: //kategori barang_det
        begin
          fungsi.SQLExec(dm.Q_Exe, 'delete from tb_kategori where tag="' +
            q_cari.fieldbyname('tag').AsString + '"', false);
        end;
      8: //perusahaan
        begin
          fungsi.SQLExec(dm.Q_Exe,
            'delete from tb_company where kd_perusahaan="' + q_cari.fieldbyname('kd_perusahaan').AsString
            + '"', false);
        end;
      9: //supplier
        begin
          if q_cari.fieldbyname('kode').AsString = 'SU-0001' then
          begin
            ShowMessage('Supplier Umum Tidak Bisa di hapus...');
            Exit;
          end;
          fungsi.SQLExec(dm.Q_Exe, 'delete from tb_supp where kode="' + q_cari.fieldbyname
            ('kode').AsString + '"', false);
        end;
      11: //pelanggan
        begin
          if q_cari.fieldbyname('kd_pelanggan').AsString = 'CU-0001' then
          begin
            ShowMessage('Pelanggan Umum Tidak Bisa di hapus...');
            Exit;
          end;

          fungsi.SQLExec(dm.Q_temp,
            'select kd_perusahaan from tb_company where kd_perusahaan= ' +
            quotedstr(q_cari.fieldbyname('kd_pelanggan').AsString) + '', True);
          if not (dm.Q_temp.Eof) then
          begin
            ShowMessage('Toko cabang Tidak Bisa di hapus...');
            Exit;
          end;

          fungsi.SQLExec(dm.Q_Exe,
            'delete from tb_pelanggan where kd_pelanggan="' + q_cari.fieldbyname
            ('kd_pelanggan').AsString + '" and kd_perusahaan="' + dm.kd_perusahaan
            + '" ', false);
        end;
      12: //user
        begin
          ShowMessage('Sementara Tidak bisa hapus User. '#10#13'Hubungi Programmer untuk Hapus User...');
        end;
    else
      //satuan
      begin
        fungsi.SQLExec(dm.Q_Exe, 'delete from tb_satuan where kd_satuan="' +
          q_cari.fieldbyname('kd_satuan').AsString + '"', false);
      end;
    end;
  end;

  q_cari.Close;
  q_cari.Open;

  if (CariT = 5) or (CariT = 6) or (CariT = 7) then
  begin
    F_cari.clm1.caption := 'No';
    F_cari.clm2.caption := 'Deskripsi';
    F_cari.clm3.caption := 'Singkatan';
  end
  else
  begin
    clm1.caption := 'No';
    clm2.caption := 'Deskripsi';
  end;
end;

procedure TF_cari.Ed_cariChange(Sender: TObject);
var
  saringan: string;
  x: Integer;
begin
  for x := 0 to q_cari.FieldCount - 1 do
    saringan := saringan + q_cari.Fields[x].FieldName + ' like "%' + ed_cari.Text
      + '%" or ';

  delete(saringan, Length(saringan) - 3, 4);

  fungsi.SQLExec(q_cari, 'select ' + TblTemp.CommaText + ' from ' + nm_tabel +
    ' where ' + kondisi + '(' + saringan + ') limit 0,100', true);
end;

procedure TF_cari.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    close;

  if key = vk_f2 then
    ed_cari.SetFocus;

  if key = vk_up then
  begin
//Q_cari.Prior;
    t_data.DataController.FocusedRowIndex := t_data.DataController.FocusedRowIndex - 1;
    key := VK_NONAME;
  end;

  if key = vk_down then
  begin
//Q_cari.Next;
    t_data.DataController.FocusedRowIndex := t_data.DataController.FocusedRowIndex + 1;
  end;
end;

procedure TF_cari.tampil_button(lihatA, lihatB: boolean);
begin
  b_baru.Visible := lihatA;
  b_ubah.Visible := lihatA;
  b_hapus.Visible := lihatA;

  B_Ambil.Visible := lihatB;
end;

procedure TF_cari.FormShow(Sender: TObject);
var
  x: Integer;
begin
  fungsi.SQLExec(Q_cari, _SQLi + ' limit 0,100', True);

  nm_tabel := cari_tabel(_SQLi);

  if cari_kondisi(_SQLi) <> '' then
    kondisi := cari_kondisi(_SQLi) + ' AND '
  else
    kondisi := '';

  TblTemp.Clear;

  for x := 0 to q_cari.FieldCount - 1 do
  begin
    TblTemp.Add(q_cari.Fields[x].FieldName);
  end;

  for x := 0 to q_cari.FieldCount - 1 do
  begin
    TcxGridDBColumn(FindComponent('clm' + IntToStr(x + 1))).DataBinding.FieldName
      := q_cari.Fields[x].FieldName;
    TcxGridDBColumn(FindComponent('clm' + IntToStr(x + 1))).Visible := True;
    TcxGridDBColumn(FindComponent('clm' + IntToStr(x + 1))).Caption := tblCap[x];
  end;
end;

procedure TF_cari.t_dataDblClick(Sender: TObject);
begin
  B_AmbilClick(Sender);
end;

procedure TF_cari.Ed_cariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    B_AmbilClick(Sender);
  end;
end;

procedure TF_cari.t_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    B_AmbilClick(Sender);
end;

procedure TF_cari.B_AmbilClick(Sender: TObject);
var
  x: Integer;
begin
  for x := 0 to q_cari.FieldCount - 1 do
  begin
    TblVal[x] := q_cari.fieldbyname(TcxGridDBColumn(FindComponent('clm' +
      IntToStr(x + 1))).DataBinding.FieldName).AsString;
  end;
  ModalResult := mrOk;
end;

procedure TF_cari.refresh;
var
  posisi: integer;
begin
  posisi := t_data.DataController.DataSource.DataSet.RecNo;
  t_data.DataController.DataSource.DataSet.Close;
  t_data.DataController.DataSource.DataSet.Open;
  t_data.DataController.DataSource.DataSet.RecNo := posisi;
end;

initialization
  TblTemp := TStringList.Create;

finalization
  TblTemp.Free;

end.


