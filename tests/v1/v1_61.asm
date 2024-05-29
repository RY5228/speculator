
; Copyright 2021 IBM Corporation
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.

[BITS 64]
    %include "common.inc"
    %include "pmc.inc"

    section .data
    warmup_cnt: db 1
    fill: times 63 db 0

    warmup_cnt_fake: dw 2
    fill2: times 62 db 0

    array1: times 256 db 0
    array1_len: equ $-array1         ; 计算数组长度

    array1_size: dq 12
    fill3: times 60 db 0

    fill4: times 256 db 0
    bucket: db 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, \
               11, 12, 13, 14, 15, 16, 17, 18, 19, 20, \
               21, 22, 23, 24, 25, 26, 27, 28, 29, 30, \
               31, 32, 33, 34, 35, 36, 37, 38, 39, 40, \
               41, 42, 43, 44, 45, 46, 47, 48, 49, 50, \
               51, 52, 53, 54, 55, 56, 57, 58, 59, 00
    bucket_len: equ $-bucket          ; 计算数组长度
    fill5: times 196 db 0
    bucket_ptr: dq 0

    dev_file: db '/dev/cpu/',VICTIM_PROCESS_STR,'/msr',0
    fd: dq 0
    val: dq 0
    len: equ $-val
    lea_array: times 40 db 0
    junk: db 1
    ;##### DATA STARTS HERE ########


    ;##### DATA ENDS HERE ########

    section .text
    global perf_test_entry:function
    global snippet:function

perf_test_entry:
    push rbp
    mov rbp, rsp
    sub rsp, len

    check_pinning VICTIM_PROCESS
    msr_open
    msr_seek
    mov r14, 1
    lea rax, [bucket]
    mov [bucket_ptr], rax
.data:
    clflush [array1_size]
    mov rax, 0
    cpuid
    lfence
    reset_counter
    start_counter
    mov r15, QWORD[array1_size]
    cmp r14d, r15d
    je .else


















    ;##### SNIPPET STARTS HERE ######
    ; mov r15d, DWORD[warmup_cnt]
    mov rax,QWORD [bucket_ptr]
    movzx edx,BYTE [rax+59]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]
    movzx edx,BYTE [rax+rdx*1]

    lea rax, [array1]
    movzx eax,BYTE [rax+r14*1] ; y = array1[x]
    lea eax, [rcx+rax*1-60] ; z = y + idx - 60
    shl eax, 0x9
    cdqe
    lea rdx, [lea_array]
    lea eax, [rdx+rax*1]
    mov rbx, 2
    xor rdx, rdx
    div rbx
    ;##### SNIPPET ENDS HERE ######
    ;lea rax, [lea_array+rax*2]
.else:
    lfence
    stop_counter

    inc r14
    cmp r14, 13
    jl .data

    msr_close
    exit 0
