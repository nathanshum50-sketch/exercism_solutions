-- Schema: CREATE TABLE "difference-of-squares" ("number" INT", property" TEXT, "result" INT);
-- Task: update the difference-of-squares table and set the result based on the number and property fields.

CREATE TABLE IF NOT EXISTS "difference-of-squares"(
    number INT,
    property TEXT,
    result INT
);

.mode csv
.import data.csv "difference-of-squares"


UPDATE "difference-of-squares"
SET result = CASE
    WHEN property = 'squareOfSum' THEN number*number*(number+1)*(number+1)/4
    WHEN property = 'sumOfSquares' THEN number*(number+1)*(2*number+1)/6
    WHEN property = 'differenceOfSquares' THEN (
        SELECT result FROM "difference-of-squares" AS d1
        WHERE d1.number = "difference-of-squares".number AND d1.property = 'squareOfSum'
    ) - (
        SELECT result FROM "difference-of-squares" AS d2
        WHERE d2.number = "difference-of-squares".number AND d2.property = 'sumOfSquares'
    )
END;