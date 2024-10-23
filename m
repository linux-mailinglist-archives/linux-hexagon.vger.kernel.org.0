Return-Path: <linux-hexagon+bounces-486-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5419ABE04
	for <lists+linux-hexagon@lfdr.de>; Wed, 23 Oct 2024 07:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85F4AB2375B
	for <lists+linux-hexagon@lfdr.de>; Wed, 23 Oct 2024 05:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B8F1494A5;
	Wed, 23 Oct 2024 05:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cSZtI28L"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDF146A7A;
	Wed, 23 Oct 2024 05:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661813; cv=none; b=QTtK/ZZkuf1+ncE8c7teZcIqvS8Fyz+kNc+P5DbgQgTrzW0XjFp8XzUmQ2eiqawTinxixbmBh/Cx6hKCMqW1EyhzJqiaMztu7SaMuG3sV2M9W3q4AJNXKQrVFsGiW7LZFAg9vBZC5k7DF9xlmggISubCUVEj0B/p98ppykcuQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661813; c=relaxed/simple;
	bh=XSGSuHNQEdrQy+BKrbPyy9MG//8ZdaDUukz2EIw98CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nka3LWhyLoEOA1RJvx+XfoD81ETIL/Rp9sccOioBFyRAPBcq+Jrp+mKkmpCFQNU/jgh4fGW+LPlTsPC8H8llKPJFrdIgjdihAIH3UXu+HB/CSEFCUCB4Q3WmtkZjJQCP/UIzx90Zj6/jPftDO6j5KI4WVDyR81drbRAUgXKKD7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cSZtI28L; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=RKAuiXMcVVir6Sj/vC8bs5Pfx8cTWrFUye8LPzyLf00=; b=cSZtI28LT6xxPDijyS+a7/0ofW
	k2SJFIBUmeX2QLpKb+bxiiaJFmcDCHSG9XPVbA5gQpC23DDGaITjC2av8zKlltsAPphjEdeNpAaIN
	S4H61MsugDVQcSuJXPbf0vlQgZNNjIUv0gHtuGeUVuSyO23GktA/p4/lQSiDfx94iqRKwkoucLOrD
	wveKbM3yf7MgHh104Gx9/Z6Q3DE7LK/sHJ0UBhUHHtBKt/NWrJXVfAEdrW0WrZokHGRLjUygRCkuy
	35MRlcl3F0GeOnjjP7Ozaj422qJpZp/Vr+7u4HpHcR1QvDUL/c3xukG4Ke28ceeRUBpjA+SvAn0jQ
	zYt+l1Wg==;
Received: from 2a02-8389-2341-5b80-8c6c-e123-fc47-94a5.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:8c6c:e123:fc47:94a5] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3U37-0000000D4KB-34l9;
	Wed, 23 Oct 2024 05:36:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 1/2] asm-generic: provide generic page_to_phys and phys_to_page implementations
Date: Wed, 23 Oct 2024 07:36:36 +0200
Message-ID: <20241023053644.311692-2-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023053644.311692-1-hch@lst.de>
References: <20241023053644.311692-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

page_to_phys is duplicated by all architectures, and from some strange
reason placed in <asm/io.h> where it doesn't fit at all.

phys_to_page is only provided by a few architectures despite having a lot
of open coded users.

Provide generic versions in <asm-generic/memory_model.h> to make these
helpers more easily usable.

Note with this patch powerpc loses the CONFIG_DEBUG_VIRTUAL pfn_valid
check.  It will be added back in a generic version later.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/include/asm/io.h         |  1 -
 arch/arc/include/asm/io.h           |  3 ---
 arch/arm/include/asm/memory.h       |  6 ------
 arch/arm64/include/asm/memory.h     |  6 ------
 arch/csky/include/asm/page.h        |  3 ---
 arch/hexagon/include/asm/page.h     |  6 ------
 arch/loongarch/include/asm/page.h   |  3 ---
 arch/m68k/include/asm/virtconvert.h |  3 ---
 arch/microblaze/include/asm/page.h  |  1 -
 arch/mips/include/asm/io.h          |  5 -----
 arch/nios2/include/asm/io.h         |  3 ---
 arch/openrisc/include/asm/page.h    |  2 --
 arch/parisc/include/asm/page.h      |  1 -
 arch/powerpc/include/asm/io.h       | 12 ------------
 arch/riscv/include/asm/page.h       |  3 ---
 arch/s390/include/asm/page.h        |  2 --
 arch/sh/include/asm/page.h          |  1 -
 arch/sparc/include/asm/page.h       |  2 --
 arch/um/include/asm/pgtable.h       |  2 --
 arch/x86/include/asm/io.h           |  5 -----
 arch/xtensa/include/asm/page.h      |  1 -
 include/asm-generic/memory_model.h  |  3 +++
 22 files changed, 3 insertions(+), 71 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index b191d87f89c4..65fe1e54c6da 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -88,7 +88,6 @@ static inline void * phys_to_virt(unsigned long address)
 
 #define virt_to_phys		virt_to_phys
 #define phys_to_virt		phys_to_virt
-#define page_to_phys(page)	page_to_pa(page)
 
 /* Maximum PIO space address supported?  */
 #define IO_SPACE_LIMIT 0xffff
diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index f57cb5a6b624..00171a212b3c 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -42,9 +42,6 @@ static inline void ioport_unmap(void __iomem *addr)
 #define iowrite16be(v,p)	({ __iowmb(); __raw_writew((__force u16)cpu_to_be16(v), p); })
 #define iowrite32be(v,p)	({ __iowmb(); __raw_writel((__force u32)cpu_to_be32(v), p); })
 
-/* Change struct page to physical address */
-#define page_to_phys(page)		(page_to_pfn(page) << PAGE_SHIFT)
-
 #define __raw_readb __raw_readb
 static inline u8 __raw_readb(const volatile void __iomem *addr)
 {
diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
index ef2aa79ece5a..7c2fa7dcec6d 100644
--- a/arch/arm/include/asm/memory.h
+++ b/arch/arm/include/asm/memory.h
@@ -147,12 +147,6 @@ extern unsigned long vectors_base;
 #define DTCM_OFFSET	UL(0xfffe8000)
 #endif
 
-/*
- * Convert a page to/from a physical address
- */
-#define page_to_phys(page)	(__pfn_to_phys(page_to_pfn(page)))
-#define phys_to_page(phys)	(pfn_to_page(__phys_to_pfn(phys)))
-
 /*
  * PLAT_PHYS_OFFSET is the offset (from zero) of the start of physical
  * memory.  This is used for XIP and NoMMU kernels, and on platforms that don't
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 0480c61dbb4f..b9b992908a56 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -353,12 +353,6 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 #define __phys_to_virt(x)	((unsigned long)((x) - PHYS_OFFSET) | PAGE_OFFSET)
 #define __phys_to_kimg(x)	((unsigned long)((x) + kimage_voffset))
 
-/*
- * Convert a page to/from a physical address
- */
-#define page_to_phys(page)	(__pfn_to_phys(page_to_pfn(page)))
-#define phys_to_page(phys)	(pfn_to_page(__phys_to_pfn(phys)))
-
 /*
  * Note: Drivers should NOT use these.  They are the wrong
  * translation for translating DMA addresses.  Use the driver
diff --git a/arch/csky/include/asm/page.h b/arch/csky/include/asm/page.h
index 0ca6c408c07f..a5afdfe27dc6 100644
--- a/arch/csky/include/asm/page.h
+++ b/arch/csky/include/asm/page.h
@@ -43,9 +43,6 @@ extern void *memcpy(void *to, const void *from, size_t l);
 #define clear_page(page)	memset((page), 0, PAGE_SIZE)
 #define copy_page(to, from)	memcpy((to), (from), PAGE_SIZE)
 
-#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
-#define phys_to_page(paddr)	(pfn_to_page(PFN_DOWN(paddr)))
-
 struct page;
 
 #include <abi/page.h>
diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
index 8a6af57274c2..aba4d7901305 100644
--- a/arch/hexagon/include/asm/page.h
+++ b/arch/hexagon/include/asm/page.h
@@ -118,12 +118,6 @@ static inline void clear_page(void *page)
 #define clear_user_page(page, vaddr, pg)	clear_page(page)
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
-/*
- * page_to_phys - convert page to physical address
- * @page - pointer to page entry in mem_map
- */
-#define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
-
 static inline unsigned long virt_to_pfn(const void *kaddr)
 {
 	return __pa(kaddr) >> PAGE_SHIFT;
diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index e85df33f11c7..8b4e6b280f2b 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -81,9 +81,6 @@ struct page *tlb_virt_to_page(unsigned long kaddr);
 #define pfn_to_phys(pfn)	__pfn_to_phys(pfn)
 #define phys_to_pfn(paddr)	__phys_to_pfn(paddr)
 
-#define page_to_phys(page)	pfn_to_phys(page_to_pfn(page))
-#define phys_to_page(paddr)	pfn_to_page(phys_to_pfn(paddr))
-
 #ifndef CONFIG_KFENCE
 
 #define page_to_virt(page)	__va(page_to_phys(page))
diff --git a/arch/m68k/include/asm/virtconvert.h b/arch/m68k/include/asm/virtconvert.h
index 0a27905b0036..32e27bddb7d4 100644
--- a/arch/m68k/include/asm/virtconvert.h
+++ b/arch/m68k/include/asm/virtconvert.h
@@ -28,9 +28,6 @@ static inline void *phys_to_virt(unsigned long address)
 	return __va(address);
 }
 
-/* Permanent address of a page. */
-#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
-
 /*
  * IO bus memory addresses are 1:1 with the physical address,
  * deprecated globally but still used on two machines.
diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
index 8810f4f1c3b0..ecd4bf2779a0 100644
--- a/arch/microblaze/include/asm/page.h
+++ b/arch/microblaze/include/asm/page.h
@@ -101,7 +101,6 @@ extern int page_is_ram(unsigned long pfn);
 
 #  define virt_to_page(kaddr)	(pfn_to_page(__pa(kaddr) >> PAGE_SHIFT))
 #  define page_to_virt(page)   __va(page_to_pfn(page) << PAGE_SHIFT)
-#  define page_to_phys(page)     (page_to_pfn(page) << PAGE_SHIFT)
 
 #  define ARCH_PFN_OFFSET	(memory_start >> PAGE_SHIFT)
 # endif /* __ASSEMBLY__ */
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index af58d6ae06b8..0bddb568af7c 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -125,11 +125,6 @@ static inline unsigned long isa_virt_to_bus(volatile void *address)
 	return virt_to_phys(address);
 }
 
-/*
- * Change "struct page" to physical address.
- */
-#define page_to_phys(page)	((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
-
 void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
 		unsigned long prot_val);
 void iounmap(const volatile void __iomem *addr);
diff --git a/arch/nios2/include/asm/io.h b/arch/nios2/include/asm/io.h
index 746853ac7d8d..36e3550673b3 100644
--- a/arch/nios2/include/asm/io.h
+++ b/arch/nios2/include/asm/io.h
@@ -28,9 +28,6 @@
 void __iomem *ioremap(unsigned long physaddr, unsigned long size);
 void iounmap(void __iomem *addr);
 
-/* Pages to physical address... */
-#define page_to_phys(page)	virt_to_phys(page_to_virt(page))
-
 /* Macros used for converting between virtual and physical mappings. */
 #define phys_to_virt(vaddr)	\
 	((void *)((unsigned long)(vaddr) | CONFIG_NIOS2_KERNEL_REGION_BASE))
diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm/page.h
index 1d5913f67c31..45d6c440729c 100644
--- a/arch/openrisc/include/asm/page.h
+++ b/arch/openrisc/include/asm/page.h
@@ -80,8 +80,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
 #define virt_to_page(addr) \
 	(mem_map + (((unsigned long)(addr)-PAGE_OFFSET) >> PAGE_SHIFT))
 
-#define page_to_phys(page)      ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
-
 #define virt_addr_valid(kaddr)	(pfn_valid(virt_to_pfn(kaddr)))
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 4bea2e95798f..6cb5b02aca9a 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -168,7 +168,6 @@ extern int npmem_ranges;
 
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
 
-#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
 
 #include <asm-generic/memory_model.h>
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 52e1b1d15ff6..fd92ac450169 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -969,18 +969,6 @@ static inline void * phys_to_virt(unsigned long address)
 }
 #define phys_to_virt phys_to_virt
 
-/*
- * Change "struct page" to physical address.
- */
-static inline phys_addr_t page_to_phys(struct page *page)
-{
-	unsigned long pfn = page_to_pfn(page);
-
-	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && !pfn_valid(pfn));
-
-	return PFN_PHYS(pfn);
-}
-
 /*
  * 32 bits still uses virt_to_bus() for its implementation of DMA
  * mappings se we have to keep it defined here. We also have some old
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 32d308a3355f..16f4141f0055 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -194,9 +194,6 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 #define virt_to_page(vaddr)	(pfn_to_page(virt_to_pfn(vaddr)))
 #define page_to_virt(page)	(pfn_to_virt(page_to_pfn(page)))
 
-#define page_to_phys(page)	(pfn_to_phys(page_to_pfn(page)))
-#define phys_to_page(paddr)	(pfn_to_page(phys_to_pfn(paddr)))
-
 #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
 
 unsigned long kaslr_offset(void);
diff --git a/arch/s390/include/asm/page.h b/arch/s390/include/asm/page.h
index 73e1e03317b4..16d62a4ecccc 100644
--- a/arch/s390/include/asm/page.h
+++ b/arch/s390/include/asm/page.h
@@ -245,9 +245,7 @@ static inline unsigned long __phys_addr(unsigned long x, bool is_31bit)
 #define phys_to_pfn(phys)	((phys) >> PAGE_SHIFT)
 #define pfn_to_phys(pfn)	((pfn) << PAGE_SHIFT)
 
-#define phys_to_page(phys)	pfn_to_page(phys_to_pfn(phys))
 #define phys_to_folio(phys)	page_folio(phys_to_page(phys))
-#define page_to_phys(page)	pfn_to_phys(page_to_pfn(page))
 #define folio_to_phys(page)	pfn_to_phys(folio_pfn(folio))
 
 static inline void *pfn_to_virt(unsigned long pfn)
diff --git a/arch/sh/include/asm/page.h b/arch/sh/include/asm/page.h
index f780b467e75d..4e82ea84a06f 100644
--- a/arch/sh/include/asm/page.h
+++ b/arch/sh/include/asm/page.h
@@ -147,7 +147,6 @@ typedef struct page *pgtable_t;
 #endif
 
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
-#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 
 /*
  * PFN = physical frame number (ie PFN 0 == physical address 0)
diff --git a/arch/sparc/include/asm/page.h b/arch/sparc/include/asm/page.h
index 5e44cdf2a8f2..1a00cc0a1893 100644
--- a/arch/sparc/include/asm/page.h
+++ b/arch/sparc/include/asm/page.h
@@ -2,8 +2,6 @@
 #ifndef ___ASM_SPARC_PAGE_H
 #define ___ASM_SPARC_PAGE_H
 
-#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
-
 #if defined(__sparc__) && defined(__arch64__)
 #include <asm/page_64.h>
 #else
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index 83373c9963e7..faab5a2a4b06 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -287,9 +287,7 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  * and a page entry and page directory to the page they refer to.
  */
 
-#define phys_to_page(phys) pfn_to_page(phys_to_pfn(phys))
 #define __virt_to_page(virt) phys_to_page(__pa(virt))
-#define page_to_phys(page) pfn_to_phys(page_to_pfn(page))
 #define virt_to_page(addr) __virt_to_page((const unsigned long) addr)
 
 #define mk_pte(page, pgprot) \
diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index 1d60427379c9..ed580c7f9d0a 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -151,11 +151,6 @@ static inline void *phys_to_virt(phys_addr_t address)
 }
 #define phys_to_virt phys_to_virt
 
-/*
- * Change "struct page" to physical address.
- */
-#define page_to_phys(page)    ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
-
 /*
  * ISA I/O bus memory addresses are 1:1 with the physical address.
  * However, we truncate the address to unsigned int to avoid undesirable
diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
index 4db56ef052d2..dc3d5b094ecd 100644
--- a/arch/xtensa/include/asm/page.h
+++ b/arch/xtensa/include/asm/page.h
@@ -195,7 +195,6 @@ static inline unsigned long ___pa(unsigned long va)
 #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
 #define page_to_virt(page)	__va(page_to_pfn(page) << PAGE_SHIFT)
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
-#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index 6796abe1900e..a73a140cbecd 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -64,6 +64,9 @@ static inline int pfn_valid(unsigned long pfn)
 #define page_to_pfn __page_to_pfn
 #define pfn_to_page __pfn_to_page
 
+#define page_to_phys(page)	PFN_PHYS(page_to_pfn(page))
+#define phys_to_page(phys)	pfn_to_page(PHYS_PFN(phys))
+
 #endif /* __ASSEMBLY__ */
 
 #endif
-- 
2.45.2


