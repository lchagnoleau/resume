// Two-column CV layout ported from a LaTeX "Simple Hipster CV" style template:
// a white main column and a dark sidebar on the right.

#import "@preview/fontawesome:0.6.2": fa-icon

// Colors
#let complcol = rgb("#2F65FF") // accent
#let bgcol = rgb("#747474") // grey
#let sectcol = rgb("#272727") // dark sidebar and section bars
#let sidecol = rgb("#C8C8C8") // muted text on the sidebar

// Font sizes (LaTeX 10pt class equivalents)
#let scriptsize = 7pt
#let footnotesize = 8pt
#let small = 9pt
#let large = 12pt

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

// Main column

// Dark full-width bar with arrows and an uppercase title
#let cv-section(title) = block(
  width: 100%,
  fill: sectcol,
  inset: (x: 4pt, y: 3pt),
  above: 8pt,
  below: 4pt,
  {
    arrows(bgcol)
    h(4pt)
    text(fill: white, weight: "bold", upper(title))
  },
)

// Employer headline (company, optional job title, dates) followed by one or
// more `cv-exp`
#let cv-event(date, place, role: none, body) = block(above: 9pt, below: 0pt, {
  grid(
    columns: (1fr, auto),
    column-gutter: 6pt,
    {
      text(fill: complcol, place)
      if role != none {
        text(fill: bgcol, [ · ])
        text(fill: sectcol, weight: "bold", role)
      }
    },
    text(size: small, fill: bgcol, date),
  )
  body
})

// One project or responsibility inside a `cv-event`. For consulting missions,
// `client` and `date` show the client name and mission dates on the title line.
#let cv-exp(title, desc, tech, client: none, date: none) = pad(left: 1em, top: 1.5pt, block(
  spacing: 0pt,
  {
    set par(leading: 0.38em)
    grid(
      columns: (1fr, auto),
      column-gutter: 6pt,
      text(size: footnotesize, {
        if client != none {
          text(fill: complcol, client)
          text(fill: bgcol, [ · ])
        }
        text(weight: "bold", title)
      }),
      if date != none { text(size: scriptsize, fill: bgcol, date) },
    )
    if desc != none {
      text(size: footnotesize, desc)
      linebreak()
    }
    text(size: scriptsize, fill: bgcol, tech)
  },
))

#let cv-education(date, title, school) = block(above: 7pt, grid(
  columns: (58%, 1fr),
  column-gutter: 6pt,
  text(weight: "bold", title),
  align(right, text(fill: complcol, school) + h(0.4em) + text(fill: bgcol, date)),
))

// Sidebar

#let meta-section(title, body) = block(above: 14pt, {
  align(center, {
    text(size: large, fill: white, upper(title))
    v(1pt)
    line(length: 70%, stroke: 0.4pt + white)
  })
  v(2pt)
  body
})

#let side-item(label, items) = block(above: 0pt, below: 7pt, {
  set par(leading: 0.45em)
  text(size: small, weight: "bold", fill: white, label)
  linebreak()
  text(size: footnotesize, fill: sidecol, items)
})

#let contact(icon, body, link-to: none) = block(above: 0pt, below: 8pt, {
  box(width: 1.2em, align(center, text(fill: white, fa-icon(icon))))
  h(0.3em)
  let content = text(size: small, fill: white, body)
  if link-to == none { content } else { link(link-to, content) }
})

// Page

#let cv(
  first-name: "",
  last-name: "",
  photo: none,
  headline: "",
  summary: "",
  sidebar: [],
  body,
) = {
  set document(title: first-name + " " + last-name + " - CV", author: first-name + " " + last-name)
  let sidebar-width = 5.6cm
  // The sidebar background is drawn on the page so that overflowing content
  // creates a second page instead of being silently cut off
  set page(paper: "a4", margin: 0pt, background: place(
    right,
    rect(width: sidebar-width, height: 100%, fill: sectcol),
  ))
  set text(font: "TeX Gyre Heros", size: 10pt, lang: "en")
  set par(leading: 0.55em, spacing: 0.55em)

  grid(
    columns: (1fr, sidebar-width),
    // Main column
    block(inset: (top: 0.6cm, left: 0.6cm, right: 0.5cm), width: 100%, {
      align(center, text(size: 28pt, {
        text(fill: bgcol, first-name)
        h(0.3em)
        text(fill: sectcol, last-name)
      }))
      v(-2pt)
      // Photo banner with the summary box overlaid on its right side
      if photo != none {
        block(width: 100%, {
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
      }
      body
    }),
    // Sidebar
    block(width: 100%, inset: (x: 0.45cm, top: 0.6cm), sidebar),
  )
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
