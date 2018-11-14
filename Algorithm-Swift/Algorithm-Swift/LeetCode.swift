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
    
}
