# HTML Migration Plan

A plan for rewriting this Flutter Web portfolio as a static HTML/CSS/JS site, for
when we decide to do it. Captured 2026-06-19.

## Why migrate (the actual wins)

- **Native-smooth scroll & animation** — the browser does parallax, smooth scroll,
  and fades for free in CSS. No canvas renderer to fight. (Note: the debug-mode
  lag that prompted this is *not* present in the deployed release build — verify
  perf with `flutter build web --release`, not `flutter run`, before assuming a
  rewrite is required for speed.)
- **Load size** — Flutter web ships a large engine (CanvasKit ~1.5MB+ wasm). A
  static site is a fraction of that.
- **SEO & accessibility** — Flutter renders to canvas, so text isn't real DOM:
  poor for search engines, screen readers, and text selection. For a portfolio
  recruiters should find and read, this is the biggest reason to switch.

## Recommended stack

**Astro** (recommended) — component-based, ships zero JS by default, trivial
GitHub Pages deploy, easy to add a project by editing a data file. Alternative:
**vanilla HTML/CSS/JS** (one `index.html` + `style.css` + small `main.js`) if you
want zero build tooling.

## Content to port (inventory)

Sections (from `lib/main.dart`): Welcome/hero, About, Projects (with tag filter:
All/Hardware/Software/Data/Design), Experience, Leadership, Footer/contact.

Projects data lives inline in `_projects` (List<ProjectData>) — move this to a
JSON/JS data file (`projects.json`). Each project: title, summary, subtitle,
company/module, strategies, timeline, toolsUsed, tags, fullDescription,
highlights, galleryImages, productViews (label/image/caption), youtubeVideoId,
documentEmbedUrls + documentTitles, imagePath.

Detail pages: currently a pushed route per project. In HTML, either one
`project.html?id=...` template or one page per project generated from the data
file (Astro does this with dynamic routes).

Assets: everything in `lib/assets/` (images + the PlayfairDisplay/Inter fonts).
Reuse the rendered `vrptw_poster.png` / `vrptw_slide1.png` — no need to re-export.

## Widget → HTML/CSS mapping

| Flutter | HTML/CSS equivalent |
|---|---|
| `FadeInUp` (VisibilityDetector) | IntersectionObserver + CSS transition |
| `ParallaxBox` | CSS `transform: translateY()` on scroll, or `background-attachment` |
| `HoverLift` | `:hover { transform: translateY(-6px) }` + box-shadow |
| Scroll progress bar | scroll listener → set width %, or `animation-timeline: scroll()` |
| Nav active-section + underline | IntersectionObserver on sections; CSS underline |
| `ProductViewer` | thumbnails + JS to swap `<img src>`; `object-fit: contain` |
| `_GalleryWithArrows` | horizontal flex + scroll-snap, or a lightbox lib |
| `WebEmbedFrame` / `YouTubeEmbed` | plain `<iframe>` (Slides/Drive/YouTube embed URLs already work) |
| `theme.dart` tokens | CSS custom properties (`--color-primary: #D4A66A`, etc.) |

The embeds already use standard URLs that work as raw iframes:
- Slides: `https://docs.google.com/presentation/d/<id>/embed`
- Drive file (PDF/video): `https://drive.google.com/file/d/<id>/preview`
- YouTube: `https://www.youtube.com/embed/<id>`

## Theme tokens to carry over (from `lib/theme.dart`)

- primary (gold): `#D4A66A`
- dark navy background palette, nav surface `#1A1714`
- Fonts: PlayfairDisplay (headings), Inter (body)

## Suggested phases

1. Scaffold Astro project + global CSS tokens + fonts; port the static shell
   (nav, hero, footer).
2. Move project data to `projects.json`; build the Projects grid + tag filter.
3. Build the project detail template (metadata, description, product viewer,
   embeds, gallery, highlights).
4. Add scroll polish (IntersectionObserver reveals, parallax, progress bar,
   active-nav).
5. Deploy: Astro static output → `docs/` (keep the same GitHub Pages setup) or
   GitHub Actions. Update `base` to `/webfolio/`.

## Deploy note

Current site deploys via `docs/` with base-href `/webfolio/`. Keep that contract:
Astro `astro.config` → `base: '/webfolio/'`, `outDir: 'docs'` (or copy on build).
