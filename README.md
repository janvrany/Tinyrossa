# Tinyrossa

*Tinyrossa* is pure-Smalltalk (very) experimental compiler backend
based on [Testarossa Intermediate Language][1], [ArchC][2]
and [MachineArithmetic][3].

## Beware...

...that "nothing works!"

At the moment, this is just an experiment, a result of couple afternoons
of hacking to see what it might look like and to get initial feedback from the community.
Pretty much every part is either incomplete or plain wrong and the API is not great
either.

However, it is - in my opinion - enough to demonstrate some of the core ideas.

## Example

```
| compilation builder |

"Create a compilation object:"
compilation := TRCompilation new.

"Create IL builder and build IL representation of :"
builder := compilation builder.
builder ireturn:
       { builder iconst: 42 }.

"Indicate we're done building the IL."
compilation buildFinished.

"To inspect the IL, evaluate and inspect:"
compilation il.

"Run IL-level optimizer"
compilation optimize.

"Compile IL to machine code. This includes
instruction selection, register allocation and
branch relocation."
compilation compile.

"Once compiled, the code buffer contains the actual
machine code."
compilation codeBuffer.
```

## How to load

### ...into Smalltalk/X

#### Using provided makefile*

    make -C stx run

#### Manually from workspace

**NOTE**: The following instructions assume you have
a recent [Smalltalk/X jv-branch][3], i.e., a version newer than 2022-06-01.


 1. Load [MachineArithmetic][4]. Follow instructions in
    [README.md](https://github.com/shingarov/MachineArithmetic/blob/pure-z3/README.md#into-smalltalkx)

 2. Load [Pharo-ArchC][2]. Follow instructions in
    [README.md](https://github.com/shingarov/Pharo-ArchC/blob/pure-z3/README.md#into-smalltalkx)


 3. Clone the repository:

    ````
    git clone https://github.com/janvrany/Tinyrossa.git
    ````

 3. In Smalltalk/X, execute:

    ```
    "/ Tell Smalltalk/X where to look for Tinyrossa packages
    Smalltalk packagePath add: '/where/you/cloned/it/Tinyrossa'.

    "/ Load Tinyrossa
    Smalltalk loadPackage: 'Tinyrossa'.
    Smalltalk loadPackage: 'Tinyrossa-RISCV'.
    Smalltalk loadPackage: 'Tinyrossa-Tests'.

    "/ Generate RV64G assembler"
    (Smalltalk at: #AcDSLAssemblerGenerator) generate: (Smalltalk at:#AcDSLRV64GAssembler).
    ```


[1]: https://github.com/eclipse/omr/tree/master/doc/compiler/il
[2]: https://github.com/shingarov/Pharo-ArchC
[3]: https://swing.fit.cvut.cz/projects/stx-jv
[4]: https://github.com/shingarov/MachineArithmetic/
