program gudang;

uses
  Vcl.Forms,
  UTerbilang in '..\..\tools\pascal\UTerbilang.pas',
  UFungsi in '..\..\tools\pascal\UFungsi.pas',
  u_dm in '..\src\u_dm.pas' {dm: TDataModule},
  u_cari in '..\src\u_cari.pas' {F_cari},
  u_login in '..\src\u_login.pas' {F_Login},
  u_utama in '..\src\u_utama.pas' {F_utama},
  u_company in '..\src\u_company.pas' {F_comp},
  u_pengguna in '..\src\u_pengguna.pas' {F_emp},
  u_supplier in '..\src\u_supplier.pas' {F_supplier},
  u_pelanggan in '..\src\u_pelanggan.pas' {F_cust},
  u_jenis in '..\src\u_jenis.pas' {F_jenis},
  u_golongan in '..\src\u_golongan.pas' {F_golongan},
  u_kategori in '..\src\u_kategori.pas' {F_Kategori},
  u_merk in '..\src\u_merk.pas' {F_merk},
  u_satuan in '..\src\u_satuan.pas' {F_satuan},
  u_barang in '..\src\u_barang.pas' {F_barang},
  u_barang_detail in '..\src\u_barang_detail.pas' {F_barang_det},
  u_barang_property in '..\src\u_barang_property.pas' {F_barang_property},
  u_barang_supplier in '..\src\u_barang_supplier.pas' {F_barang_supp},
  u_group_barang in '..\src\u_group_barang.pas' {FGroupBarang},
  u_group_barang_detail in '..\src\u_group_barang_detail.pas' {FGroupBarangDetail},
  u_planogram in '..\src\u_planogram.pas' {F_planogram},
  u_harga in '..\src\u_harga.pas' {F_ubah_harga},
  u_edit_harga in '..\src\u_edit_harga.pas' {F_Edit_Harga},
  u_purchase in '..\src\u_purchase.pas' {F_purchase},
  u_receipt in '..\src\u_receipt.pas' {F_RO},
  u_return in '..\src\u_return.pas' {F_return},
  u_kirim in '..\src\u_kirim.pas' {F_kirim},
  u_return_kirim in '..\src\u_return_kirim.pas' {F_return_kirim},
  u_list_purchase in '..\src\u_list_purchase.pas' {F_List_purchase},
  u_list_receipt in '..\src\u_list_receipt.pas' {F_list_receipt},
  u_list_return in '..\src\u_list_return.pas' {F_list_return},
  u_list_kirim in '..\src\u_list_kirim.pas' {F_list_kirim},
  u_list_return_kirim in '..\src\u_list_return_kirim.pas' {F_list_return_kirim},
  u_list_jual in '..\src\u_list_jual.pas' {F_list_sales},
  u_list_return_jual in '..\src\u_list_return_jual.pas' {F_list_return_jual},
  u_list_stock_opname in '..\src\u_list_stock_opname.pas' {F_list_SO},
  u_laporan in '..\src\u_laporan.pas' {F_toko},
  u_ganti_hari in '..\src\u_ganti_hari.pas' {F_hari},
  u_ubah_password in '..\src\u_ubah_password.pas' {F_ubahPassword},
  u_barcode in '..\src\u_barcode.pas' {F_Barcode},
  u_real_card in '..\src\u_real_card.pas' {F_realCard},
  u_settings in '..\src\u_settings.pas' {FrmSetting};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  if dm.db_conn.Connected then
  begin
    Application.CreateForm(TF_utama, F_utama);
    Application.Run;
  end;
end.
