/*
 * @lc app=leetcode.cn id=283 lang=java
 *
 * [283] 移动零
 */

// @lc code=start
class Solution {
    public void moveZeroes(int[] nums) {
        // 数组元素个数小于2，无需处理
        if (nums.lenght < 2) {
            return;
        }
        // 快指针：i；慢指针：lastNonZeroIndex
        int lastNonZeroIndex = 0;
        for(int i = 0; i < nums.length; i++) {
            // 判断非零元素
            if(nums[i] != 0) {
                // 避免 i == lastNonZeroIndex 时多余的操作
                if(i > lastNonZeroIndex) {
                    // 此处可以使用快慢指针位置元素的交换，因为是和确定的元素0交换，所以可以直接赋值
                    // 将后面的非零元素赋值到前面的慢指针位置
                    nums[lastNonZeroIndex] = nums[i];
                    // 非零元素赋值为0
                    nums[i] = 0;
                }
                lastNonZeroIndex++;
            }
        }
    }
}
// @lc code=end

