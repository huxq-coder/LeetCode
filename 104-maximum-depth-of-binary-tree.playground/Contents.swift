import UIKit

/**
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


// Definition for a binary tree node.
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
  }
 
//class Solution {
//    // 层级临时变量
//    var maxLevel = 0
//
//    func maxDepth(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        helper(root, 0)
//        return maxLevel
//    }
//    // 递归二叉树
//    func helper(_ node: TreeNode?, _ level: Int) {
//        if node == nil {
//            // 记录最大层级
//            maxLevel = max(maxLevel, level)
//            return
//        }
//        // 向下一层级移动
//        helper(node?.left, level + 1)
//        helper(node?.right, level + 1)
//    }
//}

class Solution {
    
    /**
     层级高度 = max(left最大高度，right最大高度)
     left最大高度和right最大高度的计算同上
     时间复杂度为O(n)
     空间复杂度为O(height)
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftHeight = maxDepth(root?.left)
        let rightHeight = maxDepth(root?.right)
        return max(leftHeight, rightHeight) + 1
    }
}
