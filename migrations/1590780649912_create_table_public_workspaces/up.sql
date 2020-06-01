CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."workspaces"("_id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "_owner" uuid NOT NULL, PRIMARY KEY ("_id") , UNIQUE ("_id")); COMMENT ON TABLE "public"."workspaces" IS E'Add workspaces table';
