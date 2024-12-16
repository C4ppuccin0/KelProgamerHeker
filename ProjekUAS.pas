program vendingmachine;
uses crt;

// tipe data untuk itemnya
type 
    item = record
        nama  : string; // nama barang
        harga : integer; // harga barang
        stok  : integer; // stok barang
    end;

var 
    barang : array [1..3] of item; // array untuk menyimpan barang
    pilihan : integer;             // pilihan untuk user
    uang : integer;                // jumlah uang user
    i : integer;                   // variabel untuk loop

// procedure untuk menginisialisasi data barang
procedure inisalisaibarang;
begin
    barang[1].nama := 'Pocari'; // barang pertama
    barang[1].harga := 5000;
    barang[1].stok := 10;
    
    barang[2].nama := 'Teh Sosro'; // barang kedua
    barang[2].harga := 3500;
    barang[2].stok := 9;
    
    barang[3].nama := 'Teh Pucuk'; // barang ketiga
    barang[3].harga := 3000;
    barang[3].stok := 8;
end;

// procedure untuk menampilkan daftar barang
procedure tampilkanbarang;
begin
    writeln ('Barang yang tersedia: ');
    for i := 1 to 3 do 
        begin
            writeln (
                i, '. ', barang[i].nama, ' - harga Rp.', barang[i].harga, ' - stok: ', barang[i].stok
            );
        end;
end;

// procedur untuk membeli barang
procedure belibarang (indeksbarang : integer);
begin
    if barang[indeksbarang].stok > 0 then
        begin
            if uang >= barang[indeksbarang].harga then
                begin
                    uang := uang - barang[indeksbarang].harga;
                    barang[indeksbarang].stok := barang[indeksbarang].stok - 1;
                    writeln ('Anda telah membeli: ', barang[indeksbarang].nama);
                    writeln ('Sisa uang anda: Rp.', uang);
                end
            else
                begin
                    writeln ('Uang anda tidak cukup!');
                end
        end
    else
        begin
            writeln ('Barang habis!');
        end;
end;

begin
    clrscr;
    inisalisaibarang;

    writeln ('Selamat Datang di Mesin Penjual Otomatis!');
    writeln ('Masukkan Uang Anda: '); readln (uang);

    repeat
        tampilkanbarang;
        writeln ('Pilih barang (1-3) atau 0 untuk keluar: '); readln (pilihan);
        
        if (pilihan >= 1) and (pilihan <= 3) then
            begin
                belibarang(pilihan);
            end
        else if pilihan <> 0 then
            begin
                writeln ('Pilihan tidak valid!');
            end;
    until pilihan = 0;

    writeln ('Terimakasih telah menggunakan mesin penjual otomatis!');
end.