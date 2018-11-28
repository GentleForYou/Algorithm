//
//  LeetCode.swift
//  Algorithm-Swift
//
//  Created by 掌上汇通Mac on 2018/11/8.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

import UIKit

class LeetCode: NSObject {
    /*
     单调数列
     如果数组是单调递增或单调递减的，那么它是单调的。
     
     如果对于所有 i <= j，A[i] <= A[j]，那么数组 A 是单调递增的。 如果对于所有 i <= j，A[i]> = A[j]，那么数组 A 是单调递减的。
     
     当给定的数组 A 是单调数组时返回 true，否则返回 false。
     示例 1：
     
     输入：[1,2,2,3]
     输出：true
     示例 2：
     
     输入：[6,5,4,4]
     输出：true
     示例 3：
     
     输入：[1,3,2]
     输出：false
     示例 4：
     
     输入：[1,2,4,5]
     输出：true
     示例 5：
     
     输入：[1,1,1]
     输出：true
     */
     func isMonotonic(_ A: [Int]) -> Bool {
        
        
        var a = 0,b=0;
        for (i,item) in A.enumerated() {
            if (i > 0) {
                if(item > A[i-1]) {//递增
                    a = 1
                } else if(item < A[i-1]) {//递减
                    b = 1
                } else {
                    if (a != b && a > 0) {
                        a = 1
                    } else if (a != b && b > 0) {
                        b = 1
                    }
                }
                if a*b > 0 {
                    return false;
                }
            }
        }
        return true;
    }
    
    /*
     二叉树的最大深度
     给定一个二叉树，找出其最大深度。
     
     二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
     
     说明: 叶子节点是指没有子节点的节点。
     
     示例：
     给定二叉树 [3,9,20,null,null,15,7]，
     
     3
     / \
     9  20
     /  \
     15   7
     返回它的最大深度 3 。
     */
    func maxDepth(_ root : TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right))+1
    }
    
    /*
     螺旋矩阵 III
     在 R 行 C 列的矩阵上，我们从 (r0, c0) 面朝东面开始
     
     这里，网格的西北角位于第一行第一列，网格的东南角位于最后一行最后一列。
     
     现在，我们以顺时针按螺旋状行走，访问此网格中的每个位置。
     
     每当我们移动到网格的边界之外时，我们会继续在网格之外行走（但稍后可能会返回到网格边界）。
     
     最终，我们到过网格的所有 R * C 个空间。
     
     按照访问顺序返回表示网格位置的坐标列表。
     
     
     
     示例 1：
     
     输入：R = 1, C = 4, r0 = 0, c0 = 0
     输出：[[0,0],[0,1],[0,2],[0,3]]
     
     
     
     
     示例 2：
     
     输入：R = 5, C = 6, r0 = 1, c0 = 4
     输出：[[1,4],[1,5],[2,5],[2,4],[2,3],[1,3],[0,3],[0,4],[0,5],[3,5],[3,4],[3,3],[3,2],[2,2],[1,2],[0,2],[4,5],[4,4],[4,3],[4,2],[4,1],[3,1],[2,1],[1,1],[0,1],[4,0],[3,0],[2,0],[1,0],[0,0]]
     
     
     
     
     提示：
     
     1 <= R <= 100
     1 <= C <= 100
     0 <= r0 < R
     0 <= c0 < C
     */
    
    func spiralMatrixIII(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        
        
        var r = r0,c = c0,n = 1,direction = 1,count = 1
        var arr : Array<Array<Int>> = [[]]
        arr.removeAll()
        arr.append([r,c])
        while arr.count < R * C {
            
            switch direction%4 {//上右下左
            case 0: r-=1
            case 1: c+=1
            case 2: r+=1
            case 3: c-=1
            default: break
            }
            if (r >= 0 && r < R && c >= 0 && c < C) {
                arr.append([r,c])
            }
            
            if count < n {
                count += 1
            } else {
            if direction % 4 == 0 || direction % 4 == 2 {
                n+=1
            }
            count = 1
       direction += 1
            }
        }
        return arr
        
        
    }
    
    /*
     索引处的解码字符串
     给定一个编码字符串 S。为了找出解码字符串并将其写入磁带，从编码字符串中每次读取一个字符，并采取以下步骤：
     
     如果所读的字符是字母，则将该字母写在磁带上。
     如果所读的字符是数字（例如 d），则整个当前磁带总共会被重复写 d-1 次。
     现在，对于给定的编码字符串 S 和索引 K，查找并返回解码字符串中的第 K 个字母。
     
     
     
     示例 1：
     
     输入：S = "leet2code3", K = 10
     输出："o"
     解释：
     解码后的字符串为 "leetleetcodeleetleetcodeleetleetcode"。
     字符串中的第 10 个字母是 "o"。
     示例 2：
     
     输入：S = "ha22", K = 5
     输出："h"
     解释：
     解码后的字符串为 "hahahaha"。第 5 个字母是 "h"。
     示例 3：
     
     输入：S = "a2345678999999999999999", K = 1
     输出："a"
     解释：
     解码后的字符串为 "a" 重复 8301530446056247680 次。第 1 个字母是 "a"。
     
     
     提示：
     
     2 <= S.length <= 100
     S 只包含小写字母与数字 2 到 9 。
     S 以字母开头。
     1 <= K <= 10^9
     解码后的字符串保证少于 2^63 个字母。
     */
    
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        
        func isNum(_ char: Character) -> Bool {
            if char == "2" || char == "3" || char == "4" || char == "5" || char == "6" || char == "7" || char == "8" || char == "9" {
                return true
            }
            return false
        }
        var size = 0, k = K
        for char in S {
            if isNum(char) {
                let str = String(char)
                size *= (Int(str) ?? 1-1)
            } else {
                size += 1
            }
        }
        for item in S.reversed() {
            k %= size
            if k == 0 && !isNum(item){
                return String(item)
            }
            if isNum(item) {
                let str = String(item)
                size /= (Int(str) ?? 1)
            } else {
                size -= 1
            }
        }
        return ""
        
        
    }
    
    /*
     公平的糖果交换
     爱丽丝和鲍勃有不同大小的糖果棒：A[i] 是爱丽丝拥有的第 i 块糖的大小，B[j] 是鲍勃拥有的第 j 块糖的大小。
     
     因为他们是朋友，所以他们想交换一个糖果棒，这样交换后，他们都有相同的糖果总量。（一个人拥有的糖果总量是他们拥有的糖果棒大小的总和。）
     
     返回一个整数数组 ans，其中 ans[0] 是爱丽丝必须交换的糖果棒的大小，ans[1] 是 Bob 必须交换的糖果棒的大小。
     
     如果有多个答案，你可以返回其中任何一个。保证答案存在。
     
     
     
     示例 1：
     
     输入：A = [1,1], B = [2,2]
     输出：[1,2]
     示例 2：
     
     输入：A = [1,2], B = [2,3]
     输出：[1,2]
     示例 3：
     
     输入：A = [2], B = [1,3]
     输出：[2,3]
     示例 4：
     
     输入：A = [1,2,5], B = [2,4]
     输出：[5,4]
     
     
     提示：
     
     1 <= A.length <= 10000
     1 <= B.length <= 10000
     1 <= A[i] <= 100000
     1 <= B[i] <= 100000
     保证爱丽丝与鲍勃的糖果总量不同。
     答案肯定存在。
     */
    
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        
        var i = 0,j = 0,c = 0,sumA = 0, sumB = 0
        let a = A.sorted()
        let b = B.sorted()
        for item in a {
            sumA += item
        }
        for item in b {
            sumB += item
        }
        c = sumA - sumB
        while (i < a.count && j < b.count) {
            if a[i] - b[j] == c/2 {
                return [a[i],b[j]]
            } else if a[i] - b[j] > c/2{
                j += 1
            } else {
                i += 1
            }
        }
        return []
        
    }
    
    /*
     救生艇
     第 i 个人的体重为 people[i]，每艘船可以承载的最大重量为 limit。
     
     每艘船最多可同时载两人，但条件是这些人的重量之和最多为 limit。
     
     返回载到每一个人所需的最小船数。(保证每个人都能被船载)。
     
     
     示例 1：
     
     输入：people = [1,2], limit = 3
     输出：1
     解释：1 艘船载 (1, 2)
     示例 2：
     
     输入：people = [3,2,2,1], limit = 3
     输出：3
     解释：3 艘船分别载 (1, 2), (2) 和 (3)
     示例 3：
     
     输入：people = [3,5,3,4], limit = 5
     输出：4
     解释：4 艘船分别载 (3), (3), (4), (5)
     提示：
     
     1 <= people.length <= 50000
     1 <= people[i] <= limit <= 30000
     */
    
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
       
        let arr = people.sorted()
        var sum = 0,i=0,j=arr.count-1
        while i <= j {
            if i == j {
                sum += 1
                break
            } else {
                if arr[i]+arr[j] <= limit {
                    i += 1
                }
                    j -= 1
                    sum += 1
            }
        }
        return sum
        
        
    }
    
    /*
     三维形体投影面积
     在 N * N 的网格中，我们放置了一些与 x，y，z 三轴对齐的 1 * 1 * 1 立方体。
     
     每个值 v = grid[i][j] 表示 v 个正方体叠放在单元格 (i, j) 上。
     
     现在，我们查看这些立方体在 xy、yz 和 zx 平面上的投影。
     
     投影就像影子，将三维形体映射到一个二维平面上。
     
     在这里，从顶部、前面和侧面看立方体时，我们会看到“影子”。
     
     返回所有三个投影的总面积。
     
     
     
     示例 1：
     
     输入：[[2]]
     输出：5
     示例 2：
     
     输入：[[1,2],[3,4]]
     输出：17
     解释：
     这里有该形体在三个轴对齐平面上的三个投影(“阴影部分”)。
     
     示例 3：
     
     输入：[[1,0],[0,2]]
     输出：8
     示例 4：
     
     输入：[[1,1,1],[1,0,1],[1,1,1]]
     输出：14
     示例 5：
     
     输入：[[2,2,2],[2,1,2],[2,2,2]]
     输出：21
     
     
     提示：
     
     1 <= grid.length = grid[0].length <= 50
     0 <= grid[i][j] <= 50
     */
    func projectionArea(_ grid: [[Int]]) -> Int {
        
        var Sa = 0,Sb = 0,Sc = 0,maxRow = 0
        var lineArr : Array<Int> = []
        for (i,arr) in grid.enumerated() {//行
            maxRow = 0
            for (j,item) in arr.enumerated() {//列
                if item > 0 {
                    Sa += 1
                }
                if item > maxRow {
                    maxRow = item
                }
                if i == 0 {
                    lineArr.append(item)
                } else {
                    if item > lineArr[j] {
                        lineArr[j] = item
                    }
                }
            }
            Sb += maxRow
        }
        for item in lineArr {
            Sc += item
        }
        return Sa+Sb+Sc
        
    }
    /*
     石子游戏
     亚历克斯和李用几堆石子在做游戏。偶数堆石子排成一行，每堆都有正整数颗石子 piles[i] 。
     
     游戏以谁手中的石子最多来决出胜负。石子的总数是奇数，所以没有平局。
     
     亚历克斯和李轮流进行，亚历克斯先开始。 每回合，玩家从行的开始或结束处取走整堆石头。 这种情况一直持续到没有更多的石子堆为止，此时手中石子最多的玩家获胜。
     
     假设亚历克斯和李都发挥出最佳水平，当亚历克斯赢得比赛时返回 true ，当李赢得比赛时返回 false 。
     
     
     
     示例：
     
     输入：[5,3,4,5]
     输出：true
     解释：
     亚历克斯先开始，只能拿前 5 颗或后 5 颗石子 。
     假设他取了前 5 颗，这一行就变成了 [3,4,5] 。
     如果李拿走前 3 颗，那么剩下的是 [4,5]，亚历克斯拿走后 5 颗赢得 10 分。
     如果李拿走后 5 颗，那么剩下的是 [3,4]，亚历克斯拿走后 4 颗赢得 9 分。
     这表明，取前 5 颗石子对亚历克斯来说是一个胜利的举动，所以我们返回 true 。
     
     
     提示：
     
     2 <= piles.length <= 500
     piles.length 是偶数。
     1 <= piles[i] <= 500
     sum(piles) 是奇数。
     */
    
    func stoneGame(_ piles: [Int]) -> Bool {
       
        return true 
        
    }
    
    /*
     统计所有小于非负整数 n 的质数的数量。
     示例:
     
     输入: 10
     输出: 4
     解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
     */
    func countPrimes(_ n: Int) -> Int {
        
        var sum = 1
        var flag = true
        if n <= 2 {
            return 0
        }
        for i in 2...(n-1) {
            flag = true
            for j in 2...Int(sqrt(Double(i)))+1 {
                if i % j == 0 {
                    flag = false
                    break
                }
            }
            if flag {
                sum += 1
            }
        }
        return sum
        
    }
    /*
     在二维平面上计算出两个由直线构成的矩形重叠后形成的总面积。
     
     每个矩形由其左下顶点和右上顶点坐标表示，如图所示。
     
     Rectangle Area
     
     示例:
     
     输入: -3, 0, 3, 4, 0, -1, 9, 2
     输出: 45
     说明: 假设矩形面积不会超出 int 的范围。
     */
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        
        let a = abs(C-A)*abs(D-B)
        let b = abs(G-E)*abs(H-F)
        var leftX1=0,leftX2=0,rightX1=0,rightX2=0,topY1=0,topY2=0,downY1=0,downY2=0,w=0,h=0
        if A < C {
            leftX1 = A
            rightX1 = C
        } else {
            leftX1 = C
            rightX1 = A
        }
        if E < G {
            leftX2 = E
            rightX2 = G
        } else {
            leftX2 = G
            rightX2 = E
        }
        if B < D {
            downY1 = B
            topY1 = D
        } else {
            downY1 = D
            topY1 = B
        }
        if F < H {
            downY2 = F
            topY2 = H
        } else {
            downY2 = H
            topY2 = F
        }
        if leftX2 >= rightX1 || leftX1 >= rightX2 || downY2 >= topY1 || downY1 >= topY2  {
            return a+b
        }
        if leftX2 >= leftX1 && leftX2 <= rightX1 {
            if rightX2 <= rightX1 {
                w = rightX2 - leftX2
            } else {
                w = rightX1 - leftX2
            }
        } else {
            if rightX1 <= rightX2 {
                w = rightX1 - leftX1
            } else {
                w = rightX2 - leftX1
            }
        }
        if downY2 >= downY1 && downY2 <= topY1 {
            if topY2 <= topY1 {
                h = topY2 - downY2
            } else {
                h = topY1 - downY2
            }
        } else {
            if topY1 <= topY2 {
                h = topY1 - downY1
            } else {
                h = topY2 - downY1
            }
        }
        return a+b-w*h
        
    }
    
    /*
     给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
     
     示例 1:
     
     输入: n = 12
     输出: 3
     解释: 12 = 4 + 4 + 4.
     示例 2:
     
     输入: n = 13
     输出: 2
     解释: 13 = 4 + 9.
     */
    
    func numSquares(_ n : Int) -> Int {

        var dp = [Int](repeating: Int(INTMAX_MAX), count: n+1)
        dp[0] = 0
        for i in 0...n {
            var j = 1
            while i + j*j <= n {
                dp[i+j*j] = min(dp[i+j*j], dp[i]+1)
                j += 1
            }
        }
        return dp.last ?? 1
        
    }
    /*
     三角形最小路径和
     给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
     
     例如，给定三角形：
     
     [
     [2],
     [3,4],
     [6,5,7],
     [4,1,8,3]
     ]
     自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
     */
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        var dp = triangle[triangle.count-1]
            var i = triangle.count-2
            while i >= 0 {
                for j in 0...i {
                    dp[j] = triangle[i][j] + min(dp[j], dp[j+1])
                }
                i -= 1
            }
        return dp[0]
        
    }
    
    /*
     打家劫舍
     你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
     
     给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
     
     示例 1:
     
     输入: [1,2,3,1]
     输出: 4
     解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。
     示例 2:
     
     输入: [2,7,9,3,1]
     输出: 12
     解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。
     */
    func rob(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: nums.count)
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2...nums.count-1 {
            dp[i] = max(nums[i]+dp[i-2], dp[i-1])
        }
        return dp[nums.count-1]
    }
    /*
     买卖股票的最佳时机
     给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
     
     如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
     
     注意你不能在买入股票前卖出股票。
     
     示例 1:
     
     输入: [7,1,5,3,6,4]
     输出: 5
     解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
     示例 2:
     
     输入: [7,6,4,3,1]
     输出: 0
     解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
     */
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count <= 1 {
            return 0
        } else if prices.count == 2 {
            return max(0,prices[1]-prices[0])
        }
        var maxL = 0, maxR = 0
        for i in 0...prices.count - 2 {
            for j in i + 1...prices.count - 1 {
                maxL = max(maxL, prices[j])
            }
            maxR = max(maxR, maxL - prices[i])
            maxL = 0
        }
        return maxR
        
    }
   /*
     最大子序和
     给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
     
     示例:
     
     输入: [-2,1,-3,4,-1,2,1,-5,4],
     输出: 6
     解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        var sum = nums[0], m = nums[0]
        for i in 1...nums.count-1 {
            if m > 0 {
                m += nums[i]
            } else {
                m = nums[i]
            }
            if sum < m {
                sum = m
            }
        }
        return sum
    }
    /*
     回文数
     判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
     
     示例 1:
     
     输入: 121
     输出: true
     示例 2:
     
     输入: -121
     输出: false
     解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
     示例 3:
     
     输入: 10
     输出: false
     解释: 从右向左读, 为 01 。因此它不是一个回文数。
     */
    
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var a = 0,sum = x
        while sum > 0 {
            a = a*10 + sum % 10
            sum /= 10
        }
        return a == x ? true : false
    }
    
}


