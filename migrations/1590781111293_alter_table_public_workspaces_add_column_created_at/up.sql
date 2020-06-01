ALTER TABLE "public"."workspaces" ADD COLUMN "created_at" timestamptz NOT NULL DEFAULT now();
