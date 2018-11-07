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


#define maxsize 100
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
int effective_brackets(char arr[], int size)
{
    Stack st = {"",-1};
    int result = 0;
    for (int i = 0; i < size; i++) {
        switch (arr[i]) {
            case '(':
                result = push(&st, arr[i]);
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case '[':
                result = push(&st, arr[i]);
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case '{':
                result = push(&st, arr[i]);
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
                
                
            case ')':
                result = pop(&st, arr[i]);
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case ']':
                result = pop(&st, arr[i]);
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
            case '}':
                result = pop(&st, arr[i]);
                if (result == 1) {
                    printf("不是 有效括号");
                    return 1;
                }
                break;
                
            default:
                break;
        }
    }
    if (st.top > -1) {
        printf("不是 有效括号");
        return 1;
    }
    printf("是 有效括号");
    return 0;
}
