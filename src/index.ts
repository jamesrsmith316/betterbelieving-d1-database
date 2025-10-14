import { renderHtml } from "./renderHtml";

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname;

    if (path === "/search") {
      const q = url.searchParams.get("q") || "";

      const stmt = env.DB.prepare(
        "SELECT id, name, slug, category FROM article WHERE name LIKE ? OR keywords LIKE ? LIMIT 20"
      ).bind(`%${q}%`, `%${q}%`);

      const results = await stmt.all();

      return new Response(JSON.stringify(results.results), {
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
