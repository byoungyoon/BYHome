import java.io.*;
import java.util.*;

public class java2206{
    static class Place{
        int y;
        int x;
        int dis;
        int drill;

        public Place(int y, int x, int dis, int drill){
            this.y = y;
            this.x = x;
            this.dis = dis;
            this.drill = drill;
        }
    }

    static int n,m,ans;
    static int[][] map, visit;

    static int[] dy = {-1,1,0,0};
    static int[] dx = {0,0,-1,1};

    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String[] str = br.readLine().split(" ");

        n = Integer.parseInt(str[0]);
        m = Integer.parseInt(str[1]);

        map = new int[n][m];
        visit = new int[n][m];

        for(int i=0; i<n; i++){
            str = br.readLine().split("");
            for(int j=0; j<m; j++){
                map[i][j] = Integer.parseInt(str[j]);
                visit[i][j] = Integer.MAX_VALUE;
            }
        }

        ans = Integer.MAX_VALUE;

        bfs(0,0);

        if(ans == Integer.MAX_VALUE) System.out.println(-1);
        else System.out.println(ans);
    }

    public static void bfs(int y, int x){
        Queue<Place> q = new LinkedList<>();

        q.add(new Place(y,x,1,0));
        visit[y][x] = 0;

        while(!q.isEmpty()){
            Place p = q.poll();

            if(p.y == n-1 && p.x == m-1){
                ans = p.dis;
                break;
            }

            for(int i=0; i<4; i++){
                int ny = p.y + dy[i];
                int nx = p.x + dx[i];

                if(ny<0 || nx<0 || ny>=n || nx<=m) continue;

                if(visit[ny][nx] <= p.drill) continue;

                if(map[ny][nx] == 0){
                    visit[ny][nx] = p.drill;
                    q.add(new Place(ny,nx,p.dis+1,p.drill));
                }
                else{
                    if(p.drill == 0){
                        visit[ny][nx] = p.drill + 1;
                        q.add(new Place(ny,nx,p.dis+1,p.drill+1));
                    }
                }
            }
        }
    }
}









