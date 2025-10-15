import { renderHtml } from "./renderHtml";

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname;

    if (path === "/search") {
      const q = url.searchParams.get("q") || "";

      const words = q.trim().split(/\s+/); // Split by spaces into individual words

      //try exact match of the phrase first
      const stmt = env.DB.prepare(
        "SELECT id, name, slug, category FROM article WHERE name LIKE ? OR keywords LIKE ? ORDER BY NAME LIMIT 50"
      ).bind(`%${q}%`, `%${q}%`);

      let {results} = await stmt.all();

      //if no results found, try splitting on space and look up all words individually
      if (!results || results.length === 0) {
        // Build dynamic WHERE clause
        const conditions = words.map(() => "(name LIKE ? OR keywords LIKE ?)").join(" AND ");
        const sql = `SELECT id, name, slug, category FROM article WHERE ${conditions} ORDER BY name LIMIT 50`;

        // Bind each word twice (for name and keywords)
        const bindings = words.flatMap(word => [`%${word}%`, `%${word}%`]);

        const stmt = env.DB.prepare(sql).bind(...bindings);
        {results} = await stmt.all();

      }

      return new Response(JSON.stringify(results), {
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      });
    }

    const stmt = env.DB.prepare("SELECT * FROM comments LIMIT 3");
    const { results } = await stmt.all();

    return new Response(renderHtml(JSON.stringify(results, null, 2)), {
      headers: {
        "content-type": "text/html",
      },
    });
  },
} satisfies ExportedHandler<Env>;
