Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED5B6F3980
	for <lists+linux-hexagon@lfdr.de>; Mon,  1 May 2023 22:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjEAU7b (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 1 May 2023 16:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbjEAU73 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 1 May 2023 16:59:29 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5291E1BDC
        for <linux-hexagon@vger.kernel.org>; Mon,  1 May 2023 13:59:26 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so2232411b3a.1
        for <linux-hexagon@vger.kernel.org>; Mon, 01 May 2023 13:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682974766; x=1685566766;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56zwdsQPzBA4Fq57F7zZq8xm3cbpRSpnOmcnA0Dh+zY=;
        b=dhuoKYDmXvVL9rcvID9l7RqV772Z8lTC+U0WXQUi0tYJbLE9a48GrmSzQs7bEghGbC
         JAz8rXoL1w4B9KKuEwX7POjH3Ox3r6V4zpIxvsvZpSsylQJD8ptmZ7+Vz+V8jAHJj04w
         T6FV37TSFDDCD7el69cwAEuuEXi6g8EgNvIcALlfkGBQgAio2kQ2a6bJAUGpYJRLsZzz
         ZNQyL545JSX++O1LCUyCJsybjwMgrDioUAedrjXfVSqEM2lGIt3XAkC5ujMjWrYDbKAU
         lx6fFu18ULaY/km5rliSpJC6ISEyi513He8uKlna726VX+0Zf3a2zrJJ6SJgvgEWorgq
         velw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682974766; x=1685566766;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56zwdsQPzBA4Fq57F7zZq8xm3cbpRSpnOmcnA0Dh+zY=;
        b=JPko/Qjj9+iGy49M3EqQGMCTAJuBR4cNuPb5cetCsCtTKgYDkGs3ixKhoTNBkiJCdf
         Aumxdcu137v+CFRgHU1r18X3hRsxnwqP3l07uuChWCfzSTf0dn3IDaHQJ+NrNOmC+z1F
         rIA0DJnUAkvLnD6WFzllGp2YASYe4LJwPi3yGCYR7bciPVLyjW+wwZ1XFWExc/FaSyUd
         ztmjjuC41Y8ZTO3daHxcVYWnPAg/Wuvf1X4kJ0eS+YpOxzDZJCCMZ239z6wsID8y6r1n
         KRH45DawQTweK1Fp9PlcSdlFJaSt4gbZCij8UW1d8nw9ZB4qhzuXo47SZNP+l3IiWHmG
         SJNQ==
X-Gm-Message-State: AC+VfDyrBgv5rwDbxQwv72nuUnZzp6ZFoiMC5JPSo+3uKNI2+X0EQGst
        8uY4xxSRYlmb4X+8DXGDVpxLzg==
X-Google-Smtp-Source: ACHHUZ7NRh0XptQx7EX4B/2U8oMa1VyQthNvjC4nK5qetnlZ9yiAEbyNISqPVXEejwWKpBkEgu1KUQ==
X-Received: by 2002:a05:6a00:1301:b0:63d:27a1:d578 with SMTP id j1-20020a056a00130100b0063d27a1d578mr19620776pfu.20.1682974765524;
        Mon, 01 May 2023 13:59:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x3-20020a628603000000b0063d666566d1sm20322681pfd.72.2023.05.01.13.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:59:24 -0700 (PDT)
Date:   Mon, 01 May 2023 13:59:24 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 13:59:09 PDT (-0700)
Subject:     Re: [PATCH v2 29/34] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
In-Reply-To: <20230501192829.17086-30-vishal.moola@gmail.com>
CC:     akpm@linux-foundation.org, willy@infradead.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        vishal.moola@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     vishal.moola@gmail.com
Message-ID: <mhng-e6f12727-9abe-4a93-a361-15a6cd333f51@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Mon, 01 May 2023 12:28:24 PDT (-0700), vishal.moola@gmail.com wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use ptdesc_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/riscv/include/asm/pgalloc.h |  8 ++++----
>  arch/riscv/mm/init.c             | 16 ++++++----------
>  2 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index 59dc12b5b7e8..cb5536403bd8 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -153,10 +153,10 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>
>  #endif /* __PAGETABLE_PMD_FOLDED */
>
> -#define __pte_free_tlb(tlb, pte, buf)   \
> -do {                                    \
> -	pgtable_pte_page_dtor(pte);     \
> -	tlb_remove_page((tlb), pte);    \
> +#define __pte_free_tlb(tlb, pte, buf)			\
> +do {							\
> +	ptdesc_pte_dtor(page_ptdesc(pte));		\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
>  } while (0)
>  #endif /* CONFIG_MMU */
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index eb8173a91ce3..8f1982664687 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -353,12 +353,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
>
>  static phys_addr_t __init alloc_pte_late(uintptr_t va)
>  {
> -	unsigned long vaddr;
> -
> -	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)));
> +	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
>
> -	return __pa(vaddr);
> +	BUG_ON(!ptdesc || !ptdesc_pte_ctor(ptdesc));
> +	return __pa((pte_t *)ptdesc_address(ptdesc));
>  }
>
>  static void __init create_pte_mapping(pte_t *ptep,
> @@ -436,12 +434,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
>
>  static phys_addr_t __init alloc_pmd_late(uintptr_t va)
>  {
> -	unsigned long vaddr;
> -
> -	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
> +	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
>
> -	return __pa(vaddr);
> +	BUG_ON(!ptdesc || !ptdesc_pmd_ctor(ptdesc));
> +	return __pa((pmd_t *)ptdesc_address(ptdesc));
>  }
>
>  static void __init create_pmd_mapping(pmd_t *pmdp,

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
