import UIKit

/**
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/invert-binary-tree
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
 
/**
 递归
 从叶子节点开始翻转，从下往上一直到root节点，最后交换左右子树
 时间复杂度为O(n)
 空间复杂度为O(n)
 */
func invertTree(_ root: TreeNode?) -> TreeNode? {
    // 递归终结条件
    if root == nil {
        return nil
    }
    // 递归左子树
    let leftNode = invertTree(root?.left)
    // 递归右子树
    let rightNode = invertTree(root?.right)
    // 左右之树交换
    root?.right = leftNode
    root?.left = rightNode
    return root
}

