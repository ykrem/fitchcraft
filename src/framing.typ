// type definition
#let framing(height: 3em, thickness: .05em, stroke: black, is-short: false, is-assume: false, assume-length: 2.25em, assume-thickness: .05em, assume-stroke: black) = {
  (
    height: height,
    thick: thickness,
    stroke: stroke,
    is-short: is-short,
    is-assume: is-assume,
    assume-length: assume-length,
    assume-thick: assume-thickness,
    assume-stroke: assume-stroke
  )
}

// display a framing
#let fl-display(fl) = {

  let height = fl.height
  if fl.is-short {height -= .5em}

  let ln = line(angle: 90deg, length: height, stroke: fl.thick + fl.stroke)  
  if fl.is-assume {
    ln = stack(dir: ttb, ln, move(
      dx: fl.thick/2,
      dy: -fl.assume-thick/2,
      line(length: fl.assume-length, stroke: fl.assume-thick)
      )
    )
  }
  
  //ln = align(left+bottom, ln) 
  // won't "work" for some reason
  return ln
}