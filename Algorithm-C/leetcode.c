//
//  leetcode.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/11/6.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "leetcode.h"

int max_profit(int arr[], int size)
{
    int max = 0;
    for (int i = 1; i < size; i++) {
        if (arr[i] > arr[i-1]) {
            max += arr[i] - arr[i-1];
        }
    }
    printf("股票最大利润为 : %d",max);
    return max;
}

void yanghui_triangle(int rows)
{
    int arr[100][100] = {1};
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j <= i; j++) {
            
            if (j == 0 || j == i) {
                arr[i][j] = 1;
                printf("%d",arr[i][j]);
            } else {
                arr[i][j] = arr[i-1][j-1] + arr[i-1][j];
                printf("%d",arr[i][j]);
            }
            
        }
        printf("\n");
    }
}

int effective_brackets(char arr[], int size)
{
    if (size <= 0 || size % 2 == 1) {
        printf("不是 有效括号");
        return 1;
    }
//    int falg = 0;
//    for (int i = 0; i < size; i+=2) {
//        if (!((arr[i] == '(' && arr[i+1] == ')')||(arr[i] == '{' && arr[i+1] == '}')||(arr[i] == '[' && arr[i+1] == ']'))) {
//            falg = 1;
//            break;
//        }
//    }
//    if (falg == 1) {
//        for (int j = 0; j < size/2; j++) {
//            if (!((arr[j] == '(' && arr[size-j-1] == ')')||(arr[j] == '{' && arr[size-j-1] == '}')||(arr[j] == '[' && arr[size-j-1] == ']'))) {
//                    printf("不是 有效括号");
//                    return 1;
//            }
//        }
//    }
    printf("是 有效括号");
    return 0;
}
