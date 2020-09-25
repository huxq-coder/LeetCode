import UIKit

/**
 给定一个可包含重复数字的序列，返回所有不重复的全排列。

 示例:

 输入: [1,1,2]
 输出:
 [
   [1,1,2],
   [1,2,1],
   [2,1,1]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思考：返回所有不重复的全排列
 结果集不重复：1、根据 47.全排列，得到所有结果后去重
            2、过程中去重（推荐）
 */

/**
 // 结果去重
 
 var result = Set<[Int]>()
 func permuteUnique(_ nums: [Int]) -> [[Int]] {
     if nums.count == 0 {
         return [[Int]]()
     }
     let used = [Bool](repeating: false, count: nums.count)
     dfs(nums, nums.count, 0, [Int](), used)
     return [[Int]](result)
 }

 func dfs(_ nums: [Int],_ length: Int, _ depth: Int, _ path: [Int], _ used: [Bool]) {
     if length == depth {
         result.insert(path)
         return
     }
     for i in 0..<length {
         if !used[i] {
             var newPath = path
             newPath.append(nums[i])
             
             var newUsed = used
             newUsed[i] = true
             dfs(nums, length, depth+1, newPath, newUsed)
         }
     }
 }
 
 */

/**
 过程去重
 参考题解： https://leetcode-cn.com/problems/permutations-ii/solution/hui-su-suan-fa-python-dai-ma-java-dai-ma-by-liwe-2/
 */

var result = [[Int]]()
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    // 过滤边界
    if nums.count == 0 {
        return result
    }
    // 排序
    let nums = nums.sorted()
    // 访问标记位
    var used = [Bool](repeating: false, count: nums.count)
    // 访问路径
    var path = [Int]()
    dfs(nums, nums.count, 0, &path, &used)
    return result
}

func dfs(_ nums: [Int],_ length: Int, _ depth: Int, _ path: inout [Int], _ used: inout [Bool]) {
    // 递归终结条件
    if length == depth {
        result.append([Int](path))
        return
    }
    for i in 0..<length {
        // 未被访问
        if !used[i] {
            // 剪枝条件
            // i > 0 ： 0是第一个，没有之前的元素可以比较是否重复，保证后面的nums[i-1]有效
            // used[i-1] 或者 !used[i-1] 的选择可以参考题解的最后解释
            if i > 0 && nums[i] == nums[i-1] && !used[i-1] {
                continue
            }
            // 添加路径
            path.append(nums[i])
            // 添加标记位 已访问
            used[i] = true
            dfs(nums, length, depth+1, &path, &used)
            // 回溯
            used[i] = false
            path.removeLast()
        }
    }
}

let nums = [1,1,2]
permuteUnique(nums)

