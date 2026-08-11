import std.stdio;
import init_prog;
import error;
import std.file, std.regex, std.string, std.algorithm, core.stdc.stdlib, std.conv;
import infss;
public import marschiert;
// web server
import handy_httpd;
import handy_httpd.handlers.file_resolving_handler;
int oa = 0;
string aj;
void main(string[] args)
{
	if (args.length < 2){
		writeln("\033[1mP/ (V0.0.3) https://github.com/anhumandev/csl");
		writeln("	Usage: ./lpa/lpaash [flag] [options]");
		writeln("\nFlags:\n	-e | --enter: Importing a P/ program");
		writeln("	-ge| --generate-exe: Generate an executable binary as a standalone application.");
		writeln("	-n | --normal: Run the interpreter in normal mode (without interpretation messages)");
		writeln("	-d | --debug: Run the interpreter in debug mode and display messages during the interpretation process.");
		writeln("	-x | --xdoc: Offline Documents in localhost.");
		writeln("	-v | --version: show version of P/Interperter.");
		writeln("	-h | --help: show current menu.");
		writeln("	-spe | --sboxprinterror: Show errors of SboX.");
		writeln("	-adebug | --asm-debug: Print result of P/C to NASM.");
		writeln("	-cdebug | --csc-debug: Printf P/ to P/C result.");
		writeln("	-td | --term-debugger: run terminal-based Debugger.");
		writeln("	-ast | --abstract-syntax-tree: Use AST to run your program. (BETA) (More info: https://github.com/anhumandv/lpa/ast/)");
		writeln("Versions:");
		writeln("	marschiert(runtime librray): " ~ _version);
		writeln("	P/: 0.0.3");
		writeln("\nExample: ./lpa -e hi.lpa-n\033[0m");
        //prinPanic("WUT");
    } else if(args[1] == "-e" || args[1] == "--enter" || args[1] == "--generate-exe" || args[1] == "-ge"){
        if (exists(args[2])){
			try {
			if (args[3] == "-d" || args[3] == "--debug"){
				if (args[1] == "-ge" || args[1] == "--generate-exe")
				{
					infs(args[2], "cc", "ll");
				} else {
					infs(args[2], "debug", "ll");
				}
			} else if(args[3] == "-n" || args[3] == "--normal"){
				if (args[1] == "-ge" || args[1] == "--generate-exe"){
					infs(args[2], "cc", "ll");
				} else {
            		infs(args[2], "normal", "ll");
				}
			} else if (args[3] == "-ast" || args[3] == "--abstract-syntax-tree")
			{
				infs(args[2], "ast", "ll");
			}
			} catch(Exception e){

			}
        } else {
            prinPanic(kodes._no_file, "import userfile");
        }
    } else if (args[1] == "-v" || args[1] == "--version")
	{
		writeln("\033[1mP/ (v0.0.3) " ~ __DATE__ ~ " " ~ __TIME__);
	} else if (args[1] == "-h" || args[1] == "--help")
	{
		writeln("\033[1mP/ (V0.0.3) https://github.com/anhumandev/csl");
		writeln("	Usage: ./lpa/lpaash [flag] [options]");
		writeln("\nFlags:\n	-e | --enter: Importing a P/ program");
		writeln("	-ge| --generate-exe: Generate an executable binary as a standalone application.");
		writeln("	-n | --normal: Run the interpreter in normal mode (without interpretation messages)");
		writeln("	-d | --debug: Run the interpreter in debug mode and display messages during the interpretation process.");
		writeln("	-x | --xdoc: Offline Documents in localhost.");
		writeln("	-v | --version: show version of P/Interperter.");
		writeln("	-h | --help: show current menu.");
		writeln("	-spe | --sboxprinterror: Show errors of SboX.");
		writeln("	-adebug | --asm-debug: Print result of P/C to NASM.");
		writeln("	-cdebug | --csc-debug: Printf P/ to P/C result.");
		writeln("	-td | --term-debugger: run terminal-based Debugger.");
		writeln("	-ast | --abstract-syntax-tree: Use AST to run your program. (BETA) (More info: https://github.com/anhumandv/lpa/ast/)");
		writeln("\nExample: ./lpa -e hi.lpa -n\033[0m");
	} else if (args[1] == "-td" || args[1] == "--term-debugger")
	{
		writeln("\033[1mP/-Term-Debugger V0.0.1 based on P/ Version 0.1\033[0m");
		writeln("\033[34mhttps://github.com/anhumandev/lpa/p-term-debugger/\033[0m");
		writeln("\033[1m\n\t[I]: Run \"help\" to get list of functions and a help menu.\033[0m");
		writeln("");
		ctermde();
	} else if (args[1] == "-rv" || args[1] == "--runtime-version")
	{
		writeln("\033[1mMarschiert (runtime library for P/) " ~ _version ~ "\n© 2026 All rights reserved.\033[0m");
	} else if (args[1] == "-x" || args[1] == "--xdoc")
	{
		auto lpaa = new FileResolvingHandler(".");
		new HttpServer().start();
	}
}

void ctermde()
{
	//int oa = 0;
	write("(lpa-term-debugger) ");
	auto jaj = readln();
	if (jaj.strip() == "help")
	{
		help();
		ctermde();
	} else if (jaj.startsWith("include"))
	{
		auto ja = regex(`include (\S+) (\S+)`);
		auto ja2 = match(jaj, ja);
		if (!ja2.empty)
		{
			if (exists(ja2.captures[1])){
				if (ja2.captures[2] == "exe"){
					aj = ja2.captures[1];
					infs(ja2.captures[1], "cc", "ll");
					oa = 1;
					ctermde();
				} else if(ja2.captures[2] == "engine"){
					infs(ja2.captures[1], "debug", "ll");
					
					ctermde();
				}
			}
		}
	} else if (jaj.strip() == "exit"){
		exit(0);
	} else if (jaj.strip() == "asm"){
		if (oa == 1)
		{
			infs(aj, "cc", "d");
			ctermde();
		} else {
			writeln("first run \"include FILENAME exe\" then try again.");
			ctermde();
		}
	} else {
		writeln("\033[1m\033[31mThe debugger received an undefined command.\033[0m");
		ctermde();
	}
}

void help()
{
	writeln("A quick Help Menu for csl-term-debugger.");
	writeln("\n\thelp: show current menu.");
	writeln("\tinclude FILEPATH [option=exe, engine]: run or compile a csl file in debug mode.");
	writeln("\tasm: show result of convert P/ to asm. (just work in include exe.)");
	writeln("\tcsc: show result of convert P/ to P/C. (just work in include exe.)");
}