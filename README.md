# Loïc Chagnoleau — Resume

One-page CV written in [Typst](https://typst.app), with a two-column layout (dark sidebar on the right) ported from the original LaTeX version.

**Latest PDF:** [Releases → latest](../../releases/tag/latest)

## Layout

- `cv.typ` — the content: header, sidebar, experience and education
- `template.typ` — layout and styling (`cv`, `cv-section`, `cv-event`, `cv-exp`, `cv-education`, `meta-section`, `side-item`, `contact`)
- `assets/me.jpg` — profile photo, cropped by `cropped-image` in `cv.typ`
- `mise.toml` — pinned Typst version, font environment and tasks
- `scripts/fetch-fonts.sh` — downloads TeX Gyre Heros and Font Awesome 7 into `fonts/`

## Build locally

Requires [mise](https://mise.jdx.dev), `curl` and `unzip`.

```sh
mise install     # install the pinned Typst version
mise run build   # fetch fonts if needed, then build cv.pdf
mise run watch   # rebuild on every change
mise run check   # fail if the CV no longer fits on one page
```

## CI

`.github/workflows/build.yml` compiles the CV with the same mise tasks on every push and pull request, checks it fits on one page, and uploads the PDF as a workflow artifact.

- Push to `main`: updates the rolling `latest` release.
- Push a `v*` tag (e.g. `git tag v2026.10 && git push --tags`): creates a versioned release.
