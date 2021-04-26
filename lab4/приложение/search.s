	.file	"search.c"
	.option nopic
	.attribute arch, "rv64i2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	sort
	.type	sort, @function
sort:
	addi	a1,a1,-1
	beq	a1,zero,.L1
	slli	a2,a1,2
	add	a2,a0,a2
	j	.L3
.L4:
	addi	a5,a5,4
	beq	a5,a2,.L11
.L5:
	lw	a4,0(a5)
	lw	a3,4(a5)
	bleu	a4,a3,.L4
	sw	a3,0(a5)
	sw	a4,4(a5)
	j	.L4
.L11:
	addi	a1,a1,-1
	addi	a2,a2,-4
	beq	a1,zero,.L1
.L3:
	mv	a5,a0
	bne	a1,zero,.L5
	addi	a1,a1,-1
	addi	a2,a2,-4
	j	.L3
.L1:
	ret
	.size	sort, .-sort
	.align	1
	.globl	findElement
	.type	findElement, @function
findElement:
	li	a5,1
	beq	a1,a5,.L13
	addi	a5,a0,4
	slli	a6,a1,2
	add	a6,a0,a6
	li	a4,1
	li	a7,0
	j	.L16
.L14:
	addi	a4,a4,1
.L15:
	addi	a5,a5,4
	beq	a5,a6,.L20
.L16:
	lw	a3,-4(a5)
	lw	a2,0(a5)
	beq	a2,a3,.L14
	bgtu	a7,a4,.L18
	mv	a7,a4
	mv	t1,a3
	li	a4,1
	j	.L15
.L18:
	li	a4,1
	j	.L15
.L20:
	bleu	a7,a4,.L13
.L17:
	mv	a0,t1
	ret
.L13:
	slli	a1,a1,2
	add	a1,a0,a1
	lw	t1,-4(a1)
	j	.L17
	.size	findElement, .-findElement
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
