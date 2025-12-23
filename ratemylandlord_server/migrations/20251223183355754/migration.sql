BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "properties" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "apn" text NOT NULL
);


--
-- MIGRATION VERSION FOR ratemylandlord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ratemylandlord', '20251223183355754', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251223183355754', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();


COMMIT;
