Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F58A73034D
	for <lists+linux-hexagon@lfdr.de>; Wed, 14 Jun 2023 17:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343733AbjFNPRR (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 14 Jun 2023 11:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343692AbjFNPRI (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 14 Jun 2023 11:17:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73D82110;
        Wed, 14 Jun 2023 08:16:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B471638D3;
        Wed, 14 Jun 2023 15:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0C6C433C8;
        Wed, 14 Jun 2023 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686755817;
        bh=YWehRl3xWKEbQP9tq7ePmQYYbNy3P9MQRqza8pSXoQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a5HfETjkviYZmB3yycxaStNQCcDjQ92r6U1dHXLCQYNXXuG0AAUSq7jKrB+2l21WE
         GypEoOApF1rLNsDZqptGPcxmCr0wOSIRfpVC7vWwoWHblSH2+PhDM7ZW5oWZFVA9ML
         0FHsMp89h7dErkEWSqM9r5MLgxZuAZm5NLE0GbwBvKGpFqgzoxM2AhuVGiRnrVxHpJ
         +MEb2WN6DRbMDDPEuOzeya9BK86TjWF0eG9IOlempn4j36CfKy0Jiz99cVNmFKgRnt
         JUCMMz1gmGbQUt/P8bZ99XYy/Rxm4p9/4bFRzL62I+G/NVscu1YUh+MWxgzqPj29/v
         2pSk7JFRzXlsw==
Date:   Wed, 14 Jun 2023 18:16:19 +0300
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
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v4 26/34] mips: Convert various functions to use ptdescs
Message-ID: <20230614151619.GY52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-27-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-27-vishal.moola@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Mon, Jun 12, 2023 at 02:04:15PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/mips/include/asm/pgalloc.h | 31 +++++++++++++++++--------------
>  arch/mips/mm/pgtable.c          |  7 ++++---
>  2 files changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index f72e737dda21..6940e5536664 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -51,13 +51,13 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
>  
>  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  {
> -	free_pages((unsigned long)pgd, PGD_TABLE_ORDER);
> +	pagetable_free(virt_to_ptdesc(pgd));
>  }
>  
> -#define __pte_free_tlb(tlb,pte,address)			\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb), pte);			\
> +#define __pte_free_tlb(tlb, pte, address)			\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
>  } while (0)
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> @@ -65,18 +65,18 @@ do {							\
>  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pmd_t *pmd;
> -	struct page *pg;
> +	struct ptdesc *ptdesc;
>  
> -	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
> -	if (!pg)
> +	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
> +	if (!ptdesc)
>  		return NULL;
>  
> -	if (!pgtable_pmd_page_ctor(pg)) {
> -		__free_pages(pg, PMD_TABLE_ORDER);
> +	if (!pagetable_pmd_ctor(ptdesc)) {
> +		pagetable_free(ptdesc);
>  		return NULL;
>  	}
>  
> -	pmd = (pmd_t *)page_address(pg);
> +	pmd = ptdesc_address(ptdesc);
>  	pmd_init(pmd);
>  	return pmd;
>  }
> @@ -90,10 +90,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pud_t *pud;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
>  
> -	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_TABLE_ORDER);
> -	if (pud)
> -		pud_init(pud);
> +	if (!ptdesc)
> +		return NULL;
> +	pud = ptdesc_address(ptdesc);
> +
> +	pud_init(pud);
>  	return pud;
>  }
>  
> diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
> index b13314be5d0e..729258ff4e3b 100644
> --- a/arch/mips/mm/pgtable.c
> +++ b/arch/mips/mm/pgtable.c
> @@ -10,10 +10,11 @@
>  
>  pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
> -	pgd_t *ret, *init;
> +	pgd_t *init, *ret = NULL;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PGD_TABLE_ORDER);
>  
> -	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_TABLE_ORDER);
> -	if (ret) {
> +	if (ptdesc) {
> +		ret = ptdesc_address(ptdesc);
>  		init = pgd_offset(&init_mm, 0UL);
>  		pgd_init(ret);
>  		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
