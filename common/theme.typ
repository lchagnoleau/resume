// Shared look for the resume and the portfolio: colors, fonts, section bars,
// photo banner and contact icons, ported from the original LaTeX CV.

#import "@preview/fontawesome:0.6.2": fa-icon

// Colors
#let complcol = rgb("#2F65FF") // accent
#let bgcol = rgb("#747474") // grey
#let sectcol = rgb("#272727") // dark sidebar and section bars
#let sidecol = rgb("#C8C8C8") // muted text on dark backgrounds
#let rulecol = rgb("#D9D9D9") // light separators

// Font sizes (LaTeX 10pt class equivalents)
#let scriptsize = 7pt
#let footnotesize = 8pt
#let small = 9pt
#let large = 12pt

// Base typography, applied with `#show: theme-base`
#let theme-base(body) = {
  set text(font: "TeX Gyre Heros", size: 10pt, lang: "en")
  set par(leading: 0.55em, spacing: 0.55em)
  body
}

// Chevron used in section bars and in the summary box
#let arrow(fill, size: 0.58cm) = box(
  baseline: -0.05em,
  polygon(
    fill: fill,
    (0 * size, 0.4 * size),
    (0.2 * size, 0.4 * size),
    (0.3 * size, 0.2 * size),
    (0.2 * size, 0 * size),
    (0 * size, 0 * size),
    (0.1 * size, 0.2 * size),
  ),
)

#let arrows(fill, n: 3) = for _ in range(n) { arrow(fill) + h(-0.06cm) }

// Dark full-width bar with arrows and an uppercase title
#let section-bar(title, above: 8pt, below: 4pt) = block(
  width: 100%,
  fill: sectcol,
  inset: (x: 4pt, y: 3pt),
  above: above,
  below: below,
  sticky: true,
  {
    arrows(bgcol)
    h(4pt)
    text(fill: white, weight: "bold", upper(title))
  },
)

// Icon followed by a (possibly linked) label
#let contact(icon, body, link-to: none, fill: white, size: small) = {
  box(width: 1.2em, align(center, text(size: size, fill: fill, fa-icon(icon))))
  h(0.3em)
  let content = text(size: size, fill: fill, body)
  if link-to == none { content } else { link(link-to, content) }
}

// Crop an image like LaTeX's `\includegraphics[trim=l b r t, clip]` and scale
// it to the available width. `data` is the raw image (`read(path, encoding: none)`),
// `size` its natural (width, height) and `trim` the (left, bottom, right, top)
// amounts, all in pixels.
#let cropped-image(data, size: (0, 0), trim: (0, 0, 0, 0)) = layout(avail => {
  let (w, h) = size
  let (l, b, r, t) = trim
  let s = avail.width / (w - l - r)
  box(
    width: avail.width,
    height: (h - t - b) * s,
    clip: true,
    place(top + left, dx: -l * s, dy: -t * s, image(data, width: w * s, height: h * s)),
  )
})

// Name in two tones, as in the LaTeX title
#let name-title(first-name, last-name) = align(center, text(size: 28pt, {
  text(fill: bgcol, first-name)
  h(0.3em)
  text(fill: sectcol, last-name)
}))

// Photo with the semi-transparent summary box overlaid on its right side
#let photo-banner(photo, headline, summary) = block(width: 100%, {
  photo
  place(right + bottom, dx: -6pt, dy: -14pt, block(
    width: 52%,
    fill: bgcol.transparentize(15%),
    inset: 8pt,
    align(center, {
      set par(leading: 0.45em)
      arrows(white, n: 2)
      h(4pt)
      text(fill: white, weight: "bold", headline)
      linebreak()
      text(fill: white, size: small, summary)
    }),
  ))
})

// Shared personal data
#let me = (
  first-name: "Loïc",
  last-name: "Chagnoleau",
  headline: [Senior Embedded Software Engineer],
  summary: [12 years taking embedded software from source code to reliable devices in the field: secure boot, OTA updates, CI/CD and HIL testing.],
  contacts: (
    ("location-dot", [Toulouse, France], none),
    ("paper-plane", [lchagnoleau\@pm.me], "mailto:lchagnoleau@pm.me"),
    ("globe", [lchagnoleau.dev], "https://lchagnoleau.dev"),
    ("linkedin", [in/loïc-chagnoleau], "https://www.linkedin.com/in/lo%C3%AFc-chagnoleau-899b13b7"),
    ("github", [github.com/lchagnoleau], "https://github.com/lchagnoleau"),
  ),
)

#let my-photo = cropped-image(
  read("../assets/me.jpg", encoding: none),
  size: (1119, 689),
  trim: (350, 150, 10, 200),
)
