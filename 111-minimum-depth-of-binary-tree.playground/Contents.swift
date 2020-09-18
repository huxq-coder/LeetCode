import UIKit
/**
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明: 叶子节点是指没有子节点的节点。

 示例:

 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回它的最小深度  2.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree
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

class Solution {
    
//    func minDepth(_ root: TreeNode?) -> Int {
//        if (root == nil) {
//            return 0
//        }
//        if root?.left == nil && root?.right == nil {
//            return 1
//        }
//        var depth = Int.max
//        if root?.left != nil {
//            depth = min(minDepth(root?.left), depth)
//        }
//        if root?.right != nil {
//            depth = min(depth, minDepth(root?.right))
//        }
//        return depth+1
//    }
    
    /** 参考题解：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/solution/li-jie-zhe-dao-ti-de-jie-shu-tiao-jian-by-user7208/
     
     叶子节点的定义是左孩子和右孩子都为 null 时叫做叶子节点
     当 root 节点左右孩子都为空时，返回 1
     当 root 节点左右孩子有一个为空时，返回不为空的孩子节点的深度
     当 root 节点左右孩子都不为空时，返回左右孩子较小深度的节点值
     */
    func minDepth(_ root: TreeNode?) -> Int {
        // 根节点为空
        if (root == nil) {
            return 0
        }
        // 根节点没有左右子树
        if root?.left == nil && root?.right == nil {
            return 1
        }
        // 左子树为空，深度以右子树为准
        if root?.left == nil {
            return minDepth(root?.right) + 1
        }
        // 右子树为空，深度以左子树为准
        if root?.right == nil {
            return minDepth(root?.left) + 1
        }
        // 有左子树 且 有右子树 ，以值小的为准
        return min(minDepth(root?.left), minDepth(root?.right)) + 1
    }
}
