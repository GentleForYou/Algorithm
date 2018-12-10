//
//  sorting_algorithm.c
//  Algorithm-C
//
//  Created by 掌上汇通Mac on 2018/10/22.
//  Copyright © 2018 掌上汇通Mac. All rights reserved.
//

#include "sorting_algorithm.h"

int * bubbleSort(int arr[], int size)
{
    int temp;
    int flag = 1;
    for (int i = 0; i < size-1 && flag == 1; i++) {
        flag = 0;
        for (int j = 0; j < size - i-1; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                flag = 1;
            }
        }
    }
    return arr;
}


void swap(int *p, int *q)
{
    int temp = *p;
    *p = *q;
    *q = temp;
}
int * selection_sort(int arr[], int size)
{
    for (int i = 0; i < size-1; i++) {
        int min = i;
        for (int j = i+1; j < size; j++) {
            if (arr[j] < arr[min]) {
                min = j;
            }
        }
        swap(&arr[min], &arr[i]);
    }
    return arr;
}


int * insertion_sort(int arr[], int size)
{
    int i,j,temp;
    for (i = 1; i < size; i++) {
        temp = arr[i];
        for (j = i; j > 0 && arr[j-1] > temp; j--) {
            arr[j] = arr[j-1];
        }
        arr[j] = temp;
    }
    return arr;
}

int * shell_sort(int arr[], int size)
{
    int gap, i, j,temp;
    
    for (gap = size >> 1; gap > 0; gap = gap >>= 1) {
        for (i = gap; i < size; i++) {
            temp = arr[i];
            for (j = i-gap; j >= 0 && arr[j] > temp; j -= gap) {
                arr[j+gap] = arr[j];
            }
            arr[j+gap] = temp;
        }
    }
    
    return arr;
}

int * merge_sort(int arr[], int reg[], int start, int end)
{
    if (start >= end) {
        return arr;
    }

    int mid = start + (end-start)/2;
    int start1 = start;
    int end1 = mid;
    int start2 = mid+1;
    int end2 = end;
    merge_sort(arr, reg, start1, end1);
    merge_sort(arr, reg, start2, end2);
    int k = start;
    while (start1 <= end1 && start2 <= end2) {
        reg[k++] = arr[start1] < arr[start2] ? arr[start1++] : arr[start2++];
    }
    while (start1 <= end1) {
        reg[k++] = arr[start1++];
    }
    while (start2 <= end2) {
        reg[k++] = arr[start2++];
    }
    for (int k = start; k <= end; k++) {
        arr[k] = reg[k];
    }
    
    return arr;
}
/*
 快排方法:
 1.找出首,尾,中,三个数的中位数,将其与尾数交换
 2.用双指针,i指向d头,jd指向尾-1的数
 */
int * quick_sort_recursive(int arr[], int low, int high)
{
    if (low >= high) {
        return arr;
    }
    int i = low, j = high, mid = (high-low)/2;
    //三位数取中为基准数
    if ((arr[low]<arr[mid]&&arr[mid]<arr[high])||(arr[high]<arr[mid]&&arr[mid]<arr[low])) {
        mid = mid;
    } else if ((arr[mid]<arr[low]&&arr[low]<arr[high])||(arr[high]<arr[low]&&arr[low]<arr[mid])) {
        mid = low;
    } else {
        mid = high;
    }
    //将基准数暂时放在末尾
    if (mid != high) {
        swap(&arr[mid], &arr[high]);
        mid = high;
    }
    j = high-1;
    while (i < j) {
        if (arr[i] < arr[mid]) {
            i++;
        } else if (arr[j] > arr[mid]) {
            j--;
        } else {
            swap(&arr[i], &arr[j]);
            i++;
        }
    }
    //将尾部的基准数交换回来
    swap(&arr[i], &arr[mid]);
    //分治思想递归
    quick_sort_recursive(arr, low, i-1);
    quick_sort_recursive(arr, i+1, high);
    return arr;
}
