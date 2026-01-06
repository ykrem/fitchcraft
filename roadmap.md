Submit to [Typst Universe](https://github.com/typst/packages) when ready.
# 1.0
- finalize naming.
- write the [README](README.md) and documentation.
    - write/rethink/combine with [README.typ](README.typ).
- constrain imports.
- constrain [lib.typ](lib.typ) to just the deduction function.
- get rid of [interface.typ](src/interface.typ)
- rethink how framing works in relation to the "fixed" mode. Perhaps return to a length instead, recieving the other design parameters independently, or not at all.
- remove [README.typ](README.typ) from [.gitignore](.gitignore)


# 1.1
- implement styling; specialize styling for the different elements: text, equations, framings.
- add the option to manually define asm-lines (length and/or style). can either "obey" to dynamic, ignore it, or be settable. be different to "fixed"?
- strengthen input verification & error messages.
- clean the library, especially how the `dynamic` mode is implemented.
- (related) consider "structural validation" (equal number of opennings and closings, no double assumptions, anything else?)
    - problem: implementing it means that while writing a proof, it may not render until finished.
    - solutions:
        1. add it as it is - get used to "writing correctly".
        2. give it up - let the user do "what they wish".
        3. make it modifiable as a parameter of the main function (on/off by default?)
        4. create a `qed` utility formula that switches it on (so off by default? and/or 3).

# Later
- asm-mode is either constant or dynamic (or "widest"); could maybe add some "curved length" sometime (just a composition of the measure part with some function of a domain... idk, range of the interval \(0,1\]). Perhaps "dynamic" itself should be non-linear.
- consider rewriting the line/parsing logic - the "array polymorphism" is not ideal.
- consider "reomving" the redundant math.quad-s
- try to utilize as much built-in functions as possible.
- consider re-introducing "depth" into the formula object (although I'm pretty sure it'll introduce many "contextuality" problems I've had to solve) and write around it.
- rethink how the `framing` object works. maybe use an "object library" or merge it with `formula`.
- consider more features. open for requests if there'll be demand for it.
- optimize for local and CLI use.
- clean the repo.
- maintain.