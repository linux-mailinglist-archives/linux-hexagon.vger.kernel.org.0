Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36FBE699471
	for <lists+linux-hexagon@lfdr.de>; Thu, 16 Feb 2023 13:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjBPMff (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 16 Feb 2023 07:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjBPMfa (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 16 Feb 2023 07:35:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5F93A853
        for <linux-hexagon@vger.kernel.org>; Thu, 16 Feb 2023 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676550884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v0nZZRtgRBEjd1TuZoUTX3TC1k0a64a2n3jlsJishp4=;
        b=D3tSEyFO+h+VJOx0OUwgWS2cbmCxXp5cBPKu5xYf90Qs11W6HIsQihZ5y3YdFtlhG6e936
        QbuKMu9FE6w0UPCsiyAUHTFl0U8dscISRtN6MD7DkFZxWOn8uXftLyYo4PcZ6MXd8gsace
        4wYTVbPK0imdkaoVsbH9afefCpLpqmc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-IqQp3gjfNf6Iot1Z8qjFEQ-1; Thu, 16 Feb 2023 07:34:39 -0500
X-MC-Unique: IqQp3gjfNf6Iot1Z8qjFEQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 936D0830F82;
        Thu, 16 Feb 2023 12:34:38 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-99.pek2.redhat.com [10.72.12.99])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1A24A492C3C;
        Thu, 16 Feb 2023 12:34:31 +0000 (UTC)
From:   Baoquan He <bhe@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        christophe.leroy@csgroup.eu, hch@infradead.org,
        agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
        schnelle@linux.ibm.com, David.Laight@ACULAB.COM, shorne@gmail.com,
        arnd@arndb.de, Baoquan He <bhe@redhat.com>,
        Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org
Subject: [PATCH v4 01/16] hexagon: mm: Convert to GENERIC_IOREMAP
Date:   Thu, 16 Feb 2023 20:34:04 +0800
Message-Id: <20230216123419.461016-2-bhe@redhat.com>
In-Reply-To: <20230216123419.461016-1-bhe@redhat.com>
References: <20230216123419.461016-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

By taking GENERIC_IOREMAP method, the generic ioremap_prot() and
iounmap() are visible and available to arch. This change will
simplify implementation by removing duplicated codes with generic
ioremap_prot() and iounmap(), and has the equivalent functioality.

For hexagon, the current ioremap() and iounmap() are the same as
generic version. After taking GENERIC_IOREMAP way, the old ioremap()
and iounmap() can be completely removed.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: Brian Cain <bcain@quicinc.com>
Cc: linux-hexagon@vger.kernel.org
---
 arch/hexagon/Kconfig          |  1 +
 arch/hexagon/include/asm/io.h |  9 +++++--
 arch/hexagon/mm/ioremap.c     | 44 -----------------------------------
 3 files changed, 8 insertions(+), 46 deletions(-)
 delete mode 100644 arch/hexagon/mm/ioremap.c

diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index 54eadf265178..17afffde1a7f 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -25,6 +25,7 @@ config HEXAGON
 	select NEED_SG_DMA_LENGTH
 	select NO_IOPORT_MAP
 	select GENERIC_IOMAP
+	select GENERIC_IOREMAP
 	select GENERIC_SMP_IDLE_THREAD
 	select STACKTRACE_SUPPORT
 	select GENERIC_CLOCKEVENTS_BROADCAST
diff --git a/arch/hexagon/include/asm/io.h b/arch/hexagon/include/asm/io.h
index 46a099de85b7..dcd9cbbf5934 100644
--- a/arch/hexagon/include/asm/io.h
+++ b/arch/hexagon/include/asm/io.h
@@ -170,8 +170,13 @@ static inline void writel(u32 data, volatile void __iomem *addr)
 #define writew_relaxed __raw_writew
 #define writel_relaxed __raw_writel
 
-void __iomem *ioremap(unsigned long phys_addr, unsigned long size);
-#define ioremap_uc(X, Y) ioremap((X), (Y))
+/*
+ * I/O memory mapping functions.
+ */
+#define _PAGE_IOREMAP (_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE | \
+		       (__HEXAGON_C_DEV << 6))
+
+#define ioremap_uc(addr, size) ioremap((addr), (size))
 
 
 #define __raw_writel writel
diff --git a/arch/hexagon/mm/ioremap.c b/arch/hexagon/mm/ioremap.c
deleted file mode 100644
index 255c5b1ee1a7..000000000000
--- a/arch/hexagon/mm/ioremap.c
+++ /dev/null
@@ -1,44 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * I/O remap functions for Hexagon
- *
- * Copyright (c) 2010-2011, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/io.h>
-#include <linux/vmalloc.h>
-#include <linux/mm.h>
-
-void __iomem *ioremap(unsigned long phys_addr, unsigned long size)
-{
-	unsigned long last_addr, addr;
-	unsigned long offset = phys_addr & ~PAGE_MASK;
-	struct vm_struct *area;
-
-	pgprot_t prot = __pgprot(_PAGE_PRESENT|_PAGE_READ|_PAGE_WRITE
-					|(__HEXAGON_C_DEV << 6));
-
-	last_addr = phys_addr + size - 1;
-
-	/*  Wrapping not allowed  */
-	if (!size || (last_addr < phys_addr))
-		return NULL;
-
-	/*  Rounds up to next page size, including whole-page offset */
-	size = PAGE_ALIGN(offset + size);
-
-	area = get_vm_area(size, VM_IOREMAP);
-	addr = (unsigned long)area->addr;
-
-	if (ioremap_page_range(addr, addr+size, phys_addr, prot)) {
-		vunmap((void *)addr);
-		return NULL;
-	}
-
-	return (void __iomem *) (offset + addr);
-}
-
-void iounmap(const volatile void __iomem *addr)
-{
-	vunmap((void *) ((unsigned long) addr & PAGE_MASK));
-}
-- 
2.34.1

