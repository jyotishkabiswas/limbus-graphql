DROP TRIGGER IF EXISTS "set_public_workspaces_updated_at" ON "public"."workspaces";
ALTER TABLE "public"."workspaces" DROP COLUMN "updated_at";
