import java.io.*;
import java.util.*;

public class hihi{
    static int Answer;
    public static void main(String[] args) throws IOException{
        Scanner sc = new Scanner(System.in);

        int T = sc.nextInt();

        for(int i=0;i<T;i++){
            Answer = 1;

            int N = Integer.parseInt(sc.next());
            int K = Integer.parseInt(sc.next());
            int M = Integer.parseInt(sc.next());
            sc.nextLine();
            
            String st = sc.nextLine();
            String[] sp = new String[N+1-K];

            for(int j=0;j<sp.length;j++){
                sp[i] = Character.toString(st.charAt(j));
            }
    

            System.out.println(sp[2]);
        }

		//System.out.println("Case #");
		//System.out.println(Answer);
    }
}
