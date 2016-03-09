<!-- spl-perl by NewForester:  programming examples in Perl 5 -->

# Script Programming Language - Perl

Programming examples written in [Perl 5](https://en.wikipedia.org/wiki/Perl).

The examples are implemented as scripts and so can be run directly from the shell:

```bash
    $ ./hello.pm  NewForester "Big Bad World"
    Hello NewForester
    Hello Big Bad World
```

Each example comes with a unit test based on [Test::Class](http://search.cpan.org/~ether/Test-Class-0.50/lib/Test/Class.pm).

```bash
    $ perl TestHello.pm                 # run unit test for hello.pm
```

All modules are documented for use with [perldoc](http://perldoc.co.uk/perldoc.html).

```bash
    $ perldoc hello.pm                  # print documentation for hello.pm
    $ perldoc TestHello.pm              # print documentation for TestHello.pm
```

All modules have been put through [Perl::Lint](https://www.perllint.org/) with default configuration.

```bash
    $ ./perllint hello.pm               # check hello.pm for code smells
    $ ./perllint TestHello.pm           # check TestHello.pm for code smells
```

---

Module  | Contents
------  | --------

---

Caveat:  perl is a mature and unique language that is relatively new to me.
The unit tests and documentation may not look all that authentic to the experienced.

---

*spl-perl* by NewForester licensed under the MIT Licence.

<!-- EOF -->
