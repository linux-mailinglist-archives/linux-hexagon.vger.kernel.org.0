Return-Path: <linux-hexagon+bounces-702-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D7A099F0
	for <lists+linux-hexagon@lfdr.de>; Fri, 10 Jan 2025 19:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 435C43A3051
	for <lists+linux-hexagon@lfdr.de>; Fri, 10 Jan 2025 18:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19567227579;
	Fri, 10 Jan 2025 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lvo99Kck"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08602224AF3
	for <linux-hexagon@vger.kernel.org>; Fri, 10 Jan 2025 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534522; cv=none; b=H64iA5VpxxNjIaBS5tZhRaEu/GWR79YG1R7VhBSM+WlaihU3bdkOr1SOA1TGWFGhTqKrJEARYjlc6UCxDFnqt/Y4bRqxcBpRp9V/aDpVjUr48/jPgXRy3mTQtQOMzEp9eTJml0Npx/IpHIABhyBjda8n/eeXS4m9tMylvykn3/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534522; c=relaxed/simple;
	bh=grUiPSYSTM6ChkvRHUtI259QuAZLs69ifkTxsxb8DH0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RAziUQAlBT2ngbzCUSI9bVNva9dsydZS+RIHpYf7zdPk1UXEeodweQ0diDzH7QlJNz74t0IVd6Pw6Wt22rpeNzLLI4brY8+Pq4az2DJ4vxFiV5QY3/aOzY/rClICHAF6BuFWtH/F00zZ641Vo629IHMybk1lbWGAUiHnMpQ3xvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lvo99Kck; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43625ceae52so12794075e9.0
        for <linux-hexagon@vger.kernel.org>; Fri, 10 Jan 2025 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534488; x=1737139288; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=;
        b=Lvo99KckLDyldxX15h+TjfXGJf7Ekdo5jrPdJIUEIg771ULA8S3zDtTA/izt5OOh2X
         /hKBgkYRRGgVjZ1ihNnRbXQV4k3rQNxvVWvzHemTztULdqYQ9DrKKryTHQvgDIVjKcNO
         3C5pI3cs5m+Fohf/Ic/RUtyER1KlN4jVtLlueSF7qErVgxWFxRGbD31f8TcIW/kHZ34d
         ODNzUhAQBdcHANlZJ6/DY1t20B19souwwVo2UebqYR+hkOhX4/n+x1JkfhEh12fZ10ua
         7bUfLYbQeUqCNQk29ZrclEdM44uaUJfssWrHnFN4GkpO4zM1gzTpaxXUm4m0ROa18Y7k
         OY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534488; x=1737139288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=;
        b=Kw2ncIeMfUyrcCtUmNn+SH4XiK3mRr245WHwXDY6A3yONXTk4zJ5brXHFUPPKGQavU
         Iyd5dK6ASdMpAqahrQk/BdS6gtsKqEMBWKZBX4nvj4doaIBn3SB6H4QfR63m40d57AwX
         lhtqPyM0Mz0XEcuMHwQP+K3URYen2vvhktQcxsZVV9WncK3Lu/rYaZEKXwgq0QwaFPZv
         mugThJ3qPYwj8Sp5PrlNMlb1eKXDyiGaFQbf7r1aEIBb2EnqVIxvhnFnU46Tm5McG+XA
         thWSYP7KBSXdNTBeKP+KZC2p5GpPive7BjTAefmzpBQx1Wd5Cp26dVErlMxbs11nHFDG
         Qv2A==
X-Forwarded-Encrypted: i=1; AJvYcCUcSblniwqiCc7zfu7pUPnUkrHNYArSRsG9D6cjd8NFJdl2c8pYLpShABfz0OaXncdJfXgLf+YJFdqd05bx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4KWGogAP2UWNv4tKLkQqUzqO5t9/s0ZFuXLPImhy64NseAPJ
	doGYIgpY3cud6XfUNS4uzXB10xwzcmXLBm4YpPNM/g/7UG+jNqNAmdF+y89Szygtsh07d2PzY4b
	BYQiKgzcMzQ==
X-Google-Smtp-Source: AGHT+IFeKlzdEnxlsx468YN6J+lzj2fJ2REIK9m1LE7fZOV2UV2JrR/PAzf48/PWmJ/jsXO7ZyblIN12CqtAPQ==
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:434:fa72:f1bf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4586:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-436e26f4b91mr97248925e9.25.1736534488470;
 Fri, 10 Jan 2025 10:41:28 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:45 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-19-8419288bc805@google.com>
Subject: [PATCH RFC v2 19/29] mm: asi: Stabilize CR3 in switch_mm_irqs_off()
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

An ASI-restricted CR3 is unstable as interrupts can cause ASI-exits.
Although we already unconditionally ASI-exit during context-switch, and
before returning from the VM-run path, it's still possible to reach
switch_mm_irqs_off() in a restricted context, because KVM code updates
static keys, which requires using a temporary mm.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/tlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index c55733e144c7538ce7f97b74ea2b1b9c22497c32..ce5598f96ea7a84dc0e8623022ab5bfbba401b48 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -546,6 +546,9 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	bool need_flush;
 	u16 new_asid;
 
+	/* Stabilize CR3, before reading or writing CR3 */
+	asi_exit();
+
 	/* We don't want flush_tlb_func() to run concurrently with us. */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING))
 		WARN_ON_ONCE(!irqs_disabled());

-- 
2.47.1.613.gc27f4b7a9f-goog


