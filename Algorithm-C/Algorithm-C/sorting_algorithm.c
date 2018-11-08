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


int * quick_sort_recursive(int arr[], int start, int end)
{
    if (start >= end) {
        return arr;
    }
    int mid = arr[end];
    int left = start,right = end-1;
    while (left < right) {
        while (arr[left] < mid && left < right) {
            left++;
        }
        while (arr[right] >= mid && left < right) {
            right--;
        }
        swap(&arr[left], &arr[right]);
    }
    
    if (arr[left] > arr[end]) {
        swap(&arr[left], &arr[end]);
    } else {
        left++;
    }
    if (left) {
        quick_sort_recursive(arr, start, left-1);
    }
    quick_sort_recursive(arr, left+1, end);
    return arr;
}
