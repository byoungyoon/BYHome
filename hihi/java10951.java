import java.io.*;
import java.util.*;

public class java10951{
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        
    
        String inputStr = br.readLine();
        StringTokenizer st = new StringTokenizer(inputStr, " ");
        int[] inputInt = new int[2];
        for(int j=0;j<2;j++) inputInt[j] = Integer.parseInt(st.nextToken());
            
        int sum = inputInt[0] + inputInt[1];
        bw.write(sum + "\n");
        
        bw.flush();
        bw.close();
        br.close();
    }
}