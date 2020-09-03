import java.io.*;
import java.util.*;

public class java2206{
    public static void main(String[] args) throws IOException{
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String inputStr = br.readLine();
        StringTokenizer st = new StringTokenizer(inputStr, " ");

        int[] inputInt = new int[2];
        for(int i=0; i<2; i++) inputInt[i] = Integer.parseInt(st.nextToken());

        int[][] map = new int[inputInt[0]][inputInt[1]];
        int[][] mapCheck = new int[inputInt[0]][inputInt[1]];
        String[] mapSplitD = new String[inputInt[0]];
        String[] mapSplitR = new String[inputInt[1]];

        for(int i=0; i<inputInt[0]; i++){
            mapSplitD[i] = br.readLine();
            mapSplitR =  mapSplitD[i].split("");
            for(int j=0; j<inputInt[1]; j++){
                map[i][j] = Integer.parseInt(mapSplitR[j]);
            }
        }

        int answer = BPS(inputInt[0],inputInt[1],map,mapCheck);

        bw.write(answer + "\n");
        bw.flush();
        bw.close();
        br.close();
    }

    public static int BPS(int endX, int endY, int[][] map ,int[][] mapCheck){
        int nextX = 0;
        int nextY = 0;

        int[][] search = {{0,1},{0,-1},{1,0},{-1,0}};

        mapCheck[nextX][nextY] = 1;
        Queue<Integer> qX = new LinkedList<Integer>();
        Queue<Integer> qY = new LinkedList<Integer>();

        qX.add(nextX);
        qY.add(nextY);

        while(mapCheck[endX][endY] == 0){
            nextX = qX.poll();
            nextY = qY.poll();

            for(int i=0; i<4; i++){
                if(search[i][0]+nextX>=0 && search[i][0]+nextX<endX && 
                         search[i][1]+nextY>=0 && search[i][1]+nextY<endY){
                    if(mapCheck[search[i][0]+nextX][search[i][1]+nextY] == 0){
                        if(map[search[i][0]+nextX][search[i][1]+nextY] == 0){
                            qX.add(search[i][0]+nextX);
                            qY.add(search[i][1]+nextY);

                            mapCheck[search[i][0]+nextX][search[i][1]+nextY] = mapCheck[nextX][nextY] + 1;
                        }
                    }
                }
            }
        }

        return mapCheck[endX][endY];
    }
}









