.globl binary_search
binary_search:
      mov r12, #0 //startIndex
      sub r8, r2, #1 //endIndex in r14
      mov r7, r8, LSR #1 // middleIndex in r7
      sub r9, r12, #1 // saving -1 in r9
      mov r3, #1 // saving 1 into r3 (NumIters)
      sub r4, r12, #1 // keyIndex in r4
while:
      cmp r4, r9 // keyIndex == -1?
      bne return
      cmp r12, r8 //startIndex > endIndex?
      bgt return
      add r5, r0, r7, LSL #2 //find  address of numbers[middeIndex]
      ldr r6, [r5] // save numbers[middleIndex] into r6
      cmp r6, r1 // numbers[middleIndex] == key?
      beq else1
      cmp r6, r1 // numbers[middleIndex] > key?
      bgt else2
      b else3
else1:
      mov r4, r7 // keyIndex = middleIndex
      b rest
else2:
      sub r8, r7, #1 //endIndex = middleIndex -1
      b rest
else3:
      add r12, r7, #1 // startIndex = middleIndex +1
      b rest
rest:
      add r5, r0, r7, LSL #2 //find  address of numbers[middeIndex]
      mov r10, #0
      sub r11, r10, r3 //calculating -NumIters
      str r11, [r5] // numbers[middleIndex] = -NumIters
      sub r5, r8, r12 // endIndex-startIndex
      add r7, r12, r5, LSR #1 // middleIndex = startIndex + (endIndex - startIndex)/2
      add r3, r3, #1 // NumIters++
      b while
return:
      mov r0, r4
      mov pc, lr

  
