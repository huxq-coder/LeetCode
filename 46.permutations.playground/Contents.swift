import UIKit

/**
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 参考链接：https://leetcode-cn.com/problems/permutations/solution/hui-su-suan-fa-python-dai-ma-java-dai-ma-by-liweiw/
 */

// 结果集合
var result = [[Int]]()

func permute(_ nums: [Int]) -> [[Int]] {
    let length = nums.count
    // 过滤边界值
    if length == 0 {
        return result
    }
    // 标记是否访问过的数组
    let used = [Bool](repeating: false, count: length)
    // 访问路径
    let path = [Int]()
    dfs(nums, length, 0, path, used)
    return result
}

/// 深度优先
/// - Parameters:
///   - nums: 原始数组
///   - length: 原始数组长度
///   - depth: 深度优先递归深度
///   - path: 访问路径数组
///   - used: 访问标记位数组
func dfs(_ nums: [Int], _ length: Int, _ depth: Int, _ path: [Int], _ used: [Bool]) {
    // 递归终结条件，路径长度等于数组长度，本次递归结束，路径添加到结果集中
    if length == depth {
        result.append(path)
        return
    }
    // 递归逻辑
    for i in 0..<length {
        // 未访问过
        if !used[i] {
            // 每次尝试都使用新的 路径 和 访问标记位，如果使用path和used需要回溯
            // 访问的路径添加到路径之中
            var newPath = path
            newPath.append(nums[i])
            // 标记为已访问
            var newUsed = used
            newUsed[i] = true
            dfs(nums, length, depth+1, newPath, newUsed)
        }
    }
}

var nums = [1,2,3]
print(permute(nums))


