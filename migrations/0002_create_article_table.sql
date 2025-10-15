-- Migration number: 0002 	 2025-07-06T22:04:18.794Z
-- npx wrangler d1 execute example-db --remote --file=0002_create_article_table.sql
-- npx wrangler d1 execute betterbelieving-d1 --remote --command "SELECT id,name,slug,category FROM article ORDER BY name;"
CREATE TABLE IF NOT EXISTS [article] (
  id INTEGER PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  "slug" text, 
  "keywords" text, 
  "content" blob, 
  "category" text
)
