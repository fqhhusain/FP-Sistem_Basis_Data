    -- Creating table Faskes
CREATE TABLE Faskes (
    id_faskes INT PRIMARY KEY,
    Nama VARCHAR(255),
    Tipe_fasilitas VARCHAR(255),
    Jarak INT,
    Alamat TEXT,
    Telepon VARCHAR(15)
);

-- Creating table Peserta
CREATE TABLE Peserta (
    id_peserta INT NOT NULL PRIMARY KEY,
    Nama VARCHAR(255),
    Kelas VARCHAR(50),
    Status VARCHAR(50),
    Status_dalam_keluarga VARCHAR(50),
    Tanggal_lahir DATE,
    id_faskes INT,      
    FOREIGN KEY (id_faskes) REFERENCES Faskes(id_faskes)
);

-- Creating table Antrian
CREATE TABLE Antrian (
    Kode_Antiran INT PRIMARY KEY,
    Tanggal_daftar DATE,
    Keluhan TEXT,
    id_faskes INT,
    id_peserta INT,
    FOREIGN KEY (id_faskes) REFERENCES Faskes(id_faskes),
    FOREIGN KEY (id_peserta) REFERENCES Peserta(id_peserta)
);

-- Creating table Pelayanan
CREATE TABLE Pelayanan (
    ID_pelayanan INT PRIMARY KEY,
    Tanggal_periksa DATE,
    Review_star INT,
    Diagnosa TEXT,
    Terapi TEXT,
    id_faskes INT,
    id_peserta INT,
    FOREIGN KEY (id_faskes) REFERENCES Faskes(id_faskes),
    FOREIGN KEY (id_peserta) REFERENCES Peserta(id_peserta)
);

-- Creating table Pembayaran_Iuran
CREATE TABLE Pembayaran_Iuran (
    ID_pembayaran INT PRIMARY KEY,
    Jumlah_pembayaran DECIMAL(10,2),
    Channel_bank VARCHAR(255),
    Tanggal_bayar DATE,
    Status_pembayaran_lunas BOOLEAN,
    id_peserta INT,
    FOREIGN KEY (id_peserta) REFERENCES Peserta(id_peserta)
);

-- Creating table Jadwal_Operasi
CREATE TABLE Jadwal_Operasi (
    Kode_Operasi INT PRIMARY KEY,
    Jadwal_pelaksanaan DATE,
    ID_faskes INT,
    Tenaga_kesehatan VARCHAR(255),
    Bidang_Spesialis VARCHAR(255),
    id_peserta INT,
    FOREIGN KEY (ID_faskes) REFERENCES Faskes(id_faskes),
    FOREIGN KEY (id_peserta) REFERENCES Peserta(id_peserta)
);

-- Creating table Tempat_tidur
CREATE TABLE Tempat_tidur (
    ID_kamar INT PRIMARY KEY,
    Tipe_kamar VARCHAR(50),
    Status_ketersediaan BOOLEAN,
    Last_update DATE,
    id_faskes INT,
    FOREIGN KEY (id_faskes) REFERENCES Faskes(id_faskes)
);

