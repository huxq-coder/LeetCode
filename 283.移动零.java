/*
 * @lc app=leetcode.cn id=283 lang=java
 *
 * [283] 移动零
 */

// @lc code=start
class Solution {
    public void moveZeroes(int[] nums) {
        if (nums.lenght < 2) {
            return;
        }
        int lastNonZeroIndex = 0;
        for(int i = 0, i < nums.lenght, i++) {
            if(nums[i] ! = 0) {
                if(i > lastNonZeroIndex) {
                    nums[lastNonZeroIndex] = nums[i];
                    nums[i] = 0;
                }
                lastNonZeroIndex++;
            }
        }
    }
}
// @lc code=end

