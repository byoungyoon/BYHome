import java.io.*;
import java.util.*;

public class hihi{
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        int maxNum = Integer.parseInt(br.readLine());
        String inputStr = br.readLine();

        StringTokenizer st = new StringTokenizer(inputStr, " ");
        int[] inputInt = new int[maxNum];
        for(int i=0; i<inputInt.length; i++) inputInt[i] = Integer.parseInt(st.nextToken());

        Arrays.sort(inputInt);

        int max = inputInt[inputInt.length - 1];
        int min = inputInt[0];

        bw.write(min + " " + max + "\n");
        bw.flush();
        bw.close();
        br.close();
    }
}
