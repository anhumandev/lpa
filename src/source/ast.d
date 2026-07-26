module ast;

import std.stdio, std.string, infss;

interface Node {
    void execute();
}

string gn;
string laststring;

interface Inter : Node {}
class Int : Inter {
    int value;
    this(int value)
    {
        this.value = value;
    }
    override void execute()
    {
        if (gn != null)
        {
            int_s[gn] = value;
        }
    }
}


class Program : Node {
    Node[] st;
    this(Node[] st)
    {
        this.st = st;
    }
    override void execute()
    {
        foreach(oa; st)
        {
            oa.execute();
        }
    }
}

class Printd : Node {
    override void execute()
    {
        if (laststring != null)
        {
            write(laststring.replace("\\n", "\n"));
        }
    }
}

class InterName : Node {
    string value;
    this(string value)
    {
        this.value = value;
    }
    override void execute()
    {
        gn = value;
    }
}

class StringExce : Node {
    string value;
    this(string value)
    {
        this.value = value;
    }
    override void execute()
    {
        laststring = value;
    }
}
