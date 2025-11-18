// constants

#let height = 30pt

#let frame-length = height
#let frame-girth = .5pt
#let frame-line = line(angle: 90deg, length: frame-length, stroke: frame-girth)
#let frame-space = 10pt


#let asm-length = 30pt
#let asm-girth = frame-girth
#let asm-line-isolated = line(length: asm-length, stroke: asm-girth)

#let asm-spacing = line(stroke: 0pt, length: asm-length - frame-space)
#let frame-spacing = line(stroke: 0pt, length: frame-space)

#let asm-line = stack(
  dir: ttb, frame-line,
  move(
    dx: frame-girth/2,
    dy: -asm-girth/2, asm-line-isolated
   )
)




#import "../src/formula.typ": * // constrain later

// returns an array of each formula's array of frame lines and (asm) spaces
#let frame-arr(fms) = { // parse prior?

  let frm = ()
  let new = (frame-line,)
  let is-asm = (false,)

  for line in fms {

    if line == sps {

      if is-asm.last() {new.push(asm-spacing)}

      new.push(frame-line)
      is-asm.push(false)
    }

    else if line == spe {
      let _ = new.pop()

      if new.last() == asm-spacing {let _ = new.pop()}

      let _ = is-asm.pop()
    }

    else if line == asm {
      frm.last().last() = asm-line
      is-asm.last() = true
    }

    else {
      frm.push(new)
    }

  }

  return frm

}

// merges two equally lengthed arrays into a pair-array of the same length
#let merge(arr1, arr2) = {

  let l1 = arr1.len()
  let l2 = arr2.len()
  assert(arr1.len() == arr2.len(), message: "Arrays must be of the same length")

  let out = ()
  for i in range(arr1.len()) {out.push((arr1.at(i), arr2.at(i)))}
  return out
}

#let frame(fms) = {

  let arr = frame-arr(fms)
  fms = parse(fms).filter(x => x not in utils)
  let out = ()

  for (fml, frm) in merge(fms, arr) {

    let move-left = 0pt 
    if frm.last() == asm-line {move-left = asm-length}
    let new = stack(
      dir: ltr,
      spacing: frame-space,
      ..frm,
      align(left+horizon, move(dx: -move-left - 4pt, fml.equation)) // fix constant
      )
    out.push(new)

  }

  return stack(
    dir: ttb,
    spacing: 0pt, // redundant
    ..out
  )

}

/*
#let frfr(fms) = {

  let last-frame = (frame-line,)
  let is-asm = (false,)
  let out = ()

  for fm in fms {

    if fm == sps {

      if is-asm.last() {last-frame.push(asm-spacing)}
      else {last-frame.push(frame-spacing)}
      is-asm.push(false)

      }

    else if fm == spe {

      let _ = is-asm.pop()
      let _ = last-frame.pop()
      if is-asm.last() in (frame-spacing, asm-spacing) {let _ = last-frame.pop()}

      }

    else if fm == asm {

      last-frame.last() = asm-line
      is-asm.last() = true

      }

    else {
      fm = parse-single(fm,1)
      out.push(stack(dir:ltr, ..last-frame, fm.equation))
      }

  }

  return stack(dir: ttb, ..out)
}

// found the problem: can't retroactively change content. would require some more rethinking.