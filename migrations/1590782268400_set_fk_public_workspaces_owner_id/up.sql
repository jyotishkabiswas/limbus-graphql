alter table "public"."workspaces"
           add constraint "workspaces_owner_id_fkey"
           foreign key ("owner_id")
           references "public"."users"
           ("id") on update restrict on delete restrict;
