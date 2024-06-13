    INSERT INTO Faskes (id_faskes, Nama, Tipe_fasilitas, Jarak, Alamat, Telepon) VALUES
(1, 'RS Harapan Kita', 'Rumah Sakit', 5, 'Jl. Harapan No. 1', '0211234567'),
(2, 'Puskesmas Sehat', 'Puskesmas', 3, 'Jl. Sehat No. 12', '0217654321'),
(3, 'Klinik Keluarga', 'Klinik', 2, 'Jl. Keluarga No. 7', '0213344556'),
(4, 'RS Medika Utama', 'Rumah Sakit', 10, 'Jl. Utama No. 45', '0212233445'),
(5, 'Puskesmas Harapan', 'Puskesmas', 7, 'Jl. Harapan No. 22', '0217788990'),
(6, 'Klinik Sejahtera', 'Klinik', 4, 'Jl. Sejahtera No. 10', '0214455667');


INSERT INTO Peserta (id_peserta, Nama, Kelas, Status, Status_dalam_keluarga, Tanggal_lahir, id_faskes) VALUES
(101, 'Budi Santoso', 'Kelas 1', 'Aktif', 'Kepala Keluarga', '1980-01-15', 1),
(102, 'Siti Aminah', 'Kelas 2', 'Nonaktif', 'Istri', '1982-02-20', 2),
(103, 'Adi Nugroho', 'Kelas 3', 'Aktif', 'Anak', '2005-05-10', 3),
(104, 'Dewi Kusuma', 'Kelas 1', 'Aktif', 'Istri', '1981-03-25', 1),
(105, 'Joko Widodo', 'Kelas 2', 'Nonaktif', 'Kepala Keluarga', '1975-04-17', 4),
(106, 'Ratna Sari', 'Kelas 3', 'Aktif', 'Anak', '2007-07-22', 5);

INSERT INTO Antrian (Kode_Antiran, Tanggal_daftar, Keluhan, id_faskes, id_peserta) VALUES
(1001, '2024-06-01', 'Demam', 1, 101),
(1002, '2024-06-03', 'Batuk', 2, 102),
(1003, '2024-06-05', 'Pusing', 3, 103),
(1004, '2024-06-07', 'Mual', 1, 104),
(1005, '2024-06-09', 'Diare', 4, 105),
(1006, '2024-06-11', 'Flu', 5, 106);

INSERT INTO Pelayanan (ID_pelayanan, Tanggal_periksa, Review_star, Diagnosa, Terapi, id_faskes, id_peserta) VALUES
(2001, '2024-06-02', 4, 'Infeksi Saluran Pernapasan', 'Antibiotik', 1, 101),
(2002, '2024-06-04', 5, 'Flu', 'Istirahat dan Vitamin C', 2, 102),
(2003, '2024-06-06', 3, 'Migrain', 'Analgesik', 3, 103),
(2004, '2024-06-08', 4, 'Gastritis', 'Antasida', 1, 104),
(2005, '2024-06-10', 5, 'Diare Akut', 'Oralit', 4, 105),
(2006, '2024-06-12', 4, 'Flu Berat', 'Antivirus', 5, 106);


INSERT INTO Pembayaran_Iuran (ID_pembayaran, Jumlah_pembayaran, Channel_bank, Tanggal_bayar, Status_pembayaran_lunas, id_peserta) VALUES
(3001, 150000.00, 'Bank Mandiri', '2024-05-31', TRUE, 101),
(3002, 100000.00, 'Bank BRI', '2024-06-01', FALSE, 102),
(3003, 75000.00, 'Bank BNI', '2024-06-02', TRUE, 103),
(3004, 200000.00, 'Bank BCA', '2024-06-03', TRUE, 104),
(3005, 120000.00, 'Bank Danamon', '2024-06-04', FALSE, 105),
(3006, 90000.00, 'Bank CIMB', '2024-06-05', TRUE, 106);


INSERT INTO Jadwal_Operasi (Kode_Operasi, Jadwal_pelaksanaan, ID_faskes, Tenaga_kesehatan, Bidang_Spesialis, id_peserta) VALUES
(4001, '2024-06-10', 1, 'Dr. Sutrisno', 'Bedah Umum', 101),
(4002, '2024-06-12', 2, 'Dr. Lestari', 'Ginekologi', 102),
(4003, '2024-06-14', 3, 'Dr. Mahendra', 'Pediatri', 103),
(4004, '2024-06-16', 1, 'Dr. Budi', 'Kardiologi', 104),
(4005, '2024-06-18', 4, 'Dr. Susilo', 'Ortopedi', 105),
(4006, '2024-06-20', 5, 'Dr. Sari', 'Dermat


INSERT INTO Tempat_tidur (ID_kamar, Tipe_kamar, Status_ketersediaan, Last_update, id_faskes) VALUES
(5001, 'VIP', TRUE, '2024-06-01', 1),
(5002, 'Kelas 1', FALSE, '2024-06-02', 1),
(5003, 'Kelas 2', TRUE, '2024-06-01', 2),
(5004, 'Kelas 3', FALSE, '2024-06-03', 2),
(5005, 'Kelas 1', TRUE, '2024-06-01', 3),
(5006, 'Kelas 3', TRUE, '2024-06-02', 3),
(5007, 'Kelas 2', FALSE, '2024-06-04', 4),
(5008, 'Kelas 3', TRUE, '2024-06-05', 5),
(5009, 'VIP', FALSE, '2024-06-06', 6),
(5010, 'Kelas 1', TRUE, '2024-06-07', 6);
