#import "src/chart.typ": diagram

#let proof(framing: 2.25em, assumption-mode: "fixed", indexation: "1", proof-arr) = {

  import "src/framing.typ": framing
  let framing = framing()

  // 1.1
  //let assumption-modes = ("fixed", "widest", "dynamic", "dynamic-single")

  // 1.0
  let assumption-modes = ("fixed", "widest", "dynamic-single")

  let assumption-mode-error = "Invalid assumption mode! Can only be" + assumption-modes.join(" or ") + "."
  
  assert(assumption-mode in assumption-modes, message: assumption-mode-error)

  
  import "src/formula.typ": parse
  diagram(framing, assumption-mode, parse(proof-arr, indexation))
}