// AC解答

import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    long n = Long.parseLong(sc.next());
    long A = Long.parseLong(sc.next());
    long B = Long.parseLong(sc.next());
    long C = Long.parseLong(sc.next());


    long ans = Long.MAX_VALUE;

    for(int a = 0; a < 10000; a++) {
      for (int b = 0; a + b < 10000; b++) {
        long v = n - A * a - B * b;
        long r = a + b + v / C;
        if (v % C != 0 || v < 0 || r > 9999) continue;
        ans = Math.min(ans, r);
      }
    }
    System.out.println(ans);
    sc.close();
  }
}