-- Schema: CREATE TABLE "rna-transcription" ("dna" TEXT, "result" TEXT);
-- Task: update the rna-transcription table and set the result based on the dna field.

CREATE TABLE IF NOT EXISTS "rna-transcription"(
    dna TEXT,
    result TEXT
);

.mode csv
.import data.csv "rna-transcription"

UPDATE "rna-transcription"
SET result =
    replace(
        replace(
            replace(
                replace(
                    replace(
                        dna,'A','U'
                    ),'T','A'
                ),'C','D'
            ),'G','C'
        ),'D','G'
    );