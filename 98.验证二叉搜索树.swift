/*
 * @lc app=leetcode.cn id=98 lang=swift
 *
 * [98] 验证二叉搜索树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    /**
    中序递归遍历
    */
    // func isValidBST(_ root: TreeNode?) -> Bool {
    //     var result = [Int]()
    //     if root == nil {
    //         return true
    //     }
    //     // 二叉搜索树，中序遍历，遍历之后的数组为严格递增
    //     helper(root!, &result)
    //     // 判断数组是否严格递增
    //     for i in 0..<result.count-1 {
    //         if result[i] >= result[i+1] {
    //             return false
    //         }
    //     }
    //     return true
    // }

    // 中序递归遍历 
    func helper(_ node: TreeNode?, _ result: inout [Int]) {
        if node == nil {
            return
        }
        helper(node?.left, &result)
        result.append(node!.val)
        helper(node?.right, &result)
    }

    /**
    迭代中序遍历
    */
    func isValidBST(_ root: TreeNode?) -> Bool {
        var stack = [TreeNode]()
        var root = root
        // 中间变量保存上一个节点的值
        var minValue = Int.min
        while !stack.isEmpty || root != nil {
            while root != nil {
                stack.append(root!)
                root = root!.left
            }
            let current = stack.popLast()
            // 过程中直接判断
            if current!.val <= minValue {
                return false
            }
            minValue = current!.val
            root = current!.right
        }
        return true
    }
}
// @lc code=end

