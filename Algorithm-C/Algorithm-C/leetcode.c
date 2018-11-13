//
//  leetcode.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/11/6.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "leetcode.h"
#include <math.h>

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


#define maxsize 1000000
typedef struct Stack{
    char data[maxsize];
    int top;
}Stack;

int push(Stack *st, char str){
    if (st->top == maxsize-1) {//满栈
        return 1;
    }
    ++st->top;
    st->data[st->top] = str;
    return 0;
}
int pop(Stack *st, char str){
    if (st->top == -1) {//空栈
        return 1;
    }
    if ( !((str == ')'&&st->data[st->top]=='(')||(str == ']'&&st->data[st->top]=='[')||(str == '}'&&st->data[st->top]=='{')) ) {
        return 1;
    }
    st->data[st->top] = '\0';
    --st->top;
    
    return 0;
}
int isValid(char* s)
{
    Stack st = {"",-1};
    int result = 0;
    int p= 0;
    while (*(s+p) != '\0') {
        switch (*(s+p)) {
            case '(':
                result = push(&st, *(s+p));
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case '[':
                result = push(&st, *(s+p));
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case '{':
                result = push(&st, *(s+p));
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
                
                
            case ')':
                result = pop(&st, *(s+p));
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case ']':
                result = pop(&st, *(s+p));
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case '}':
                result = pop(&st, *(s+p));
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
                
            default:
                break;
        }
        p++;
    }

    if (st.top > -1) {
        printf("不是 有效括号");
        return 1;
    }
    printf("是 有效括号");
    return 0;
}

int surfaceArea(int** grid, int gridRowSize, int gridColSizes)
{
    int sum = 0,a = 0,b = 0, c = 0, d = 0,Va = 0,Vb = 0, Vc = 0, Vd = 0;
    for (int i = 0; i < gridRowSize; i++) {
        for (int j = 0; j < gridColSizes; j++) {
            if (*((int *)grid+gridColSizes*i+j) > 0) {
                sum += 2;
                //前后左右
                a = j <  gridColSizes-1 ? *((int *)grid+gridColSizes*i+j+1) : 0;
                b = j >  0 ? *((int *)grid+gridColSizes*i+j-1) : 0;
                c = i >  0 ? *((int *)grid+gridColSizes*(i-1)+j) : 0;
                d = i <  gridRowSize-1 ? *((int *)grid+gridColSizes*(i+1)+j) : 0;
                Va = *((int *)grid+gridColSizes*i+j) - a > 0 ? *((int *)grid+gridColSizes*i+j) - a : 0;
                Vb = *((int *)grid+gridColSizes*i+j) - b > 0 ? *((int *)grid+gridColSizes*i+j) - b : 0;
                Vc = *((int *)grid+gridColSizes*i+j) - c > 0 ? *((int *)grid+gridColSizes*i+j) - c : 0;
                Vd = *((int *)grid+gridColSizes*i+j) - d > 0 ? *((int *)grid+gridColSizes*i+j) - d : 0;
                sum += (Va+Vb+Vc+Vd);
            }
        }
    }
    printf("表面积之和为 : %d",sum);
    return sum;
}
