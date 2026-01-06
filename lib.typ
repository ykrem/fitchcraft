#import "src/formula.typ": *
#import "src/interface.typ": *
#import "src/framing.typ": *
#import "src/chart.typ": *

#let proof(framing: framing(), assumption-mode: "fixed", indexation: "1", proof-arr) = {
  
  assert(assumption-mode in assumption-modes, message: assumption-mode-error)
  chart(framing, assumption-mode, parse(proof-arr, indexation))
}