Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECD372FFC1
	for <lists+linux-hexagon@lfdr.de>; Wed, 14 Jun 2023 15:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244969AbjFNNQG (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 14 Jun 2023 09:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244950AbjFNNPy (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 14 Jun 2023 09:15:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3902942;
        Wed, 14 Jun 2023 06:15:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B80C363FCC;
        Wed, 14 Jun 2023 13:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B649EC433C8;
        Wed, 14 Jun 2023 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686748529;
        bh=whQ+zlV1WEzxZw+ZGXxEweg4a4vDfMR6e71uQQs2gbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s7xjkClpsrRd0CoRixHJBi4/Lfdbz8nogYKdzoqL6s3eJxDRQCWNMpgdb4AbXv9CR
         Z4Mkv0qvYVy9SJkW/jvAS0ZxXx1CQYkEeu3NCrKciopGG9Und4903naocQqXFUMtl6
         yPzbCW2LZ6ezDI/wxoH54Yg/kLOj2i69KWH8UiwI6sF7DiK4/NkKP6rV9un/0W0Doj
         RAgFJvLRKzVNYh4fJ9vtLInAHMLllXQVH7t+igJKjaaprbiWJJRoGHFINHYZo43mnv
         pbyGvMKi8Ho+27G5xW4j/fp1MwG565nU3rISYKnonGcF9dec/Rj6LEhrskTSlZT6VS
         kmQL4fPtrwc2A==
Date:   Wed, 14 Jun 2023 16:14:50 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH v4 02/34] s390: Use _pt_s390_gaddr for gmap address
 tracking
Message-ID: <20230614131450.GA52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-3-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-3-vishal.moola@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Mon, Jun 12, 2023 at 02:03:51PM -0700, Vishal Moola (Oracle) wrote:
> s390 uses page->index to keep track of page tables for the guest address
> space. In an attempt to consolidate the usage of page fields in s390,
> replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> 
> This will help with the splitting of struct ptdesc from struct page, as
> well as allow s390 to use _pt_frag_refcount for fragmented page table
> tracking.
> 
> Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> before freeing the pages as well.

I'm looking at the final result and unless I've missed something, setting
of _pt_s390_gaddr to 0 is always followed by pagetable_free().
Can't we have pagetable_free() take care of zeroing _pt_s390_gaddr?
I think patch 16 ("s390: Convert various gmap functions to use ptdescs")
would be the right place for that.

Otherwise:

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
 
> This also reverts commit 7e25de77bc5ea ("s390/mm: use pmd_pgtable_page()
> helper in __gmap_segment_gaddr()") which had s390 use
> pmd_pgtable_page() to get a gmap page table, as pmd_pgtable_page()
> should be used for more generic process page tables.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/s390/mm/gmap.c      | 56 +++++++++++++++++++++++++++-------------
>  include/linux/mm_types.h |  2 +-
>  2 files changed, 39 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> index dc90d1eb0d55..81c683426b49 100644
> --- a/arch/s390/mm/gmap.c
> +++ b/arch/s390/mm/gmap.c
> @@ -70,7 +70,7 @@ static struct gmap *gmap_alloc(unsigned long limit)
>  	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
>  	if (!page)
>  		goto out_free;
> -	page->index = 0;
> +	page->_pt_s390_gaddr = 0;
>  	list_add(&page->lru, &gmap->crst_list);
>  	table = page_to_virt(page);
>  	crst_table_init(table, etype);
> @@ -187,16 +187,20 @@ static void gmap_free(struct gmap *gmap)
>  	if (!(gmap_is_shadow(gmap) && gmap->removed))
>  		gmap_flush_tlb(gmap);
>  	/* Free all segment & region tables. */
> -	list_for_each_entry_safe(page, next, &gmap->crst_list, lru)
> +	list_for_each_entry_safe(page, next, &gmap->crst_list, lru) {
> +		page->_pt_s390_gaddr = 0;
>  		__free_pages(page, CRST_ALLOC_ORDER);
> +	}
>  	gmap_radix_tree_free(&gmap->guest_to_host);
>  	gmap_radix_tree_free(&gmap->host_to_guest);
>  
>  	/* Free additional data for a shadow gmap */
>  	if (gmap_is_shadow(gmap)) {
>  		/* Free all page tables. */
> -		list_for_each_entry_safe(page, next, &gmap->pt_list, lru)
> +		list_for_each_entry_safe(page, next, &gmap->pt_list, lru) {
> +			page->_pt_s390_gaddr = 0;
>  			page_table_free_pgste(page);
> +		}
>  		gmap_rmap_radix_tree_free(&gmap->host_to_rmap);
>  		/* Release reference to the parent */
>  		gmap_put(gmap->parent);
> @@ -318,12 +322,14 @@ static int gmap_alloc_table(struct gmap *gmap, unsigned long *table,
>  		list_add(&page->lru, &gmap->crst_list);
>  		*table = __pa(new) | _REGION_ENTRY_LENGTH |
>  			(*table & _REGION_ENTRY_TYPE_MASK);
> -		page->index = gaddr;
> +		page->_pt_s390_gaddr = gaddr;
>  		page = NULL;
>  	}
>  	spin_unlock(&gmap->guest_table_lock);
> -	if (page)
> +	if (page) {
> +		page->_pt_s390_gaddr = 0;
>  		__free_pages(page, CRST_ALLOC_ORDER);
> +	}
>  	return 0;
>  }
>  
> @@ -336,12 +342,14 @@ static int gmap_alloc_table(struct gmap *gmap, unsigned long *table,
>  static unsigned long __gmap_segment_gaddr(unsigned long *entry)
>  {
>  	struct page *page;
> -	unsigned long offset;
> +	unsigned long offset, mask;
>  
>  	offset = (unsigned long) entry / sizeof(unsigned long);
>  	offset = (offset & (PTRS_PER_PMD - 1)) * PMD_SIZE;
> -	page = pmd_pgtable_page((pmd_t *) entry);
> -	return page->index + offset;
> +	mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
> +	page = virt_to_page((void *)((unsigned long) entry & mask));
> +
> +	return page->_pt_s390_gaddr + offset;
>  }
>  
>  /**
> @@ -1351,6 +1359,7 @@ static void gmap_unshadow_pgt(struct gmap *sg, unsigned long raddr)
>  	/* Free page table */
>  	page = phys_to_page(pgt);
>  	list_del(&page->lru);
> +	page->_pt_s390_gaddr = 0;
>  	page_table_free_pgste(page);
>  }
>  
> @@ -1379,6 +1388,7 @@ static void __gmap_unshadow_sgt(struct gmap *sg, unsigned long raddr,
>  		/* Free page table */
>  		page = phys_to_page(pgt);
>  		list_del(&page->lru);
> +		page->_pt_s390_gaddr = 0;
>  		page_table_free_pgste(page);
>  	}
>  }
> @@ -1409,6 +1419,7 @@ static void gmap_unshadow_sgt(struct gmap *sg, unsigned long raddr)
>  	/* Free segment table */
>  	page = phys_to_page(sgt);
>  	list_del(&page->lru);
> +	page->_pt_s390_gaddr = 0;
>  	__free_pages(page, CRST_ALLOC_ORDER);
>  }
>  
> @@ -1437,6 +1448,7 @@ static void __gmap_unshadow_r3t(struct gmap *sg, unsigned long raddr,
>  		/* Free segment table */
>  		page = phys_to_page(sgt);
>  		list_del(&page->lru);
> +		page->_pt_s390_gaddr = 0;
>  		__free_pages(page, CRST_ALLOC_ORDER);
>  	}
>  }
> @@ -1467,6 +1479,7 @@ static void gmap_unshadow_r3t(struct gmap *sg, unsigned long raddr)
>  	/* Free region 3 table */
>  	page = phys_to_page(r3t);
>  	list_del(&page->lru);
> +	page->_pt_s390_gaddr = 0;
>  	__free_pages(page, CRST_ALLOC_ORDER);
>  }
>  
> @@ -1495,6 +1508,7 @@ static void __gmap_unshadow_r2t(struct gmap *sg, unsigned long raddr,
>  		/* Free region 3 table */
>  		page = phys_to_page(r3t);
>  		list_del(&page->lru);
> +		page->_pt_s390_gaddr = 0;
>  		__free_pages(page, CRST_ALLOC_ORDER);
>  	}
>  }
> @@ -1525,6 +1539,7 @@ static void gmap_unshadow_r2t(struct gmap *sg, unsigned long raddr)
>  	/* Free region 2 table */
>  	page = phys_to_page(r2t);
>  	list_del(&page->lru);
> +	page->_pt_s390_gaddr = 0;
>  	__free_pages(page, CRST_ALLOC_ORDER);
>  }
>  
> @@ -1557,6 +1572,7 @@ static void __gmap_unshadow_r1t(struct gmap *sg, unsigned long raddr,
>  		/* Free region 2 table */
>  		page = phys_to_page(r2t);
>  		list_del(&page->lru);
> +		page->_pt_s390_gaddr = 0;
>  		__free_pages(page, CRST_ALLOC_ORDER);
>  	}
>  }
> @@ -1762,9 +1778,9 @@ int gmap_shadow_r2t(struct gmap *sg, unsigned long saddr, unsigned long r2t,
>  	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
>  	if (!page)
>  		return -ENOMEM;
> -	page->index = r2t & _REGION_ENTRY_ORIGIN;
> +	page->_pt_s390_gaddr = r2t & _REGION_ENTRY_ORIGIN;
>  	if (fake)
> -		page->index |= GMAP_SHADOW_FAKE_TABLE;
> +		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
>  	s_r2t = page_to_phys(page);
>  	/* Install shadow region second table */
>  	spin_lock(&sg->guest_table_lock);
> @@ -1814,6 +1830,7 @@ int gmap_shadow_r2t(struct gmap *sg, unsigned long saddr, unsigned long r2t,
>  	return rc;
>  out_free:
>  	spin_unlock(&sg->guest_table_lock);
> +	page->_pt_s390_gaddr = 0;
>  	__free_pages(page, CRST_ALLOC_ORDER);
>  	return rc;
>  }
> @@ -1846,9 +1863,9 @@ int gmap_shadow_r3t(struct gmap *sg, unsigned long saddr, unsigned long r3t,
>  	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
>  	if (!page)
>  		return -ENOMEM;
> -	page->index = r3t & _REGION_ENTRY_ORIGIN;
> +	page->_pt_s390_gaddr = r3t & _REGION_ENTRY_ORIGIN;
>  	if (fake)
> -		page->index |= GMAP_SHADOW_FAKE_TABLE;
> +		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
>  	s_r3t = page_to_phys(page);
>  	/* Install shadow region second table */
>  	spin_lock(&sg->guest_table_lock);
> @@ -1898,6 +1915,7 @@ int gmap_shadow_r3t(struct gmap *sg, unsigned long saddr, unsigned long r3t,
>  	return rc;
>  out_free:
>  	spin_unlock(&sg->guest_table_lock);
> +	page->_pt_s390_gaddr = 0;
>  	__free_pages(page, CRST_ALLOC_ORDER);
>  	return rc;
>  }
> @@ -1930,9 +1948,9 @@ int gmap_shadow_sgt(struct gmap *sg, unsigned long saddr, unsigned long sgt,
>  	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
>  	if (!page)
>  		return -ENOMEM;
> -	page->index = sgt & _REGION_ENTRY_ORIGIN;
> +	page->_pt_s390_gaddr = sgt & _REGION_ENTRY_ORIGIN;
>  	if (fake)
> -		page->index |= GMAP_SHADOW_FAKE_TABLE;
> +		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
>  	s_sgt = page_to_phys(page);
>  	/* Install shadow region second table */
>  	spin_lock(&sg->guest_table_lock);
> @@ -1982,6 +2000,7 @@ int gmap_shadow_sgt(struct gmap *sg, unsigned long saddr, unsigned long sgt,
>  	return rc;
>  out_free:
>  	spin_unlock(&sg->guest_table_lock);
> +	page->_pt_s390_gaddr = 0;
>  	__free_pages(page, CRST_ALLOC_ORDER);
>  	return rc;
>  }
> @@ -2014,9 +2033,9 @@ int gmap_shadow_pgt_lookup(struct gmap *sg, unsigned long saddr,
>  	if (table && !(*table & _SEGMENT_ENTRY_INVALID)) {
>  		/* Shadow page tables are full pages (pte+pgste) */
>  		page = pfn_to_page(*table >> PAGE_SHIFT);
> -		*pgt = page->index & ~GMAP_SHADOW_FAKE_TABLE;
> +		*pgt = page->_pt_s390_gaddr & ~GMAP_SHADOW_FAKE_TABLE;
>  		*dat_protection = !!(*table & _SEGMENT_ENTRY_PROTECT);
> -		*fake = !!(page->index & GMAP_SHADOW_FAKE_TABLE);
> +		*fake = !!(page->_pt_s390_gaddr & GMAP_SHADOW_FAKE_TABLE);
>  		rc = 0;
>  	} else  {
>  		rc = -EAGAIN;
> @@ -2054,9 +2073,9 @@ int gmap_shadow_pgt(struct gmap *sg, unsigned long saddr, unsigned long pgt,
>  	page = page_table_alloc_pgste(sg->mm);
>  	if (!page)
>  		return -ENOMEM;
> -	page->index = pgt & _SEGMENT_ENTRY_ORIGIN;
> +	page->_pt_s390_gaddr = pgt & _SEGMENT_ENTRY_ORIGIN;
>  	if (fake)
> -		page->index |= GMAP_SHADOW_FAKE_TABLE;
> +		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
>  	s_pgt = page_to_phys(page);
>  	/* Install shadow page table */
>  	spin_lock(&sg->guest_table_lock);
> @@ -2101,6 +2120,7 @@ int gmap_shadow_pgt(struct gmap *sg, unsigned long saddr, unsigned long pgt,
>  	return rc;
>  out_free:
>  	spin_unlock(&sg->guest_table_lock);
> +	page->_pt_s390_gaddr = 0;
>  	page_table_free_pgste(page);
>  	return rc;
>  
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 306a3d1a0fa6..6161fe1ae5b8 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -144,7 +144,7 @@ struct page {
>  		struct {	/* Page table pages */
>  			unsigned long _pt_pad_1;	/* compound_head */
>  			pgtable_t pmd_huge_pte; /* protected by page->ptl */
> -			unsigned long _pt_pad_2;	/* mapping */
> +			unsigned long _pt_s390_gaddr;	/* mapping */
>  			union {
>  				struct mm_struct *pt_mm; /* x86 pgds only */
>  				atomic_t pt_frag_refcount; /* powerpc */
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
