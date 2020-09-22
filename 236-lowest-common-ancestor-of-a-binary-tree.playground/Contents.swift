import UIKit
/**
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]

 示例 1:

 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 示例 2:

 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出: 5
 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
  

 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉树中。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree
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
    
    // 父节点字典
    var dict = [Int: TreeNode]()
    // 已访问节点数组
    var visited = [TreeNode]()
    
    /**
     从上到下遍历父节点，保存所有的父节点到字典中
     */
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//        dfs(root)
//        // 从p节点想上访问其所有的父节点，保存到已访问数组中
//        var p = p
//        while p != nil {
//            visited.append(p!)
//            // 移动到p的父节点
//            p = dict[p!.val]
//        }
//        var q = q
//        while q != nil {
//            if visited.contains(where: { (node) -> Bool in
//                return q!.val == node.val
//            }) {
//                return q
//            }
//            q = dict[q!.val]
//        }
//        return nil
//    }
    
    func dfs(_ node: TreeNode?) {
        if node?.left != nil {
            dict[node!.left!.val] = node
            dfs(node?.left)
        }
        if node?.right != nil {
            dict[node!.right!.val] = node
            dfs(node?.right)
        }
    }
    
    /**
     递归
     */
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // 如果root为nil、p 为 root、q为root，则共同祖先节点为root
        if root == nil || p?.val == root?.val || q?.val == root?.val {
            return root
        }
        // 递归左右子树
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        // 左子树为nil，则祖先节点在右子树中
        if left == nil {
            return right
        }
        // 右子树为nil，则祖先节点在左子树中
        if right == nil {
            return left
        }
        return root
    }
}
