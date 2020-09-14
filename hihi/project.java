import java.io.*;
import java.util.*;

public class project {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String answer = br.readLine();

        // 1단계
        answer = answer.toLowerCase();

        // 2단계
        answer = answer.replaceAll("!", "");
        answer = answer.replaceAll("@", "");
        answer = answer.replaceAll("#", "");
        answer = answer.replaceAll("[*]", "");

        // 3단계
        String[] answerTest = answer.split("");
        for(int i=1; i<answerTest.length-1; i++){
            if(answerTest[i].equals(".")){
                if(answerTest[i+1].equals(".") && answerTest[i-1].equals(".")){
                    answerTest[i+1] = "";
                    answerTest[i] = "";
                }
            }
        }

        for(int i=1; i<answerTest.length; i++){
            if(answerTest[i].equals(".")){
                if(answerTest[i-1].equals(".")){
                    answerTest[i] = "";
                }
            }
        }

        // 4단계
        if(answerTest[0].equals(".")) answerTest[0] = "";


        // 5단계
        for(int i=0; i<answerTest.length; i++){
            if(answerTest[i].equals(" ")) answerTest[i]= "a";
        }

        // 6단계

        String str = "";
        int check = 0;
        for(int i=0; i<answerTest.length; i++){
            str += answerTest[i];
        }

       
       
        System.out.println(answer);
    }
}
