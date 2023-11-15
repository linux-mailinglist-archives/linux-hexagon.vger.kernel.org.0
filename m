Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112297E0E95
	for <lists+linux-hexagon@lfdr.de>; Sat,  4 Nov 2023 10:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbjKDJRZ (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 4 Nov 2023 05:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231556AbjKDJRR (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 4 Nov 2023 05:17:17 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57DA1D42
        for <linux-hexagon@vger.kernel.org>; Sat,  4 Nov 2023 02:16:56 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so25988135ad.0
        for <linux-hexagon@vger.kernel.org>; Sat, 04 Nov 2023 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699089416; x=1699694216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca5+RMX27tK8Pble5rnmjXYY/wcc9M5C/f3DXh2ZNs0=;
        b=XEwU0yu5PEk36RFN4IAPUKC7D5muKDZt9aSmIw33le1DnG64+iz3t5usxWi1efoKOA
         26SGpYkdFBBPdcM3OaHTY7Jng53GPhUKc9CDNeH1XqFIoPiYQ6cpEwREPQFVU/j5CUYW
         pKyGSH4dVFgbBfE7lixRc/rzwXUS3aqrcmL2sSrq3GOW+57krMt8YgmlfujE/cTnc6lt
         OO01FDkQ8eVsFo683ZrEBdTIttGiR65MYlGZNkinORhLYrFICrdtN2vhf+RdVOYpx0hZ
         1E1YIICudioGNVEe3v01VTlQCkWX6n0Z+SMofZkx70OMfn1fFmJFwbJtcijrIxG6UdZj
         FfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089416; x=1699694216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca5+RMX27tK8Pble5rnmjXYY/wcc9M5C/f3DXh2ZNs0=;
        b=rL2ywraz4K5/fguXK+d5FFfUBJzVPvNpsBCGp4R6Trssc/AmXDT89XpxOo13M0mfkh
         EIkK3R71rA0VGQeVkn6QAOSwO5GQ7qrcQvrVHZnzMpv5VNoPsNNqqXIM9/vZ4VbmN+aE
         zzCe01I8MRD8CaZYAXMUgTnE1JfKj3EZjAGESfT1mwg9B26Lps8vDxpgKXbsNTvN/P2P
         rsensUQfN12DcDJAtYVrr6HeQrMSfvcHiCPBCAVn7KsJS1WrfuVqHndVGqwbQ8PBMckv
         m8lBwq3xqQcRoIqtWYTZ1QZPvjTTx1fU9JGxPCq1oAAe+KEPexy+hOOzzW3vxROMDKSO
         s5ng==
X-Gm-Message-State: AOJu0Yz7wj5EmkX7rOzyq2N3TIC3BXn9aNSFwR1QjD0pwrOStZLfQgJ/
        BDv0K9mGmZFogWXySk2ZLpuy7g==
X-Google-Smtp-Source: AGHT+IHU3BXym51NNkU7o64tWd3Rm0m4CMV06Kghzo1NlAS/cJ7uQGkFro/CIvwdK6Bs6cg+zccvjA==
X-Received: by 2002:a17:902:e88f:b0:1cc:5b5a:62a5 with SMTP id w15-20020a170902e88f00b001cc5b5a62a5mr18228857plg.9.1699089415812;
        Sat, 04 Nov 2023 02:16:55 -0700 (PDT)
Received: from devz1.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc54202429sm2585127plh.288.2023.11.04.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:16:55 -0700 (PDT)
From:   "wuqiang.matt" <wuqiang.matt@bytedance.com>
To:     vgupta@kernel.org, bcain@quicinc.com, jonas@southpole.se,
        stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
        geert@linux-m68k.org, andi.shyti@linux.intel.com, mingo@kernel.org,
        palmer@rivosinc.com, andrzej.hajda@intel.com, arnd@arndb.de,
        peterz@infradead.orgm, mhiramat@kernel.org
Cc:     linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, mattwu@163.com,
        linux@roeck-us.ne, "wuqiang.matt" <wuqiang.matt@bytedance.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 4/4] locking/atomic: hexagon: arch_cmpxchg[64]_local undefined
Date:   Sat,  4 Nov 2023 17:16:15 +0800
Message-Id: <20231104091615.4884-5-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

For architectures that support native cmpxchg, we'd like to
implement arch_cmpxchg[64]_local with the native variants of
supported data size. If not, the generci_cmpxchg[64]_local
will be used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
---
 arch/hexagon/include/asm/cmpxchg.h | 51 +++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index bf6cf5579cf4..2b5e5bbaf807 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_CMPXCHG_H
 #define _ASM_CMPXCHG_H
 
+#include <linux/build_bug.h>
+
 /*
  * __arch_xchg - atomically exchange a register and a memory location
  * @x: value to swap
@@ -51,13 +53,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
  *  variable casting.
  */
 
-#define arch_cmpxchg(ptr, old, new)				\
+#define __cmpxchg_32(ptr, old, new)				\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
 	__typeof__(*(ptr)) __old = (old);			\
 	__typeof__(*(ptr)) __new = (new);			\
 	__typeof__(*(ptr)) __oldval = 0;			\
 								\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);			\
+								\
 	asm volatile(						\
 		"1:	%0 = memw_locked(%1);\n"		\
 		"	{ P0 = cmp.eq(%0,%2);\n"		\
@@ -72,4 +76,49 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 	__oldval;						\
 })
 
+#define __cmpxchg(ptr, old, val, size)				\
+({								\
+	__typeof__(*(ptr)) oldval;				\
+								\
+	switch (size) {						\
+	case 4:							\
+		oldval = __cmpxchg_32(ptr, old, val);		\
+		break;						\
+	default:						\
+		BUILD_BUG();					\
+		oldval = val;					\
+		break;						\
+	}							\
+								\
+	oldval;							\
+})
+
+#define arch_cmpxchg(ptr, o, n)	__cmpxchg((ptr), (o), (n), sizeof(*(ptr)))
+
+/*
+ * always make arch_cmpxchg[64]_local available, native cmpxchg
+ * will be used if available, then generic_cmpxchg[64]_local
+ */
+#include <asm-generic/cmpxchg-local.h>
+
+#define arch_cmpxchg_local(ptr, old, val)			\
+({								\
+	__typeof__(*(ptr)) retval;				\
+	int size = sizeof(*(ptr));				\
+								\
+	switch (size) {						\
+	case 4:							\
+		retval = __cmpxchg_32(ptr, old, val);		\
+		break;						\
+	default:						\
+		retval = __generic_cmpxchg_local(ptr, old,	\
+						 val, size);	\
+		break;						\
+	}							\
+								\
+	retval;							\
+})
+
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
+
 #endif /* _ASM_CMPXCHG_H */
-- 
2.40.1

