#import "../src/formula.typ": *
#import "../src/frame.typ": *

#let indices(fms) = {
  
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, it.index))
    )
}

#let rules(fms) = {
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, $it.rule$))
    )
}


#let diagram(fms) = {

  let psd = parse(fms).filter(x =>
  x not in (frame-space, asm-spacing) and
  x not in utils // I hate this
  )

  stack(
    dir: ltr,
    spacing: 10pt,
    indices(psd),
    frame(fms),
    rules(psd)
  )
}

