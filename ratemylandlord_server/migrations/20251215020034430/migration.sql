BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "landlords" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "landlords" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "addedByUserId" uuid NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "reviews" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "landlordId" uuid NOT NULL,
    "tenantId" uuid NOT NULL,
    "rating" bigint NOT NULL,
    "comment" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tenants" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "email" text NOT NULL
);


--
-- MIGRATION VERSION FOR ratemylandlord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ratemylandlord', '20251215020034430', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251215020034430', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
