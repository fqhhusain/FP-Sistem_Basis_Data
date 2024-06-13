---------------------------------------
-- Tampilkan Lokasi Faskes

DELIMITER //

CREATE PROCEDURE TampilkanFaskesByTipe(
    IN p_tipe_fasilitas VARCHAR(255)
)
BEGIN
    SELECT * 
    FROM Faskes 
    WHERE Tipe_fasilitas = p_tipe_fasilitas
    ORDER BY Jarak ASC;
END //

DELIMITER ;

CALL TampilkanFaskesByTipe('Rumah Sakit');


--------------------------------------------
-- Tampilkan riwayat pelayanan

DELIMITER //

CREATE PROCEDURE TampilkanRiwayatPelayanan(
    IN p_id_peserta INT
)
BEGIN
    SELECT * 
    FROM Pelayanan 
    WHERE id_peserta = p_id_peserta
    ORDER BY Tanggal_periksa DESC;
END //

DELIMITER ;

CALL TampilkanRiwayatPelayanan(123);
-------------------------------------------------
-- hitung ketersediaan tempat tidur

DELIMITER //

CREATE PROCEDURE HitungKetersediaanTempatTidur(
    IN p_id_faskes INT
)
BEGIN
    SELECT 
        Tipe_kamar,
        COUNT(*) AS Jumlah_total_kamar,
        SUM(Status_ketersediaan) AS Jumlah_kamar_tersedia,
        MAX(Last_update) AS Last_update_terbaru
    FROM 
        Tempat_tidur
    WHERE 
        id_faskes = p_id_faskes
    GROUP BY 
        Tipe_kamar;
END //

DELIMITER ;

CALL HitungKetersediaanTempatTidur(1);

-------------------------------------------------
-- procedure untuk menampilkan jadwal operasi dengan parameter input Id_peserta

DELIMITER //

CREATE PROCEDURE TampilkanJadwalOperasi(
    IN p_id_peserta INT
)
BEGIN
    SELECT * 
    FROM Jadwal_Operasi 
    WHERE id_peserta = p_id_peserta
    ORDER BY Jadwal_pelaksanaan ASC;
END //

DELIMITER ;

CALL TampilkanJadwalOperasi(123);

------------------------------------------------

-- procedure untuk menampilkan jadwal tindakan operasi dengan parameter input id_faskes namun tidak menampilkan tenaga medis dan id peserta
DELIMITER //

CREATE PROCEDURE TampilkanJadwalOperasiFaskes(
    IN p_id_faskes INT
)
BEGIN
    SELECT 
        Kode_Operasi,
        Jadwal_pelaksanaan,
        Bidang_Spesialis
    FROM 
        Jadwal_Operasi
    WHERE 
        ID_faskes = p_id_faskes
    ORDER BY 
        Jadwal_pelaksanaan ASC;
END //

DELIMITER ;

CALL TampilkanJadwalOperasiFaskes(1);

