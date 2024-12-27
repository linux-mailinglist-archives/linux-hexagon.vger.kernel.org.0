Return-Path: <linux-hexagon+bounces-577-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562AC9FD607
	for <lists+linux-hexagon@lfdr.de>; Fri, 27 Dec 2024 17:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A493A2BAC
	for <lists+linux-hexagon@lfdr.de>; Fri, 27 Dec 2024 16:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F1A1F76AB;
	Fri, 27 Dec 2024 16:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="euaublLJ"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D67A1F76AF
	for <linux-hexagon@vger.kernel.org>; Fri, 27 Dec 2024 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735317618; cv=none; b=t1ENUWxrRDqrMsf7E293BzLQDq6NdD7Xx9gLRYmZTKWuIrStaPXSjXBmRT2sqggq0tW9QYdn/Z2bEFdwQP8iNX/eJ2sQXz0GdeBRTbmoHJI0IvzQOlyo1/nDZG3Xt0/M+Swe7y3awsbhLyUdM3QSwp/YYiaFZ66FcCnBVbpM0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735317618; c=relaxed/simple;
	bh=BDBP5cg+rIVLRgMT5uzHFCvod2SD2RGOm2yeQu6lvr4=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=IS65ysQBA7yHk29HmfCKiT/4iHArSRmTyfxD/fffaQX263W2g6yccml8cTxndGmmbxd/D0LkHfmhbbYWeFl28YfGTDBrz2uJl7WzW/C3VDkIMaBU6aLUlzCrb4xCWL+dY+/MYk/FIy9uUaFQXE+7cMUMTSOJ/ZpF8tpfwx/h/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=euaublLJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21683192bf9so93579185ad.3
        for <linux-hexagon@vger.kernel.org>; Fri, 27 Dec 2024 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1735317614; x=1735922414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=;
        b=euaublLJ5Vd1sOtYUO3rxorS6gBUra3bZmwdcf9mF7fP1kFUODP5YYr4iJKhEm8A7O
         7uWFCErJY93AkN5/Biq7XC3vzSiffpocVrzboPC5iL/VArHUNK5LZ3Q81cbROCUIIvxM
         ntIrgJBRqTMRJrldDWdDMfrDCdbepqnVzf4HeSLxrNUk+OsUKRTGFE3XLdgOOfzrWfLg
         szZfJi1Q2YwPcuYnnrxpYiSohMZVeRS715xOgSdVhIgLXbhn/w8Yi4TWqfoabeqRrnlb
         ig5YRruIxF3O6UPU6ozIlNGRBeuzRZLvN9BCJEROA5I/o9wNFUFEC0p21H6M2PnfrawD
         qLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735317614; x=1735922414;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=;
        b=KQ9Xjbe/TdMzZIYNLpjS+KLrshd/VYbMzyFudWtof/6O3bNAPoUsbyQPt5AM/m8UZE
         jC2wm3g5WS8gmiQBLB4kojpdCsP8b/a62VC9Kur3ex6OUExXnIhFGQzAA0gDTLx57tBB
         Oew7sMztMfm8t7HUu7dshyjOCkEW3MLjiUWYB8kHa7xJDA3uCa9HkXExrznKQM3XuS6Y
         uAbAeXDp7knmrS6KHwTPjiDOt08dlISyyIF2DFr2rU6yoR03dcqTkS/WXfkr0LaUEpRd
         QobcrN92s1kjeaU7L1VXavtOAwC9rurhH59k6IVE0W6dJWXbxBgDhfNHRn5WZigfNtDE
         S4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFxPNXqQteQg0AzvrIeacO1z/LA708rs29IMIvwBzQ7/kZVX2AcH2gTlBpwTYKsFNm9B1OJVSi6JX6LkrT@vger.kernel.org
X-Gm-Message-State: AOJu0YzXl4r6Evp51i/pLRirI1ihLQ+CnDPKbqkjRnOQdZHSDR630MGV
	YTq1jWDWKpj3fTlSGcUmjV37b9e7Bv9678Ml1FLg8D0trY4YrJluEnb67tVIm/g=
X-Gm-Gg: ASbGncvNogSpfnfalRZ8nsQenndWwhpdgBQCZXPFa57J/iXR/Nq5/SrWH/ySci8zaL7
	zCaVPdErCcZWGgxebrLngB+BbygJRdLQaBEEA4vPx0GCVph4nfmzkEO/6DgHYRjXWjxZd2r4341
	L0AfXCRtc9H/2G0I887BZ74HQFeJ8BgLm3wQ9L4zu2CrY3A5V5PXzSJH+2PfrVC2Hz5Ow9pkC+n
	9fbFuQ3lt1ZY1GanCib2jwnfLWFdd7vnGbH2OfEuVr9KSM4IQ==
X-Google-Smtp-Source: AGHT+IGj5bTxRBL/TPC4rp9UNK8vWD764vaF6GBCxeBJ0bzTi0HACd7gUMrcV8Bcwh/Ub684hrsLqw==
X-Received: by 2002:a17:902:f645:b0:216:5556:8b46 with SMTP id d9443c01a7336-219e70dbcf8mr427204505ad.49.1735317614352;
        Fri, 27 Dec 2024 08:40:14 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-89eaa1c4fdfsm7512714a12.60.2024.12.27.08.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:40:13 -0800 (PST)
Date: Fri, 27 Dec 2024 08:40:13 -0800 (PST)
X-Google-Original-Date: Fri, 27 Dec 2024 08:40:12 PST (-0800)
Subject:     Re: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
In-Reply-To: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
CC: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
  tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
  willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
  akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com, Arnd Bergmann <arnd@arndb.de>,
  Will Deacon <will@kernel.org>, aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
  rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
  linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
  linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
  linux-sh@vger.kernel.org, linux-um@lists.infradead.org, zhengqi.arch@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhengqi.arch@bytedance.com
Message-ID: <mhng-3d6d3e65-b264-4033-b985-fa7763cacf9e@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 23 Dec 2024 01:40:48 PST (-0800), zhengqi.arch@bytedance.com wrote:
> From: Kevin Brodsky <kevin.brodsky@arm.com>
>
> {pmd,pud,p4d}_alloc_one() is never called if the corresponding page
> table level is folded, as {pmd,pud,p4d}_alloc() already does the
> required check. We can therefore remove the runtime page table level
> checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
> the generic version, so we remove it altogether.
>
> This is consistent with the way arm64 and x86 handle this situation
> (runtime check in p4d_free() only).
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index f52264304f772..8ad0bbe838a24 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -12,7 +12,6 @@
>  #include <asm/tlb.h>
>
>  #ifdef CONFIG_MMU
> -#define __HAVE_ARCH_PUD_ALLOC_ONE
>  #define __HAVE_ARCH_PUD_FREE
>  #include <asm-generic/pgalloc.h>
>
> @@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
>  	}
>  }
>
> -#define pud_alloc_one pud_alloc_one
> -static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> -{
> -	if (pgtable_l4_enabled)
> -		return __pud_alloc_one(mm, addr);
> -
> -	return NULL;
> -}
> -
>  #define pud_free pud_free
>  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>  {
> @@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>  #define p4d_alloc_one p4d_alloc_one
>  static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
>  {
> -	if (pgtable_l5_enabled) {
> -		gfp_t gfp = GFP_PGTABLE_USER;
> -
> -		if (mm == &init_mm)
> -			gfp = GFP_PGTABLE_KERNEL;
> -		return (p4d_t *)get_zeroed_page(gfp);
> -	}
> +	gfp_t gfp = GFP_PGTABLE_USER;
>
> -	return NULL;
> +	if (mm == &init_mm)
> +		gfp = GFP_PGTABLE_KERNEL;
> +	return (p4d_t *)get_zeroed_page(gfp);
>  }
>
>  static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Are you trying to keep these together, or do you want me to try and pick 
up the RISC-V bits on their own?

