# ZoThawnthu — a story site you can run from your phone

No login for readers. Only you can post, using the same sign-in you already made for reel. Customizable categories — just type any category name when posting (Horror, Romance, Fantasy, whatever you want), and readers can filter by tapping category tabs at the top.

## Are you reusing your existing Supabase project (from reel)?

**Yes (recommended, faster):**
1. Open your existing Supabase project.
2. Go to SQL Editor → New query → open `schema.sql` from this folder, copy all of it, paste, tap Run.
3. Open `config.js` and paste in the SAME Project URL and anon key you already used for reel.
4. Skip straight to Part 2 (GitHub) below. No new bucket, no new admin login needed — same one works here.

**No, starting fresh:**
Follow the full Supabase setup you did for reel first (new project → run `schema.sql` → Authentication → Users → Add user for your login), then come back here for Part 2. You won't need a Storage bucket this time — stories are just text, stored in the database.

## Part 2 — put the site on GitHub

1. Go to github.com, tap the **+** icon → New repository. Name it e.g. `zothawnthu-site`. Create it.
2. On the repo page, tap **Add file → Upload files**.
3. Select every file in this folder (`index.html`, `story.html`, `admin.html`, `style.css`, `client.js`, `config.js`, `schema.sql`, `README.md`) and upload them.
4. If you haven't filled in `config.js` yet, tap it in the repo, tap the pencil to edit, paste your Supabase URL and key, commit.

## Part 3 — deploy on Netlify

1. Go to netlify.com (sign in with the same GitHub account if you already have one).
2. Tap **Add new site → Import an existing project** → **GitHub** → authorize if asked.
3. Pick the `zothawnthu-site` repo.
4. Leave build settings blank → Deploy.
5. Wait a minute — you'll get a live link like `https://something.netlify.app`.
6. Optional: in that project's settings, change the site name to `zothawnthu` so your link becomes `zothawnthu.netlify.app`.

## Using it

- Share the homepage link with anyone — they read, like, and comment, no login.
- Go to `/admin.html` yourself, sign in, write a story, type any category name, tap publish.
- The category tabs on the homepage update automatically based on whatever categories you've used — no separate setup needed.
- Never share the `/admin.html` link.

## Limits worth knowing

- Comments have no moderation — anything posted shows up immediately.
- Likes are tracked by a random ID in the visitor's browser, not a real account — a soft limit, not airtight.
- There's no rich text formatting (bold, italics, images) — stories are plain text, with line breaks preserved.
