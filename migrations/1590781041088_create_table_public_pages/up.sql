CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."pages"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "title" text NOT NULL, "workspace_id" uuid NOT NULL, "snapshot" jsonb, "link_enabled" bool NOT NULL DEFAULT false, "creator_id" uuid NOT NULL, "updated_at" timestamptz NOT NULL DEFAULT now(), "created_at" timestamptz NOT NULL DEFAULT now(), "deleted" bool NOT NULL DEFAULT false, PRIMARY KEY ("id") , FOREIGN KEY ("workspace_id") REFERENCES "public"."workspaces"("_id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_pages_updated_at"
BEFORE UPDATE ON "public"."pages"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_pages_updated_at" ON "public"."pages" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
