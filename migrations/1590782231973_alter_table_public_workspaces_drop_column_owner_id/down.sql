ALTER TABLE "public"."workspaces" ADD COLUMN "owner_id" int4;
ALTER TABLE "public"."workspaces" ALTER COLUMN "owner_id" DROP NOT NULL;
