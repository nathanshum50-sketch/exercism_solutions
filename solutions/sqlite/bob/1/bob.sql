-- Schema: CREATE TABLE "bob" ("input" TEXT, "reply" TEXT);
-- Task: update the bob table and set the reply based on the input.

CREATE TABLE IF NOT EXISTS bob(
    input TEXT,
    reply TEXT
);

.mode csv
.import data.csv bob

UPDATE bob
SET reply = CASE
    WHEN upper(input) == input AND lower(input) != input AND SUBSTR(replace(input, " ", ""),-1) == "?" THEN "Calm down, I know what I'm doing!"
    WHEN SUBSTR(replace(input, " ", ""),-1) == "?" THEN "Sure."
    WHEN upper(input) == input AND lower(input) != input THEN "Whoa, chill out!"
    WHEN length(replace(replace(replace(replace(replace(replace(input, " ", ""), char(9), ""), char(10), ""), char(11), ""), char(12), ""), char(13), "")) == 0 THEN "Fine. Be that way!"
    ELSE "Whatever."
END;