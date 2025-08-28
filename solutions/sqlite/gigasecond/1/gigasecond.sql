-- Schema: CREATE TABLE "gigasecond" ("moment" TEXT, "result" TEXT);
-- Task: update the gigasecond table and set the result based on the moment.

CREATE TABLE IF NOT EXISTS gigasecond(
    moment TEXT,
    result TEXT
);

.mode csv
.import data.csv gigasecond

UPDATE gigasecond
SET result = strftime('%Y-%m-%dT%H:%M:%S',strftime('%s', replace(moment, 'T', ' '))+1000000000,'unixepoch');