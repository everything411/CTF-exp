	.text
	.file	"task.ll"
	.globl	check                           # -- Begin function check
	.p2align	4, 0x90
	.type	check,@function
check:                                  # @check
	.cfi_startproc
# %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, 48(%rsp)
	movl	$1, 44(%rsp)
	movl	$0, 40(%rsp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movslq	40(%rsp), %rax
	movl	$what, %edi
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	callq	strlen
	movq	32(%rsp), %rcx                  # 8-byte Reload
	cmpq	%rax, %rcx
	jae	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	48(%rsp), %rax
	movslq	40(%rsp), %rcx
	movsbl	(%rax,%rcx), %edx
	movq	48(%rsp), %rax
	movl	40(%rsp), %esi
	addl	$1, %esi
	movslq	%esi, %rcx
	movl	$what, %edi
	movl	%edx, 28(%rsp)                  # 4-byte Spill
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	callq	strlen
	movq	8(%rsp), %rcx                   # 8-byte Reload
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%rcx, %rax
	xorl	%edx, %edx
                                        # kill: def $rdx killed $edx
	movq	(%rsp), %rdi                    # 8-byte Reload
	divq	%rdi
	movq	16(%rsp), %r8                   # 8-byte Reload
	movsbl	(%r8,%rdx), %esi
	movl	28(%rsp), %r9d                  # 4-byte Reload
	xorl	%esi, %r9d
	movslq	40(%rsp), %rdx
	movsbl	what(,%rdx), %esi
	cmpl	%esi, %r9d
	sete	%r10b
	andb	$1, %r10b
	movzbl	%r10b, %esi
	andl	44(%rsp), %esi
	movl	%esi, 44(%rsp)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	40(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB0_1
.LBB0_4:
	movl	44(%rsp), %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	check, .Lfunc_end0-check
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$168, %rsp
	.cfi_def_cfa_offset 176
	movl	$0, 164(%rsp)
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.1, %rdi
	movl	%eax, 84(%rsp)                  # 4-byte Spill
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.2, %rdi
	movl	%eax, 80(%rsp)                  # 4-byte Spill
	movb	$0, %al
	callq	printf
	leaq	96(%rsp), %rsi
	movabsq	$.L.str.3, %rdi
	movl	%eax, 76(%rsp)                  # 4-byte Spill
	movb	$0, %al
	callq	__isoc99_scanf
	leaq	96(%rsp), %rdi
	movl	%eax, 72(%rsp)                  # 4-byte Spill
	callq	strlen
	movl	$what, %edi
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	callq	strlen
	movq	64(%rsp), %rcx                  # 8-byte Reload
	cmpq	%rax, %rcx
	je	.LBB1_2
# %bb.1:
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
	movl	$1, 164(%rsp)
	jmp	.LBB1_14
.LBB1_2:
	leaq	96(%rsp), %rdi
	callq	check
	cmpl	$0, %eax
	je	.LBB1_8
# %bb.3:
	movl	$0, 92(%rsp)
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	leaq	96(%rsp), %rdi
	movslq	92(%rsp), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	callq	strlen
	movq	56(%rsp), %rcx                  # 8-byte Reload
	cmpq	%rax, %rcx
	jae	.LBB1_7
# %bb.5:                                #   in Loop: Header=BB1_4 Depth=1
	movslq	92(%rsp), %rax
	movsbl	96(%rsp,%rax), %ecx
	movslq	92(%rsp), %rax
	movl	$secret, %edi
	movl	%ecx, 52(%rsp)                  # 4-byte Spill
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	callq	strlen
	movq	40(%rsp), %rdx                  # 8-byte Reload
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movq	%rdx, %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	32(%rsp), %rsi                  # 8-byte Reload
	divq	%rsi
	movsbl	secret(,%rdx), %ecx
	movl	52(%rsp), %r8d                  # 4-byte Reload
	xorl	%ecx, %r8d
                                        # kill: def $r8b killed $r8b killed $r8d
	movslq	92(%rsp), %rdx
	movb	%r8b, 96(%rsp,%rdx)
# %bb.6:                                #   in Loop: Header=BB1_4 Depth=1
	movl	92(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 92(%rsp)
	jmp	.LBB1_4
.LBB1_7:
	leaq	96(%rsp), %rsi
	movabsq	$format, %rdi
	movb	$0, %al
	callq	printf
	jmp	.LBB1_13
.LBB1_8:
	movl	$0, 88(%rsp)
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	leaq	96(%rsp), %rdi
	movslq	88(%rsp), %rax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	callq	strlen
	movq	24(%rsp), %rcx                  # 8-byte Reload
	cmpq	%rax, %rcx
	jae	.LBB1_12
# %bb.10:                               #   in Loop: Header=BB1_9 Depth=1
	movslq	88(%rsp), %rax
	movsbl	flag(,%rax), %ecx
	movslq	88(%rsp), %rax
	movl	$secret, %edi
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	callq	strlen
	movq	8(%rsp), %rdx                   # 8-byte Reload
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%rdx, %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	(%rsp), %rsi                    # 8-byte Reload
	divq	%rsi
	movsbl	secret(,%rdx), %ecx
	movl	20(%rsp), %r8d                  # 4-byte Reload
	xorl	%ecx, %r8d
                                        # kill: def $r8b killed $r8b killed $r8d
	movslq	88(%rsp), %rdx
	movb	%r8b, 96(%rsp,%rdx)
# %bb.11:                               #   in Loop: Header=BB1_9 Depth=1
	movl	88(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 88(%rsp)
	jmp	.LBB1_9
.LBB1_12:
	leaq	96(%rsp), %rsi
	movabsq	$format, %rdi
	movb	$0, %al
	callq	printf
.LBB1_13:
	movl	$0, 164(%rsp)
.LBB1_14:
	movl	164(%rsp), %eax
	addq	$168, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	format,@object                  # @format
	.data
	.globl	format
	.p2align	4
format:
	.asciz	"\n\360\237\230\202\360\237\221\214\360\237\230\202\360\237\221\214\360\237\230\202\360\237\221\214 flag{%s} \360\237\221\214\360\237\230\202\360\237\221\214\360\237\230\202\360\237\221\214\360\237\230\202\n\n\000\000"
	.size	format, 64

	.type	flag,@object                    # @flag
	.globl	flag
	.p2align	4
flag:
	.asciz	"\035U#hJ7.8\006\026\003rUO=[bg9JmtGt`7U\013nNjD\001\003\0220\031;OVIaM\000\b,qu<g\035;K\000}Y\000\000\000\000\000\000\000"
	.size	flag, 64

	.type	what,@object                    # @what
	.globl	what
	.p2align	4
what:
	.asciz	"dNl.\03668\004D\022\034$\\Y=\013Zx\b\tvpy3\023\026 ~k#6E\007\021,\"JJO.HL|>\021\017j\0307B\036+\022\003ZG\000\000\000\000\000\000\000"
	.size	what, 64

	.type	secret,@object                  # @secret
	.globl	secret
	.p2align	4
secret:
	.asciz	"B\n|_\"\006\033g7#\\F\n)\t0Q8_{Y\023\030\rP\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	secret, 64

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Only the chosen one will know what the flag is!\n"
	.size	.L.str, 49

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Are you the chosen one?\n"
	.size	.L.str.1, 25

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"flag: "
	.size	.L.str.2, 7

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%64s"
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\n\360\237\230\240\360\237\230\241\360\237\230\240\360\237\230\241\360\237\230\240\360\237\230\241 You are not the chosen one! \360\237\230\241\360\237\230\240\360\237\230\241\360\237\230\240\360\237\230\241\360\237\230\240\n\n"
	.size	.L.str.4, 81

	.section	".note.GNU-stack","",@progbits
