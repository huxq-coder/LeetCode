/*
 * @lc app=leetcode.cn id=11 lang=java
 *
 * [11] 盛最多水的容器
 */

// @lc code=start
class Solution {
    /**
     * 暴力解法
     * 两次循环得到所有的结果，然后返回最大值
     * 时间复杂度O(n^2)
     * 空间复杂度O(1)
     */
    // public int maxArea(int[] height) {
    //     int max = 0;
    //     for(int i = 0; i < height.length; i++) {
    //         for(int j = i+1; j < height.length; j++) {
    //             int tempMax = (j - i) * Math.min(height[i], height[j]);
    //             max = Math.max(tempMax, max);
    //         }
    //     }
    //     return max;
    // }
    /**
     * 双指针
     * 头部和尾部向中间移动， 每次判断头部和尾部的值，哪个小，哪个向中间移动
     * 官方题解：https://leetcode-cn.com/problems/container-with-most-water/solution/sheng-zui-duo-shui-de-rong-qi-by-leetcode-solution/
     * 
     * 时间复杂度O(n)
     * 空间复杂度O(1)
     * 
     * 执行用时：4 ms, 在所有 Java 提交中击败了67.78%的用户
     * 内存消耗：39.9 MB, 在所有 Java 提交中击败了83.04%的用户
     */
    // public int maxArea(int[] height) {
    //     int length = height.length;
    //     int max = 0;
    //     int j = length - 1;
    //     int i = 0;
    //     while(j > i) {
    //         int tempMax = (j - i) * Math.min(height[i], height[j]);
    //         max = Math.max(tempMax, max);
    //         if(height[i] > height[j]) {
    //             j--;
    //         } else {
    //             i++;
    //         }
    //     }
    //     return max;
    // }

    /**
     * 双指针
     * 在上面解法的基础上进行优化，执行用时缩短
     * 
     * 时间复杂度O(n)
     * 空间复杂度O(1)
     * 
     * 执行结果：通过
     * 执行用时：2 ms, 在所有 Java 提交中击败了99.16%的用户
     * 内存消耗：39.9 MB, 在所有 Java 提交中击败了84.48%的用户
     */
    // public int maxArea(int[] height) {
    //     int max = 0;
    //     int tempMax = 0;
    //     int j = height.length - 1;
    //     int i = 0;
    //     while(j > i) {
    //         /**
    //          * 既然有 height[i] > height[j]判断，就将tempMax的计算放到了具体的判断里面，避免了一次 Math.min 的操作
    //          */
    //         if(height[i] > height[j]) {
    //             tempMax = (j - i) * height[j];
    //             // max = Math.max(tempMax, max);
    //             // 使用上面代码，执行时间会增加 1 ms
    //             max = max > tempMax ? max : tempMax;
    //             j--;
    //         } else {
    //             tempMax = (j - i) * height[i];
    //             max = max > tempMax ? max : tempMax;
    //             i++;
    //         }
    //     }
    //     return max;
    // }


    public int maxArea(int[] height) {
        int max = 0;
        int right = height.length - 1;
        int left = 0;
        while(left < right) {
            int rightHeight = height[right];
            int leftHeight = height[left];
            int minHeight = Math.min(leftHeight, rightHeight);
            int tempMax = (right - left) * minHeight;
            if(tempMax > max) max = tempMax;
            if(height[left] < height[right]) {
                // 左边高度一直小于最小高度时，直接向中间靠拢，无需再计算面积
                while(left < right) {
                    leftHeight = height[left];
                    if(leftHeight <= minHeight)
                        left++;
                    else
                        break;
                }
            } else {
                while(left < right) {
                    // 右边高度一直小于最小高度，向中间靠拢，无需计算面积
                    rightHeight = height[right];
                    if(rightHeight <= minHeight)
                        right--;
                    else
                        break;
                }
            }
        }
        return max;
    }
}
// @lc code=end

