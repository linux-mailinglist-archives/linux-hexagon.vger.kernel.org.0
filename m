Return-Path: <linux-hexagon+bounces-752-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62190A1B696
	for <lists+linux-hexagon@lfdr.de>; Fri, 24 Jan 2025 14:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 845613A22D8
	for <lists+linux-hexagon@lfdr.de>; Fri, 24 Jan 2025 13:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3786AA1;
	Fri, 24 Jan 2025 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WcolCWBh"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7676CA64
	for <linux-hexagon@vger.kernel.org>; Fri, 24 Jan 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723857; cv=none; b=dwOlam579rv1rOb16NrTTYwf15fwHtPKq8GydC5ek+bigBAzVGaLyji7PW3gcKaG2slR/NjDIfkrqGGD0RgIfNbGMulee0lAtlIC3Q2TUvuuWneTPMWaLSIJDeFHzXQDOy3AO14sK+9rKJIR9zyem3hL3c0lW/JnWptV3EJ7JwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723857; c=relaxed/simple;
	bh=6DUwB+hCjWKh6+gmJpLDb9ZpCQfqoZDHN+wZTg6VGKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPG1UPtT19vlKkkMet/tVPYYy9i9mdyuG5jxt/fgOzfuG2Sjt6859CHIqmy6kWfoS3XUU+VrUte0QiHW3bQZpfUIXYc5ORVNvYPaT9c/xCmbx2MCSxtD/+jW03SWFicuu1HmyuAGBuD67MiwKEdWutEjFiRWci/vTfST/3wVC7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WcolCWBh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso3755018a91.0
        for <linux-hexagon@vger.kernel.org>; Fri, 24 Jan 2025 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737723855; x=1738328655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=WcolCWBh+lB0KK8J6dDDEpKKfAjF2Cm6vBH1qSPgHiLw2VU81OIi3krrtfSEFWD9yO
         AqbnVBZZnFSp0SPjfB+kIjYMWdslGMdkpPA8S5gjdvQI0f3VZiAJxhLNERNL31UgWYG1
         guI1Xi3e/gDfb11BNupzOJ66yAMX1m75bZ2tUhpWXuVS99UyoZF3GgEiASJS8eG+qVcR
         pXuFs342QbpqHYxe6z9BMnhI2d+BMUx/R6mfINhNwZUur1HPSJBAvu4z16axZqcOpgqq
         xgHgWHkOffIZbVLnZWBABUNqZkmDgkdZw0TrtFP+pM+6syIFaocruvc2yOk22b7S+9Pu
         8P0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723855; x=1738328655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=Gz+zRehYRKovLwp0c5mu3OMmVu3nFUltqzsaZTPHaEcAbviXzEIqArWriXVAq5zehF
         UDCCChBbgTi55ojVdRrnnPOFQnG/cXpdJ2MNh0tHvogDCSAQOqmwMCx8SXzudqEHsCNw
         YHR0WeHPr+7583IBs7xsBYZyWFL9aEimdshvYyPNIeTPH8M53Qlo4MpxgfRkuxalS3mC
         RKeVx1WINU5USVTvyD6H9J9cuaDGU57nAGESic2wM/Xb83o7RTddanCArnvsTSHZuh2z
         s7KLkMHrA3je6+47XygBcgBmqOat0FPhZFGSooqaUNOtlJkvEzNpDy5pYMizkHVjjBVi
         AufQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJZQ60x6Msq7yQ1vp0pkxyvDMyQy/zY1j+Qryno/UHMzKDW/lFAUxeScublIqXvBt9SD+8n+lv75Bd65qz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6nJc7rRJ30OJgaofUxJojhY43tRzQ0/ZZn7WfOJ8NPzilnkIB
	Pl2hpbqW1Yi9e17tEMoKtmRUMk5gF17iR9A1ylvtORG833RU2SUQx2NAbimQMxM=
X-Gm-Gg: ASbGnct6Rg/rOv2Tee4xlg1sKCPuIdG4PmadhUc9zJV5K9QqUJwpyi3bUnZKoor4SzM
	ow96TrwlDn1gYqpigblDk1JJCdNeKGCT2ayhNZ+ab3vJwUU0WcTy9DuYdpG2eBx7sxJDPCcy+ka
	vd5gttNke7HUwwE7JFZRrAp10OdjltN0pehfQgExf9Ew/RB8RZI00nZnRHF+kf8RAaRQKm1Q/Kh
	0vpx3EyY77RPedB3e147+SP7vSh+7ttygcO/5dVnd9J/eDznf6ieJwoPOUWlJcICjIRHtH1iyJ0
	JJnsNPMd3wJ03aRzL4u6ZxkcUFqW6SzJMcnDGDbJPnPq6wIEtGKbRbB+pJQH5/ejAyf3OtzhGS7
	y5+dn
X-Google-Smtp-Source: AGHT+IGZTgGY31e/1k/dTmcJmo/YDWxdXL7RglCap7bUypXHuwXLFHjK5+LGZw2OAN+HVTY4hEX3Xw==
X-Received: by 2002:a17:90b:2d88:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2f782c628bbmr47170073a91.2.1737723854887;
        Fri, 24 Jan 2025 05:04:14 -0800 (PST)
Received: from ?IPV6:240e:370:8b13:5250:f0b9:2326:6cb0:b423? ([240e:370:8b13:5250:f0b9:2326:6cb0:b423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a975sm1776638a91.15.2025.01.24.05.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 05:04:13 -0800 (PST)
Message-ID: <65710478-4ee0-499e-9f66-dff81e226042@bytedance.com>
Date: Fri, 24 Jan 2025 21:04:02 +0800
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: kevin.brodsky@arm.com, riel@surriel.com, vishal.moola@gmail.com,
 david@redhat.com, jannh@google.com, hughd@google.com, willy@infradead.org,
 yuzhao@google.com, muchun.song@linux.dev, akpm@linux-foundation.org,
 will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
 <20250124114759.GB15996@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250124114759.GB15996@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/24 19:47, Peter Zijlstra wrote:
> On Thu, Jan 23, 2025 at 09:26:13PM +0800, Qi Zheng wrote:
>> Hi all,
>>
>> As suggested by Peter Zijlstra below [1], this series aims to remove
>> tlb_remove_page_ptdesc().
>>
>> : Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
>> : there should not be a page-table anywhere near here *ever*.
>> :
>> : Yes, some architectures use tlb_remove_page() for page-tables too, but
>> : that is more or less an implementation detail that can be fixed.
>>
>> After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
>> to remove the page table pages. In the future, once all architectures using
>> tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
>> may be possible to use only tlb_remove_ptdesc().
> 
> Right, so I don't think Sparc and Power care to use ptdesc, they're
> using non page page-tables.
> 
> At the very least we should do something like this, the only point of
> having tlb_remove_ptdesc() is type safety, there really is no benefit
> from it in any other way.
> 
> ---
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index dec030cb1210..a6731328db6f 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -504,7 +504,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>   	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>   }
>   
> -static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
> +static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
>   {
>   	tlb_remove_table(tlb, pt);
>   }

Ah, make sense. I think this can be added to the patch #1.

Thanks!


