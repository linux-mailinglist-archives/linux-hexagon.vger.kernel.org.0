Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DBD67559F
	for <lists+linux-hexagon@lfdr.de>; Fri, 20 Jan 2023 14:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjATNVQ (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 20 Jan 2023 08:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjATNVQ (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 20 Jan 2023 08:21:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1634C45A4;
        Fri, 20 Jan 2023 05:20:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3AA8161F66;
        Fri, 20 Jan 2023 13:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80664C4339B;
        Fri, 20 Jan 2023 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674220818;
        bh=7sRP5YV7+4nvTnB9myl03nHIHTkL3kZT7GRc5F0MWrA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OFDvfDrX++behha59jrKLiGP08cVgLfyeHgYs2XzYiNvQx1ViTSTIDGhYHl0Z4BVc
         Scl+FUOs4YCPDp30VPCfn/ZRUGlXl2uiIJ0I++kX27sG/OvvJjDb/AYKgxA8HrU3cZ
         HD9LzpDkgCim/jXBnt9QPRXA5jcFt/pQBDNdsfzOuAqlp/a9WFQRCsSXiYRtUdwOea
         4ZmBdY+fdRDUdL9LQdMQv6lsFXyVVfbM5SBj859z28jnkRYXpDQ3h2Lf6Wu59pOWUw
         NGuR4Dzgg2q8492rZ5KQyfOtzMkhpBtyXGEdv+TjH7tBdkDxyHwCxmdURS7C+NzcN+
         OC3k4X/sxEPEg==
Received: by mail-ej1-f50.google.com with SMTP id rl14so10566799ejb.2;
        Fri, 20 Jan 2023 05:20:18 -0800 (PST)
X-Gm-Message-State: AFqh2kpf8JeAB6RH2yU0qFLPY8DkNumK4DjkNVNmYStHwW/eQycIMnbZ
        tsdtm7qlMsEed/8MhtZIre1n/XFzF/45mPPHaJw=
X-Google-Smtp-Source: AMrXdXsseKqgithP3QPuUcxmnhw1UliiTCKhMRHieF2HT9vAQYrsWmv9tMQd3G0VMIxKHDhoXw0US9AQjLhMIGdOIRE=
X-Received: by 2002:a17:906:eb13:b0:84d:4cb1:2591 with SMTP id
 mb19-20020a170906eb1300b0084d4cb12591mr2106642ejb.202.1674220816515; Fri, 20
 Jan 2023 05:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20230119143619.2733236-1-vschneid@redhat.com> <20230119143619.2733236-6-vschneid@redhat.com>
In-Reply-To: <20230119143619.2733236-6-vschneid@redhat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Fri, 20 Jan 2023 21:19:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H59VNksaXRXG-6THv+1jLeMD-mLBYYrVb7mj5eRtOpr+g@mail.gmail.com>
Message-ID: <CAAhV-H59VNksaXRXG-6THv+1jLeMD-mLBYYrVb7mj5eRtOpr+g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] treewide: Trace IPIs sent via smp_send_reschedule()
To:     Valentin Schneider <vschneid@redhat.com>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, Guo Ren <guoren@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

For LoongArch parts,
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Thu, Jan 19, 2023 at 10:37 PM Valentin Schneider <vschneid@redhat.com> wrote:
>
> To be able to trace invocations of smp_send_reschedule(), rename the
> arch-specific definitions of it to arch_smp_send_reschedule() and wrap it
> into an smp_send_reschedule() that contains a tracepoint.
>
> Changes to include the declaration of the tracepoint were driven by the
> following coccinelle script:
>
>   @func_use@
>   @@
>   smp_send_reschedule(...);
>
>   @include@
>   @@
>   #include <trace/events/ipi.h>
>
>   @no_include depends on func_use && !include@
>   @@
>     #include <...>
>   +
>   + #include <trace/events/ipi.h>
>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> [csky bits]
> Acked-by: Guo Ren <guoren@kernel.org>
> [riscv bits]
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/alpha/kernel/smp.c                  |  2 +-
>  arch/arc/kernel/smp.c                    |  2 +-
>  arch/arm/kernel/smp.c                    |  2 +-
>  arch/arm/mach-actions/platsmp.c          |  2 ++
>  arch/arm64/kernel/smp.c                  |  2 +-
>  arch/csky/kernel/smp.c                   |  2 +-
>  arch/hexagon/kernel/smp.c                |  2 +-
>  arch/ia64/kernel/smp.c                   |  4 ++--
>  arch/loongarch/kernel/smp.c              |  4 ++--
>  arch/mips/include/asm/smp.h              |  2 +-
>  arch/mips/kernel/rtlx-cmp.c              |  2 ++
>  arch/openrisc/kernel/smp.c               |  2 +-
>  arch/parisc/kernel/smp.c                 |  4 ++--
>  arch/powerpc/kernel/smp.c                |  6 ++++--
>  arch/powerpc/kvm/book3s_hv.c             |  3 +++
>  arch/powerpc/platforms/powernv/subcore.c |  2 ++
>  arch/riscv/kernel/smp.c                  |  4 ++--
>  arch/s390/kernel/smp.c                   |  2 +-
>  arch/sh/kernel/smp.c                     |  2 +-
>  arch/sparc/kernel/smp_32.c               |  2 +-
>  arch/sparc/kernel/smp_64.c               |  2 +-
>  arch/x86/include/asm/smp.h               |  2 +-
>  arch/x86/kvm/svm/svm.c                   |  4 ++++
>  arch/x86/kvm/x86.c                       |  2 ++
>  arch/xtensa/kernel/smp.c                 |  2 +-
>  include/linux/smp.h                      | 11 +++++++++--
>  virt/kvm/kvm_main.c                      |  2 ++
>  27 files changed, 52 insertions(+), 26 deletions(-)
>
> diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
> index f4e20f75438f8..38637eb9eebd5 100644
> --- a/arch/alpha/kernel/smp.c
> +++ b/arch/alpha/kernel/smp.c
> @@ -562,7 +562,7 @@ handle_ipi(struct pt_regs *regs)
>  }
>
>  void
> -smp_send_reschedule(int cpu)
> +arch_smp_send_reschedule(int cpu)
>  {
>  #ifdef DEBUG_IPI_MSG
>         if (cpu == hard_smp_processor_id())
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index ad93fe6e4b77d..409cfa4675b40 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -292,7 +292,7 @@ static void ipi_send_msg(const struct cpumask *callmap, enum ipi_msg_type msg)
>                 ipi_send_msg_one(cpu, msg);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         ipi_send_msg_one(cpu, IPI_RESCHEDULE);
>  }
> diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> index 45b8ca2ce521f..dea24a6e0ed6f 100644
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -744,7 +744,7 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>         ipi_setup(smp_processor_id());
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/arm/mach-actions/platsmp.c b/arch/arm/mach-actions/platsmp.c
> index f26618b435145..7b208e96fbb67 100644
> --- a/arch/arm/mach-actions/platsmp.c
> +++ b/arch/arm/mach-actions/platsmp.c
> @@ -20,6 +20,8 @@
>  #include <asm/smp_plat.h>
>  #include <asm/smp_scu.h>
>
> +#include <trace/events/ipi.h>
> +
>  #define OWL_CPU1_ADDR  0x50
>  #define OWL_CPU1_FLAG  0x5c
>
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 937d2623e06ba..8d108edc4a89f 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -976,7 +976,7 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>         ipi_setup(smp_processor_id());
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
> index 4b605aa2e1d65..fd7f81be16dd6 100644
> --- a/arch/csky/kernel/smp.c
> +++ b/arch/csky/kernel/smp.c
> @@ -140,7 +140,7 @@ void smp_send_stop(void)
>         on_each_cpu(ipi_stop, NULL, 1);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/hexagon/kernel/smp.c b/arch/hexagon/kernel/smp.c
> index 4ba93e59370c4..4e8bee25b8c68 100644
> --- a/arch/hexagon/kernel/smp.c
> +++ b/arch/hexagon/kernel/smp.c
> @@ -217,7 +217,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>         }
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         send_ipi(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/ia64/kernel/smp.c b/arch/ia64/kernel/smp.c
> index e2cc59db86bc2..ea4f009a232b4 100644
> --- a/arch/ia64/kernel/smp.c
> +++ b/arch/ia64/kernel/smp.c
> @@ -220,11 +220,11 @@ kdump_smp_send_init(void)
>   * Called with preemption disabled.
>   */
>  void
> -smp_send_reschedule (int cpu)
> +arch_smp_send_reschedule (int cpu)
>  {
>         ia64_send_ipi(cpu, IA64_IPI_RESCHEDULE, IA64_IPI_DM_INT, 0);
>  }
> -EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
>
>  /*
>   * Called with preemption disabled.
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index 8c6e227cb29df..83225610a1480 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -155,11 +155,11 @@ void loongson_send_ipi_mask(const struct cpumask *mask, unsigned int action)
>   * it goes straight through and wastes no time serializing
>   * anything. Worst case is that we lose a reschedule ...
>   */
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>  }
> -EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
>
>  irqreturn_t loongson_ipi_interrupt(int irq, void *dev)
>  {
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index 5d9ff61004ca7..9806e79895d99 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -66,7 +66,7 @@ extern void calculate_cpu_foreign_map(void);
>   * it goes straight through and wastes no time serializing
>   * anything. Worst case is that we lose a reschedule ...
>   */
> -static inline void smp_send_reschedule(int cpu)
> +static inline void arch_smp_send_reschedule(int cpu)
>  {
>         extern const struct plat_smp_ops *mp_ops;       /* private */
>
> diff --git a/arch/mips/kernel/rtlx-cmp.c b/arch/mips/kernel/rtlx-cmp.c
> index d26dcc4b46e74..e991cc936c1cd 100644
> --- a/arch/mips/kernel/rtlx-cmp.c
> +++ b/arch/mips/kernel/rtlx-cmp.c
> @@ -17,6 +17,8 @@
>  #include <asm/vpe.h>
>  #include <asm/rtlx.h>
>
> +#include <trace/events/ipi.h>
> +
>  static int major;
>
>  static void rtlx_interrupt(void)
> diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> index e1419095a6f0a..0a7a059e2dff4 100644
> --- a/arch/openrisc/kernel/smp.c
> +++ b/arch/openrisc/kernel/smp.c
> @@ -173,7 +173,7 @@ void handle_IPI(unsigned int ipi_msg)
>         }
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> index 7dbd92cafae38..b7fc859fa87db 100644
> --- a/arch/parisc/kernel/smp.c
> +++ b/arch/parisc/kernel/smp.c
> @@ -246,8 +246,8 @@ void kgdb_roundup_cpus(void)
>  inline void
>  smp_send_stop(void)    { send_IPI_allbutself(IPI_CPU_STOP); }
>
> -void
> -smp_send_reschedule(int cpu) { send_IPI_single(cpu, IPI_RESCHEDULE); }
> +void
> +arch_smp_send_reschedule(int cpu) { send_IPI_single(cpu, IPI_RESCHEDULE); }
>
>  void
>  smp_send_all_nop(void)
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6b90f10a6c819..35f101ccb540d 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -61,6 +61,8 @@
>  #include <asm/kup.h>
>  #include <asm/fadump.h>
>
> +#include <trace/events/ipi.h>
> +
>  #ifdef DEBUG
>  #include <asm/udbg.h>
>  #define DBG(fmt...) udbg_printf(fmt)
> @@ -364,12 +366,12 @@ static inline void do_message_pass(int cpu, int msg)
>  #endif
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         if (likely(smp_ops))
>                 do_message_pass(cpu, PPC_MSG_RESCHEDULE);
>  }
> -EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
>
>  void arch_send_call_function_single_ipi(int cpu)
>  {
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6ba68dd6190bd..3b70b5f80bd56 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -43,6 +43,7 @@
>  #include <linux/compiler.h>
>  #include <linux/of.h>
>  #include <linux/irqdomain.h>
> +#include <linux/smp.h>
>
>  #include <asm/ftrace.h>
>  #include <asm/reg.h>
> @@ -80,6 +81,8 @@
>  #include <asm/dtl.h>
>  #include <asm/plpar_wrappers.h>
>
> +#include <trace/events/ipi.h>
> +
>  #include "book3s.h"
>  #include "book3s_hv.h"
>
> diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
> index 7e98b00ea2e84..c53c4c7977680 100644
> --- a/arch/powerpc/platforms/powernv/subcore.c
> +++ b/arch/powerpc/platforms/powernv/subcore.c
> @@ -20,6 +20,8 @@
>  #include <asm/opal.h>
>  #include <asm/smp.h>
>
> +#include <trace/events/ipi.h>
> +
>  #include "subcore.h"
>  #include "powernv.h"
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 8c3b59f1f9b80..42e9656a1db2e 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -328,8 +328,8 @@ bool smp_crash_stop_failed(void)
>  }
>  #endif
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         send_ipi_single(cpu, IPI_RESCHEDULE);
>  }
> -EXPORT_SYMBOL_GPL(smp_send_reschedule);
> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
> diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
> index 0031325ce4bc9..6c4da1e26e568 100644
> --- a/arch/s390/kernel/smp.c
> +++ b/arch/s390/kernel/smp.c
> @@ -553,7 +553,7 @@ void arch_send_call_function_single_ipi(int cpu)
>   * it goes straight through and wastes no time serializing
>   * anything. Worst case is that we lose a reschedule ...
>   */
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         pcpu_ec_call(pcpu_devices + cpu, ec_schedule);
>  }
> diff --git a/arch/sh/kernel/smp.c b/arch/sh/kernel/smp.c
> index 65924d9ec2459..5cf35a774dc70 100644
> --- a/arch/sh/kernel/smp.c
> +++ b/arch/sh/kernel/smp.c
> @@ -256,7 +256,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
>                (bogosum / (5000/HZ)) % 100);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         mp_ops->send_ipi(cpu, SMP_MSG_RESCHEDULE);
>  }
> diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
> index ad8094d955eba..87eaa7719fa27 100644
> --- a/arch/sparc/kernel/smp_32.c
> +++ b/arch/sparc/kernel/smp_32.c
> @@ -120,7 +120,7 @@ void cpu_panic(void)
>
>  struct linux_prom_registers smp_penguin_ctable = { 0 };
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         /*
>          * CPU model dependent way of implementing IPI generation targeting
> diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> index a55295d1b9244..e5964d1d8b37d 100644
> --- a/arch/sparc/kernel/smp_64.c
> +++ b/arch/sparc/kernel/smp_64.c
> @@ -1430,7 +1430,7 @@ static unsigned long send_cpu_poke(int cpu)
>         return hv_err;
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         if (cpu == smp_processor_id()) {
>                 WARN_ON_ONCE(preemptible());
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index b4dbb20dab1a1..f9757123d8fa1 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -98,7 +98,7 @@ static inline void play_dead(void)
>         smp_ops.play_dead();
>  }
>
> -static inline void smp_send_reschedule(int cpu)
> +static inline void arch_smp_send_reschedule(int cpu)
>  {
>         smp_ops.smp_send_reschedule(cpu);
>  }
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 9a194aa1a75a4..7114f62f4846b 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -27,6 +27,7 @@
>  #include <linux/swap.h>
>  #include <linux/rwsem.h>
>  #include <linux/cc_platform.h>
> +#include <linux/smp.h>
>
>  #include <asm/apic.h>
>  #include <asm/perf_event.h>
> @@ -41,6 +42,9 @@
>  #include <asm/fpu/api.h>
>
>  #include <asm/virtext.h>
> +
> +#include <trace/events/ipi.h>
> +
>  #include "trace.h"
>
>  #include "svm.h"
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index da4bbd043a7b6..730a493d4443e 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -59,7 +59,9 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/entry-kvm.h>
>  #include <linux/suspend.h>
> +#include <linux/smp.h>
>
> +#include <trace/events/ipi.h>
>  #include <trace/events/kvm.h>
>
>  #include <asm/debugreg.h>
> diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
> index 4dc109dd6214e..d95907b8e4d38 100644
> --- a/arch/xtensa/kernel/smp.c
> +++ b/arch/xtensa/kernel/smp.c
> @@ -389,7 +389,7 @@ void arch_send_call_function_single_ipi(int cpu)
>         send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
>  }
>
> -void smp_send_reschedule(int cpu)
> +void arch_smp_send_reschedule(int cpu)
>  {
>         send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
>  }
> diff --git a/include/linux/smp.h b/include/linux/smp.h
> index a80ab58ae3f1d..c036a2228d8d0 100644
> --- a/include/linux/smp.h
> +++ b/include/linux/smp.h
> @@ -125,8 +125,15 @@ extern void smp_send_stop(void);
>  /*
>   * sends a 'reschedule' event to another CPU:
>   */
> -extern void smp_send_reschedule(int cpu);
> -
> +extern void arch_smp_send_reschedule(int cpu);
> +/*
> + * scheduler_ipi() is inline so can't be passed as callback reason, but the
> + * callsite IP should be sufficient for root-causing IPIs sent from here.
> + */
> +#define smp_send_reschedule(cpu) ({                              \
> +       trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);  \
> +       arch_smp_send_reschedule(cpu);                            \
> +})
>
>  /*
>   * Prepare machine for booting other CPUs.
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 9c60384b5ae0b..88620f27c4f94 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -67,6 +67,8 @@
>
>  #include <linux/kvm_dirty_ring.h>
>
> +#include <trace/events/ipi.h>
> +
>  /* Worst case buffer size needed for holding an integer. */
>  #define ITOA_MAX_LEN 12
>
> --
> 2.31.1
>
>
