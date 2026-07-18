export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    const target = new URL(url.pathname + url.search, 'https://aura-luxe.pages.dev');
    const proxied = new Request(target.toString(), {
      method: request.method,
      headers: request.headers,
      body: request.method !== 'GET' && request.method !== 'HEAD' ? request.body : undefined,
      redirect: 'follow',
    });
    return fetch(proxied);
  }
};
