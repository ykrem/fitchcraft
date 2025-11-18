//type definition
#let formula(index, equation, rule: none) = {
  (
    index: [#index],
    equation: equation,
    rule: rule
  )
}

// utility formulas

#let sps = formula(1,"UTIL subproof start") // starts a subproof
#let spe = formula(1,"UTIL subproof end") // ends a subproof
#let asm = formula(1,"UTIL assumption line") // an assumption line

#let spb = formula(1,"UTIL subproof break") // breaks two subproofs of the same depth

#let utils = (sps, spe, asm, spb)

// parse a single formula; use internally
// note - can't parse on input because context is required for index insertion
#let parse-single(fm, line-number) = {

  if type(fm) == content { // just an equation
      return formula(
        [#line-number],
        fm,
        rule: []
      )
    }

    // otherwise, must be an array

    if type(fm) == array {

      if fm.len() == 2 { // equation, rule
        return formula(
          [#line-number],
          fm.at(0), // equation
          rule: fm.at(1) // rule
        )
      }

      else if fm.len() == 3 { // index, equation, rule
        return formula(
          fm.at(0), // index
          fm.at(1), // equation
          rule: fm.at(2) // rule
        )
      }

      //else
      panic("Array of invalid form! The valid forms are (equation, rule) or (index, equation, rule).")

      }

    // else

    panic("Invalid input type! Valid inputs are equations or arrays.")

}

// parse input to array of formulas
#let parse(arr) = {

  let formulas = ()
  let line-number = 1

  for line in arr {

    if line in utils {
      formulas.push(line)
    }

    else { // is a visible formula
      formulas.push(parse-single(line, line-number))
      line-number += 1
    }

  }

  return formulas
  
}