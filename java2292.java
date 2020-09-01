import java.io.*;
import java.util.*;

public class java10951{
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        
        int inputInt = Integer.parseInt(br.readLine());
        
        int count = 1;
        int check = 0;

        while(true){
            check++;
            inputInt -= count;
            count = check*6;
            if(inputInt<=1) break;
        }
        bw.write(check + "\n");
        bw.flush();
        bw.close();
        br.close();
    }
}