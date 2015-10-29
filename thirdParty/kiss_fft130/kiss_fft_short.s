	.file	"kiss_fft.c"
# GNU C (Ubuntu 4.8.2-19ubuntu1) version 4.8.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.8.2, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D FIXED_POINT kiss_fft.c
# --param l1-cache-size=32 --param l1-cache-line-size=64
# --param l2-cache-size=8192 -mtune=corei7 -march=x86-64
# -auxbase-strip kiss_fft_short.s -O3 -ffast-math -fomit-frame-pointer
# -fverbose-asm -fstack-protector -Wformat -Wformat-security
# options enabled:  -faggressive-loop-optimizations -fassociative-math
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fcx-limited-range
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize -fdwarf2-cfi-asm
# -fearly-inlining -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics -finline-functions
# -finline-functions-called-once -finline-small-functions -fipa-cp
# -fipa-cp-clone -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fivopts -fkeep-static-consts -fleading-underscore -fmerge-constants
# -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
# -foptimize-register-move -foptimize-sibling-calls -foptimize-strlen
# -fpartial-inlining -fpeephole -fpeephole2 -fpredictive-commoning
# -fprefetch-loop-arrays -freciprocal-math -free -freg-struct-return
# -fregmove -freorder-blocks -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsplit-ivs-in-unroller -fsplit-wide-types -fstack-protector
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp
# -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
# -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vect-loop-version -ftree-vectorize -ftree-vrp -funit-at-a-time
# -funsafe-math-optimizations -funswitch-loops -funwind-tables
# -fvect-cost-model -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -maccumulate-outgoing-args
# -malign-stringops -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mtls-direct-seg-refs

	.text
	.p2align 4,,15
	.type	kf_work, @function
kf_work:
.LFB78:
	.cfi_startproc
# BLOCK 2 freq:44 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15	# Fout, Fout
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# f, f
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r9, %rbp	# st, st
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp	#,
	.cfi_def_cfa_offset 224
	movl	(%r8), %eax	# *factors_11(D), p
	movq	%rdx, 48(%rsp)	# fstride, %sfp
	movl	4(%r8), %ebx	# MEM[(int *)factors_11(D) + 4B], m
	movl	%ecx, 16(%rsp)	# in_stride, %sfp
	movl	%eax, %edx	# p, D.6068
	movl	%eax, 12(%rsp)	# p, %sfp
	imull	%ebx, %edx	# m, D.6068
	movl	%ebx, %eax	# m, m
	movl	%ebx, 64(%rsp)	# m, %sfp
	cmpl	$1, %eax	#, m
	movslq	%edx, %rdx	# D.6068, D.6069
	leaq	(%rdi,%rdx,4), %rbx	#, Fout_end
# SUCC: 22 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L40	#,
# BLOCK 3 freq:32 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	48(%rsp), %rdi	# %sfp, fstride
	movq	%r15, %r14	# Fout, Fout
	movq	%r15, 56(%rsp)	# Fout, %sfp
	movslq	16(%rsp), %r13	# %sfp, D.6069
	movq	%r14, %r12	# Fout, Fout
	movq	%rsi, %r14	# f, f
	movslq	64(%rsp), %rdx	# %sfp, D.6069
	movq	%rdi, %rax	# fstride, fstride
	salq	$2, %rax	#, D.6069
	movq	%rax, 40(%rsp)	# D.6069, %sfp
	imulq	%rax, %r13	# D.6069, D.6069
	movslq	12(%rsp), %rax	# %sfp, D.6069
	imulq	%rdi, %rax	# fstride, D.6069
	leaq	8(%r8), %rdi	#, factors
	movq	%rdi, 32(%rsp)	# factors, %sfp
	movq	%rax, 24(%rsp)	# D.6069, %sfp
	leaq	0(,%rdx,4), %rax	#, D.6069
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# D.6069, D.6069
# BLOCK 4 freq:352 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L5:
	movq	32(%rsp), %r8	# %sfp,
	movq	%r14, %rsi	# f,
	movq	%r12, %rdi	# Fout,
	movl	16(%rsp), %ecx	# %sfp,
	movq	%rbp, %r9	# st,
	addq	%r15, %r12	# D.6069, Fout
	movq	24(%rsp), %rdx	# %sfp,
	addq	%r13, %r14	# D.6069, f
	call	kf_work	#
	cmpq	%rbx, %r12	# Fout_end, Fout
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L5	#,
# BLOCK 5 freq:32 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 12(%rsp)	#, %sfp
	movq	56(%rsp), %r15	# %sfp, Fout
# SUCC: 25 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L7	#,
# BLOCK 6 freq:35 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [80.0%]  (CAN_FALLTHRU)
.L43:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 18 [37.5%]  (CAN_FALLTHRU)
	jle	.L41	#,
# BLOCK 7 freq:22 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	12(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 13 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L10	#,
# BLOCK 8 freq:13 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L6	#,
# BLOCK 9 freq:9 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	64(%rsp), %r14d	# %sfp, m
	leaq	264(%rbp), %rax	#, twiddles
	movq	48(%rsp), %rsi	# %sfp, D.6069
	movq	%rax, %rbx	# twiddles, twiddles
	movq	%rax, 128(%rsp)	# twiddles, %sfp
	movslq	%r14d, %rax	# m, D.6069
	imulq	%rax, %rsi	# D.6069, D.6069
	salq	$2, %rax	#, D.6069
	leaq	(%r15,%rax), %r10	#, Fout1
	leaq	(%r10,%rax), %r12	#, Fout2
	leaq	(%r12,%rax), %r11	#, Fout3
	addq	%r11, %rax	# Fout3, Fout4
	salq	$2, %rsi	#, D.6069
	movq	%rax, %r9	# Fout4, Fout4
	leaq	(%rbx,%rsi), %rdx	#, D.6072
	movzwl	(%rdx), %edi	# MEM[(struct kiss_fft_cpx *)_458], ya$r
	movzwl	2(%rdx), %ecx	# MEM[(struct kiss_fft_cpx *)_458 + 2B], ya$i
	addq	%rsi, %rdx	# D.6069, D.6072
	testl	%r14d, %r14d	# m
	movzwl	(%rdx), %esi	# MEM[(struct kiss_fft_cpx *)_462], yb$r
	movzwl	2(%rdx), %edx	# MEM[(struct kiss_fft_cpx *)_462 + 2B], yb$i
# SUCC: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L1	#,
# BLOCK 10 freq:8 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movswl	%di, %eax	# ya$r, D.6068
	movq	%rbx, 104(%rsp)	# twiddles, %sfp
	movq	%r10, %r13	# Fout1, Fout1
	movl	%eax, 32(%rsp)	# D.6068, %sfp
	movswl	%si, %eax	# yb$r, D.6068
	movl	%eax, 48(%rsp)	# D.6068, %sfp
	movswl	%cx, %eax	# ya$i, D.6068
	movl	%eax, 148(%rsp)	# D.6068, %sfp
	movswl	%dx, %eax	# yb$i, D.6068
	movl	%eax, 120(%rsp)	# D.6068, %sfp
	movq	40(%rsp), %rax	# %sfp, D.6069
	movq	$0, 112(%rsp)	#, %sfp
	leaq	(%rax,%rax,2), %rax	#, tmp1140
	movq	%rax, 152(%rsp)	# tmp1140, %sfp
	movl	%r14d, %eax	# m, D.6075
	movq	%r9, %r14	# Fout4, Fout4
	subl	$1, %eax	#, D.6075
	leaq	4(%r9,%rax,4), %rax	#, D.6072
# SUCC: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, 136(%rsp)	# D.6072, %sfp
# BLOCK 11 freq:89 seq:9
# PRED: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L20:
	movswl	(%r15), %eax	# MEM[base: Fout_964, offset: 0B], D.6068
	movq	128(%rsp), %rdi	# %sfp, twiddles
	movq	112(%rsp), %r9	# %sfp, ivtmp.220
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, (%r15)	# D.6068, MEM[base: Fout_964, offset: 0B]
	movswl	2(%r15), %eax	# MEM[base: Fout_964, offset: 2B], D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%r15)	# D.6068, MEM[base: Fout_964, offset: 2B]
	movswl	0(%r13), %eax	# MEM[base: Fout1_963, offset: 0B], D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 0(%r13)	# D.6068, MEM[base: Fout1_963, offset: 0B]
	movswl	2(%r13), %eax	# MEM[base: Fout1_963, offset: 2B], D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%r13)	# D.6068, MEM[base: Fout1_963, offset: 2B]
	movswl	(%r12), %eax	# MEM[base: Fout2_962, offset: 0B], D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, (%r12)	# D.6068, MEM[base: Fout2_962, offset: 0B]
	movswl	2(%r12), %eax	# MEM[base: Fout2_962, offset: 2B], D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%r12)	# D.6068, MEM[base: Fout2_962, offset: 2B]
	movswl	(%r11), %eax	# MEM[base: Fout3_961, offset: 0B], D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, (%r11)	# D.6068, MEM[base: Fout3_961, offset: 0B]
	movswl	2(%r11), %eax	# MEM[base: Fout3_961, offset: 2B], D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%r11)	# D.6068, MEM[base: Fout3_961, offset: 2B]
	movswl	(%r14), %edx	# MEM[base: Fout4_960, offset: 0B], D.6068
	movswl	2(%r14), %eax	# MEM[base: Fout4_960, offset: 2B], D.6068
	imull	$6553, %edx, %edx	#, D.6068, D.6068
	imull	$6553, %eax, %eax	#, D.6068, D.6068
	addl	$16384, %edx	#, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %edx	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%dx, (%r14)	# D.6068, MEM[base: Fout4_960, offset: 0B]
	movw	%ax, 2(%r14)	# D.6068, MEM[base: Fout4_960, offset: 2B]
	movswl	(%r12), %esi	# MEM[base: Fout2_962, offset: 0B], D.6068
	movzwl	2(%r15), %ebx	# MEM[base: Fout_964, offset: 2B], scratch$0$i
	movswl	0(%r13), %ecx	# MEM[base: Fout1_963, offset: 0B], D.6068
	movswl	(%rdi,%r9,2), %r8d	# MEM[base: twiddles_454, index: ivtmp.220_322, step: 2, offset: 0B], D.6068
	movl	%esi, 124(%rsp)	# D.6068, %sfp
	movswl	2(%r12), %esi	# MEM[base: Fout2_962, offset: 2B], D.6068
	movswl	2(%r13), %r10d	# MEM[base: Fout1_963, offset: 2B], D.6068
	movw	%bx, 12(%rsp)	# scratch$0$i, %sfp
	movswl	2(%rdi,%r9), %ebp	# MEM[base: twiddles_454, index: ivtmp.220_322, offset: 2B], D.6068
	movl	%ecx, 56(%rsp)	# D.6068, %sfp
	movswl	(%rdi,%r9), %ebx	# MEM[base: twiddles_454, index: ivtmp.220_322, offset: 0B], D.6068
	movl	%r8d, 64(%rsp)	# D.6068, %sfp
	movl	%esi, 68(%rsp)	# D.6068, %sfp
	movswl	2(%rdi,%r9,2), %ecx	# MEM[base: twiddles_454, index: ivtmp.220_322, step: 2, offset: 2B], D.6068
	movswl	(%r11), %r8d	# MEM[base: Fout3_961, offset: 0B], D.6068
	movl	%ecx, 144(%rsp)	# D.6068, %sfp
	movq	104(%rsp), %rcx	# %sfp, ivtmp.229
	movl	%r8d, 72(%rsp)	# D.6068, %sfp
	movswl	2(%r11), %r8d	# MEM[base: Fout3_961, offset: 2B], D.6068
	movswl	(%rcx), %esi	# MEM[base: _1068, offset: 0B], D.6068
	movl	%r8d, 88(%rsp)	# D.6068, %sfp
	movswl	(%rdi,%r9,4), %r8d	# MEM[base: twiddles_454, index: ivtmp.220_322, step: 4, offset: 0B], D.6068
	movswl	2(%rdi,%r9,4), %r9d	# MEM[base: twiddles_454, index: ivtmp.220_322, step: 4, offset: 2B], D.6068
	movl	%r10d, %edi	# D.6068, D.6068
	imull	%ebp, %edi	# D.6068, D.6068
	movl	%esi, 80(%rsp)	# D.6068, %sfp
	movswl	2(%rcx), %esi	# MEM[base: _1068, offset: 2B], D.6068
	movl	56(%rsp), %ecx	# %sfp, D.6068
	imull	%ebx, %ecx	# D.6068, D.6068
	subl	%edi, %ecx	# D.6068, D.6068
	leal	16384(%rcx), %edi	#, D.6068
	movl	%edi, 16(%rsp)	# D.6068, %sfp
	movl	%edx, %edi	# D.6068, D.6068
	sarl	$15, 16(%rsp)	#, %sfp
	imull	%r8d, %edi	# D.6068, D.6068
	imull	%r9d, %edx	# D.6068, D.6068
	imull	%ebx, %r10d	# D.6068, D.6068
	movl	124(%rsp), %ebx	# %sfp, D.6068
	imull	56(%rsp), %ebp	# %sfp, D.6068
	movl	%edi, %ecx	# D.6068, D.6068
	movl	%eax, %edi	# D.6068, D.6068
	imull	%r9d, %edi	# D.6068, D.6068
	movl	68(%rsp), %r9d	# %sfp, D.6068
	imull	%r8d, %eax	# D.6068, D.6068
	leal	16384(%rbp,%r10), %r10d	#, D.6068
	subl	%edi, %ecx	# D.6068, D.6068
	sarl	$15, %r10d	#, D.6068
	leal	16384(%rcx), %edi	#, D.6068
	movl	%edi, 24(%rsp)	# D.6068, %sfp
	leal	16384(%rdx,%rax), %edx	#, D.6068
	movl	64(%rsp), %eax	# %sfp, D.6068
	sarl	$15, 24(%rsp)	#, %sfp
	sarl	$15, %edx	#, D.6068
	movl	144(%rsp), %edi	# %sfp, D.6068
	leal	(%rdx,%r10), %r8d	#, D.6071
	imull	%ebx, %eax	# D.6068, D.6068
	movzwl	24(%rsp), %ecx	# %sfp, D.6071
	imull	%edi, %r9d	# D.6068, D.6068
	imull	%ebx, %edi	# D.6068, D.6068
	addw	16(%rsp), %cx	# %sfp, D.6071
	subl	%r9d, %eax	# D.6068, D.6068
	leal	16384(%rax), %ebp	#, D.6068
	movl	72(%rsp), %eax	# %sfp, D.6068
	sarl	$15, %ebp	#, D.6068
	movw	%cx, 96(%rsp)	# D.6071, %sfp
	movl	88(%rsp), %ecx	# %sfp, D.6068
	imull	80(%rsp), %eax	# %sfp, D.6068
	imull	%esi, %ecx	# D.6068, D.6068
	imull	72(%rsp), %esi	# %sfp, D.6068
	subl	%ecx, %eax	# D.6068, D.6068
	leal	16384(%rax), %r9d	#, D.6068
	movl	64(%rsp), %eax	# %sfp, D.6068
	sarl	$15, %r9d	#, D.6068
	leal	(%r9,%rbp), %ecx	#, D.6071
	imull	68(%rsp), %eax	# %sfp, D.6068
	leal	16384(%rdi,%rax), %ebx	#, D.6068
	movzwl	(%r15), %edi	# MEM[base: Fout_964, offset: 0B], D.6071
	movl	80(%rsp), %eax	# %sfp, D.6068
	sarl	$15, %ebx	#, D.6068
	imull	88(%rsp), %eax	# %sfp, D.6068
	movw	%di, 56(%rsp)	# D.6071, %sfp
	addl	%ecx, %edi	# D.6071, D.6071
	addw	96(%rsp), %di	# %sfp, tmp1224
	movswl	%cx, %ecx	# D.6071, D.6068
	movl	%ecx, 72(%rsp)	# D.6068, %sfp
	leal	16384(%rsi,%rax), %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%di, (%r15)	# tmp1224, MEM[base: Fout_964, offset: 0B]
	movzwl	12(%rsp), %edi	# %sfp, scratch$0$i
	leal	(%rax,%rbx), %esi	#, D.6071
	addl	%esi, %edi	# D.6071, D.6071
	movswl	%si, %esi	# D.6071, D.6068
	addl	%r8d, %edi	# D.6071, tmp1226
	movl	%esi, 88(%rsp)	# D.6068, %sfp
	movswl	%r8w, %r8d	# D.6071, D.6068
	movw	%di, 2(%r15)	# tmp1226, MEM[base: Fout_964, offset: 2B]
	movswl	96(%rsp), %edi	# %sfp, D.6068
	movl	%r8d, 80(%rsp)	# D.6068, %sfp
	movl	%edi, 64(%rsp)	# D.6068, %sfp
	movl	48(%rsp), %edi	# %sfp, D.6068
	imull	%ecx, %edi	# D.6068, D.6068
	movl	64(%rsp), %ecx	# %sfp, D.6068
	addl	$16384, %edi	#, D.6068
	sarl	$15, %edi	#, D.6068
	addw	56(%rsp), %di	# %sfp, D.6071
	subl	%eax, %ebx	# D.6068, D.6071
	subl	%edx, %r10d	# D.6068, D.6071
	imull	32(%rsp), %ecx	# %sfp, D.6068
	movswl	%r10w, %r10d	# D.6071, D.6068
	imull	48(%rsp), %esi	# %sfp, D.6068
	subl	%r9d, %ebp	# D.6068, D.6071
	movl	120(%rsp), %eax	# %sfp, D.6068
	movswl	%bp, %r9d	# D.6071, D.6068
	addl	$16384, %ecx	#, D.6068
	movl	120(%rsp), %ebp	# %sfp, D.6068
	sarl	$15, %ecx	#, D.6068
	addl	$16384, %esi	#, D.6068
	addl	%edi, %ecx	# D.6071, D.6071
	movswl	%bx, %edi	# D.6071, D.6068
	movl	148(%rsp), %ebx	# %sfp, D.6068
	movw	%cx, 68(%rsp)	# D.6071, %sfp
	movl	32(%rsp), %ecx	# %sfp, D.6068
	imull	%edi, %eax	# D.6068, D.6068
	sarl	$15, %esi	#, D.6068
	addw	12(%rsp), %si	# %sfp, D.6071
	movl	%ebx, %edx	# D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	imull	%r8d, %ecx	# D.6068, D.6068
	movzwl	16(%rsp), %r8d	# %sfp, D.6071
	sarl	$15, %eax	#, D.6068
	imull	%r10d, %edx	# D.6068, D.6068
	addl	$16384, %ecx	#, D.6068
	subw	24(%rsp), %r8w	# %sfp, D.6071
	addl	$16384, %edx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	sarl	$15, %edx	#, D.6068
	addl	%ecx, %esi	# D.6068, D.6071
	addl	%eax, %edx	# D.6068, D.6071
	movl	%ebx, %ecx	# D.6068, D.6068
	movl	%ebp, %eax	# D.6068, D.6068
	imull	%r9d, %eax	# D.6068, D.6068
	movswl	%r8w, %r8d	# D.6071, D.6068
	imull	%r8d, %ecx	# D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	addl	%ecx, %eax	# D.6068, D.6071
	movzwl	68(%rsp), %ecx	# %sfp, tmp1257
	subl	%edx, %ecx	# D.6071, tmp1257
	addw	68(%rsp), %dx	# %sfp, tmp1259
	movw	%cx, 0(%r13)	# tmp1257, MEM[base: Fout1_963, offset: 0B]
	leal	(%rsi,%rax), %ecx	#, tmp1258
	subl	%eax, %esi	# D.6071, tmp1260
	movl	72(%rsp), %eax	# %sfp, D.6068
	movw	%cx, 2(%r13)	# tmp1258, MEM[base: Fout1_963, offset: 2B]
	movl	32(%rsp), %ecx	# %sfp, D.6068
	imull	%ebx, %edi	# D.6068, D.6068
	movw	%dx, (%r14)	# tmp1259, MEM[base: Fout4_960, offset: 0B]
	movl	64(%rsp), %edx	# %sfp, D.6068
	movw	%si, 2(%r14)	# tmp1260, MEM[base: Fout4_960, offset: 2B]
	movl	48(%rsp), %esi	# %sfp, D.6068
	imull	%ecx, %eax	# D.6068, D.6068
	imull	%esi, %edx	# D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	addw	56(%rsp), %ax	# %sfp, D.6071
	addl	$16384, %edx	#, D.6068
	sarl	$15, %edx	#, D.6068
	addl	%edx, %eax	# D.6068, D.6071
	movl	88(%rsp), %edx	# %sfp, D.6068
	imull	%ecx, %edx	# D.6068, D.6068
	movl	80(%rsp), %ecx	# %sfp, D.6068
	addl	$16384, %edx	#, D.6068
	imull	%esi, %ecx	# D.6068, D.6068
	sarl	$15, %edx	#, D.6068
	movl	%r10d, %esi	# D.6068, D.6068
	addw	12(%rsp), %dx	# %sfp, D.6071
	imull	%ebp, %esi	# D.6068, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	addl	$16384, %esi	#, D.6068
	addl	%edx, %ecx	# D.6071, D.6071
	movl	%edi, %edx	# D.6068, D.6068
	sarl	$15, %esi	#, D.6068
	addl	$16384, %edx	#, D.6068
	movl	%r9d, %edi	# D.6068, D.6068
	sarl	$15, %edx	#, D.6068
	imull	%ebx, %edi	# D.6068, D.6068
	subl	%esi, %edx	# D.6068, D.6071
	movl	%r8d, %esi	# D.6068, D.6068
	imull	%ebp, %esi	# D.6068, D.6068
	addl	$16384, %edi	#, D.6068
	sarl	$15, %edi	#, D.6068
	addl	$16384, %esi	#, D.6068
	sarl	$15, %esi	#, D.6068
	subl	%edi, %esi	# D.6068, D.6071
	leal	(%rax,%rdx), %edi	#, tmp1287
	subl	%edx, %eax	# D.6071, tmp1289
	movw	%di, (%r12)	# tmp1287, MEM[base: Fout2_962, offset: 0B]
	leal	(%rcx,%rsi), %edi	#, tmp1288
	subl	%esi, %ecx	# D.6071, tmp1290
	movw	%di, 2(%r12)	# tmp1288, MEM[base: Fout2_962, offset: 2B]
	addq	$4, %r15	#, Fout
	addq	$4, %r14	#, Fout4
	movw	%ax, (%r11)	# tmp1289, MEM[base: Fout3_961, offset: 0B]
	movq	40(%rsp), %rax	# %sfp, D.6069
	addq	$4, %r13	#, Fout1
	movw	%cx, 2(%r11)	# tmp1290, MEM[base: Fout3_961, offset: 2B]
	addq	$4, %r12	#, Fout2
	addq	$4, %r11	#, Fout3
	addq	%rax, 112(%rsp)	# D.6069, %sfp
	movq	152(%rsp), %rax	# %sfp, tmp1140
	addq	%rax, 104(%rsp)	# tmp1140, %sfp
	cmpq	136(%rsp), %r14	# %sfp, Fout4
# SUCC: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L20	#,
# BLOCK 12 freq:35 seq:10
# PRED: 15 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 9 [9.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 21 [100.0%]  27 [100.0%] 
.L1:
	addq	$168, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 13 freq:9 seq:11
# PRED: 7 [40.0%]  (CAN_FALLTHRU)
.L10:
	.cfi_restore_state
	movq	48(%rsp), %rbx	# %sfp, fstride
	leaq	264(%rbp), %rdi	#, tw3
	movslq	64(%rsp), %rax	# %sfp, k
	movq	%rdi, 48(%rsp)	# tw3, %sfp
	movq	%rdi, %r10	# tw3, tw3
	movq	%rdi, %r14	# tw3, tw3
	leaq	(%rbx,%rbx,2), %rdx	#, tmp1049
	leaq	0(,%rbx,8), %rcx	#, D.6069
	movq	%rax, 72(%rsp)	# k, %sfp
	salq	$2, %rax	#, D.6069
	leaq	0(,%rdx,4), %rbx	#, tmp1050
	movq	%rcx, 80(%rsp)	# D.6069, %sfp
	movq	%rbx, 96(%rsp)	# tmp1050, %sfp
	movl	4(%rbp), %ebx	# st_33(D)->inverse, D.6068
	leaq	(%r15,%rax), %r9	#, ivtmp.180
	leaq	(%r9,%rax), %rsi	#, ivtmp.183
	leaq	(%rsi,%rax), %r11	#, ivtmp.186
	movl	%ebx, 88(%rsp)	# D.6068, %sfp
# SUCC: 16 [100.0%] 
	jmp	.L19	#
# BLOCK 14 freq:49 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
.L42:
	movzwl	68(%rsp), %edx	# %sfp, D.6071
	subl	%edi, %eax	# D.6071, tmp1129
	addl	%ecx, %edi	# D.6071, tmp1131
	movw	%ax, (%r9)	# tmp1129, MEM[base: _1097, offset: 0B]
	movl	%edx, %eax	# D.6071, D.6071
	addl	%ebx, %eax	# D.6071, tmp1130
	movw	%ax, 2(%r9)	# tmp1130, MEM[base: _1097, offset: 2B]
	movl	%edx, %eax	# D.6071, tmp1132
	subl	%ebx, %eax	# D.6071, tmp1132
	movw	%di, (%r11)	# tmp1131, MEM[base: _1089, offset: 0B]
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movw	%ax, 2(%r11)	# tmp1132, MEM[base: _1089, offset: 2B]
# BLOCK 15 freq:98 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [100.0%] 
.L18:
	addq	$4, %r15	#, Fout
	addq	$4, %r9	#, ivtmp.180
	addq	$4, %rsi	#, ivtmp.183
	addq	$4, %r11	#, ivtmp.186
	subq	$1, 72(%rsp)	#, %sfp
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	je	.L1	#,
# BLOCK 16 freq:98 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [100.0%] 
.L19:
	movswl	(%r15), %edx	# MEM[base: Fout_280, offset: 0B], D.6068
	movq	48(%rsp), %rdi	# %sfp, tw3
	movl	%edx, %eax	# D.6068, D.6068
	sall	$13, %eax	#, D.6068
	subl	%edx, %eax	# D.6068, D.6068
	movswl	2(%r15), %edx	# MEM[base: Fout_280, offset: 2B], D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, (%r15)	# D.6068, MEM[base: Fout_280, offset: 0B]
	movl	%edx, %eax	# D.6068, D.6068
	sall	$13, %eax	#, D.6068
	subl	%edx, %eax	# D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%r15)	# D.6068, MEM[base: Fout_280, offset: 2B]
	movswl	(%r9), %edx	# MEM[base: _1097, offset: 0B], D.6068
	movl	%edx, %eax	# D.6068, D.6068
	sall	$13, %eax	#, D.6068
	subl	%edx, %eax	# D.6068, D.6068
	movswl	2(%r9), %edx	# MEM[base: _1097, offset: 2B], D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, (%r9)	# D.6068, MEM[base: _1097, offset: 0B]
	movl	%edx, %eax	# D.6068, D.6068
	sall	$13, %eax	#, D.6068
	subl	%edx, %eax	# D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%r9)	# D.6068, MEM[base: _1097, offset: 2B]
	movswl	(%rsi), %edx	# MEM[base: _1093, offset: 0B], D.6068
	movl	%edx, %eax	# D.6068, D.6068
	sall	$13, %eax	#, D.6068
	subl	%edx, %eax	# D.6068, D.6068
	movswl	2(%rsi), %edx	# MEM[base: _1093, offset: 2B], D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, (%rsi)	# D.6068, MEM[base: _1093, offset: 0B]
	movl	%edx, %eax	# D.6068, D.6068
	sall	$13, %eax	#, D.6068
	subl	%edx, %eax	# D.6068, D.6068
	addl	$16384, %eax	#, D.6068
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%rsi)	# D.6068, MEM[base: _1093, offset: 2B]
	movswl	(%r11), %eax	# MEM[base: _1089, offset: 0B], D.6068
	movswl	2(%r11), %ecx	# MEM[base: _1089, offset: 2B], D.6068
	movl	%eax, %edx	# D.6068, D.6068
	sall	$13, %edx	#, D.6068
	subl	%eax, %edx	# D.6068, D.6068
	movl	%ecx, %eax	# D.6068, D.6068
	sall	$13, %eax	#, D.6068
	addl	$16384, %edx	#, D.6068
	subl	%ecx, %eax	# D.6068, D.6068
	sarl	$15, %edx	#, D.6068
	addl	$16384, %eax	#, D.6068
	movw	%dx, (%r11)	# D.6068, MEM[base: _1089, offset: 0B]
	sarl	$15, %eax	#, D.6068
	movw	%ax, 2(%r11)	# D.6068, MEM[base: _1089, offset: 2B]
	movswl	(%r9), %ebx	# MEM[base: _1097, offset: 0B], D.6068
	movswl	2(%r9), %ecx	# MEM[base: _1097, offset: 2B], D.6068
	movswl	(%rsi), %r13d	# MEM[base: _1093, offset: 0B], D.6068
	movswl	(%r10), %ebp	# MEM[base: tw3_358, offset: 0B], D.6068
	movl	%ebx, 12(%rsp)	# D.6068, %sfp
	movswl	(%r14), %ebx	# MEM[base: tw3_337, offset: 0B], D.6068
	movl	%ecx, 56(%rsp)	# D.6068, %sfp
	movswl	(%rdi), %ecx	# MEM[base: tw3_378, offset: 0B], D.6068
	movswl	2(%r10), %r12d	# MEM[base: tw3_358, offset: 2B], D.6068
	movswl	2(%r14), %r8d	# MEM[base: tw3_337, offset: 2B], D.6068
	movl	%ebx, 16(%rsp)	# D.6068, %sfp
	movswl	2(%rsi), %ebx	# MEM[base: _1093, offset: 2B], D.6068
	movl	%ecx, 24(%rsp)	# D.6068, %sfp
	movswl	2(%rdi), %ecx	# MEM[base: tw3_378, offset: 2B], D.6068
	movl	%ebx, %edi	# D.6068, D.6068
	movl	%ecx, 32(%rsp)	# D.6068, %sfp
	movl	%r13d, %ecx	# D.6068, D.6068
	imull	%ebp, %ecx	# D.6068, D.6068
	imull	%r12d, %edi	# D.6068, D.6068
	imull	%ebp, %ebx	# D.6068, D.6068
	imull	%r13d, %r12d	# D.6068, D.6068
	subl	%edi, %ecx	# D.6068, D.6068
	movzwl	(%r15), %edi	# MEM[base: Fout_280, offset: 0B], D.6071
	addl	$16384, %ecx	#, D.6068
	leal	16384(%r12,%rbx), %r13d	#, D.6068
	sarl	$15, %ecx	#, D.6068
	sarl	$15, %r13d	#, D.6068
	movl	%ecx, %r12d	# D.6068, D.6071
	subl	%ecx, %edi	# D.6068, D.6071
	movw	%di, 64(%rsp)	# D.6071, %sfp
	movzwl	2(%r15), %edi	# MEM[base: Fout_280, offset: 2B], D.6071
	movl	12(%rsp), %ebx	# %sfp, D.6068
	movl	24(%rsp), %ebp	# %sfp, D.6068
	addw	(%r15), %r12w	# MEM[base: Fout_280, offset: 0B], D.6071
	subl	%r13d, %edi	# D.6068, D.6071
	addw	2(%r15), %r13w	# MEM[base: Fout_280, offset: 2B], D.6071
	movw	%di, 68(%rsp)	# D.6071, %sfp
	movl	56(%rsp), %edi	# %sfp, D.6068
	imull	%edx, %ebp	# D.6068, D.6068
	addq	40(%rsp), %r14	# %sfp, tw3
	imull	16(%rsp), %ebx	# %sfp, D.6068
	movw	%r12w, (%r15)	# D.6071, MEM[base: Fout_280, offset: 0B]
	imull	32(%rsp), %edx	# %sfp, D.6068
	movw	%r13w, 2(%r15)	# D.6071, MEM[base: Fout_280, offset: 2B]
	movl	%edi, %ecx	# D.6068, D.6068
	addq	80(%rsp), %r10	# %sfp, tw3
	imull	%r8d, %ecx	# D.6068, D.6068
	imull	16(%rsp), %edi	# %sfp, D.6068
	imull	12(%rsp), %r8d	# %sfp, D.6068
	subl	%ecx, %ebx	# D.6068, D.6068
	movl	%ebp, %ecx	# D.6068, D.6068
	movl	32(%rsp), %ebp	# %sfp, D.6068
	addl	$16384, %ebx	#, D.6068
	leal	16384(%r8,%rdi), %edi	#, D.6068
	sarl	$15, %ebx	#, D.6068
	sarl	$15, %edi	#, D.6068
	imull	%eax, %ebp	# D.6068, D.6068
	imull	24(%rsp), %eax	# %sfp, D.6068
	subl	%ebp, %ecx	# D.6068, D.6068
	leal	16384(%rdx,%rax), %eax	#, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %eax	#, D.6068
	sarl	$15, %ecx	#, D.6068
	leal	(%rax,%rdi), %edx	#, D.6071
	subl	%eax, %edi	# D.6068, D.6071
	movq	96(%rsp), %rax	# %sfp, tmp1050
	leal	(%rcx,%rbx), %ebp	#, D.6071
	subl	%edx, %r13d	# D.6071, tmp1128
	subl	%ecx, %ebx	# D.6068, D.6071
	subl	%ebp, %r12d	# D.6071, tmp1127
	movw	%r13w, 2(%rsi)	# tmp1128, MEM[base: _1093, offset: 2B]
	movzwl	64(%rsp), %ecx	# %sfp, D.6071
	movw	%r12w, (%rsi)	# tmp1127, MEM[base: _1093, offset: 0B]
	addq	%rax, 48(%rsp)	# tmp1050, %sfp
	addw	%dx, 2(%r15)	# D.6071, MEM[base: Fout_280, offset: 2B]
	movl	88(%rsp), %edx	# %sfp,
	movl	%ecx, %eax	# D.6071, tmp1129
	addw	%bp, (%r15)	# D.6071, MEM[base: Fout_280, offset: 0B]
	testl	%edx, %edx	#
# SUCC: 14 [50.0%]  (CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L42	#,
# BLOCK 17 freq:49 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movzwl	68(%rsp), %edx	# %sfp, D.6071
	addl	%edi, %eax	# D.6071, tmp1133
	movw	%ax, (%r9)	# tmp1133, MEM[base: _1097, offset: 0B]
	movl	%edx, %eax	# D.6071, tmp1134
	subl	%ebx, %eax	# D.6071, tmp1134
	addl	%edx, %ebx	# D.6071, tmp1136
	movw	%ax, 2(%r9)	# tmp1134, MEM[base: _1097, offset: 2B]
	movl	%ecx, %eax	# D.6071, tmp1135
	subl	%edi, %eax	# D.6071, tmp1135
	movw	%bx, 2(%r11)	# tmp1136, MEM[base: _1089, offset: 2B]
	movw	%ax, (%r11)	# tmp1135, MEM[base: _1089, offset: 0B]
# SUCC: 15 [100.0%] 
	jmp	.L18	#
# BLOCK 18 freq:13 seq:16
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
.L41:
	cmpl	$2, 12(%rsp)	#, %sfp
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L6	#,
# BLOCK 19 freq:9 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	64(%rsp), %r8d	# %sfp, m
	addq	$264, %rbp	#, tw1
	movq	40(%rsp), %r9	# %sfp, D.6069
	movslq	%r8d, %rax	# m, D.6069
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	(%r15,%rax,4), %rax	#, Fout2
# BLOCK 20 freq:98 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L14:
	movswl	(%r15), %ecx	# MEM[base: Fout_54, offset: 0B], D.6068
	addq	$4, %rax	#, Fout2
	movl	%ecx, %edx	# D.6068, D.6068
	sall	$14, %edx	#, D.6068
	subl	%ecx, %edx	# D.6068, D.6068
	movswl	2(%r15), %ecx	# MEM[base: Fout_54, offset: 2B], D.6068
	addl	$16384, %edx	#, D.6068
	sarl	$15, %edx	#, D.6068
	movw	%dx, (%r15)	# D.6068, MEM[base: Fout_54, offset: 0B]
	movl	%ecx, %edx	# D.6068, D.6068
	sall	$14, %edx	#, D.6068
	subl	%ecx, %edx	# D.6068, D.6068
	addl	$16384, %edx	#, D.6068
	sarl	$15, %edx	#, D.6068
	movw	%dx, 2(%r15)	# D.6068, MEM[base: Fout_54, offset: 2B]
	movswl	-4(%rax), %edx	# MEM[base: Fout2_67, offset: 0B], D.6068
	movswl	-2(%rax), %esi	# MEM[base: Fout2_67, offset: 2B], D.6068
	movl	%edx, %ecx	# D.6068, D.6068
	sall	$14, %ecx	#, D.6068
	subl	%edx, %ecx	# D.6068, D.6068
	movl	%esi, %edx	# D.6068, D.6068
	sall	$14, %edx	#, D.6068
	addl	$16384, %ecx	#, D.6068
	subl	%esi, %edx	# D.6068, D.6068
	sarl	$15, %ecx	#, D.6068
	addl	$16384, %edx	#, D.6068
	movw	%cx, -4(%rax)	# D.6068, MEM[base: Fout2_67, offset: 0B]
	movl	%ecx, %esi	# D.6068, D.6068
	sarl	$15, %edx	#, D.6068
	movw	%dx, -2(%rax)	# D.6068, MEM[base: Fout2_67, offset: 2B]
	movl	%edx, %edi	# D.6068, D.6068
	movswl	0(%rbp), %r10d	# MEM[base: tw1_81, offset: 0B], D.6068
	movswl	2(%rbp), %r11d	# MEM[base: tw1_81, offset: 2B], D.6068
	addq	%r9, %rbp	# D.6069, tw1
	imull	%r10d, %esi	# D.6068, D.6068
	imull	%r11d, %edi	# D.6068, D.6068
	imull	%r11d, %ecx	# D.6068, D.6068
	imull	%r10d, %edx	# D.6068, D.6068
	subl	%edi, %esi	# D.6068, D.6068
	movzwl	(%r15), %edi	# MEM[base: Fout_54, offset: 0B], D.6071
	addl	$16384, %esi	#, D.6068
	leal	16384(%rcx,%rdx), %edx	#, D.6068
	sarl	$15, %esi	#, D.6068
	sarl	$15, %edx	#, D.6068
	subl	%esi, %edi	# D.6068, D.6071
	movw	%di, -4(%rax)	# D.6071, MEM[base: Fout2_67, offset: 0B]
	movzwl	2(%r15), %ecx	# MEM[base: Fout_54, offset: 2B], D.6071
	subl	%edx, %ecx	# D.6068, D.6071
	movw	%cx, -2(%rax)	# D.6071, MEM[base: Fout2_67, offset: 2B]
	addw	%si, (%r15)	# D.6068, MEM[base: Fout_54, offset: 0B]
	addw	%dx, 2(%r15)	# D.6068, MEM[base: Fout_54, offset: 2B]
	addq	$4, %r15	#, Fout
	subl	$1, %r8d	#, m
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU)
	jne	.L14	#,
# BLOCK 21 freq:9 seq:19
# PRED: 20 [9.0%]  (FALLTHRU)
# SUCC: 12 [100.0%] 
	jmp	.L1	#
# BLOCK 22 freq:12 seq:20
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
.L40:
	movq	48(%rsp), %rax	# %sfp, fstride
	movslq	%ecx, %r14	#, D.6069
	movq	%rdi, %rdx	# Fout, Fout
	salq	$2, %rax	#, D.6069
	imulq	%rax, %r14	# D.6069, D.6069
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, 40(%rsp)	# D.6069, %sfp
# BLOCK 23 freq:137 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%r12), %eax	# MEM[base: f_3, offset: 0B], MEM[base: f_3, offset: 0B]
	addq	$4, %rdx	#, Fout
	addq	%r14, %r12	# D.6069, f
	movl	%eax, -4(%rdx)	# MEM[base: f_3, offset: 0B], MEM[base: Fout_1, offset: 0B]
	cmpq	%rbx, %rdx	# Fout_end, Fout
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L4	#,
# BLOCK 24 freq:12 seq:22
# PRED: 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 12(%rsp)	#, %sfp
# SUCC: 25 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L43	#,
# BLOCK 25 freq:9 seq:23
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 24 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L7:
	movslq	64(%rsp), %rax	# %sfp, m
	leaq	264(%rbp), %r9	#, tw2
	movq	%rax, %rbx	# m, m
	movq	%rax, 16(%rsp)	# m, %sfp
	movq	48(%rsp), %rax	# %sfp, fstride
	leaq	(%r15,%rbx,8), %rdx	#, ivtmp.154
	leaq	0(,%rax,8), %rdi	#, D.6069
	imulq	%rbx, %rax	# m, D.6069
	movq	%rdi, 24(%rsp)	# D.6069, %sfp
	movswl	266(%rbp,%rax,4), %eax	# MEM[(struct kiss_fft_state *)_125 + 2B], D.6068
	movq	%r9, %rbp	# tw2, tw2
	movl	%eax, 32(%rsp)	# D.6068, %sfp
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	(%r15,%rbx,4), %rax	#, ivtmp.151
# BLOCK 26 freq:98 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L16:
	movswl	(%r15), %ecx	# MEM[base: Fout_128, offset: 0B], D.6068
	imull	$10922, %ecx, %ecx	#, D.6068, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	movw	%cx, (%r15)	# D.6068, MEM[base: Fout_128, offset: 0B]
	movswl	2(%r15), %ecx	# MEM[base: Fout_128, offset: 2B], D.6068
	imull	$10922, %ecx, %ecx	#, D.6068, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	movw	%cx, 2(%r15)	# D.6068, MEM[base: Fout_128, offset: 2B]
	movswl	(%rax), %ecx	# MEM[base: _814, offset: 0B], D.6068
	imull	$10922, %ecx, %ecx	#, D.6068, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	movw	%cx, (%rax)	# D.6068, MEM[base: _814, offset: 0B]
	movswl	2(%rax), %ecx	# MEM[base: _814, offset: 2B], D.6068
	imull	$10922, %ecx, %ecx	#, D.6068, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	movw	%cx, 2(%rax)	# D.6068, MEM[base: _814, offset: 2B]
	movswl	(%rdx), %esi	# MEM[base: _1125, offset: 0B], D.6068
	movswl	2(%rdx), %ecx	# MEM[base: _1125, offset: 2B], D.6068
	imull	$10922, %esi, %esi	#, D.6068, D.6068
	imull	$10922, %ecx, %ecx	#, D.6068, D.6068
	addl	$16384, %esi	#, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %esi	#, D.6068
	sarl	$15, %ecx	#, D.6068
	movw	%si, (%rdx)	# D.6068, MEM[base: _1125, offset: 0B]
	movw	%cx, 2(%rdx)	# D.6068, MEM[base: _1125, offset: 2B]
	movswl	(%rax), %r13d	# MEM[base: _814, offset: 0B], D.6068
	movswl	2(%rax), %r11d	# MEM[base: _814, offset: 2B], D.6068
	movswl	0(%rbp), %edi	# MEM[base: tw2_191, offset: 0B], D.6068
	movswl	(%r9), %ebx	# MEM[base: tw2_171, offset: 0B], D.6068
	movswl	2(%r9), %r12d	# MEM[base: tw2_171, offset: 2B], D.6068
	movl	%r13d, %r8d	# D.6068, D.6068
	movswl	2(%rbp), %r10d	# MEM[base: tw2_191, offset: 2B], D.6068
	movl	%edi, %r14d	# D.6068, D.6068
	movl	%r11d, %edi	# D.6068, D.6068
	imull	%ebx, %r8d	# D.6068, D.6068
	movl	%r14d, 12(%rsp)	# D.6068, %sfp
	imull	%r12d, %edi	# D.6068, D.6068
	imull	%ebx, %r11d	# D.6068, D.6068
	imull	%r13d, %r12d	# D.6068, D.6068
	subl	%edi, %r8d	# D.6068, D.6068
	movl	%r14d, %edi	# D.6068, D.6068
	movl	%ecx, %r14d	# D.6068, D.6068
	imull	%r10d, %r14d	# D.6068, D.6068
	addl	$16384, %r8d	#, D.6068
	imull	%esi, %edi	# D.6068, D.6068
	leal	16384(%r12,%r11), %r11d	#, D.6068
	sarl	$15, %r8d	#, D.6068
	imull	%r10d, %esi	# D.6068, D.6068
	sarl	$15, %r11d	#, D.6068
	imull	12(%rsp), %ecx	# %sfp, D.6068
	subl	%r14d, %edi	# D.6068, D.6068
	addl	$16384, %edi	#, D.6068
	leal	16384(%rsi,%rcx), %ecx	#, D.6068
	sarl	$15, %edi	#, D.6068
	movzwl	(%r15), %esi	# MEM[base: Fout_128, offset: 0B], D.6071
	leal	(%rdi,%r8), %r14d	#, D.6071
	sarl	$15, %ecx	#, D.6068
	subl	%edi, %r8d	# D.6068, D.6071
	movl	%r14d, %ebx	# D.6071, D.6070
	addq	40(%rsp), %r9	# %sfp, tw2
	addq	$4, %rdx	#, ivtmp.154
	sarw	%bx	# D.6070
	addq	24(%rsp), %rbp	# %sfp, tw2
	subl	%ebx, %esi	# D.6070, D.6071
	movw	%si, (%rax)	# D.6071, MEM[base: _814, offset: 0B]
	leal	(%rcx,%r11), %r10d	#, D.6071
	subl	%ecx, %r11d	# D.6068, D.6071
	movzwl	2(%r15), %esi	# MEM[base: Fout_128, offset: 2B], D.6071
	movl	%r10d, %ebx	# D.6071, D.6070
	sarw	%bx	# D.6070
	subl	%ebx, %esi	# D.6070, D.6071
	movl	32(%rsp), %ebx	# %sfp, D.6068
	movw	%si, 2(%rax)	# D.6071, MEM[base: _814, offset: 2B]
	movswl	%r11w, %esi	# D.6071, D.6068
	addw	%r14w, (%r15)	# D.6071, MEM[base: Fout_128, offset: 0B]
	addw	%r10w, 2(%r15)	# D.6071, MEM[base: Fout_128, offset: 2B]
	addq	$4, %r15	#, Fout
	imull	%ebx, %esi	# D.6068, D.6068
	addl	$16384, %esi	#, D.6068
	sarl	$15, %esi	#, D.6068
	movl	%esi, %ecx	# D.6068, D.6071
	addw	(%rax), %cx	# MEM[base: _814, offset: 0B], D.6071
	movw	%cx, -4(%rdx)	# D.6071, MEM[base: _1125, offset: 0B]
	movswl	%r8w, %ecx	# D.6071, D.6068
	imull	%ebx, %ecx	# D.6068, D.6068
	movzwl	2(%rax), %edi	# MEM[base: _814, offset: 2B], D.6071
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %ecx	#, D.6068
	subl	%ecx, %edi	# D.6068, D.6071
	movw	%di, -2(%rdx)	# D.6071, MEM[base: _1125, offset: 2B]
	subw	%si, (%rax)	# D.6068, MEM[base: _814, offset: 0B]
	addw	%cx, 2(%rax)	# D.6068, MEM[base: _814, offset: 2B]
	addq	$4, %rax	#, ivtmp.151
	subq	$1, 16(%rsp)	#, %sfp
# SUCC: 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 27 [9.0%]  (FALLTHRU)
	jne	.L16	#,
# BLOCK 27 freq:9 seq:25
# PRED: 26 [9.0%]  (FALLTHRU)
# SUCC: 12 [100.0%] 
	jmp	.L1	#
# BLOCK 28 freq:9 seq:26
# PRED: 18 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
.L6:
	movl	0(%rbp), %ebx	# st_33(D)->nfft, Norig
	leaq	264(%rbp), %r14	#, twiddles
	movl	12(%rsp), %ebp	# %sfp, p
	movslq	%ebp, %rdi	# p, D.6069
	salq	$2, %rdi	#, D.6069
	call	malloc	#
	movl	64(%rsp), %edx	# %sfp, m
	movq	%rax, %rcx	#, scratch
	movq	%rax, 24(%rsp)	# scratch, %sfp
	testl	%edx, %edx	# m
# SUCC: 29 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 39 [9.0%]  (CAN_FALLTHRU)
	jle	.L21	#,
# BLOCK 29 freq:8 seq:27
# PRED: 28 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	48(%rsp), %rsi	# %sfp, fstride
	movslq	%edx, %rax	# m, D.6069
	movq	%r15, 56(%rsp)	# Fout, %sfp
	salq	$2, %rax	#, D.6069
	movl	$0, 72(%rsp)	#, %sfp
	movq	%rax, 32(%rsp)	# D.6069, %sfp
	leal	-1(%rbp), %eax	#, D.6077
	leaq	4(%rcx,%rax,4), %rax	#, D.6077
	movl	$0, 68(%rsp)	#, %sfp
	movq	%rax, 88(%rsp)	# D.6077, %sfp
	movl	%esi, %eax	# fstride, D.6073
	imull	%edx, %eax	# m, D.6073
	movl	%esi, 80(%rsp)	# tmp1541, %sfp
	movl	%eax, 48(%rsp)	# D.6073, %sfp
	leal	-2(%rbp), %eax	#, D.6077
	leaq	4(%rcx,%rax,4), %r15	#, D.6077
# SUCC: 30 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
# BLOCK 30 freq:89 seq:28
# PRED: 38 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 29 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L22:
	movl	12(%rsp), %edi	# %sfp, p
	testl	%edi, %edi	# p
# SUCC: 31 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 38 [9.0%]  (CAN_FALLTHRU)
	jle	.L26	#,
# BLOCK 31 freq:81 seq:29
# PRED: 30 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$32767, %eax	#, tmp1326
	movq	56(%rsp), %rsi	# %sfp, ivtmp.103
	cltd
	movq	88(%rsp), %r8	# %sfp, D.6077
	idivl	%edi	# p
	movq	32(%rsp), %r9	# %sfp, D.6069
# SUCC: 32 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	24(%rsp), %rdx	# %sfp, ivtmp.105
# BLOCK 32 freq:900 seq:30
# PRED: 32 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 31 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L30:
	movl	(%rsi), %ecx	# MEM[base: _1154, offset: 0B], MEM[base: _1154, offset: 0B]
	addq	$4, %rdx	#, ivtmp.105
	addq	%r9, %rsi	# D.6069, ivtmp.103
	movswl	%cx, %edi	# MEM[base: _1154, offset: 0B], D.6068
	sarl	$16, %ecx	#, D.6068
	imull	%eax, %edi	# tmp1326, D.6068
	imull	%eax, %ecx	# tmp1326, D.6068
	addl	$16384, %edi	#, D.6068
	addl	$16384, %ecx	#, D.6068
	sarl	$15, %edi	#, D.6068
	sarl	$15, %ecx	#, D.6068
	movw	%di, -4(%rdx)	# D.6068, MEM[base: _1153, offset: 0B]
	movw	%cx, -2(%rdx)	# D.6068, MEM[base: _1153, offset: 2B]
	cmpq	%r8, %rdx	# D.6077, ivtmp.105
# SUCC: 32 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 33 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L30	#,
# BLOCK 33 freq:81 seq:31
# PRED: 32 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	movq	24(%rsp), %rax	# %sfp, scratch
	movl	$0, 16(%rsp)	#, %sfp
	movq	56(%rsp), %r10	# %sfp, ivtmp.95
	movl	72(%rsp), %r13d	# %sfp, ivtmp.93
	movl	(%rax), %eax	# *scratch_791, *scratch_791
# SUCC: 34 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, 40(%rsp)	# *scratch_791, %sfp
# BLOCK 34 freq:900 seq:32
# PRED: 37 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 33 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L29:
	movl	40(%rsp), %eax	# %sfp, *scratch_791
	cmpl	$1, 12(%rsp)	#, %sfp
	movl	%eax, (%r10)	# *scratch_791, MEM[base: _1164, offset: 0B]
# SUCC: 35 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 37 [9.0%]  (CAN_FALLTHRU)
	je	.L27	#,
# BLOCK 35 freq:819 seq:33
# PRED: 34 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movzwl	(%r10), %r12d	# MEM[base: _1164, offset: 0B], D.6078
	xorl	%ecx, %ecx	# twidx
	movzwl	2(%r10), %ebp	# MEM[base: _1164, offset: 2B], D.6078
# SUCC: 36 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	24(%rsp), %rax	# %sfp, ivtmp.82
# BLOCK 36 freq:9100 seq:34
# PRED: 35 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 36 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L28:
	addl	%r13d, %ecx	# ivtmp.93, D.6073
	movswl	6(%rax), %r8d	# MEM[base: _1185, offset: 6B], D.6068
	movl	%ecx, %edx	# D.6073, twidx
	subl	%ebx, %edx	# Norig, twidx
	cmpl	%ecx, %ebx	# D.6073, Norig
	cmovle	%edx, %ecx	# twidx,, twidx
	movswl	4(%rax), %edx	# MEM[base: _1185, offset: 4B], D.6068
	addq	$4, %rax	#, ivtmp.82
	movslq	%ecx, %rsi	# twidx, D.6069
	leaq	(%r14,%rsi,4), %rsi	#, D.6072
	movswl	(%rsi), %r9d	# _836->r, D.6068
	movl	%edx, %edi	# D.6068, D.6068
	movswl	2(%rsi), %r11d	# _836->i, D.6068
	movl	%r8d, %esi	# D.6068, D.6068
	imull	%r9d, %edi	# D.6068, D.6068
	imull	%r11d, %esi	# D.6068, D.6068
	imull	%r9d, %r8d	# D.6068, D.6068
	imull	%edx, %r11d	# D.6068, D.6068
	subl	%esi, %edi	# D.6068, D.6068
	leal	16384(%rdi), %esi	#, D.6068
	leal	16384(%r11,%r8), %edx	#, D.6068
	sarl	$15, %esi	#, D.6068
	sarl	$15, %edx	#, D.6068
	addl	%esi, %r12d	# D.6068, D.6070
	addl	%edx, %ebp	# D.6068, D.6070
	cmpq	%r15, %rax	# D.6077, ivtmp.82
	movw	%r12w, (%r10)	# D.6070, MEM[base: _1164, offset: 0B]
	movw	%bp, 2(%r10)	# D.6070, MEM[base: _1164, offset: 2B]
# SUCC: 36 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 37 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L28	#,
# BLOCK 37 freq:900 seq:35
# PRED: 36 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 34 [9.0%]  (CAN_FALLTHRU)
.L27:
	addl	$1, 16(%rsp)	#, %sfp
	movl	12(%rsp), %eax	# %sfp, p
	addl	48(%rsp), %r13d	# %sfp, ivtmp.93
	addq	32(%rsp), %r10	# %sfp, ivtmp.95
	cmpl	%eax, 16(%rsp)	# p, %sfp
# SUCC: 34 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 38 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L29	#,
# BLOCK 38 freq:89 seq:36
# PRED: 30 [9.0%]  (CAN_FALLTHRU) 37 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L26:
	movl	80(%rsp), %eax	# %sfp, D.6073
	addl	$1, 68(%rsp)	#, %sfp
	addq	$4, 56(%rsp)	#, %sfp
	addl	%eax, 72(%rsp)	# D.6073, %sfp
	movl	64(%rsp), %eax	# %sfp, m
	cmpl	%eax, 68(%rsp)	# m, %sfp
# SUCC: 30 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 39 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L22	#,
# BLOCK 39 freq:9 seq:37
# PRED: 28 [9.0%]  (CAN_FALLTHRU) 38 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L21:
	movq	24(%rsp), %rdi	# %sfp,
	addq	$168, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
	.cfi_endproc
.LFE78:
	.size	kf_work, .-kf_work
	.p2align 4,,15
	.globl	kiss_fft_alloc
	.type	kiss_fft_alloc, @function
kiss_fft_alloc:
.LFB80:
	.cfi_startproc
# BLOCK 2 freq:501 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%rdi), %eax	#, D.6109
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	cltq
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx	# nfft, nfft
	leaq	268(,%rax,4), %rdi	#, memneeded
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	testq	%rcx, %rcx	# lenmem
# SUCC: 28 [6.7%]  (CAN_FALLTHRU) 3 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L75	#,
# BLOCK 3 freq:468 seq:1
# PRED: 2 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	testq	%rdx, %rdx	# mem
	movq	%rdx, %rbp	# mem, mem
# SUCC: 4 [85.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [15.0%]  (CAN_FALLTHRU)
	je	.L47	#,
# BLOCK 4 freq:397 seq:2
# PRED: 3 [85.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpq	(%rcx), %rdi	# *lenmem_13(D), memneeded
	movl	$0, %eax	#, tmp189
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmova	%rax, %rbp	# mem,, tmp189, mem
# BLOCK 5 freq:468 seq:3
# PRED: 3 [15.0%]  (CAN_FALLTHRU) 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L47:
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, (%rcx)	# memneeded, *lenmem_13(D)
# BLOCK 6 freq:501 seq:4
# PRED: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 28 [100.0%] 
.L46:
	testq	%rbp, %rbp	# mem
# SUCC: 7 [89.9%]  (FALLTHRU,CAN_FALLTHRU) 21 [10.1%]  (CAN_FALLTHRU)
	je	.L72	#,
# BLOCK 7 freq:451 seq:5
# PRED: 6 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	testl	%ebx, %ebx	# nfft
	movl	%ebx, 0(%rbp)	# nfft, MEM[(struct kiss_fft_state *)mem_2].nfft
	movl	%esi, 4(%rbp)	# inverse_fft, MEM[(struct kiss_fft_state *)mem_2].inverse
# SUCC: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 27 [9.0%]  (CAN_FALLTHRU)
	jle	.L76	#,
# BLOCK 8 freq:410 seq:6
# PRED: 7 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	cvtsi2sd	%ebx, %xmm3	# nfft, D.6111
	movsd	.LC4(%rip), %xmm0	#, D.6111
	xorl	%r14d, %r14d	# i
	leaq	40(%rsp), %r13	#, tmp182
	testl	%esi, %esi	# inverse_fft
	movq	%rbp, %r15	# mem, ivtmp.258
	leaq	32(%rsp), %r12	#, tmp188
	movsd	%xmm3, 24(%rsp)	# D.6111, %sfp
	divsd	%xmm3, %xmm0	# D.6111, D.6111
# SUCC: 9 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 22 [50.0%]  (CAN_FALLTHRU)
	jne	.L52	#,
# BLOCK 9 freq:205 seq:7
# PRED: 8 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	.LC6(%rip), %xmm3	#, tmp185
	movsd	%xmm3, (%rsp)	# tmp185, %sfp
	movsd	.LC7(%rip), %xmm3	#, tmp186
	movsd	%xmm3, 8(%rsp)	# tmp186, %sfp
	movsd	.LC5(%rip), %xmm3	#, D.6111
	mulsd	%xmm0, %xmm3	# D.6111, D.6111
# SUCC: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	%xmm3, 16(%rsp)	# D.6111, %sfp
# BLOCK 10 freq:2278 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L56:
	cvtsi2sd	%r14d, %xmm0	# i, phase
	movq	%r12, %rsi	# tmp188,
	movq	%r13, %rdi	# tmp182,
	mulsd	16(%rsp), %xmm0	# %sfp, phase
	call	sincos	#
	movsd	32(%rsp), %xmm1	#, D.6111
	movsd	(%rsp), %xmm4	# %sfp, tmp185
	movsd	8(%rsp), %xmm6	# %sfp, tmp186
	mulsd	%xmm4, %xmm1	# tmp185, D.6111
	movsd	40(%rsp), %xmm0	#, D.6111
	mulsd	%xmm4, %xmm0	# tmp185, D.6111
	addsd	%xmm6, %xmm1	# tmp186, D.6111
	addsd	%xmm6, %xmm0	# tmp186, D.6111
	cvttsd2si	%xmm1, %eax	# D.6111, tmp143
	cvtsi2sd	%eax, %xmm2	# tmp143, tmp144
	leal	-1(%rax), %edx	#, tmp194
	comisd	%xmm1, %xmm2	# D.6111, tmp144
	cmova	%edx, %eax	# tmp143,, tmp194, tmp143
	movw	%ax, 264(%r15)	# tmp143, MEM[base: _97, offset: 264B]
	cvttsd2si	%xmm0, %eax	# D.6111, tmp151
	cvtsi2sd	%eax, %xmm1	# tmp151, tmp152
	leal	-1(%rax), %edx	#, tmp196
	comisd	%xmm0, %xmm1	# D.6111, tmp152
	cmova	%edx, %eax	# tmp151,, tmp196, tmp151
	addl	$1, %r14d	#, i
	addq	$4, %r15	#, ivtmp.258
	movw	%ax, 262(%r15)	# tmp151, MEM[base: _97, offset: 266B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L56	#,
# BLOCK 11 freq:451 seq:9
# PRED: 24 [100.0%]  10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 27 [100.0%] 
.L55:
	sqrtsd	24(%rsp), %xmm1	# %sfp, D.6111
	movsd	.LC3(%rip), %xmm0	#, tmp126
	movsd	.LC2(%rip), %xmm2	#, tmp124
	leaq	8(%rbp), %rsi	#, facbuf
	andpd	%xmm1, %xmm0	# D.6111, tmp126
	ucomisd	%xmm0, %xmm2	# tmp126, tmp124
# SUCC: 13 [50.0%]  (CAN_FALLTHRU) 12 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jbe	.L50	#,
# BLOCK 12 freq:226 seq:10
# PRED: 11 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	cvttsd2siq	%xmm1, %rax	# D.6111, tmp129
# SUCC: 13 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cvtsi2sdq	%rax, %xmm1	# tmp129, D.6111
# BLOCK 13 freq:452 seq:11
# PRED: 11 [50.0%]  (CAN_FALLTHRU) 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L50:
	movsd	.LC1(%rip), %xmm3	#, D.6111
	movl	$4, %ecx	#, nfft
# SUCC: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	.LC0(%rip), %xmm2	#, D.6111
# BLOCK 14 freq:5450 seq:12
# PRED: 13 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [100.0%] 
	.p2align 4,,10
	.p2align 3
.L51:
	movl	%ebx, %eax	# nfft, tmp179
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.6109
# SUCC: 17 [50.0%]  (CAN_FALLTHRU) 15 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L64	#,
# BLOCK 15 freq:5000 seq:13
# PRED: 14 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 16 [50.0%]  (CAN_FALLTHRU)
.L77:
	movl	%eax, %ebx	# tmp179, nfft
	movl	%ecx, (%rsi)	# nfft, *facbuf_54
	leaq	8(%rsi), %rax	#, facbuf
	cmpl	$1, %ebx	#, nfft
	movl	%ebx, 4(%rsi)	# nfft, MEM[(int *)facbuf_54 + 4B]
# SUCC: 16 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 21 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L72	#,
# BLOCK 16 freq:4550 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %rsi	# facbuf, facbuf
	movl	%ebx, %eax	# nfft, tmp179
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.6109
# SUCC: 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 15 [50.0%]  (CAN_FALLTHRU)
	je	.L77	#,
# BLOCK 17 freq:5000 seq:15
# PRED: 14 [50.0%]  (CAN_FALLTHRU) 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
.L64:
	cmpl	$2, %ecx	#, nfft
# SUCC: 25 [33.3%]  (CAN_FALLTHRU) 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L66	#,
# BLOCK 18 freq:3334 seq:16
# PRED: 17 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %ecx	#, nfft
# SUCC: 19 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [50.0%]  (CAN_FALLTHRU)
	jne	.L73	#,
# BLOCK 19 freq:1667 seq:17
# PRED: 18 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movapd	%xmm2, %xmm0	# D.6111, D.6111
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movb	$2, %cl	#,
# BLOCK 20 freq:4999 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [100.0%]  26 [100.0%] 
.L61:
	comisd	%xmm1, %xmm0	# D.6111, D.6111
	cmova	%ebx, %ecx	# nfft,, nfft, nfft
# SUCC: 14 [100.0%] 
	jmp	.L51	#
# BLOCK 21 freq:1002 seq:19
# PRED: 15 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 6 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L72:
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax	# mem,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 22 freq:205 seq:20
# PRED: 8 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	movsd	.LC5(%rip), %xmm3	#, D.6111
	movsd	.LC6(%rip), %xmm4	#, tmp185
	mulsd	%xmm0, %xmm3	# D.6111, D.6111
	movsd	.LC7(%rip), %xmm5	#, tmp186
	movsd	%xmm4, (%rsp)	# tmp185, %sfp
	movsd	%xmm5, 8(%rsp)	# tmp186, %sfp
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	%xmm3, 16(%rsp)	# D.6111, %sfp
# BLOCK 23 freq:2278 seq:21
# PRED: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L59:
	cvtsi2sd	%r14d, %xmm0	# i, phase
	movq	%r12, %rsi	# tmp188,
	movq	%r13, %rdi	# tmp182,
	mulsd	16(%rsp), %xmm0	# %sfp, phase
	xorpd	.LC8(%rip), %xmm0	#, phase
	call	sincos	#
	movsd	32(%rsp), %xmm1	#, D.6111
	movsd	(%rsp), %xmm5	# %sfp, tmp185
	movsd	8(%rsp), %xmm7	# %sfp, tmp186
	mulsd	%xmm5, %xmm1	# tmp185, D.6111
	movsd	40(%rsp), %xmm0	#, D.6111
	mulsd	%xmm5, %xmm0	# tmp185, D.6111
	addsd	%xmm7, %xmm1	# tmp186, D.6111
	addsd	%xmm7, %xmm0	# tmp186, D.6111
	cvttsd2si	%xmm1, %eax	# D.6111, tmp166
	cvtsi2sd	%eax, %xmm2	# tmp166, tmp167
	leal	-1(%rax), %edx	#, tmp195
	comisd	%xmm1, %xmm2	# D.6111, tmp167
	cmova	%edx, %eax	# tmp166,, tmp195, tmp166
	movw	%ax, 264(%r15)	# tmp166, MEM[base: _84, offset: 264B]
	cvttsd2si	%xmm0, %eax	# D.6111, tmp174
	cvtsi2sd	%eax, %xmm1	# tmp174, tmp175
	leal	-1(%rax), %edx	#, tmp197
	comisd	%xmm0, %xmm1	# D.6111, tmp175
	cmova	%edx, %eax	# tmp174,, tmp197, tmp174
	addl	$1, %r14d	#, i
	addq	$4, %r15	#, ivtmp.265
	movw	%ax, 262(%r15)	# tmp174, MEM[base: _84, offset: 266B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU)
	jne	.L59	#,
# BLOCK 24 freq:205 seq:22
# PRED: 23 [9.0%]  (FALLTHRU)
# SUCC: 11 [100.0%] 
	jmp	.L55	#
# BLOCK 25 freq:1667 seq:23
# PRED: 17 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L66:
	movapd	%xmm3, %xmm0	# D.6111, D.6111
	movl	$3, %ecx	#, nfft
# SUCC: 20 [100.0%] 
	jmp	.L61	#
# BLOCK 26 freq:1666 seq:24
# PRED: 18 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L73:
	addl	$2, %ecx	#, nfft
	cvtsi2sd	%ecx, %xmm0	# nfft, D.6111
# SUCC: 20 [100.0%] 
	jmp	.L61	#
# BLOCK 27 freq:41 seq:25
# PRED: 7 [9.0%]  (CAN_FALLTHRU)
.L76:
	cvtsi2sd	%ebx, %xmm6	# nfft, D.6111
	movsd	%xmm6, 24(%rsp)	# D.6111, %sfp
# SUCC: 11 [100.0%] 
	jmp	.L55	#
# BLOCK 28 freq:34 seq:26
# PRED: 2 [6.7%]  (CAN_FALLTHRU)
.L75:
	movl	%esi, (%rsp)	# inverse_fft, %sfp
	call	malloc	#
	movl	(%rsp), %esi	# %sfp, inverse_fft
	movq	%rax, %rbp	#, mem
# SUCC: 6 [100.0%] 
	jmp	.L46	#
	.cfi_endproc
.LFE80:
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.p2align 4,,15
	.globl	kiss_fft_stride
	.type	kiss_fft_stride, @function
kiss_fft_stride:
.LFB81:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp	# fin, fin
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx	# st, st
	movq	%rdx, %rdi	# fout, fout
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 48
	cmpq	%rdx, %rsi	# fout, fin
# SUCC: 4 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L81	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$16, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movq	%rbx, %r9	# st,
	movl	$1, %edx	#,
	leaq	8(%rbx), %r8	#,
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_work	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	movslq	(%rbx), %rdi	# st_5(D)->nfft, D.6135
	movl	%ecx, 12(%rsp)	# in_stride, %sfp
	salq	$2, %rdi	#, D.6135
	call	malloc	#
	movl	12(%rsp), %ecx	# %sfp, in_stride
	movq	%rbx, %r9	# st,
	leaq	8(%rbx), %r8	#,
	movq	%rbp, %rsi	# fin,
	movq	%rax, %rdi	# tmp75,
	movl	$1, %edx	#,
	movq	%rax, %r12	#, tmp75
	call	kf_work	#
	movslq	(%rbx), %rdx	# st_5(D)->nfft, D.6135
	movq	%rbp, %rdi	# fin,
	movq	%r12, %rsi	# tmp75,
	salq	$2, %rdx	#, D.6135
	call	memcpy	#
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
	movq	%r12, %rdi	# tmp75,
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
	.cfi_endproc
.LFE81:
	.size	kiss_fft_stride, .-kiss_fft_stride
	.p2align 4,,15
	.globl	kiss_fft
	.type	kiss_fft, @function
kiss_fft:
.LFB82:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	cmpq	%rdx, %rsi	# fout, fin
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp	# fin, fin
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx	# cfg, cfg
	movq	%rdx, %rdi	# fout, fout
# SUCC: 4 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L85	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rbx, %r9	# cfg,
	movl	$1, %ecx	#,
	movl	$1, %edx	#,
	leaq	8(%rbx), %r8	#,
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_work	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
	movslq	(%rbx), %rdi	# cfg_2(D)->nfft, D.6151
	salq	$2, %rdi	#, D.6151
	call	malloc	#
	movq	%rbx, %r9	# cfg,
	movq	%rbp, %rsi	# fin,
	leaq	8(%rbx), %r8	#,
	movq	%rax, %rdi	# tmp74,
	movl	$1, %ecx	#,
	movl	$1, %edx	#,
	movq	%rax, %r12	#, tmp74
	call	kf_work	#
	movslq	(%rbx), %rdx	# cfg_2(D)->nfft, D.6151
	movq	%rbp, %rdi	# fin,
	movq	%r12, %rsi	# tmp74,
	salq	$2, %rdx	#, D.6151
	call	memcpy	#
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi	# tmp74,
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
	.cfi_endproc
.LFE82:
	.size	kiss_fft, .-kiss_fft
	.p2align 4,,15
	.globl	kiss_fft_cleanup
	.type	kiss_fft_cleanup, @function
kiss_fft_cleanup:
.LFB83:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
# SUCC: EXIT [100.0%] 
	rep ret
	.cfi_endproc
.LFE83:
	.size	kiss_fft_cleanup, .-kiss_fft_cleanup
	.p2align 4,,15
	.globl	kiss_fft_next_fast_size
	.type	kiss_fft_next_fast_size, @function
kiss_fft_next_fast_size:
.LFB84:
	.cfi_startproc
# BLOCK 2 freq:81 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movl	$1431655766, %r8d	#, tmp126
# SUCC: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$1717986919, %esi	#, tmp127
# BLOCK 3 freq:900 seq:1
# PRED: 2 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 10 [100.0%] 
	.p2align 4,,10
	.p2align 3
.L95:
	testb	$1, %dil	#, n
	movl	%edi, %ecx	# n, n
# SUCC: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [9.0%]  (CAN_FALLTHRU)
	jne	.L88	#,
# BLOCK 4 freq:9100 seq:2
# PRED: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L89:
	movl	%ecx, %eax	# n, tmp76
	shrl	$31, %eax	#, tmp76
	addl	%eax, %ecx	# tmp76, n
	sarl	%ecx	# n
	testb	$1, %cl	#, n
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	je	.L89	#,
# BLOCK 5 freq:900 seq:3
# PRED: 3 [9.0%]  (CAN_FALLTHRU) 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L88:
	movl	%ecx, %eax	# n, tmp128
	imull	%r8d	# tmp126
	movl	%ecx, %eax	# n, tmp83
	sarl	$31, %eax	#, tmp83
	subl	%eax, %edx	# tmp83, tmp80
	leal	(%rdx,%rdx,2), %eax	#, tmp86
	cmpl	%eax, %ecx	# tmp86, n
# SUCC: 6 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [9.0%]  (CAN_FALLTHRU)
	jne	.L90	#,
# BLOCK 6 freq:9100 seq:4
# PRED: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L91:
	movl	%ecx, %eax	# n, tmp129
	sarl	$31, %ecx	#, tmp91
	imull	%r8d	# tmp126
	subl	%ecx, %edx	# tmp91, n
	movl	%edx, %eax	# n, tmp130
	movl	%edx, %ecx	# n, n
	imull	%r8d	# tmp126
	movl	%ecx, %r9d	# n, tmp95
	sarl	$31, %r9d	#, tmp95
	subl	%r9d, %edx	# tmp95, tmp92
	leal	(%rdx,%rdx,2), %edx	#, tmp98
	cmpl	%edx, %ecx	# tmp98, n
# SUCC: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 7 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	je	.L91	#,
# BLOCK 7 freq:900 seq:5
# PRED: 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 5 [9.0%]  (CAN_FALLTHRU)
.L90:
	movl	%ecx, %eax	# n, tmp131
	imull	%esi	# tmp127
	movl	%ecx, %eax	# n, tmp104
	sarl	$31, %eax	#, tmp104
	sarl	%edx	# tmp100
	subl	%eax, %edx	# tmp104, tmp100
	leal	(%rdx,%rdx,4), %eax	#, tmp107
	cmpl	%eax, %ecx	# tmp107, n
# SUCC: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [9.0%]  (CAN_FALLTHRU)
	jne	.L92	#,
# BLOCK 8 freq:9100 seq:6
# PRED: 8 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 7 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L93:
	movl	%ecx, %eax	# n, tmp132
	sarl	$31, %ecx	#, tmp113
	imull	%esi	# tmp127
	sarl	%edx	# tmp112
	subl	%ecx, %edx	# tmp113, n
	movl	%edx, %eax	# n, tmp133
	movl	%edx, %ecx	# n, n
	imull	%esi	# tmp127
	movl	%ecx, %r9d	# n, tmp118
	sarl	$31, %r9d	#, tmp118
	sarl	%edx	# tmp114
	subl	%r9d, %edx	# tmp118, tmp114
	leal	(%rdx,%rdx,4), %edx	#, tmp121
	cmpl	%edx, %ecx	# tmp121, n
# SUCC: 8 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 9 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	je	.L93	#,
# BLOCK 9 freq:900 seq:7
# PRED: 8 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 7 [9.0%]  (CAN_FALLTHRU)
.L92:
	cmpl	$1, %ecx	#, n
# SUCC: 11 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	jle	.L94	#,
# BLOCK 10 freq:819 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	$1, %edi	#, n
# SUCC: 3 [100.0%] 
	jmp	.L95	#
# BLOCK 11 freq:81 seq:9
# PRED: 9 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L94:
	movl	%edi, %eax	# n,
	.p2align 4,,3
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE84:
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1074266112
	.align 8
.LC2:
	.long	0
	.long	1127219200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	1413754136
	.long	-1072094725
	.align 8
.LC6:
	.long	0
	.long	1088421824
	.align 8
.LC7:
	.long	0
	.long	1071644672
	.section	.rodata.cst16
	.align 16
.LC8:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
