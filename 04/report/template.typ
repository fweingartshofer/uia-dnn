// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  
  set page(
    margin: (top: 40pt),
    header: [
      #pad(bottom: 5pt, top: 5pt)[
      #smallcaps[IKT-450 Deep Neural Networks]
      #h(1fr) #date
    ]
    ],
  )
  // Save heading and body font families in variables.
  let body-font = "Linux Libertine"
  let sans-font = "Inria Sans"

  // Set body font family.
  set text(font: body-font, lang: "en", size: 11pt)
  show heading: set text(font: sans-font)

  // Title row.
  align(center)[
    #block(text(font: sans-font, weight: 700, 1.75em, title))
    #v(1em, weak: true)
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: true)

  body
}