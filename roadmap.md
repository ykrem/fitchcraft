Submit to [Typst Universe](https://github.com/typst/packages) when ready.

# 1.0
- write the [README](README.md) and [manual](manual.typ). adjust for the new way `framing` is used in the `proof` function

# 1.0.1: minor patch?
- more predefined lines? contadiction, dots, etc.
- strengthen input verification & error messages.
- try to utilize as much built-in functions as possible.


# 1.1: Dynamic proper and structural verification
- clean the library, especially how the `dynamic` mode is implemented.
- "activate" `dynamic`.
- (related) consider "structural validation" (equal number of opennings and closings, no double xmptions, anything else?)
    - solutions:
        1. add it as it is - get used to "writing correctly".
        2. give it up - let the user do "what they wish".
        3. make it modifiable as a parameter of the main function (on/off by default?)
        4. create a `qed` utility formula that switches it on (so off by default? and/or 3).
- I think it only works if an assume comes after every open, which is syntactically required, but won't always be the case, such as while writing. Requires input verification or handling or the qed idea or a logic that makes it work in more cases.
    - idea: allow it only in the "structure-verification" mode. two birds with one stone.
- idea: instead of taking a constant `framing` as a parameter, take a function of the equation/line number which returns a framing. Will break if I first do it with a constant framing, no? Although I can just type-check. Would be p. cool!
    - problem: implementing it means that while writing a proof, it may not render until finished.

# 1.2: Customization
- specialize styling for the different elements: text, equations, framings.
- add the option to manually define asm-lines (length and/or style). can either "obey" to dynamic, ignore it, or be settable. be different to "fixed"?

# Later
- consider rewriting the line/parsing logic - the "array polymorphism" is not ideal.
- consider "reomving" the redundant `math.quad`-s, or just making rule-writing easier
- rethink how the `framing` object works. maybe use an "object library" or merge it with `formula`.
- asm-mode is either constant or dynamic (or "widest"); could maybe add some "curved length" sometime (just a composition of the measure part with some function of a domain... idk, range of the interval \(0,1\]). Perhaps "dynamic" itself should be non-linear.
- optimize for local and CLI use.
- consider more features. open for requests if there'll be demand for it.