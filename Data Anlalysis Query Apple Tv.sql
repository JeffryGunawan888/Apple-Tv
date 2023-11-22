SELECT * FROM Apple_tv;

--1. Statistik Film Charlie Brown:
--a. Berapa rata-rata IMDb score dari film-film Charlie Brown?

SELECT
    AVG(imdb_score) AS [Rata-Rata IMDB score]
FROM Apple_tv 
WHERE title LIKE '%Charlie Brown%';


--b. Berapa total jumlah votes IMDb dari semua film Charlie Brown?
SELECT 
    SUM(imdb_votes) AS [Total IMDB Votes]
FROM Apple_tv 
WHERE title LIKE '%Charlie Brown%';

--c. Buat grafik batang untuk total jumlah votes IMDb dari setiap film
SELECT
    title,
    SUM(imdb_votes) AS [Jumlah IMDB Votes dari setiap Film]
FROM Apple_tv
GROUP BY title
HAVING title LIKE '%Charlie Brown%'

--2. Analisis Berdasarkan Genre:
--a. Berapa jumlah total film yang memiliki genre komedi?
SELECT 
    COUNT(*) AS [Total Film Bergenre Comedy]
FROM Apple_tv
WHERE genres ='comedy'

--b. Apa genre film dengan IMDb score tertinggi?
SELECT TOP 1
    genres 
FROM Apple_tv
ORDER BY imdb_score DESC;

--3. Pertanyaan Terkait Serial TV:
--a. Berapa jumlah total seasons untuk semua serial TV?
SELECT
    SUM(seasons) AS [Total Seasons untuk TV Show]
FROM Apple_tv
WHERE type  = 'Show'

--b. Apa IMDb score rata-rata untuk serial TV?
SELECT
    AVG(imdb_score) AS [Score Rata-rata IMDB untuk TV Show]
FROM Apple_tv
WHERE type = 'Show';

--4. Analisis Berdasarkan Tahun Rilis:
--a. Bagaimana trend IMDb score dari film-film Charlie Brown dari tahun ke tahun?
SELECT
    imdb_score
FROM Apple_tv
WHERE title LIKE '%Charlie Brown%'
ORDER BY release_year ASC;
-- Kesimpulan rating IMDB Score untuk film-film Charlie Brown mengalami penurunan setiap tahunnya.

--b. Berapa jumlah film yang dirilis setiap dekade?
SELECT
    FLOOR((release_year - 1) / 10) * 10 AS Decade,
    COUNT(*) AS JumlahFilm
FROM
    Apple_tv
GROUP BY
    FLOOR((release_year - 1) / 10) * 10
ORDER BY
    FLOOR((release_year - 1) / 10) * 10;



--5. Analisis Berdasarkan Age Certification:
--a. Berapa jumlah film yang memiliki sertifikasi umur 'G'?
SELECT 
    COUNT(*) AS [Jumlah Film dengan Sertifikasi umur 'G']
FROM Apple_tv
WHERE age_certification = 'G';

--b. Bagaimana distribusi IMDb score berdasarkan sertifikasi umur?
SELECT
    age_certification,
    AVG(imdb_score) AS [Rata-rata Score IMDB Berdasarakan Sertifikasi Umur]
FROM Apple_tv
GROUP BY age_certification

--6. Analisis Berdasarkan Production Countries:
--a. Berapa jumlah film yang diproduksi di Amerika Serikat?
SELECT 
    COUNT(DISTINCT(id)) AS [Jumlah Film Produksi di US]
FROM Apple_tv
WHERE production_countries LIKE '%US%';

--b. Bagaimana IMDb score untuk film-film yang diproduksi di Amerika Serikat dibandingkan dengan negara lain?
SELECT
    production_countries,
    AVG(imdb_score) AS [Rata-rata IMDb Score]
FROM Apple_tv
GROUP BY production_countries;


--7. Pertanyaan Terkait Serial TV Fraggle Rock:
--a. Berapa rata-rata IMDb score untuk setiap season Fraggle Rock?
SELECT 
    title,
    AVG(imdb_score) AS [Rata-rata IMDB Score untuk setiap season Fraggle Rock]
FROM Apple_tv
WHERE title LIKE '%Fraggle Rock%'
GROUP BY title;

--b. Bagaimana IMDb score berubah dari satu season ke season berikutnya?
SELECT 
    *
FROM Apple_tv
WHERE title LIKE '%Fraggle Rock%'
-- Terlihat bahwa dari tahun 1983 ke 2020 film Fraggle Rock mengalami penurunan rating namun di tahun 2022 film ini mengalami penaikan rating yang cukup signifikan.


-- SOAL TABLEAU
-- Statistik Film Charlie Brown:
SELECT * FROM Apple_tv;

--1. Visualisasikan IMDb score rata-rata dari setiap film Charlie Brown.
--2. Buat grafik batang untuk total jumlah votes IMDb dari setiap film.
SELECT
    title,
    SUM(imdb_votes) AS [Jumlah IMDB Votes dari setiap Film]
FROM Apple_tv
GROUP BY title
HAVING title LIKE '%Charlie Brown%'

-- Analisis Berdasarkan Genre:
--3. Buat diagram lingkaran untuk memperlihatkan distribusi genre film-film tersebut.
SELECT
    genres,
    COUNT(*) AS [Jumlah film berdasarkan Genres]
FROM Apple_tv
GROUP BY genres;


--4. Buat peta panas untuk menunjukkan IMDb score berdasarkan kombinasi genre.
SELECT
    genres,
    AVG(imdb_score) AS [Rata-rata IMDb Score]
FROM Apple_tv
GROUP BY genres
HAVING COUNT(*) > 1; -- Filter kombinasi genre yang muncul lebih dari satu kali

--Pertanyaan Terkait Serial TV:
--5. Buat grafik garis untuk menunjukkan bagaimana IMDb score berubah dari satu season ke season berikutnya.
--Analisis Berdasarkan Tahun Rilis:
--6. Buat grafik garis atau diagram batang waktu untuk menunjukkan bagaimana IMDb score berubah dari tahun ke tahun.
SELECT
    release_year,
    AVG(imdb_Score) AS [Rata-rata IMDB Score Per Tahun]
FROM Apple_tv
GROUP BY release_year;


--7. Buat grafik batang untuk menunjukkan jumlah film yang dirilis setiap dekade.
SELECT
    FLOOR((release_year - 1) / 10) * 10 AS Dekade,
    COUNT(*) AS [Jumlah Film Dirilis per Dekade]
FROM Apple_tv
GROUP BY FLOOR((release_year - 1) / 10) * 10
ORDER BY FLOOR((release_year - 1) / 10) * 10;


-- Analisis Berdasarkan Age Certification:
--8. Buat diagram lingkaran untuk menunjukkan distribusi jumlah film berdasarkan sertifikasi umur.
SELECT
    age_certification,
    COUNT(*) AS [Jumlah Film Berdasarkan Sertifikasi Umur]
FROM Apple_tv
GROUP BY age_certification;

Analisis Berdasarkan Production Countries:
Buat peta panas atau grafik batang untuk menunjukkan IMDb score berdasarkan negara produksi.
Pertanyaan Terkait Serial TV Fraggle Rock:
Buat grafik batang untuk menunjukkan rata-rata IMDb score untuk setiap season Fraggle Rock.