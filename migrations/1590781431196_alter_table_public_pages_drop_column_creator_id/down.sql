ALTER TABLE "public"."pages" ADD COLUMN "creator_id" uuid;
ALTER TABLE "public"."pages" ALTER COLUMN "creator_id" DROP NOT NULL;
