BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "landlords" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "firstName" text NOT NULL,
    "lastName" text NOT NULL
);


--
-- MIGRATION VERSION FOR ratemylandlord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ratemylandlord', '20251208044152126', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208044152126', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
