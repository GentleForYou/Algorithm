//
//  triangle.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/17.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "triangle.h"

void triangle1()
{
    for (int i = 0; i <= 5; i++) {
        for (int j = 0; j < i; j++) {
            printf("* ");
        }
        printf("\n");
    }
}

void triangle2(int rows){
    
    for (int i = 0; i < rows; i++) {
        //d打印*的起始位置
        for (int k = 0; k < rows-i; k++) {
            printf("  ");
        }
        //打印多少个*
        for (int j = 0; j < 2*i+1; j++) {
            printf("* ");
        }
        printf("\n");
    }
}

void triangle_num1(int rows){
    for (int i = 0; i < rows; i++) {
        //起始位置
        for (int k = 0; k < rows - i; k++) {
            printf("  ");
        }
        for (int j = 0; j < 2*i+1; j++) {
            if (j <= i) {
              printf("%d ",j+i+1);
            } else {
              printf("%d ",i+1+(2*i-j));
            }
            
        }
        printf("\n");
    }
}

void triangle_num2(int rows){
    int num = 1;
    for (int i = 0; i < rows  ; i++) {
        //打印位置下标
        for (int k = 0; k < rows-i; k++) {
            printf(" ");
        }
        
        for (int j = 0; j <= i; j++) {
            if (i == 0 || j == 0) {
                num = 1;
            } else {
                num = num*(i-j+1)/j;
            }
            printf("%d ",num);
        }
        printf("\n");
    }
    
}

void triangle3(int n)
{
    for (int i = 0; i < n; i++) {
        if (i <= n/2) {//上
            //打印位置
            for (int j = 0; j < n/2-i; j++) {
                printf(" ");
            }
            //打印*个数
            for (int j = 0; j < 2*i+1; j++) {
                printf("*");
            }
            printf("\n");
        } else {//下
            //打印位置
            for (int j = 0; j < i-n/2; j++) {
                printf(" ");
            }
            //打印*个数
            for (int j = 0; j < 2*(n-i-1)+1; j++) {
                printf("*");
            }
            printf("\n");
        }
    }
}
