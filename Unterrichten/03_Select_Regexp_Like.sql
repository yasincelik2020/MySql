/* ====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern(kalip) ile query için REGEXP_LIKE komut kullanilir..  
     -- 'c' => case-sensitive demektir
     -- 'i' => incase-sensitive demektir ve default olarak incase-sensitive aktiftir..
    Syntax      REGEXP_LIKE(sutun_adı, 'pattern[] ', 'c' )
           
========================================================================== */
CREATE TABLE kelimeler
(
id int UNIQUE, -- unique-> id sütununda ayni id'de iki tane data olamaz.
kelime VARCHAR(50) NOT NULL, -- Not Null-> kelime sütunu null olamaz, data girilmek zorunda.
harf_sayisi int
);
   
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'abdi', 4);
    INSERT INTO kelimeler VALUES (1007, 'harika', 5);
    INSERT INTO kelimeler VALUES (1008, 'suzan', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    INSERT INTO kelimeler VALUES (1016, 'adem', 5);
    INSERT INTO kelimeler VALUES (1017, 'selim', 5);
    -- INSERT INTO kelimeler (id,harf_sayisi) (1017, 5); -- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1017, 5)' at line 1

    -- insert into kelimeler values (1015,'Yasin', 5); -- Error Code: 1062. Duplicate entry '1015' for key 'kelimeler.id'

select * from kelimeler;

-- Task12-> İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat ederek listeleyen query create ediniz.
select * from kelimeler where regexp_like (kelime,'ot|at', 'c');

-- Task13->  'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harf duyarsiz listeleyen query create ediniz.
select * from kelimeler where regexp_like (kelime,'^ho|^hi', 'i'); -- ^ bu isaret baslayan anlamina geliyor.
select * from kelimeler where regexp_like (kelime,'^ho|^hi');

-- Task14->  Sonu 't' veya 'm' ile bitenleri büyük-küçük harf duyarsiz listeleyen query create ediniz.
select * from kelimeler where regexp_like (kelime,'t$|m$'); -- $ isareti biten anlamina geliyor.

-- Task15->  h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyen query create ediniz.
select * from kelimeler where regexp_like (kelime, 'h[a-zA-Z]t','c'); -- h9t gelmez (gelmesini istedigimiz karakterleri koseli parantez icine yazariz.)
select * from kelimeler where regexp_like (kelime, 'h[a-zA-Z0-9]t','c'); -- 
select * from kelimeler where kelime like ('h_t'); -- 
/* SELECT *
FROM kelimeler
WHERE LENGTH(kelime) = 3
AND LOWER(kelime) LIKE 'h%t'; */

-- Task15.5->  h ile başlayıp t ile biten 4 harfli kelimeleri (h ile t küçük harfli olanlari) l listeleyen query create ediniz
select * from kelimeler where regexp_like (kelime, 'h[a-zA-Z0-9][a-zA-Z0-9]t','c'); -- her bir karakter icin bir adet koseli parantez kullaniyoruz.

-- Task16->  İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini listeleyen query create ediniz.
select * from kelimeler where regexp_like (kelime, 'h[a|i]t');
select * from kelimeler where regexp_like (kelime, 'h[ai]t'); -- [] icine birden cok karakter girerse veya

-- Task17->  a veya s ile başlayan kelimelerin tüm bilgilerini listeleyen query create ediniz.
select * from kelimeler where regexp_like (kelime, '^a|^s');
select * from kelimeler where regexp_like (kelime, '^[as]');

-- Task18->  a ile baslayan ve i ile biten kelimelerin tüm bilgilerini listeleyen query create ediniz.
select * from kelimeler where regexp_like(kelime, '^a') and regexp_like(kelime, 'i$');

-- Task19->  içerisinde en az 4 adet oooo barındıran kelimelerin tüm bilgilerini listeleyen query create ediniz.
select * from kelimeler where regexp_like (kelime,'[o]{4}');

-- Task20->  ilk harfi s veya b , 3. harfi l olan ve 5 harfli olan kelimelerin küçük harf duyarli listeleyen query create ediniz.
select * from kelimeler where LENGTH(kelime) = 5 and REGEXP_LIKE(kelime, '^[sb].l..$', 'c');
select * from kelimeler where regexp_like (kelime,'[sb][a-zA-Z0-9]l[a-zA-Z0-9][a-zA-Z0-9]','c');
select * from kelimeler where regexp_like (kelime,'[sb][a-z0-9]l[a-z0-9][a-z0-9]');
