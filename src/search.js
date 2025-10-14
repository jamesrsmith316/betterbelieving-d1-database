export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const q = url.searchParams.get("q") || "";

    // Simple SQL search query
    const stmt = env.DB.prepare(
      "SELECT id, name, slug, category FROM article WHERE name LIKE ? OR keywords LIKE ? LIMIT 20"
    ).bind(`%${q}%`, `%${q}%`);

    const results = await stmt.all();

    return new Response(JSON.stringify(results.results), {
      headers: { "Content-Type": "application/json" },
    });
  },
};
