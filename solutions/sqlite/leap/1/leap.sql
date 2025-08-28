-- Schema: CREATE TABLE "leap" ( "year" INT, "is_leap" BOOL);
-- Task: update the leap table and set the is_leap based on the year field.

CREATE TABLE IF NOT EXISTS "leap"(
    "year" INT,
    "is_leap" BOOL
);

.mode csv
.import ./data.csv "leap"

UPDATE "leap"
SET "is_leap" = TRUE
WHERE MOD("year",4) = 0 AND NOT MOD("year",100) = 0 OR MOD("year",400) = 0;

