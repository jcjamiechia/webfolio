# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal portfolio website for Jamie Chia, built with Flutter for Web. Deployed to GitHub Pages via the `docs/` directory. The site showcases academic projects, work experience, and contact information.

## Build & Deploy

```bash
# Run locally (web only — uses dart:html)
flutter run -d chrome

# Build for production (outputs to docs/ for GitHub Pages)
flutter build web --release --base-href "/" && cp -r build/web/* docs/
```

No tests exist. The project uses `flutter_lints` for static analysis:
```bash
flutter analyze
```

## Architecture

This is a **web-only** Flutter app — it uses `dart:html` and `dart:ui_web` directly for iframes (YouTube embeds, Google Drive document embeds) and `window.open` for external links. It will not compile for mobile/desktop targets.

Three Dart files make up the entire app:

- **`lib/main.dart`** — Single-page layout with scroll-based navigation. Contains the `PortfolioPage` widget with all section builders (`_buildWelcomeSection`, `_buildAboutSection`, `_buildProjectsSection`, `_buildExperienceSection`, `_buildFooterSection`). Project data is defined inline as a `List<ProjectData>` in `_PortfolioPageState`.
- **`lib/components.dart`** — All reusable widgets: `ProjectCard` (with dialog detail view), `FadeInUp` (scroll-triggered animation), `HoverLift`, `NavButton`, `ExperienceItem`, `YouTubeEmbed`, `WebEmbedFrame`, `SocialItem`, `EmailButton`. Also defines `ProjectData` model and spacing/radius constants.
- **`lib/theme.dart`** — Centralized design tokens: `AppColors` (dark navy + gold palette), `AppTextStyles` (PlayfairDisplay headings, Inter body), `AppButtonStyles`.

## Key Patterns

- **Adding a project**: Add a new `ProjectData` entry to the `_projects` list in `main.dart` and register any new image assets in `pubspec.yaml` under `flutter.assets`.
- **Adding an experience**: Add a new `ExperienceItem` widget in `_buildExperienceSection()` in `main.dart`.
- **Responsive layout**: Sections use `LayoutBuilder` with an ~850px breakpoint to switch between row (desktop) and column (mobile) layouts.
- **Scroll animations**: `FadeInUp` widget uses `VisibilityDetector` to trigger fade+slide animations when elements enter the viewport.
- **Custom fonts**: PlayfairDisplay and Inter, loaded from `lib/assets/fonts/`.
