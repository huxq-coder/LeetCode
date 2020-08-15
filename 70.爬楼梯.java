/*
 * @lc app=leetcode.cn id=70 lang=java
 *
 * [70] 爬楼梯
 */

// @lc code=start
class Solution {
    /* 斐波那契数列
    f(n) = f(n-1) + f(n-2)
    递归方法
    提交LeetCode，超时
    时间复杂度O(2^n)
    */
    // public int climbStairs(int n) {
    //     if(n < 3) {
    //         return n;
    //     } else {
    //         return climbStairs(n-1) + climbStairs(n-2);
    //     }
    // }
/* 空间换时间
   利用一个数组保存每次计算的值
    时间复杂度O(n)
    空间复杂度O(n)
*/
    // public int climbStairs(int n) {
    //     if(n < 3) {
    //         return n;
    //     } else {
    //         int[] temp = new int[n+1];
    //         temp[0] = 0;
    //         temp[1] = 1;
    //         temp[2] = 2;
    //         for(int i = 3; i <= n; i++) {
    //             temp[i] = temp[i-1] + temp[i-2];
    //         }
    //         return temp[n];
    //     }
    // }

    /* 滚动数组
    f(n) = f(n-1) + f(n-2)
    f(n)的值 只与 f(n-1) 和 f(n-2) 有关，只保留这三个值，依次往下滚动
    时间复杂度O(n)
    空间复杂度O(1)
    */
    // public int climbStairs(int n) {
    //     int a = 0;
    //     int b = 0;
    //     int c = 1;
    //     for(int i = 0; i < n; i++) {
    //         a = b;
    //         b = c;
    //         c = a + b;
    //     }
    //     return c;
    // }

    /* 国际站看到的一种解法
       a：当前台阶
       b：下一个台阶
       c：再进一步台阶 值为 a+b
       依次类推    
       时间复杂度O(n)
       空间复杂度O(1)
    */
    // public int climbStairs(int n) {
    //     if (n < 3){
    //         return n;
    //     } else {
    //         int a = 1;
    //         int b = 2;
    //         for(int i = 2; i < n; i++) {
    //             a = (b += a) - a;
    //         }
    //         return b;
    //     }
    // }

    /* 斐波那契数列公式 */
    public int climbStairs(int n) {
        double sqrt_5 = Math.sqrt(5);
        return (int)(1/sqrt_5 * (Math.pow((1 + sqrt_5) / 2, n+1) - Math.pow((1-sqrt_5)/2, n+1)));
    }
}
// @lc code=end

