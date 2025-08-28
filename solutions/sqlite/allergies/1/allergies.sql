-- Schema: CREATE TABLE "allergies" ("task" TEXT, "item" TEXT, "score" INT NOT NULL, "result" TEXT);
-- Task: update the bob allergies and set the result based on the task.
--       - The `allergicTo` task expects `true` or `false` based on the `score` and the `item` fields.
--       - For the `list` task you have to write corresponding items to the result field

CREATE TABLE IF NOT EXISTS allergies(
    task TEXT,
    item TEXT,
    score INT NOT NULL,
    result TEXT
);

.mode csv
.import data.csv allergies

UPDATE allergies
SET result = CASE
    WHEN task = "list" THEN
        (
            SELECT CASE
                WHEN COUNT(item) > 0 THEN GROUP_CONCAT(item, ', ')
                ELSE ''
            END
            FROM (
                SELECT 'eggs' AS item WHERE (score & 1) = 1
                UNION ALL SELECT 'peanuts' WHERE (score >> 1) & 1 = 1
                UNION ALL SELECT 'shellfish' WHERE (score >> 2) & 1 = 1
                UNION ALL SELECT 'strawberries' WHERE (score >> 3) & 1 = 1
                UNION ALL SELECT 'tomatoes' WHERE (score >> 4) & 1 = 1
                UNION ALL SELECT 'chocolate' WHERE (score >> 5) & 1 = 1
                UNION ALL SELECT 'pollen' WHERE (score >> 6) & 1 = 1
                UNION ALL SELECT 'cats' WHERE (score >> 7) & 1 = 1
            )
        )
    ELSE
        CASE
            WHEN (SELECT CASE
                WHEN item = 'eggs' THEN (score & 1)
                WHEN item = 'peanuts' THEN (score >> 1) & 1
                WHEN item = 'shellfish' THEN (score >> 2) & 1
                WHEN item = 'strawberries' THEN (score >> 3) & 1
                WHEN item = 'tomatoes' THEN (score >> 4) & 1
                WHEN item = 'chocolate' THEN (score >> 5) & 1
                WHEN item = 'pollen' THEN (score >> 6) & 1
                WHEN item = 'cats' THEN (score >> 7) & 1
                ELSE 0
            END) = 1 THEN 'true'
            ELSE 'false'
        END
END;

UPDATE allergies
SET result = '''' WHERE result == NULL;