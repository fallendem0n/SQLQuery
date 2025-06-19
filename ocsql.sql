---Kitaplar Tablosu Olu�turma
CREATE TABLE Kitaplar(
KitapID int PRIMARY KEY,
Baslik varchar(30) NOT NULL,
Yazar varchar(30) NOT NULL,
YayinYili int,
ISBN varchar(30) UNIQUE
);

---OduncIslemleri Tablosu Olu�turma
CREATE TABLE OduncIslemleri(
OduncID int PRIMARY KEY,
KitapID int,
UyeID int NOT NULL,
OduncTarihi date NOT NULL,
TeslimTarihi date,
FOREIGN KEY (KitapID) REFERENCES Kitaplar(KitapID),
FOREIGN KEY (UyeID) REFERENCES Uyeler (UyeID)
);

---�yeler Tablosu Olu�turma
CREATE TABLE Uyeler(
UyeID int PRIMARY KEY,
Ad varchar(30),
Soyad varchar(30)
);


----�yeler Tablosuna Data Ekleme
INSERT INTO Uyeler (UyeID, Ad, Soyad)
VALUES
    (101, 'Ay�e', 'Y�lmaz'),
    (102, 'Mehmet', 'Demir'),
    (103, 'Zeynep', 'Kaya'),
    (104, 'Ali', 'Can'),
    (105, 'Elif', '�ahin'),
    (106, 'Burak', 'Aslan'),
    (107, 'Cemre', 'Akta�'),
    (108, 'Deniz', 'Tun�'),
    (109, 'G�khan', 'Kurt'),
    (110, 'Fatma', '�elik');


---Kitaplar Tablosuna Data Ekleme
INSERT INTO Kitaplar (KitapID, Baslik, Yazar, YayinYili, ISBN)
VALUES
	(1, 'Sefiller', 'Victor Hugo', 1862, '978-0140449352'),
    (2, 'Su� ve Ceza', 'Fyodor Dostoyevski', 1866, '978-0140449130'),
    (3, 'K���k Prens', 'Antoine de Saint-Exup�ry', 1943, '978-0156013915'),
    (4, 'Nutuk', 'Mustafa Kemal Atat�rk', 1927, '978-9751600000'),
    (5, 'Don Ki�ot', 'Miguel de Cervantes', 1605, '978-0060934347'),
    (6, 'Y�z Y�ll�k Yaln�zl�k', 'Gabriel Garc�a M�rquez', 1967, '978-0061120084'),
    (7, 'Tutunamayanlar', 'O�uz Atay', 1972, '978-9754700000'),
    (8, 'Hayvan �iftli�i', 'George Orwell', 1945, '978-0451526342'),
    (9, 'K�rk Mantolu Madonna', 'Sabahattin Ali', 1943, '978-9750700000'),
    (10, 'U�urtma Avc�s�', 'Khaled Hosseini', 2003, '978-1594480000'),
    (11, 'Simyac�', 'Paulo Coelho', 1988, '978-0061122415'),
    (12, 'D�n���m', 'Franz Kafka', 1915, '978-0486280535'),
    (13, '�eker Portakal�', 'Jos� Mauro de Vasconcelos', 1968, '978-9750700001'),
    (14, '�nce Memed', 'Ya�ar Kemal', 1955, '978-9750700002'),
    (15, '1984', 'George Orwell', 1949, '978-0451524935'),
    (16, 'Fareler ve �nsanlar', 'John Steinbeck', 1937, '978-0140177398'),
    (17, 'B�lb�l� �ld�rmek', 'Harper Lee', 1960, '978-0446310789'),
    (18, 'Dorian Gray�in Portresi', 'Oscar Wilde', 1890, '978-0141439570'),
    (19, 'Anna Karenina', 'Lev Tolstoy', 1877, '978-0140449178'),
    (20, '�skender', 'Elif �afak', 2009, '978-9759910000');

---OduncIslemleri Tablosuna Data Ekleme
INSERT INTO OduncIslemleri (OduncID, KitapID, UyeID, OduncTarihi, TeslimTarihi)
VALUES
	(1, 1, 101, '2024-01-05', '2024-01-20'),
    (2, 5, 102, '2024-01-07', '2024-01-22'),
    (3, 10, 103, '2024-01-10', '2024-01-25'),
    (4, 2, 101, '2024-01-12', '2024-01-27'), 
    (5, 7, 104, '2024-01-15', '2024-01-30'),
    (6, 15, 105, '2024-01-18', '2024-02-02'),
    (7, 3, 101, '2024-01-20', '2024-02-04'), 
    (8, 12, 102, '2024-01-22', '2024-02-06'), 
    (9, 18, 106, '2024-01-25', '2024-02-09'),
    (10, 4, 107, '2024-01-28', '2024-02-12'),
    (11, 6, 108, '2024-02-01', '2024-02-16'),
    (12, 11, 109, '2024-02-03', '2024-02-18'),
    (13, 14, 110, '2024-02-05', '2024-02-20'),
    (14, 19, 101, '2024-02-08', '2024-02-23'), 
    (15, 8, 102, '2024-02-10', '2024-02-25'), 
    (16, 16, 103, '2024-02-13', '2024-02-28'), 
    (17, 20, 104, '2024-02-15', '2024-03-01'),
    (18, 9, 105, '2024-02-18', '2024-03-04'),
    (19, 13, 106, '2024-02-20', '2024-03-06'),
    (20, 17, 107, '2024-02-23', '2024-03-09'),
    (21, 1, 108, '2024-02-25', '2024-03-11'),
    (22, 5, 109, '2024-02-28', '2024-03-14'),
    (23, 10, 110, '2024-03-02', '2024-03-17'),
    (24, 2, 101, '2024-03-05', '2024-03-20'), 
    (25, 7, 102, '2024-03-07', '2024-03-22'), 
    (26, 15, 103, '2024-03-10', '2024-03-25'), 
    (27, 3, 104, '2024-03-12', '2024-03-27'),
    (28, 12, 105, '2024-03-15', '2024-03-30'),
    (29, 18, 106, '2024-03-18', '2024-04-02'),
    (30, 4, 107, '2024-03-20', '2024-04-04'),
    (31, 6, 108, '2024-03-23', '2024-04-07'),
    (32, 11, 109, '2024-03-25', '2024-04-09'),
    (33, 14, 110, '2024-03-28', '2024-04-12'),
    (34, 19, 101, '2024-03-30', '2024-04-14'), 
    (35, 8, 102, '2024-04-02', '2024-04-17'), 
    (36, 16, 103, '2024-04-04', '2024-04-19'), 
    (37, 20, 104, '2024-04-07', '2024-04-22'),
    (38, 9, 105, '2024-04-09', '2024-04-24'),
    (39, 13, 106, '2024-04-12', '2024-04-27'),
    (40, 17, 107, '2024-04-14', '2024-04-29');


SELECT K.Baslik, OI.OduncTarihi,U.Ad,U.Soyad FROM OduncIslemleri AS OI
INNER JOIN
	Kitaplar AS K ON OI.KitapID = K.KitapID
INNER JOIN
	Uyeler AS U ON OI.UyeID = U.UyeID
Order BY U.Ad

SELECT * FROM OduncIslemleri

UPDATE Uyeler
SET Soyad = 'Kurto�lu'
WHERE UyeID =101;

--DELETE FROM OduncIslemleri
--WHERE OduncID = 30;

--UyeID'si 101 olan Ay�e Y�lmaz adl� �yenin �d�n� ald��� t�m kitaplar�n ba�l�klar�n� ve bu kitaplar� �d�n� ald��� tarihleri listeleyen bir sorgu yaz�n.

SELECT K.Baslik,OI.OduncTarihi FROM OduncIslemleri AS OI
INNER JOIN 
	Kitaplar AS K ON OI.KitapID= K.KitapID
WHERE OI.UyeID='101'

--George Orwell'�n yazm�� oldu�u ve �u anda �d�n�te olan (teslim tarihi bo� olan) kitaplar�n ba�l�klar�n�, bu kitaplar� �d�n� alan �yelerin ad�n� ve soyad�n� listeleyen bir sorgu yaz�n.

INSERT INTO OduncIslemleri (OduncID, KitapID, UyeID, OduncTarihi, TeslimTarihi)
VALUES
    (41, 1, 101, '2025-06-10', NULL),
    (42, 8, 102, '2025-06-12', NULL),
    (43, 15, 103, '2025-06-14', NULL), 
    (44, 2, 104, '2025-06-15', NULL), 
    (45, 9, 105, '2025-06-16', NULL); 


SELECT U.Ad,U.Soyad,K.Yazar,OI.TeslimTarihi FROM OduncIslemleri AS OI
INNER JOIN
	Kitaplar AS K ON OI.KitapID = K.KitapID
INNER JOIN
	Uyeler AS U ON U.UyeID = OI.UyeID
WHERE K.Yazar = 'George Orwell' AND OI.TeslimTarihi IS NULL


--COUNT ve GROUP BY Kullan�m�:
--Her bir �yenin toplam ka� adet kitap �d�n� ald���n� ve bu �yelerin ad�n� soyad�n� g�steren bir sorgu yaz�n. 
--Sonu�lar� �d�n� al�nan kitap say�s�na g�re azalan s�rada s�ralay�n.

SELECT U.Ad,U.Soyad, COUNT (OI.OduncID) AS ToplamOdunc 
FROM OduncIslemleri AS OI
INNER JOIN
	Uyeler AS U ON U.UyeID = OI.UyeID
GROUP BY
U.Ad,U.Soyad
ORDER BY
ToplamOdunc DESC;

--Basit JOIN ve WHERE ile Yazar Sorgulama:
--Sabahattin Ali'den herhangi bir kitap �d�n� alm�� olan t�m �yelerin ad�n� ve soyad�n� listeleyen bir sorgu yaz�n.
SELECT U.Ad,U.Soyad FROM OduncIslemleri AS OI
INNER JOIN
Kitaplar AS K ON K.KitapID = OI.KitapID
INNER JOIN
Uyeler AS U ON U.UyeID = OI.UyeID

WHERE K.Yazar = 'Sabahattin Ali'

--LIKE KULLANIMI
SELECT * FROM Uyeler 
WHERE Soyad LIKE '%A%';

SELECT * FROM Uyeler 
WHERE Soyad LIKE 'A%';

SELECT * FROM Uyeler 
WHERE Soyad LIKE '%A';

--WHERE ve Tarih K�yaslamas�:
--2024 y�l�n�n ilk �eyre�inde (1 Ocak 2024 ile 31 Mart 2024 tarihleri aras�nda) yap�lm�� olan t�m �d�n� i�lemlerini,
--ilgili kitap ba�l���, �ye ad� ve �d�n� tarihi ile birlikte listeleyen bir sorgu yaz�n.	

SELECT K.Baslik,U.Ad,OI.OduncTarihi FROM OduncIslemleri AS OI
INNER JOIN Kitaplar AS K ON K.KitapID = OI.KitapID 
INNER JOIN Uyeler AS U ON U.UyeID = OI.UyeID
WHERE OI.OduncTarihi BETWEEN '2024-01-01' AND '2024-03-31'

--NULL Kontrol� ve ORDER BY:
--Hen�z teslim edilmemi� (TeslimTarihi NULL olan) 
--t�m kitaplar�n ba�l�klar�n�, 
--bu kitaplar� �d�n� alan �yelerin ad�n� soyad�n� ve �d�n� alma tarihlerini listeleyen bir sorgu yaz�n. 
--Sonu�lar� �d�n� alma tarihine g�re en eskiden en yeniye do�ru s�ralay�n.

SELECT U.Ad,U.Soyad,OI.OduncTarihi,K.Baslik FROM OduncIslemleri AS OI
INNER JOIN Uyeler AS U ON U.UyeID = OI.UyeID
INNER JOIN Kitaplar AS K ON K.KitapID = OI.KitapID
WHERE OI.TeslimTarihi IS NULL
ORDER BY OI.OduncTarihi

--COUNT ve GROUP BY ile Kitap Pop�lerli�i:
--Her bir kitab�n ka� kez �d�n� al�nd���n� ve bu kitaplar�n ba�l���n� listeleyen bir sorgu yaz�n. 
--Sonu�lar� �d�n� al�nma say�s�na g�re azalan s�rada s�ralay�n.

SELECT K.Baslik ,COUNT (OI.KitapID) AS KitapSayisi FROM OduncIslemleri AS OI
INNER JOIN Kitaplar AS K ON K.KitapID = OI.KitapID
GROUP BY
K.Baslik
ORDER BY
KitapSayisi DESC


--INNER JOIN ve WHERE ile �zel Durum:
--2000 y�l�ndan sonra yay�nlanm�� ve Mehmet Demir taraf�ndan �d�n� al�nm�� olan kitaplar�n ba�l�klar�n� ve
--�d�n� alma tarihlerini listeleyen bir sorgu yaz�n

SELECT K.Baslik,OI.OduncTarihi FROM OduncIslemleri AS OI
INNER JOIN Kitaplar AS K ON K.KitapID = OI.KitapID
INNER JOIN Uyeler AS U ON U.UyeID = OI.UyeID
WHERE K.YayinYili >=2000 AND U.Ad = 'Mehmet' AND U.Soyad='Demir'


--George Orwell'�n yazd��� kitaplardan herhangi birini �d�n� alm�� olan t�m �yelerin adlar�n� ve soyadlar�n� listeleyen bir sorgu yaz�n.

SELECT U.Ad,U.Soyad FROM OduncIslemleri AS OI
INNER JOIN Kitaplar AS K ON K.KitapID = OI.KitapID
INNER JOIN Uyeler AS U ON U.UyeID = OI.UyeID
WHERE K.Yazar = 'George Orwell'

--5'ten daha az kez �d�n� al�nm�� olan kitap ba�l�klar�n� ve �d�n� al�nma say�lar�n� listeleyen bir sorgu yaz�n.

SELECT K.Baslik, COUNT(K.Baslik) AS Sayim FROM OduncIslemleri AS OI
INNER JOIN Kitaplar AS K ON K.KitapID = OI.KitapID
GROUP BY K.Baslik
ORDER BY Sayim
