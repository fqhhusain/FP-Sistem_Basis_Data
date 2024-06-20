---------------------------------------
-- Tampilkan Lokasi Faskes

DELIMITER //

CREATE PROCEDURE TampilkanFaskesByTipe(
    IN p_tipe_fasilitas VARCHAR(255)
)
BEGIN
    SELECT * 
    FROM Faskes 
    WHERE Tipe_fasilitas = p_tipe_fasilitas;
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

--------------------------------------------------
-- procedure untuk menambah antrean

DELIMITER //

CREATE PROCEDURE TambahAntrean(
    IN p_id_faskes INT,
    IN p_id_peserta INT,
    IN p_keluhan TEXT
)
BEGIN
    DECLARE kode_antrian INT;
    DECLARE peserta_ada INT;
    DECLARE faskes_ada INT;
    DECLARE pesan_error VARCHAR(255);

    -- Check if the participant exists
    SELECT COUNT(*) INTO peserta_ada 
    FROM Peserta 
    WHERE id_peserta = p_id_peserta;

    -- If participant does not exist, set error message
    IF peserta_ada = 0 THEN
        SET pesan_error = 'Nama peserta tidak terdaftar';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = pesan_error;
    END IF;

    -- Check if the healthcare facility exists
    SELECT COUNT(*) INTO faskes_ada 
    FROM Faskes 
    WHERE id_faskes = p_id_faskes;

    -- If healthcare facility does not exist, set error message
    IF faskes_ada = 0 THEN
        SET pesan_error = 'Nama faskes tidak ada';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = pesan_error;
    END IF;

    -- If both participant and healthcare facility exist, proceed to insert
    IF peserta_ada > 0 AND faskes_ada > 0 THEN
        -- Calculate the next kode_antrian (auto-increment simulation)
        SELECT IFNULL(MAX(Kode_Antiran), 0) + 1 INTO kode_antrian FROM Antrian;

        -- Insert the new row into the Antrian table
        INSERT INTO Antrian (Kode_Antiran, Tanggal_daftar, Keluhan, id_faskes, id_peserta)
        VALUES (kode_antrian, NOW(), p_keluhan, p_id_faskes, p_id_peserta);
    END IF;
END //

DELIMITER ;

CALL TambahAntrean(1, 123, 'Sakit kepala');
----------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE TampilkanSemuaPeserta()
BEGIN
    SELECT * FROM Peserta;
END$$

DELIMITER ;

CALL TampilkanSemuaPeserta();


