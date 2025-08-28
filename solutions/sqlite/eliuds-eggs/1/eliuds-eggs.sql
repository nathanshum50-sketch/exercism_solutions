-- Schema: CREATE TABLE "eliuds-eggs" ("number" INT, "result" INT);
-- Task: update the eliuds-eggs table and set the result based on the number field.

CREATE TABLE IF NOT EXISTS "eliuds-eggs"(
    number INT,
    result INT
);

.mode csv
.import data.csv "eliuds-eggs"

WITH RECURSIVE bit_positions(i) AS (
    SELECT 0
    UNION ALL
    SELECT i+1 FROM bit_positions WHERE i <= floor(log10((SELECT max(number) FROM "eliuds-eggs"))/log10(2))
)

UPDATE "eliuds-eggs" SET result = CASE
    WHEN number = 0 THEN 0
    ELSE (
        SELECT SUM(number & (1 << i) != 0)
        FROM bit_positions
        WHERE number >= (1 << i)
    )
END;