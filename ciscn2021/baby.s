	.text
	.file	"baby.bc"
	.globl	docheck                         # -- Begin function docheck
	.p2align	4, 0x90
	.type	docheck,@function
docheck:                                # @docheck
	.cfi_startproc
# %bb.0:
	movq	map@GOTPCREL(%rip), %rdi
	leaq	4(%rdi), %rax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movw	$0, -4(%rsp)
	movl	$0, -8(%rsp)
	movzbl	-4(%rax), %esi
	cmpb	$0, -8(%rsp,%rsi)
	jne	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movb	$1, -8(%rsp,%rsi)
	movzbl	-3(%rax), %esi
	cmpb	$0, -8(%rsp,%rsi)
	jne	.LBB0_3
# %bb.49:                               #   in Loop: Header=BB0_1 Depth=1
	movb	$1, -8(%rsp,%rsi)
	movzbl	-2(%rax), %esi
	cmpb	$0, -8(%rsp,%rsi)
	jne	.LBB0_3
# %bb.50:                               #   in Loop: Header=BB0_1 Depth=1
	movb	$1, -8(%rsp,%rsi)
	movzbl	-1(%rax), %esi
	cmpb	$0, -8(%rsp,%rsi)
	jne	.LBB0_3
# %bb.51:                               #   in Loop: Header=BB0_1 Depth=1
	movb	$1, -8(%rsp,%rsi)
	movzbl	(%rax), %ecx
	cmpb	$0, -8(%rsp,%rcx)
	jne	.LBB0_3
# %bb.52:                               # %.thread107
                                        #   in Loop: Header=BB0_1 Depth=1
	addq	$1, %rdx
	addq	$5, %rax
	cmpq	$5, %rdx
	jl	.LBB0_1
# %bb.53:                               # %.thread54.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_54:                               # =>This Inner Loop Header: Depth=1
	movw	$0, -12(%rsp)
	movl	$0, -16(%rsp)
	movzbl	(%rdi,%rax), %edx
	cmpb	$0, -16(%rsp,%rdx)
	jne	.LBB0_3
# %bb.55:                               #   in Loop: Header=BB0_54 Depth=1
	movb	$1, -16(%rsp,%rdx)
	movzbl	5(%rdi,%rax), %edx
	cmpb	$0, -16(%rsp,%rdx)
	jne	.LBB0_3
# %bb.44:                               #   in Loop: Header=BB0_54 Depth=1
	movb	$1, -16(%rsp,%rdx)
	movzbl	10(%rdi,%rax), %edx
	cmpb	$0, -16(%rsp,%rdx)
	jne	.LBB0_3
# %bb.45:                               #   in Loop: Header=BB0_54 Depth=1
	movb	$1, -16(%rsp,%rdx)
	movzbl	15(%rdi,%rax), %edx
	cmpb	$0, -16(%rsp,%rdx)
	jne	.LBB0_3
# %bb.46:                               #   in Loop: Header=BB0_54 Depth=1
	movb	$1, -16(%rsp,%rdx)
	movzbl	20(%rdi,%rax), %ecx
	cmpb	$0, -16(%rsp,%rcx)
	jne	.LBB0_3
# %bb.47:                               # %.thread60106
                                        #   in Loop: Header=BB0_54 Depth=1
	addq	$1, %rax
	cmpq	$5, %rax
	jl	.LBB0_54
# %bb.48:                               # %.preheader77.preheader
	leaq	4(%rdi), %rax
	xorl	%edx, %edx
	movq	row@GOTPCREL(%rip), %rsi
	jmp	.LBB0_5
.LBB0_41:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	-1(%rax), %ecx
	cmpb	(%rax), %cl
	ja	.LBB0_3
.LBB0_42:                               # %.thread64105
                                        #   in Loop: Header=BB0_5 Depth=1
	addq	$1, %rdx
	addq	$5, %rax
	cmpq	$5, %rdx
	jge	.LBB0_43
.LBB0_5:                                # %.preheader77
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi,%rdx,4), %ecx
	cmpb	$2, %cl
	je	.LBB0_8
# %bb.6:                                # %.preheader77
                                        #   in Loop: Header=BB0_5 Depth=1
	cmpb	$1, %cl
	jne	.LBB0_9
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=1
	movzbl	-4(%rax), %ecx
	cmpb	-3(%rax), %cl
	jae	.LBB0_9
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_5 Depth=1
	movzbl	-4(%rax), %ecx
	cmpb	-3(%rax), %cl
	ja	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_5 Depth=1
	movzbl	1(%rsi,%rdx,4), %ecx
	cmpb	$1, %cl
	je	.LBB0_33
# %bb.10:                               #   in Loop: Header=BB0_5 Depth=1
	cmpb	$2, %cl
	jne	.LBB0_34
# %bb.11:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	-3(%rax), %ecx
	cmpb	-2(%rax), %cl
	jbe	.LBB0_34
	jmp	.LBB0_3
.LBB0_33:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	-3(%rax), %ecx
	cmpb	-2(%rax), %cl
	jb	.LBB0_3
.LBB0_34:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	2(%rsi,%rdx,4), %ecx
	cmpb	$2, %cl
	je	.LBB0_37
# %bb.35:                               #   in Loop: Header=BB0_5 Depth=1
	cmpb	$1, %cl
	jne	.LBB0_38
# %bb.36:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	-2(%rax), %ecx
	cmpb	-1(%rax), %cl
	jae	.LBB0_38
	jmp	.LBB0_3
.LBB0_37:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	-2(%rax), %ecx
	cmpb	-1(%rax), %cl
	ja	.LBB0_3
.LBB0_38:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	3(%rsi,%rdx,4), %ecx
	cmpb	$2, %cl
	je	.LBB0_41
# %bb.39:                               #   in Loop: Header=BB0_5 Depth=1
	cmpb	$1, %cl
	jne	.LBB0_42
# %bb.40:                               #   in Loop: Header=BB0_5 Depth=1
	movzbl	-1(%rax), %ecx
	cmpb	(%rax), %cl
	jae	.LBB0_42
	jmp	.LBB0_3
.LBB0_43:                               # %.preheader.preheader
	movl	$4, %edx
	xorl	%esi, %esi
	movq	col@GOTPCREL(%rip), %rcx
	jmp	.LBB0_14
.LBB0_12:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	(%rdi,%rdx), %eax
	cmpb	5(%rdi,%rdx), %al
	jb	.LBB0_3
.LBB0_13:                               # %.thread71104
                                        #   in Loop: Header=BB0_14 Depth=1
	addq	$1, %rsi
	addq	$5, %rdx
	movb	$1, %al
	cmpq	$4, %rsi
	jge	.LBB0_4
.LBB0_14:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-4(%rcx,%rdx), %eax
	cmpb	$2, %al
	je	.LBB0_17
# %bb.15:                               # %.preheader
                                        #   in Loop: Header=BB0_14 Depth=1
	cmpb	$1, %al
	jne	.LBB0_18
# %bb.16:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-4(%rdi,%rdx), %eax
	cmpb	1(%rdi,%rdx), %al
	jbe	.LBB0_18
	jmp	.LBB0_3
.LBB0_17:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-4(%rdi,%rdx), %eax
	cmpb	1(%rdi,%rdx), %al
	jb	.LBB0_3
.LBB0_18:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-3(%rcx,%rdx), %eax
	cmpb	$1, %al
	je	.LBB0_21
# %bb.19:                               #   in Loop: Header=BB0_14 Depth=1
	cmpb	$2, %al
	jne	.LBB0_22
# %bb.20:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-3(%rdi,%rdx), %eax
	cmpb	2(%rdi,%rdx), %al
	jae	.LBB0_22
	jmp	.LBB0_3
.LBB0_21:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-3(%rdi,%rdx), %eax
	cmpb	2(%rdi,%rdx), %al
	ja	.LBB0_3
.LBB0_22:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-2(%rcx,%rdx), %eax
	cmpb	$2, %al
	je	.LBB0_25
# %bb.23:                               #   in Loop: Header=BB0_14 Depth=1
	cmpb	$1, %al
	jne	.LBB0_26
# %bb.24:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-2(%rdi,%rdx), %eax
	cmpb	3(%rdi,%rdx), %al
	jbe	.LBB0_26
	jmp	.LBB0_3
.LBB0_25:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-2(%rdi,%rdx), %eax
	cmpb	3(%rdi,%rdx), %al
	jb	.LBB0_3
.LBB0_26:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-1(%rcx,%rdx), %eax
	cmpb	$2, %al
	je	.LBB0_29
# %bb.27:                               #   in Loop: Header=BB0_14 Depth=1
	cmpb	$1, %al
	jne	.LBB0_30
# %bb.28:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-1(%rdi,%rdx), %eax
	cmpb	4(%rdi,%rdx), %al
	jbe	.LBB0_30
	jmp	.LBB0_3
.LBB0_29:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	-1(%rdi,%rdx), %eax
	cmpb	4(%rdi,%rdx), %al
	jb	.LBB0_3
.LBB0_30:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	(%rcx,%rdx), %eax
	cmpb	$2, %al
	je	.LBB0_12
# %bb.31:                               #   in Loop: Header=BB0_14 Depth=1
	cmpb	$1, %al
	jne	.LBB0_13
# %bb.32:                               #   in Loop: Header=BB0_14 Depth=1
	movzbl	(%rdi,%rdx), %eax
	cmpb	5(%rdi,%rdx), %al
	jbe	.LBB0_13
.LBB0_3:
	xorl	%eax, %eax
.LBB0_4:                                # %.thread73
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end0:
	.size	docheck, .Lfunc_end0-docheck
	.cfi_endproc
                                        # -- End function
	.globl	fill_number                     # -- Begin function fill_number
	.p2align	4, 0x90
	.type	fill_number,@function
fill_number:                            # @fill_number
	.cfi_startproc
# %bb.0:
	movl	$4, %eax
	xorl	%ecx, %ecx
	movq	map@GOTPCREL(%rip), %rsi
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_17:                               # %.thread.4
                                        #   in Loop: Header=BB1_1 Depth=1
	addb	$-48, %dl
	movb	%dl, (%rsi,%rax)
.LBB1_18:                               #   in Loop: Header=BB1_1 Depth=1
	addq	$1, %rcx
	addq	$5, %rax
	cmpq	$5, %rcx
	jge	.LBB1_19
.LBB1_1:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, -4(%rsi,%rax)
	movzbl	-4(%rdi,%rax), %edx
	je	.LBB1_5
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	cmpb	$48, %dl
	je	.LBB1_6
	jmp	.LBB1_3
	.p2align	4, 0x90
.LBB1_5:                                # %.thread
                                        #   in Loop: Header=BB1_1 Depth=1
	addb	$-48, %dl
	movb	%dl, -4(%rsi,%rax)
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	cmpb	$0, -3(%rsi,%rax)
	movzbl	-3(%rdi,%rax), %edx
	je	.LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_1 Depth=1
	cmpb	$48, %dl
	je	.LBB1_9
	jmp	.LBB1_3
	.p2align	4, 0x90
.LBB1_8:                                # %.thread.1
                                        #   in Loop: Header=BB1_1 Depth=1
	addb	$-48, %dl
	movb	%dl, -3(%rsi,%rax)
.LBB1_9:                                #   in Loop: Header=BB1_1 Depth=1
	cmpb	$0, -2(%rsi,%rax)
	movzbl	-2(%rdi,%rax), %edx
	je	.LBB1_11
# %bb.10:                               #   in Loop: Header=BB1_1 Depth=1
	cmpb	$48, %dl
	je	.LBB1_12
	jmp	.LBB1_3
	.p2align	4, 0x90
.LBB1_11:                               # %.thread.2
                                        #   in Loop: Header=BB1_1 Depth=1
	addb	$-48, %dl
	movb	%dl, -2(%rsi,%rax)
.LBB1_12:                               #   in Loop: Header=BB1_1 Depth=1
	cmpb	$0, -1(%rsi,%rax)
	movzbl	-1(%rdi,%rax), %edx
	je	.LBB1_14
# %bb.13:                               #   in Loop: Header=BB1_1 Depth=1
	cmpb	$48, %dl
	je	.LBB1_15
	jmp	.LBB1_3
	.p2align	4, 0x90
.LBB1_14:                               # %.thread.3
                                        #   in Loop: Header=BB1_1 Depth=1
	addb	$-48, %dl
	movb	%dl, -1(%rsi,%rax)
.LBB1_15:                               #   in Loop: Header=BB1_1 Depth=1
	cmpb	$0, (%rsi,%rax)
	movzbl	(%rdi,%rax), %edx
	je	.LBB1_17
# %bb.16:                               #   in Loop: Header=BB1_1 Depth=1
	cmpb	$48, %dl
	je	.LBB1_18
.LBB1_3:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retq
.LBB1_19:
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end1:
	.size	fill_number, .Lfunc_end1-fill_number
	.cfi_endproc
                                        # -- End function
	.globl	valid                           # -- Begin function valid
	.p2align	4, 0x90
	.type	valid,@function
valid:                                  # @valid
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movb	(%rdi), %al
	movb	$1, %bpl
	testb	%al, %al
	je	.LBB2_6
# %bb.1:                                # %.lr.ph.preheader
	addb	$-48, %al
	cmpb	$5, %al
	ja	.LBB2_5
# %bb.2:                                # %.lr.ph7.preheader
	movq	%rdi, %rbx
	callq	strlen@PLT
	movl	$1, %ecx
	.p2align	4, 0x90
.LBB2_3:                                # %.lr.ph7
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rax, %rcx
	jae	.LBB2_6
# %bb.4:                                # %..lr.ph_crit_edge
                                        #   in Loop: Header=BB2_3 Depth=1
	movzbl	(%rbx,%rcx), %edx
	addb	$-48, %dl
	addq	$1, %rcx
	cmpb	$6, %dl
	jb	.LBB2_3
.LBB2_5:
	xorl	%ebp, %ebp
.LBB2_6:                                # %._crit_edge
	movl	%ebp, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	valid, .Lfunc_end2-valid
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	input@GOTPCREL(%rip), %rbx
	movl	$.L.str, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movq	%rbx, %rdi
	callq	strlen@PLT
	cmpl	$25, %eax
	jne	.LBB3_9
# %bb.1:
	movb	(%rbx), %al
	testb	%al, %al
	je	.LBB3_6
# %bb.2:                                # %.lr.ph.i.preheader
	addb	$-48, %al
	cmpb	$5, %al
	ja	.LBB3_9
# %bb.3:                                # %.lr.ph
	movq	%rbx, %rdi
	callq	strlen@PLT
	movl	$1, %ecx
	.p2align	4, 0x90
.LBB3_4:                                # =>This Inner Loop Header: Depth=1
	cmpq	%rax, %rcx
	jae	.LBB3_6
# %bb.5:                                # %..lr.ph_crit_edge.i
                                        #   in Loop: Header=BB3_4 Depth=1
	movzbl	(%rbx,%rcx), %edx
	addb	$-48, %dl
	addq	$1, %rcx
	cmpb	$5, %dl
	jbe	.LBB3_4
	jmp	.LBB3_9
.LBB3_6:                                # %.loopexit
	movq	input@GOTPCREL(%rip), %rdi
	callq	fill_number@PLT
	testb	%al, %al
	je	.LBB3_9
# %bb.7:
	callq	docheck@PLT
	testb	%al, %al
	je	.LBB3_9
# %bb.8:
	movq	input@GOTPCREL(%rip), %rsi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB3_9:                                # %valid.exit
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	map,@object                     # @map
	.data
	.globl	map
	.p2align	4
map:
	.zero	5
	.zero	5
	.asciz	"\000\000\004\000"
	.asciz	"\000\000\000\003"
	.zero	5
	.size	map, 25

	.type	row,@object                     # @row
	.globl	row
	.p2align	4
row:
	.ascii	"\000\000\000\001"
	.asciz	"\001\000\000"
	.ascii	"\002\000\000\001"
	.zero	4
	.asciz	"\001\000\001"
	.size	row, 20

	.type	col,@object                     # @col
	.globl	col
	.p2align	4
col:
	.ascii	"\000\000\002\000\002"
	.zero	5
	.asciz	"\000\000\000\001"
	.ascii	"\000\001\000\000\001"
	.size	col, 20

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	input,@object                   # @input
	.comm	input,100,16
	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"CISCN{MD5(%s)}"
	.size	.L.str.1, 15

	.type	input_unhex,@object             # @input_unhex
	.comm	input_unhex,100,16
	.type	steps,@object                   # @steps
	.comm	steps,100,16
	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
