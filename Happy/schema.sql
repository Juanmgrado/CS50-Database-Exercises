
CREATE TABLE "Users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Educational_institutions"(
    "id" INTEGER,
    "name_school" TEXT NOT NULL UNIQUE,
    "type_school" TEXT NOT NULL CHECK (
        "type_school" IN (
            'Elementary School',
            'Middle School',
            'High School',
            'Lower School',
            'Upper School',
            'College',
            'University'
            )),
    "founded_year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Companies"(
    "id" INTEGER,
    "name_company" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL CHECK (
        "industry" IN (
            'education',
            'technology',
            'finance'
        )),
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Connections" (
    "user_id_1" INTEGER,
    "user_id_2" INTEGER,
    PRIMARY KEY ("user_id_1", "user_id_2"),
    FOREIGN KEY ("user_id_1") REFERENCES "Users"("id"),
    FOREIGN KEY ("user_id_2") REFERENCES "Users"("id"),
    CHECK ("user_id_1" < "user_id_2")
);


CREATE TABLE "Affiliations" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "degree_type" TEXT,
    FOREIGN KEY ("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "Educational_institutions"("id")
);

CREATE TABLE "Employment_affiliations" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "job_title" TEXT NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "Companies"("id")
);
