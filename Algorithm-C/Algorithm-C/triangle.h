//
//  triangle.h
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/17.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//  三角图案

#ifndef triangle_h
#define triangle_h

#include <stdio.h>

#endif /* triangle_h */

/*
 输出以下图形
 *
 * *
 * * *
 * * * *
 * * * * *
 */

void triangle1();

/*
 输出金字塔
         *
       * * *
     * * * * *
   * * * * * * *
 * * * * * * * * *
 */
void triangle2(int rows);

/*
 输出如下数字
         1
       2 3 2
     3 4 5 4 3
   4 5 6 7 6 5 4
 5 6 7 8 9 8 7 6 5
 */
void triangle_num1(int rows);

/*
 杨辉三角
          1
        1   1
      1   2   1
    1   3   3    1
  1  4    6   4   1
1  5   10   10  5   1
 */
void triangle_num2(int rows);

/*
 d打印下图
   *
  ***
 *****
*******
 *****
  ***
   *
  */
void triangle3(int n);
