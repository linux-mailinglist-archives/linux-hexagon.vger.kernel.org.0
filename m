Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 769E090EBA
	for <lists+linux-hexagon@lfdr.de>; Sat, 17 Aug 2019 09:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfHQHtX (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 17 Aug 2019 03:49:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38388 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfHQHtW (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 17 Aug 2019 03:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=l/Mzf5xuS9oQVeGnlLjKziIgRibXQKwP5ZXqnpIrUsw=; b=Iwx2LgQayqFR2wRDYAwJPj8b12
        9ORTSL5UTWw+s01/89XJfm7Nouu7AXstI8wS688v2d3RMGFewQXOzbTqDukmsOqd4elfBlv4f8wCe
        TCdCkHuSoBnvqkT5r9IErhQbAjgnULEs4xCC3sLdZ/O8AfeqQD1fdM9sjQRh0xbMZP70Zc2hoQXx/
        z8TS46r4eoTPE8HogYstgv6apLWBKv10X0sLAzanTZpV4gISWO63nSjOuxcuHmQVxq1aZ8SSzFvmD
        Ar6rSCCMY6GeIGg5T67rvA/YSK1gY/XTzu1Z2x54X3kVpOhD/PJhGfvwyqSSGdtqiMhD0LBkIcIhz
        ja/iOKYA==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hytSb-0005Tx-3i; Sat, 17 Aug 2019 07:49:13 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
Cc:     linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-mtd@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 20/26] hexagon: remove __iounmap
Date:   Sat, 17 Aug 2019 09:32:47 +0200
Message-Id: <20190817073253.27819-21-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

No need to indirect iounmap for hexagon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/hexagon/include/asm/io.h       | 7 +------
 arch/hexagon/kernel/hexagon_ksyms.c | 2 +-
 arch/hexagon/mm/ioremap.c           | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/hexagon/include/asm/io.h b/arch/hexagon/include/asm/io.h
index 89537dc1cf97..539e3efcf39c 100644
--- a/arch/hexagon/include/asm/io.h
+++ b/arch/hexagon/include/asm/io.h
@@ -27,7 +27,7 @@
 extern int remap_area_pages(unsigned long start, unsigned long phys_addr,
 				unsigned long end, unsigned long flags);
 
-extern void __iounmap(const volatile void __iomem *addr);
+extern void iounmap(const volatile void __iomem *addr);
 
 /* Defined in lib/io.c, needed for smc91x driver. */
 extern void __raw_readsw(const void __iomem *addr, void *data, int wordlen);
@@ -175,11 +175,6 @@ void __iomem *ioremap(unsigned long phys_addr, unsigned long size);
 #define ioremap_nocache ioremap
 
 
-static inline void iounmap(volatile void __iomem *addr)
-{
-	__iounmap(addr);
-}
-
 #define __raw_writel writel
 
 static inline void memcpy_fromio(void *dst, const volatile void __iomem *src,
diff --git a/arch/hexagon/kernel/hexagon_ksyms.c b/arch/hexagon/kernel/hexagon_ksyms.c
index b3dbb472572e..6fb1aaab1c29 100644
--- a/arch/hexagon/kernel/hexagon_ksyms.c
+++ b/arch/hexagon/kernel/hexagon_ksyms.c
@@ -14,7 +14,7 @@
 EXPORT_SYMBOL(__clear_user_hexagon);
 EXPORT_SYMBOL(raw_copy_from_user);
 EXPORT_SYMBOL(raw_copy_to_user);
-EXPORT_SYMBOL(__iounmap);
+EXPORT_SYMBOL(iounmap);
 EXPORT_SYMBOL(__strnlen_user);
 EXPORT_SYMBOL(__vmgetie);
 EXPORT_SYMBOL(__vmsetie);
diff --git a/arch/hexagon/mm/ioremap.c b/arch/hexagon/mm/ioremap.c
index b103d83b5fbb..255c5b1ee1a7 100644
--- a/arch/hexagon/mm/ioremap.c
+++ b/arch/hexagon/mm/ioremap.c
@@ -38,7 +38,7 @@ void __iomem *ioremap(unsigned long phys_addr, unsigned long size)
 	return (void __iomem *) (offset + addr);
 }
 
-void __iounmap(const volatile void __iomem *addr)
+void iounmap(const volatile void __iomem *addr)
 {
 	vunmap((void *) ((unsigned long) addr & PAGE_MASK));
 }
-- 
2.20.1

