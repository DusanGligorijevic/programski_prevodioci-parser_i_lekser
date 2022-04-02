import java_cup.runtime.Scanner;
import java_cup.runtime.Symbol;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
public class Test {
    public static void main(String[] args) {
        try {
            FileReader fileReader = new FileReader("fajl19.txt");
            MPLexer mpLexer = new MPLexer(fileReader);
            parser p = new parser(mpLexer);
            p.parse();



        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
