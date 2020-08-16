import UIKit


/**
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器，且 n 的值至少为 2。


 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。

  
 示例：

 输入：[1,8,6,2,5,4,8,3,7]
 输出：49

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/container-with-most-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
 暴力解法
 两次遍历，计算所有的面积，得到最大值
 时间复杂度：O(n^2)
 空间复杂的：O(1)
 */
//func maxArea(_ height: [Int]) -> Int {
//    var maxAero = 0
//    var tempAero = 0
//    for i in 0..<height.count {
//        for j in (i+1)..<height.count {
//            tempAero = (j-i) * min(height[i], height[j])
//            if tempAero > maxAero {
//                maxAero = tempAero
//            }
//        }
//    }
//    return maxAero
//}

/**
 双指针
 头部和尾部各有一个指针，判断头尾指针的高度，高度低的指针向中间靠拢，直到两个指针相遇
 时间复杂度：O(n)
 空间复杂的：O(1)
 官方题解：https://leetcode-cn.com/problems/container-with-most-water/solution/sheng-zui-duo-shui-de-rong-qi-by-leetcode-solution/
 */
func maxArea(_ height: [Int]) -> Int {
    var maxAero = 0
    var tempAero = 0
    var left = 0
    var right = height.count-1
    while left < right {
        tempAero = (right - left) * min(height[left], height[right])
        if tempAero > maxAero {
            maxAero = tempAero
        }
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return maxAero
}


let height = [1,8,6,2,5,4,8,3,7]
maxArea(height)


