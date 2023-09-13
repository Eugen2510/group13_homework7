
SELECT
    r.name AS "ПІБ власника",
    r.email AS "Електронна пошта",
    b.num_of_flat AS "Номер квартири",
    b.adress AS "Адреса будинку",
    f.apartment_number AS "Номер квартири",
    f.area AS "Площа квартири"
FROM
    homework7.resident r
JOIN
    homework7.flat_owner fo ON r.id = fo.resident_id
JOIN
    homework7.flat f ON r.flat_id = f.id
JOIN
    homework7.building b ON r.building_id = b.id
WHERE
    r.parking_right = 0
    AND r.ownership = 1
    AND (SELECT COUNT(*) FROM homework7.flat_owner fo2 WHERE fo2.resident_id = r.id) < 2;