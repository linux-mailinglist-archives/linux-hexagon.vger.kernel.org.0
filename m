Return-Path: <linux-hexagon+bounces-17-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C487F309A
	for <lists+linux-hexagon@lfdr.de>; Tue, 21 Nov 2023 15:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54EE6B20DB6
	for <lists+linux-hexagon@lfdr.de>; Tue, 21 Nov 2023 14:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CED354FA5;
	Tue, 21 Nov 2023 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lK8s4WR4"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0441A3
	for <linux-hexagon@vger.kernel.org>; Tue, 21 Nov 2023 06:24:54 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6cb66fbc63dso1968477b3a.0
        for <linux-hexagon@vger.kernel.org>; Tue, 21 Nov 2023 06:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576694; x=1701181494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQzQ3hctuM1DrYXT+jmSwlcI1w3CAnf53zL9eOZco7c=;
        b=lK8s4WR4D8qSeSl/wIndq3Y/ygX+TN/NIiGvIInZYS4yLgqoazrLYb8VAsi94YZzBI
         Ewym/spIimpGTmNWO7w2DqPAQtRk0t8uGS52aH9pk/e/RSSPg1qPA0gv2iH456fXHf2N
         ZXK1lnI6HFlp3OWOdl3g6XN8WYUSY3bAAdc0YJ4gN/FM4U+/ThowxrCYqtt3tszLtix3
         WN7go69/Fj1hDOdBr+s/K9yYhCiYll4EMUahkrElleQ9rr0BwlPgUhSNNWEGXydRVBUK
         Bu0F/GyJBqfWo6ozXYgA4xusqzgvnUHsanLlnxodjTMBnIVRIWOqkjX22HUiu1BXvR6Q
         Anpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576694; x=1701181494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQzQ3hctuM1DrYXT+jmSwlcI1w3CAnf53zL9eOZco7c=;
        b=Yk888YM0O/7Xt4zrltUXiJNXYUdVzwNY69F9lpqVH1ofAYCGKhK8air2f+y3/70oJl
         Hh4QX/tgaCBMJ20/udMKB+xxv3yHe91TaVKTfIQ3By6gdCixnd8d6xH6tSrZ0YK1ZZTL
         7aECXhfN9DtAn96NvXAVDKy/KPTVHbKgpW/ZkB2ieGyAXtSli3N3vtE9FekyL9JtXn5Z
         PBJGFKyVeIeP7YGMUZSLk+KrPjQb15HvJADFfd8PEW+U2Zli5SBPsKmNl07AhGvc72uw
         30KUly3USPKx+IoZGHnuzP+M65/Al674IUrEsWL59PYjrZiHtVku1N4Fcyy5soGayD5n
         yFGQ==
X-Gm-Message-State: AOJu0YwZ+n76/KU5prh04KzRN36UQxHwEdc2ZhG69VdVbMDrjKnCQHyw
	x0D4uP7jFVzTkqAM3thRs0jYGQ==
X-Google-Smtp-Source: AGHT+IHbYu2jqbF7t8/wu/0pojkQUebMfIzAqIQeTS1oR0oKU5ESn/XV9iR5u5ULhgBjAJ/tpgr/hw==
X-Received: by 2002:a05:6a00:228f:b0:6cb:8abd:39b5 with SMTP id f15-20020a056a00228f00b006cb8abd39b5mr4000172pfe.1.1700576693727;
        Tue, 21 Nov 2023 06:24:53 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:24:53 -0800 (PST)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: ubizjak@gmail.com,
	mark.rutland@arm.com,
	vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.org,
	mhiramat@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.net,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/5] arch,locking/atomic: arc: add arch_cmpxchg[64]_local
Date: Tue, 21 Nov 2023 22:23:44 +0800
Message-Id: <20231121142347.241356-3-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arc doesn't have arch_cmpxhg_local implemented, which causes
building failures for any references of try_cmpxchg_local,
reported by the kernel test robot.

This patch implements arch_cmpxchg[64]_local with the native
cmpxchg variant if the corresponding data size is supported,
otherwise generci_cmpxchg[64]_local is to be used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/arc/include/asm/cmpxchg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index bf46514f6f12..91429f2350df 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -80,6 +80,34 @@
 
 #endif
 
+/*
+ * always make arch_cmpxchg[64]_local available, native cmpxchg
+ * will be used if available, then generic_cmpxchg[64]_local
+ */
+#include <asm-generic/cmpxchg-local.h>
+static inline unsigned long __cmpxchg_local(volatile void *ptr,
+				      unsigned long old,
+				      unsigned long new, int size)
+{
+	switch (size) {
+#ifdef CONFIG_ARC_HAS_LLSC
+	case 4:
+		return __cmpxchg_32((int32_t *)ptr, old, new);
+#endif
+	default:
+		return __generic_cmpxchg_local(ptr, old, new, size);
+	}
+
+	return old;
+}
+#define arch_cmpxchg_local(ptr, o, n) ({				\
+	(__typeof__(*ptr))__cmpxchg_local((ptr),			\
+					(unsigned long)(o),		\
+					(unsigned long)(n),		\
+					sizeof(*(ptr)));		\
+})
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
+
 /*
  * xchg
  */
-- 
2.40.1


