// Multi-page portfolio sharing the resume's colors, fonts and section bars:
// one wide column with the dark sidebar color kept as a stripe on the right.

#import "../common/theme.typ": *

#let stripe-width = 0.5cm

// Rounded dark keyword pill
#let pill(body) = box(
  fill: sectcol,
  radius: 8pt,
  inset: (x: 7pt, y: 3.5pt),
  text(size: small, weight: "bold", fill: white, body),
)

// Small accent label inside an experience (Context, Missions, ...)
#let label(body) = block(above: 9pt, below: 4pt, sticky: true, text(
  size: small,
  weight: "bold",
  fill: complcol,
  upper(body),
))

// Skills table: one row per category, items spread over two columns
#let skills(..rows) = block(above: 8pt, table(
  columns: (32%, 1fr, 1fr),
  stroke: (x, y) => (bottom: 0.5pt + rulecol),
  inset: (x: 6pt, y: 7pt),
  ..rows
    .pos()
    .map(((category, items)) => {
      let half = calc.ceil(items.len() / 2)
      (
        text(weight: "bold", fill: complcol, category),
        list(..items.slice(0, half)),
        list(..items.slice(half)),
      )
    })
    .flatten(),
))

// One experience: role, company and dates, then context, missions and
// technical environment
#let experience(
  role: none,
  company: none,
  date: none,
  about: none,
  missions: (),
  tech: (),
) = block(above: 16pt, {
  block(sticky: true, below: 2pt, grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    align: bottom,
    text(size: 13pt, weight: "bold", fill: sectcol, role),
    text(size: small, fill: bgcol, date),
  ))
  block(sticky: true, above: 0pt, text(fill: complcol, company))
  line(length: 100%, stroke: 0.5pt + rulecol)
  if about != none {
    label[Context]
    about
  }
  if missions.len() > 0 {
    label[Missions]
    for (title, desc) in missions {
      block(above: 7pt, below: 0pt, breakable: false, {
        set par(leading: 0.45em)
        arrow(complcol, size: 0.38cm)
        h(4pt)
        text(weight: "bold", title)
        if desc != none {
          block(above: 4pt, pad(left: 1.2em, desc))
        }
      })
    }
  }
  if tech.len() > 0 {
    label[Technical environment]
    text(size: small, fill: bgcol, tech.join([ #h(0.3em)·#h(0.3em) ]))
  }
})

// Education line: dates, degree, school
#let degree(date, title, school) = block(above: 8pt, grid(
  columns: (2.6cm, 1fr),
  column-gutter: 8pt,
  text(fill: bgcol, date),
  {
    text(weight: "bold", title)
    linebreak()
    text(fill: complcol, school)
  },
))

// Spoken language with a 0–5 star rating (halves allowed)
#let language(name, stars, note) = block({
  text(weight: "bold", name)
  h(6pt)
  for i in range(5) {
    let icon = if stars >= i + 1 { "star" } else if stars >= i + 0.5 { "star-half-stroke" } else { "star" }
    text(size: small, fill: if stars >= i + 0.5 { complcol } else { rulecol }, fa-icon(icon, solid: true))
    h(1pt)
  }
  linebreak()
  text(size: small, fill: bgcol, note)
})

#let portfolio(
  keywords: (),
  body,
) = {
  set document(
    title: me.first-name + " " + me.last-name + " - Portfolio",
    author: me.first-name + " " + me.last-name,
  )
  set page(
    paper: "a4",
    margin: (left: 1.5cm, right: 1.5cm + stripe-width, top: 1.3cm, bottom: 1.6cm),
    background: place(right, rect(width: stripe-width, height: 100%, fill: sectcol)),
    footer: context {
      set text(size: footnotesize, fill: bgcol)
      me.first-name + " " + me.last-name + " · Portfolio"
      h(1fr)
      counter(page).display("1 / 1", both: true)
    },
  )
  show: theme-base
  set list(marker: text(fill: complcol, sym.bullet), body-indent: 5pt, spacing: 5pt)

  // Header
  name-title(me.first-name, me.last-name)
  v(4pt)
  // Same summary box as the resume, without the photo behind it
  block(width: 100%, fill: bgcol, inset: 10pt, above: 6pt, align(center, {
    set par(leading: 0.45em)
    arrows(white, n: 2)
    h(4pt)
    text(size: large, fill: white, weight: "bold", me.headline)
    linebreak()
    text(fill: white, size: small, me.summary)
  }))
  v(8pt)
  align(center, {
    for k in keywords { pill(k) + h(3pt) }
  })
  v(6pt)
  align(center, {
    for (i, (icon, label, url)) in me.contacts.enumerate() {
      if i > 0 { h(10pt) }
      contact(icon, label, link-to: url, fill: sectcol, size: footnotesize)
    }
  })

  body
}
