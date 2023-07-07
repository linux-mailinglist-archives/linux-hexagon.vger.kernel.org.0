Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4435974AE0E
	for <lists+linux-hexagon@lfdr.de>; Fri,  7 Jul 2023 11:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjGGJtc (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 7 Jul 2023 05:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjGGJtb (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 7 Jul 2023 05:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C89F2123
        for <linux-hexagon@vger.kernel.org>; Fri,  7 Jul 2023 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688723320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3Hqt3DW+XoE9Brru6PZKgda5Zq5ahlIuj+xsQHjzxKI=;
        b=UxRm+7j/YsX7E3JgYBtwkhpXf70hZl2DSby6CmsZYWIXVyM6ceyKCYgvNMAdvN/tA0pSq0
        ydyqEzoZP69x7xm9Cgux6kRJpPjSB6uSj0TNORZTe69JiR2aAphFJesI4FG/jV0Pkjs9Eb
        EjB1e/xwJHYgbCT8mlmAASMOejCqxN4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-Y8PgZDwdOwmZaxTIN2AwKQ-1; Fri, 07 Jul 2023 05:48:36 -0400
X-MC-Unique: Y8PgZDwdOwmZaxTIN2AwKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C566538294B3;
        Fri,  7 Jul 2023 09:48:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 09732200B402;
        Fri,  7 Jul 2023 09:48:34 +0000 (UTC)
From:   Thomas Huth <thuth@redhat.com>
To:     Brian Cain <bcain@quicinc.com>
Cc:     linux-hexagon@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
Subject: [RFC PATCH] hexagon: Remove unusable symbols from the ptrace.h uapi
Date:   Fri,  7 Jul 2023 11:48:33 +0200
Message-Id: <20230707094833.821578-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Kernel-internal prototypes, references to current_thread_info()
and code hidden behind a CONFIG_HEXAGON_ARCH_VERSION switch are
certainly not usable in userspace, so this should not reside
in a uapi header. Move the code into an internal version of
ptrace.h instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: It's completely untested, that's why I marked it as RFC

 arch/hexagon/include/asm/ptrace.h      | 25 +++++++++++++++++++++++++
 arch/hexagon/include/uapi/asm/ptrace.h | 13 -------------
 scripts/headers_install.sh             |  1 -
 3 files changed, 25 insertions(+), 14 deletions(-)
 create mode 100644 arch/hexagon/include/asm/ptrace.h

diff --git a/arch/hexagon/include/asm/ptrace.h b/arch/hexagon/include/asm/ptrace.h
new file mode 100644
index 0000000000000..ed35da1ee685a
--- /dev/null
+++ b/arch/hexagon/include/asm/ptrace.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Ptrace definitions for the Hexagon architecture
+ *
+ * Copyright (c) 2010-2011, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _ASM_HEXAGON_PTRACE_H
+#define _ASM_HEXAGON_PTRACE_H
+
+#include <uapi/asm/ptrace.h>
+
+/* kprobe-based event tracer support */
+extern int regs_query_register_offset(const char *name);
+extern const char *regs_query_register_name(unsigned int offset);
+
+#define current_pt_regs() \
+	((struct pt_regs *) \
+	 ((unsigned long)current_thread_info() + THREAD_SIZE) - 1)
+
+#if CONFIG_HEXAGON_ARCH_VERSION >= 4
+#define arch_has_single_step()	(1)
+#endif
+
+#endif
diff --git a/arch/hexagon/include/uapi/asm/ptrace.h b/arch/hexagon/include/uapi/asm/ptrace.h
index f79de05b8689b..2a3ea14ad9b9e 100644
--- a/arch/hexagon/include/uapi/asm/ptrace.h
+++ b/arch/hexagon/include/uapi/asm/ptrace.h
@@ -29,17 +29,4 @@
 
 #define profile_pc(regs) instruction_pointer(regs)
 
-/* kprobe-based event tracer support */
-extern int regs_query_register_offset(const char *name);
-extern const char *regs_query_register_name(unsigned int offset);
-
-#define current_pt_regs() \
-	((struct pt_regs *) \
-	 ((unsigned long)current_thread_info() + THREAD_SIZE) - 1)
-
-#if CONFIG_HEXAGON_ARCH_VERSION >= 4
-#define arch_has_single_step()	(1)
-#endif
-
-
 #endif
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 56d3c338d91d7..c3064ac310030 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -74,7 +74,6 @@ arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
 arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
 arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
 arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
-arch/hexagon/include/uapi/asm/ptrace.h:CONFIG_HEXAGON_ARCH_VERSION
 arch/hexagon/include/uapi/asm/user.h:CONFIG_HEXAGON_ARCH_VERSION
 arch/ia64/include/uapi/asm/cmpxchg.h:CONFIG_IA64_DEBUG_CMPXCHG
 arch/m68k/include/uapi/asm/ptrace.h:CONFIG_COLDFIRE
-- 
2.39.3

