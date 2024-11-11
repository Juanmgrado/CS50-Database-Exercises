CREATE TABLE "CheckIns"(
    "id" INTEGER,
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "destination" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK( "age" > 0 ),
    PRIMARY KEY("id")
);

CREATE TABLE "Airline"(
    "id" INTEGER,
    "airline_name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Flights"(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_operator_id" INTEGER NOT NULL,
    "code_airport_departure" TEXT NOT NULL,
    "code_airport_destination" TEXT NOT NULL,
    "departure_time"  NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("airline_operator_id") REFERENCES "Airline"("id")
);