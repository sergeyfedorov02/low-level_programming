	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"\nOriginal array"
	.align	3
.LC1:
	.string	"%u "
	.align	3
.LC2:
	.string	"\n\nSorted array"
	.align	3
.LC3:
	.string	"\n\nMost common meaning"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	puts
	lui	s0,%hi(.LANCHOR0)
	addi	s1,s0,%lo(.LANCHOR0)
	addi	s2,s1,24
	addi	s0,s0,%lo(.LANCHOR0)
	lui	s3,%hi(.LC1)
.L2:
	lw	a1,0(s0)
	addi	a0,s3,%lo(.LC1)
	call	printf
	addi	s0,s0,4
	bne	s0,s2,.L2
	li	a1,6
	lui	a0,%hi(.LANCHOR0)
	addi	a0,a0,%lo(.LANCHOR0)
	call	sort
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	puts
	lui	s0,%hi(.LC1)
.L3:
	lw	a1,0(s1)
	addi	a0,s0,%lo(.LC1)
	call	printf
	addi	s1,s1,4
	bne	s1,s2,.L3
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	puts
	li	a1,6
	lui	a0,%hi(.LANCHOR0)
	addi	a0,a0,%lo(.LANCHOR0)
	call	findElement
	sext.w	a1,a0
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	printf
	li	a0,0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	array, @object
	.size	array, 24
array:
	.word	2
	.word	5
	.word	2
	.word	3
	.word	1
	.word	1
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
