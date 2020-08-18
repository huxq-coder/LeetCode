/*
 * @lc app=leetcode.cn id=15 lang=java
 *
 * [15] 三数之和
 */

// @lc code=start
class Solution {
    /**
     * 暴力解法
     * 三次循环，使用set集合去重
     */
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        Set<List<Integer>> result = new HashSet<>();
        for(int i = 0; i < nums.length; i++){
            for(int j = 0; j < nums.length; j++){
                for(int k = 0; k < nums.length; k++){
                    if(nums[i] + nums[j] + nums[k] == 0){
                        List<Integer> list = new ArrayList<>();
                        list.insert(nums[i]);
                        list.insert(nums[j]);
                        list.insert(nums[k]);
                        result.insert(list);
                    }
                }
            }
        }
        return new ArrayList(result)
    }

    /**
     * 双指针
     * a + b + c = 0
     * a + b = -c
     */
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> result = new ArrayList<>();
        if(nums.length < 3) return result;
        for(int i = 0; i < nums.length; i++){
            if(nums[i] > 0) break;
            // 去重
            if(i > 0 && nums[i] == nums[i-1]) continue;
            // 假定第一个值为target 求剩余两个数的值，头尾指针，向中间靠拢
            int target = -nums[i];
            int left = i + 1;
            int right = nums.length - 1;
            while(left < right) {
                if(nums[left] + nums[right] == target) {
                    List<Integer> list = new ArrayList<>();
                    list.add(nums[i]);
                    list.add(nums[left]);
                    list.add(nums[right]);
                    result.add(list);
                    // 去重
                    while(left < right && nums[left] == nums[left+1]) left++;
                    while(left < right && nums[right] == nums[right-1]) right--;

                    left++;
                    right--;
                } else if(nums[left] + nums[right] < target) {
                    left++;
                } else {
                    right--;
                }
            }
        }
        return result;
    }
}
// @lc code=end

