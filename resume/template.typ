// Two-column CV layout ported from a LaTeX "Simple Hipster CV" style template:
// a white main column and a dark sidebar on the right.

#import "../common/theme.typ": *

// Main column

#let cv-section(title) = section-bar(title)

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

// Contact line in the sidebar
#let side-contact(icon, body, link-to: none) = block(above: 0pt, below: 8pt, contact(icon, body, link-to: link-to))

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
  show: theme-base

  grid(
    columns: (1fr, sidebar-width),
    // Main column
    block(inset: (top: 0.6cm, left: 0.6cm, right: 0.5cm), width: 100%, {
      name-title(first-name, last-name)
      v(-2pt)
      if photo != none { photo-banner(photo, headline, summary) }
      body
    }),
    // Sidebar
    block(width: 100%, inset: (x: 0.45cm, top: 0.6cm), sidebar),
  )
}
