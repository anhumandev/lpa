module func;
import std.stdio;
import error;
import std.file;
import std.conv;
import std.algorithm;
import std.string;
import std.regex;
import token_string, ultracex, ssm;
import core.stdc.stdlib: exit, malloc, system;
import cslg.ultracgraphic.sgfu;
import csl.mempack.freec;
import csl.mempack.mallc;
import csl.preprs.define, infss, pslgrap.functions, arsd.simpledisplay, pslgrap.infssfunctions;

void funcl(string lio, string mode)
{
    if (lio.startsWith("write")){
        auto aj = regex(`write\("([^"]+)"\);`);
        auto aj2 = match(lio, aj);
        if (!aj2.empty)
        {

            if (aj2.captures[1] in int_s)
            {
                write(int_s[aj2.captures[1]]);
            } else {
                string kaaa = aj2.captures[1].replace("\"", "");
                kaaa = kaaa.replace("\\n", "\n");
                write(kaaa);
            }
        } else {
            auto kaj = regex(`write\((.+)\);`);
            auto kaj2 = match(lio, kaj);
            if(!kaj2.empty){
                if (kaj2.captures[1].indexOf("+") != -1){
                    string[] kp = kaj2.captures[1].split('+');
                    if (mode == "debug"){
                        writeln(kp);
                    }
                    foreach (kal; kp){
                        kal = kal.replace(" ", "");
                        if (kal in str)
                        {
                            write(str[kal]);
                        } else if(kal.startsWith("\"") && kal.endsWith("\"")){
                            auto lll = kal.replace("\"", "");
                            lll = lll.replace("\\s0", " ");
                            lll = lll.replace("\\n", "\n");
                            write(lll);
                        } else if(kal in int_s) {
                            write(int_s[kal]);
                        } else if(kal in unint){
                            write(unint[kal]);
                        } else {
                            writeln("pw2");
                        }
                    }
                } else {
                if (kaj2.captures[1] in int_s)
            {
                write(int_s[kaj2.captures[1]]);
            } else if (kaj2.captures[1] in str){
                write(str[kaj2.captures[1]]);
            } else if (kaj2.captures[1] in unint){
                write(unint[kaj2.captures[1]]);
            } else {
                prinPanic(kodes._no_value, lio);
            }
                }
        } else {
            writeln("e2");
        }
        }
    } else if(lio.startsWith("return")){
            auto reg = regex(`return (\S+);`);
            auto ja = match(lio, reg);
            if (!ja.empty)
            {
                if (ja.captures[1] in int_s){
                    
                        fiappwitherror(int_s[ja.captures[1]]); 
                    
                } else {
                    fiappwitherror(to!int(ja.captures[1]));
                }
            } else {
                writeln("r1");
            }
    } else if (lio == "_exitWDT;"){
        throw new UltraCExp("Program ended with");
    } else if (lio.startsWith("malloc"))
    {
        auto ll = regex(`malloc\((.+)\);`);
        auto ll2 = match(lio, ll);
        if (!ll2.empty)
        {
            if (mode == "debug")
            {
                writeln(ll2);
            }

            _malloc(ll2.captures[1], mode);
        }
    } else if(lio.startsWith("free")){
        auto ll = regex(`free\((.+)\);`);
        auto ll2 = match(lio, ll);
        if (!ll2.empty)
        {
            if (mode == "debug")
            {
                writeln(ll2);
            }

            _free(ll2.captures[1]);
        }
    } else if (lio.startsWith("sys") != -1)
    {
        auto ll = regex(`sys\((.+)\);`);
        auto ll2 = match(lio, ll);
        if (!ll2.empty)
        {
            string final_commend = "".dup;
            if (mode == "debug")
            {
                writeln(ll2);
            }

            if (ll2.captures[1].indexOf("+") != -1){
                    string[] kp = ll2.captures[1].split('+');
                    if (mode == "debug"){
                        writeln(kp);
                    }
                    foreach (kal; kp){
                        kal = kal.strip();
                    
                        if (kal in str)
                        {
                            final_commend = final_commend ~ kal;
                        } else if(kal.startsWith("\"") && kal.endsWith("\"")){
                            //auto lll = kal.replace("\"", "");
                            //string la = kal.dup.remove(0);
                            //la = la.dup.remove(kal.length);
                            string la = kal[1 .. $ - 1];
                            la = la.replace("\\x", "&");
                            final_commend = final_commend ~ la;
                        } else {
                            prinPanic(kodes._syntex_faild, lio);
                            //final_commend = final_commend ~ kal;
                        }
                    }
                } else {
                if (ll2.captures[1] in str){
                    //write(str[kaj2.captures[1]]);
                    final_commend = final_commend ~ ll2.captures[1];
                }
            //system(toStringz(ll2.captures[1]));
            //_free(ll2.captures[1]);
                }


                if (final_commend != "")
                {
                    system(toStringz(final_commend));
                } else {
                    system(toStringz(ll2.captures[1]));
                }
        }
     } else graphicFucntionsManager(lio);

}
