<center>
<img src="logo.jpg" height="100" width="100"/>
</center>
<h1 style="font-weight:bold;"> P/ Programming Language</h1>
<blockquote>
  welcome to main page of this project. If you came for the source, this quick explanation might help and clarify things. csc: There is an intermediate language in these source files. A language that is converted to assembly and then converted to an object file with NASM and then linked to an executable file. It is going to be integrated into the interpreter itself soon.
</blockquote>
<h1 style="font-weight:bold;">Why P/?</h1>
We all love C, but at the same time, it's difficult to use in projects and working with pointers makes many people die when writing it. But the goal of P/ is almost the same. Basically, P/ wants to have a simple and functional syntax like Turbo C, easy to understand and work with, but in a modern environment.
<h1>Current status</h1>
well, right now the project is in alpha mode. That means it's only released for debugging and it's full of bugs! And it's fixing problems and testing new features. So it's not suitable for use and it's not predictable to some extent. And it's more educational than industrial.
<h1>Examples</h1>
P/ is easy and really human-friendly. It's very easy to read and it depends on how well or how busy you are at coding.
<pre><code>
genreate main() {
  write("Hello World!\n");
}
</pre></code>
or
<pre><code>
genreate main() {
  // s0 is a escape for spcae.
  // you can remvoe return if you want normal exit-code.
  write("Hello" + "\s0" + "World\n");
  return 0;
}
</pre></code>
or 
<pre><code>
generate char -v:content[] = getInput().chomp

generate main() {
    if (strcmp("CR7", -v:content)):
        write("Hello Mr.Ronaldo! GOAT!\n");
        end;
}
</pre></code>
More example in (src/examples)
if you want learn P/ fully, you can go to psl.github.io
