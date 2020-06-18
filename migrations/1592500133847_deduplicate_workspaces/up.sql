-- move pages into first workspace --
WITH RECURSIVE workspace_pairs as (
    SELECT a.id as to_id, b.id as from_id
    FROM workspaces a
    JOIN workspaces b
    ON (
        a.created_at < b.created_at
        AND a.owner_id = b.owner_id
        AND a.name = b.name
    )
)
UPDATE
    pages
SET workspace_id = workspace_pairs.to_id
FROM workspace_pairs
WHERE pages.workspace_id = workspace_pairs.from_id;

UPDATE workspaces a
SET deleted = true
FROM
    workspaces b
WHERE
    a.created_at > b.created_at
    AND a.owner_id = b.owner_id
    AND a.name = b.name;
