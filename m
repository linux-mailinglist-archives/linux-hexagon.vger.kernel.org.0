Return-Path: <linux-hexagon+bounces-690-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1585A099C2
	for <lists+linux-hexagon@lfdr.de>; Fri, 10 Jan 2025 19:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BAE53A8537
	for <lists+linux-hexagon@lfdr.de>; Fri, 10 Jan 2025 18:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4494A218ACA;
	Fri, 10 Jan 2025 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G1T3ZOcw"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9993821B8E1
	for <linux-hexagon@vger.kernel.org>; Fri, 10 Jan 2025 18:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534478; cv=none; b=Cg/Rset3f0tUvEC/ifi84cekdpBMGM9tfP4R+5FKE/I2IMRqRGLcjowGVNJgLWCoQB4ahZbOm+t6ha9HlasiW8ljGTeP09eZr8mSv0rxDJRmtc0i50eUlJKfcMSEFCrmcwAdaXAi/RtxcqS/DxrCHHA3XQLEjn8bzqrToEzXsUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534478; c=relaxed/simple;
	bh=XnAw5nMnRVqakR2t02DFaQRnPs8banykJ7ILMz9ZBlM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HhsvsKn8C2OLLeop0qHi7E9tAl/XYTSb73EdTxHsD+TmcCrawaVw+KKRBTdWKCsqHzFlaD71uuyyJQ5dmk1vyWQYf2itSuf4YF9IeoLL4HsCDbcO6xI8J1hBCRe9yIfxzSnYHt5anf41EM8Z5m0GuZ3BpJJ77ch9en3oeZbitFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G1T3ZOcw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43621907030so19339155e9.1
        for <linux-hexagon@vger.kernel.org>; Fri, 10 Jan 2025 10:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534466; x=1737139266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WaFp0TOYaWSuGPhKgfBnenMecO/UsWYRxmgXZ26ETaU=;
        b=G1T3ZOcwHTnab8YlPK6O9gOURuFau0S6MmThrjvXzqfR2WA3xrOQzRp4j+AkWXuaco
         EA6mcKAhzDdYPUK4CJMRphQzjnG25y5NEQRBe/300nVD6UeJ9V/M7K0oWS/Bnw7eFq/4
         uTacpc46ZOJdPtA8yS16LGBxBmfu1mL38N4FxeaK5onfNijZ32LpEk80g5WzUfep2vWU
         adfGCrFJvJL+2SHF6BNs8iCCrEWIKDxColBTeznrquPHenMvsifoK3PlW/gjUQ1XYPEQ
         JDzcviI/JFHzUZjDHxGlPhrQlDbC/wNEmBWmiRLOu67Mix0VaV3GmmsECOPb4jyJFS3B
         IHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534466; x=1737139266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaFp0TOYaWSuGPhKgfBnenMecO/UsWYRxmgXZ26ETaU=;
        b=rkP2vKny4VAlMqHwBdXysQDglNa65d6w6OflaxzGOulfWk23ZNwzhOrOS+MLW65GVG
         Vu9zOOnGsT+Eb5kGKKLzOF2G214OQ/9Et/RdoKFd+M1gD2x9Zkvsftoy9hk0FyyH/Q3Y
         34qrcrQOnwoeiQ05NyjaHxPBCY25S4pdDcmXbM9ubXueHNdwFJJEO5qFwAAR/dqJSpg1
         4dA8rY9uOaG8ol/G24FApzPYyPxGB00LuNIKF/kYTiFO7ahuXjZufVpTXGvQgMzVfATa
         FdujhfQxGfQpK3mwN2pbXVvpoiVtyU9rGX3Ov+4/tBc7cGq2VKSpDYReEQoNacSpy8Fa
         V6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVSEjuqhpgkkcpToYd53XkHokJ1YPawvAv0L3pPh8EYp7C7Ry+ds+OttXwpG65G2C9jjwOFY6tLNtk2wa5y@vger.kernel.org
X-Gm-Message-State: AOJu0YznX/vLSCfAVn/CAvPqk9QuRxJPWghYy+3nSMjTN6/qBfPaTdrZ
	/QI9fsFE77PcH1IzWf/89VhkFZzarr3x0JJ60lyi+LDuW1d5xhGruU6ZfeoC20wnwrU8Jvcf3ZJ
	ap/n00SgmOQ==
X-Google-Smtp-Source: AGHT+IEE4az+Oz6XpM1h3immNPii0BZQy1AjHZ6Oe5B/in2qx8QsaCvn5PLTDmCUbo/W1PshFIv+Soo2Sqz9XA==
X-Received: from wmrn35.prod.google.com ([2002:a05:600c:5023:b0:434:f2eb:aa72])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ca4:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-436e26e203emr101768035e9.24.1736534465947;
 Fri, 10 Jan 2025 10:41:05 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:35 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-9-8419288bc805@google.com>
Subject: [PATCH RFC v2 09/29] mm: asi: ASI page table allocation functions
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
	Brendan Jackman <jackmanb@google.com>, Junaid Shahid <junaids@google.com>
Content-Type: text/plain; charset="utf-8"

From: Junaid Shahid <junaids@google.com>

This adds custom allocation and free functions for ASI page tables.

The alloc functions support allocating memory using different GFP
reclaim flags, in order to be able to support non-sensitive allocations
from both standard and atomic contexts. They also install the page
tables locklessly, which makes it slightly simpler to handle
non-sensitive allocations from interrupts/exceptions.

checkpatch.pl MACRO_ARG_UNUSED,SPACING is false positive. COMPLEX_MACRO - I
dunno, suggestions welcome.

Checkpatch-args: --ignore=MACRO_ARG_UNUSED,SPACING,COMPLEX_MACRO
Signed-off-by: Junaid Shahid <junaids@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/asi.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index 8d060c633be68b508847e2c1c111761df1da92af..b15d043acedc9f459f17e86564a15061650afc3a 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -73,6 +73,65 @@ const char *asi_class_name(enum asi_class_id class_id)
 	return asi_class_names[class_id];
 }
 
+#ifndef mm_inc_nr_p4ds
+#define mm_inc_nr_p4ds(mm)	do {} while (false)
+#endif
+
+#ifndef mm_dec_nr_p4ds
+#define mm_dec_nr_p4ds(mm)	do {} while (false)
+#endif
+
+#define pte_offset		pte_offset_kernel
+
+/*
+ * asi_p4d_alloc, asi_pud_alloc, asi_pmd_alloc, asi_pte_alloc.
+ *
+ * These are like the normal xxx_alloc functions, but:
+ *
+ *  - They use atomic operations instead of taking a spinlock; this allows them
+ *    to be used from interrupts. This is necessary because we use the page
+ *    allocator from interrupts and the page allocator ultimately calls this
+ *    code.
+ *  - They support customizing the allocation flags.
+ *
+ * On the other hand, they do not use the normal page allocation infrastructure,
+ * that means that PTE pages do not have the PageTable type nor the PagePgtable
+ * flag and we don't increment the meminfo stat (NR_PAGETABLE) as they do.
+ */
+static_assert(!IS_ENABLED(CONFIG_PARAVIRT));
+#define DEFINE_ASI_PGTBL_ALLOC(base, level)				\
+__maybe_unused								\
+static level##_t * asi_##level##_alloc(struct asi *asi,			\
+				       base##_t *base, ulong addr,	\
+				       gfp_t flags)			\
+{									\
+	if (unlikely(base##_none(*base))) {				\
+		ulong pgtbl = get_zeroed_page(flags);			\
+		phys_addr_t pgtbl_pa;					\
+									\
+		if (!pgtbl)						\
+			return NULL;					\
+									\
+		pgtbl_pa = __pa(pgtbl);					\
+									\
+		if (cmpxchg((ulong *)base, 0,				\
+			    pgtbl_pa | _PAGE_TABLE) != 0) {		\
+			free_page(pgtbl);				\
+			goto out;					\
+		}							\
+									\
+		mm_inc_nr_##level##s(asi->mm);				\
+	}								\
+out:									\
+	VM_BUG_ON(base##_leaf(*base));					\
+	return level##_offset(base, addr);				\
+}
+
+DEFINE_ASI_PGTBL_ALLOC(pgd, p4d)
+DEFINE_ASI_PGTBL_ALLOC(p4d, pud)
+DEFINE_ASI_PGTBL_ALLOC(pud, pmd)
+DEFINE_ASI_PGTBL_ALLOC(pmd, pte)
+
 void __init asi_check_boottime_disable(void)
 {
 	bool enabled = IS_ENABLED(CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION_DEFAULT_ON);

-- 
2.47.1.613.gc27f4b7a9f-goog


