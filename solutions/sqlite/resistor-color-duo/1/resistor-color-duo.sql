-- Schema: CREATE TABLE "color_code" ("color1" TEXT, "color2" TEXT, "result" INT);
-- Task: update the color_code table and set the result based on the two colors.

CREATE TABLE IF NOT EXISTS "color_code"(
    color1 TEXT,
    color2 TEXT,
    result INT
);

.mode csv
.import data.csv color_code

CREATE TABLE code(
    color TEXT,
    result INT
);

INSERT INTO code(color,result) VALUES
("black",0),
("brown",1),
("red",2),
("orange",3),
("yellow",4),
("green",5),
("blue",6),
("violet",7),
("grey",8),
("white",9);

UPDATE color_code
SET result = (
    SELECT result FROM code WHERE color == color_code.color1
)*10 + (
    SELECT result FROM code WHERE color == color_code.color2
);