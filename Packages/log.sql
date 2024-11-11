-- *** The Lost Letter ***

-- First, I need to find the ID of Anneke's address, so I'll search in the addresses table
-- using the specific address she mentioned: "900 Somerville Avenue".
SELECT id FROM addresses WHERE address = '900 Somerville Avenue';

-- Now that I have the ID of the source address, it’s time to find the package that was sent from there.
-- I’ll look in the packages table using the address ID I just found.
SELECT id FROM packages WHERE from_address_id = 432;

-- With the package ID, I can query the scans to see what has happened to the package.
-- I want to know all the scans related to the package, so I’ll search in the scans table.
SELECT * FROM scans WHERE package_id = 384;

-- Finally, I need to check where the package was delivered.
-- With the scan ID, I’ll look for the delivery address in the packages table.
-- This will allow me to confirm if the package has arrived at Varsha's address: "2 Finnegan Street".
SELECT * FROM packages WHERE id = 854;



-- *** The Devious Delivery ***

-- Step 1: I want to find any packages that contain something related to "duck" in their contents.
-- I'll search in the `packages` table to locate relevant packages.
SELECT * FROM packages WHERE contents LIKE '%duck%';

-- Step 2: After finding the relevant package in the first query, I now want to see its scan history.
-- I'll join the `scans` table with the `packages` table to find out where the package with ID 5098 was scanned.
SELECT * FROM scans JOIN packages ON scans.package_id = packages.id WHERE packages.id = 5098;

-- Step 3: From the previous query, I found the address where the package was dropped.
-- Now, I want to find the full details of that address in the `addresses` table using the `address_id` 348.
SELECT * FROM addresses WHERE id = 348;



-- *** The Forgotten Gift ***

-- Step 1: I need to find the package that was sent from "109 Tileston Street".
-- First, I will look for the packages that match this address in the from_address_id column.
-- However, I will use a subquery to find the package_id from the scans table.
-- This will help me check if the package has been scanned at all.
SELECT *
FROM scans
WHERE package_id = (
    SELECT id
    FROM packages
    WHERE from_address_id = (
        SELECT id
        FROM addresses
        WHERE address LIKE '%109 Tileston Street%'
    )
);

-- Step 2: Now that I have the package_id from the previous query,
-- I will run a query on the packages table to find out what the package contained.
SELECT contents FROM packages WHERE id = 9523;

-- Step 3: Now, using the driver_id from the scans table,
-- I want to find out who currently has the package.
-- I will query the drivers table to get the driver's name based on the driver_id
-- and see if the package was picked up or dropped off.
SELECT name FROM drivers WHERE id = 17;
