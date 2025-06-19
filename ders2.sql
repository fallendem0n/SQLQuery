/* DERS 2 */

-- Musteriler Tablosunu Oluþturma (PRIMARY KEY burada)
CREATE TABLE Musteriler (
    MusteriID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Email VARCHAR(100) UNIQUE -- E-posta adreslerinin benzersiz olmasýný saðlayalým
);

-- Musteriler Tablosuna Örnek Veri Ekleme
INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email) VALUES
(101, 'Ayþe', 'Demir', 'ayse.demir@example.com'),
(102, 'Can', 'Yýlmaz', 'can.yilmaz@example.com'),
(103, 'Zeynep', 'Kaya', 'zeynep.kaya@example.com');

---

-- Siparisler Tablosunu Oluþturma (FOREIGN KEY burada)
-- MusteriID sütunu Musteriler tablosundaki MusteriID'ye referans veriyor
CREATE TABLE Siparisler (
    SiparisID INT PRIMARY KEY,
    MusteriID INT, -- Bu sütun Musteriler tablosundaki MusteriID'ye baðlanacak
    UrunKategori VARCHAR(50),
    Miktar INT,
    Fiyat DECIMAL(10, 2),
    SiparisTarihi DATE,
    -- FOREIGN KEY tanýmý:
    FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID)
);

-- Siparisler Tablosuna Örnek Veri Ekleme (Mevcut MusteriID'leri kullanýyoruz)
INSERT INTO Siparisler (SiparisID, MusteriID, UrunKategori, Miktar, Fiyat, SiparisTarihi) VALUES
(1, 101, 'Elektronik', 2, 1200.00, '2024-01-15'),
(2, 102, 'Giyim', 1, 350.00, '2024-01-18'),
(3, 101, 'Ev Aletleri', 1, 800.00, '2024-01-20'),
(4, 103, 'Elektronik', 3, 900.00, '2024-01-22'),
(5, 102, 'Giyim', 2, 200.00, '2024-02-01'),
(6, 101, 'Elektronik', 1, 1500.00, '2024-02-05');

---

-- Calisanlar Tablosu 
CREATE TABLE Calisanlar (
    CalisanID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Departman VARCHAR(50),
    Maas DECIMAL(10, 2)
);

-- Calisanlar Tablosuna Örnek Veri Ekleme
INSERT INTO Calisanlar (CalisanID, Ad, Soyad, Departman, Maas) VALUES
(1, 'Ali', 'Yýlmaz', 'IT', 60000.00),
(2, 'Ayþe', 'Demir', 'Ýnsan Kay.', 45000.00),
(3, 'Mehmet', 'Can', 'IT', 70000.00),
(4, 'Zeynep', 'Kaya', 'Satýþ', 55000.00),
(5, 'Burak', 'Tekin', 'Satýþ', 50000.00);


-- GROUP BY KULLANIMI 
SELECT
    UrunKategori,
    SUM(Miktar * Fiyat) AS ToplamSatisTutari
FROM
    Siparisler
GROUP BY
    UrunKategori;

-- GROUP BY INNER JOIN ILISKISI
SELECT
    M.Ad,
    M.Soyad,
    COUNT(S.SiparisID) AS SiparisAdedi,
    AVG(S.Miktar * S.Fiyat) AS OrtalamaSiparisTutari
FROM
    Musteriler AS M
INNER JOIN
    Siparisler AS S ON M.MusteriID = S.MusteriID
GROUP BY
    M.MusteriID, M.Ad, M.Soyad -- Ad ve Soyad'a göre gruplarken, MusteriID'yi de eklemek iyi pratiktir.
ORDER BY
    SiparisAdedi DESC;


-- FONKSÝYONSUZ INNER JOIN GROUP BY KULLANIMI ORNEK
SELECT
    M.Ad,
    M.Soyad,
    S.UrunKategori
FROM
    Musteriler AS M
INNER JOIN
    Siparisler AS S ON M.MusteriID = S.MusteriID
GROUP BY
    M.Ad,
    M.Soyad,
    S.UrunKategori
ORDER BY
    M.Ad, S.UrunKategori;


/* HAVING KULLANIMI */
--Toplam sipariþ tutarý 1000 TL'den fazla olan ürün kategorileri
SELECT
    UrunKategori,
    SUM(Miktar * Fiyat) AS ToplamSatisTutari
FROM
    Siparisler
GROUP BY
    UrunKategori
HAVING
    SUM(Miktar * Fiyat) > 1000;

--INNER JOIN HAVING KULLANIMI
-- 1 DEN FAZLA SÝPARÝS VEREN MÜSTERÝLER

SELECT
    M.Ad,
    M.Soyad,
    COUNT(S.SiparisID) AS SiparisAdedi
FROM
    Musteriler AS M
INNER JOIN
    Siparisler AS S ON M.MusteriID = S.MusteriID
GROUP BY
    M.MusteriID, M.Ad, M.Soyad
HAVING
    COUNT(S.SiparisID) > 1;

/* ANY, >ANY, &lt;ALL ve >ALL Karþýlaþtýrma Operatörleri */
--Elektronik kategorisindeki herhangi bir sipariþten daha pahalý olan sipariþleri bul
SELECT
    SiparisID,
    UrunKategori,
    Fiyat
FROM
    Siparisler
WHERE
    Fiyat > ANY (SELECT Fiyat FROM Siparisler WHERE UrunKategori = 'Elektronik');

--Tüm elektronik sipariþlerden daha pahalý olan sipariþleri bul 
SELECT
    SiparisID,
    UrunKategori,
    Fiyat
FROM
    Siparisler
WHERE
    Fiyat > ALL (SELECT Fiyat FROM Siparisler WHERE UrunKategori = 'Elektronik');


/* INNER JOIN KULLANIMI */
SELECT
    M.Ad,
    M.Soyad,
    S.SiparisID,
    S.UrunKategori,
    S.Miktar,
    S.Fiyat
FROM
    Musteriler AS M
INNER JOIN
    Siparisler AS S ON M.MusteriID = S.MusteriID
WHERE
    S.UrunKategori = 'Elektronik';
