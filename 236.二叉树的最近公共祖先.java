import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/*
 * @lc app=leetcode.cn id=236 lang=java
 *
 * [236] 二叉树的最近公共祖先
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {

    Map<Integer, TreeNode> map = new HashMap<>();
    Set<Integer> visited = new HashSet<>();

    /**
     * 参考题解：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/solution/er-cha-shu-de-zui-jin-gong-gong-zu-xian-by-leetc-2/
     * 从上向下遍历所有的父节点，将父节点保存到哈希表中
     * 从p节点向上查询它的父节点，保存到临时数组中，判断临时数组中是否包含q节点
     */
    // public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    //     dfs(root);
    //     // 从p节点向上访问所有的父节点
    //     while (p != null) {
    //         visited.add(p.val);
    //         p = map.get(p.val);
    //     }
    //     // 从q节点向上访问所有的父节点
    //     while (q != null) {
    //         // 判断p的父节点是否包含q的父节点
    //         if (visited.contains(q.val)) {
    //             return q;
    //         }
    //         q = map.get(q.val);
    //     }
    //     return null;
    // }
    /**
     * 递归遍历父节点
     * @param node
     */
    public void dfs(TreeNode node) {
        if (node.left != null) {
            map.put(node.left.val, node);
            dfs(node.left);
        }
        if (node.right != null) {
            map.put(node.right.val, node);
            dfs(node.right);
        }
    }

    /**
     * 递归
     * 参考题解：链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/solution/236-er-cha-shu-de-zui-jin-gong-gong-zu-xian-hou-xu/
     * 若 root 是 p, q 的 最近公共祖先 ，则只可能为以下情况之一：
        p 和 q 在 root 的子树中，且分列 root 的 异侧（即分别在左、右子树中）；
        p = root，且 q 在 root 的左或右子树中；
        q = root ，且 p 在 root 的左或右子树中；
     */
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        // root 为null 或者 p、q 是 root
        if (root == null || q == root || p == root) {
            return root;
        }
        TreeNode left = lowestCommonAncestor(root.left, p, q);
        TreeNode right = lowestCommonAncestor(root.right, p, q);
        // 左边为null，共同祖先节点在右侧
        if (left == null) {
            return right;
        }
        // 右边为null，共同祖先节点在左侧
        if (right == null) {
            return left;
        }
        return root;
    }

}

// @lc code=end

