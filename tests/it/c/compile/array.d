module it.c.compile.array;

import it;

@("1d")
unittest {
    shouldCompile(
        C(
            q{
                struct Foo { int ints[4]; };
            }
        ),

        D(
            q{
                auto f = Foo();
                static assert(f.sizeof == 16, "Wrong sizeof for Foo");
                static assert(is(typeof(Foo.ints) == int[4]));
            }
        ),
    );
}

@("flexible")
unittest {
    shouldCompile(
        C(
            q{
                struct Slice {
                    int length;
                    unsigned char arr[];
                };
            }
        ),

        D(
            q{
                auto s = Slice();
                static assert(s.sizeof == 4, "Wrong sizeof for Slice");
            }
        ),
    );
}
