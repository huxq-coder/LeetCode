import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/*
 * @lc app=leetcode.cn id=46 lang=java
 *
 * [46] 全排列
 */

// @lc code=start
class Solution {
    // 结果集
    List<List<Integer>> result;
    public List<List<Integer>> permute(int[] nums) {
        result = new ArrayList();
        // 过滤边界条件
        if (nums.length == 0) {
            return result;
        }
        // 访问的路径
        List<Integer> path = new ArrayList<>();
        // 标记被访问数组
        boolean[] used = new boolean[nums.length];
        dfs(nums, nums.length, 0, path, used);
        return result;
    }

    public void dfs(int[] nums, int length, int depth, List<Integer> path, boolean[] used) {
        // 递归终结条件
        if (depth == length){
            result.add(path);
            return;
        }
        // 递归逻辑
        for (int i = 0; i < nums.length; i++) {
            // 未被使用
            if (!used[i]) {
                // 新建 路径数组 和 已访问数组 保存当前的状态
                List<Integer> newPath = new ArrayList<>(path);
                newPath.add(nums[i]);

                boolean[] newUsed = Arrays.copyOf(used, length);                
                newUsed[i] = true;
                // 下一层递归
                dfs(nums, nums.length, depth+1, newPath, newUsed);
            }
        }
    }
}
// @lc code=end

