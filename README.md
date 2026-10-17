# Loïc Chagnoleau — Resume and portfolio

A one-page resume and a detailed portfolio, written in [Typst](https://typst.app) with a shared look ported from the original LaTeX CV: two-tone name, photo banner, dark section bars and a dark sidebar.

**Latest PDFs:** [Releases → latest](../../releases/tag/latest)

## Layout

- `common/theme.typ` — shared colors, fonts, section bars, photo banner, contact icons and personal details (name, headline, contacts)
- `resume/cv.typ` — resume content; `resume/template.typ` — two-column one-page layout
- `portfolio/portfolio.typ` — portfolio content; `portfolio/template.typ` — multi-page layout (skills table, experiences with context, missions and technical environment)
- `assets/me.jpg` — profile photo used by both documents
- `mise.toml` — pinned Typst version, font environment and tasks
- `scripts/fetch-fonts.sh` — downloads TeX Gyre Heros and Font Awesome 7 into `fonts/`

## Build locally

Requires [mise](https://mise.jdx.dev), `curl` and `unzip`.

```sh
mise install                # install the pinned Typst version
mise run build              # build both PDFs into dist/
mise run build:resume       # or just one of them
mise run build:portfolio
mise run watch:resume       # rebuild on every change
mise run watch:portfolio
mise run check              # fail if the resume no longer fits on one page
```

## CI

`.github/workflows/build.yml` builds both documents with the same mise tasks on every push and pull request, checks the resume fits on one page, and uploads the PDFs as a workflow artifact.

- Push to `main`: updates the rolling `latest` release.
- Push a `v*` tag (e.g. `git tag v2026.10 && git push --tags`): creates a versioned release.
