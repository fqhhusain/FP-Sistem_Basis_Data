TRIGGER PESERTA
insert
DELIMITER $$

CREATE TRIGGER after_peserta_insert
AFTER INSERT ON Peserta
FOR EACH ROW
BEGIN
    INSERT INTO Peserta_log (id_peserta, Nama, Kelas, Status, Status_dalam_keluarga, Tanggal_lahir, id_faskes, Action_type)
    VALUES (NEW.id_peserta, NEW.Nama, NEW.Kelas, NEW.Status, NEW.Status_dalam_keluarga, NEW.Tanggal_lahir, NEW.id_faskes, 'INSERT');
END$$

DELIMITER ;


update
DELIMITER $$

CREATE TRIGGER after_peserta_update
AFTER UPDATE ON Peserta
FOR EACH ROW
BEGIN
    INSERT INTO Peserta_log (id_peserta, Nama, Kelas, Status, Status_dalam_keluarga, Tanggal_lahir, id_faskes, Action_type)
    VALUES (NEW.id_peserta, NEW.Nama, NEW.Kelas, NEW.Status, NEW.Status_dalam_keluarga, NEW.Tanggal_lahir, NEW.id_faskes, 'UPDATE');
END$$

DELIMITER ;



delete
DELIMITER $$

CREATE TRIGGER after_peserta_delete
AFTER DELETE ON Peserta
FOR EACH ROW
BEGIN
    INSERT INTO Peserta_log (id_peserta, Nama, Kelas, Status, Status_dalam_keluarga, Tanggal_lahir, id_faskes, Action_type)
    VALUES (OLD.id_peserta, OLD.Nama, OLD.Kelas, OLD.Status, OLD.Status_dalam_keluarga, OLD.Tanggal_lahir, OLD.id_faskes, 'DELETE');
END$$

DELIMITER ;
