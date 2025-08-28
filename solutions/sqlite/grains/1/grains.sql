-- Schema: CREATE TABLE "grains" ("task" TEXT, "square" INT, "result" INT);
-- Task: update the grains table and set the result based on the task (and square fields).

CREATE TABLE IF NOT EXISTS "grains"(
    task TEXT,
    square INT,
    result INT
);

UPDATE "grains"
SET result = case
    WHEN task = "single-square" THEN POWER(2,square-1)
    ELSE POWER(2,64)-1
END;