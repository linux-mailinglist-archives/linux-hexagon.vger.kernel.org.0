Return-Path: <linux-hexagon+bounces-552-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD89F919A
	for <lists+linux-hexagon@lfdr.de>; Fri, 20 Dec 2024 12:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AB33166A97
	for <lists+linux-hexagon@lfdr.de>; Fri, 20 Dec 2024 11:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF681C5F06;
	Fri, 20 Dec 2024 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="A1F34s7h"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52361C5487
	for <linux-hexagon@vger.kernel.org>; Fri, 20 Dec 2024 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695179; cv=none; b=LY+FYfjU/8I2rd/tUJwCeGorOQrDKrxxLAfaxg2WsAINhjfowrzRMQn4UdlauOPGROmPY4nxaq04c88r+OvdGh/PAoxb6Z8PtSsabln9d+DYDikRi2mfvciz+wKwJdYWkv4ZRH58lZ4ZOfjwV06cajvgSAqo9bxVY4PwlntTLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695179; c=relaxed/simple;
	bh=yIScTezDLLIu5IKi/+u7+E2INdxlbVe48yxybU1XCOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NaCL5bYCu59kQG5A45mGqgyHO7rNnPK04F1MZeVKm7NBpRcF4WIloUlUIrh42Id3vENFfq8QHe2G7Wge+eHC6XOGzDUySggPNTjbG5uqt+BjsexQ7bxhVNInZNJBKkL9hoRccWpVGW50dyUxYGDpDeRq4cdyEstw14nr447Bw0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=A1F34s7h; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21675fd60feso20921385ad.2
        for <linux-hexagon@vger.kernel.org>; Fri, 20 Dec 2024 03:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734695175; x=1735299975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=A1F34s7haE1BNX3nHh73oZcFwT07QCSwjomd6/prukB2miCl02nDVDRm+mvi3NM5V8
         ClabG/pQNIVwt6uCindT8wbcyTlPyUI5QrR1NRgnzZIAehUFN/y5fdV5eQpYEmu5xHzT
         VEzkx9kR/0zHRixLyDzZpZnT5SNKotPRLR4to7UlrupYY49iNH7HEhkrUr+g4nR1b3Co
         RtNHp9Qe7JDoBSqjnYCgWYyUyA9JoFBxhAYT+7/Y4i/cENy+6hc3FtXU1lBho1pPSO4R
         a96yUFBguasrJZzM06Bksb3cvVjB9+KIkLM3GSURJv4mJPNiHQr3JfTYyrL9bY7Sld1r
         LY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734695175; x=1735299975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=GQ8XNwctFqjLpfZpK4wLvkhEOGwGkXcqK9iRuGCkrybKA002jvU1833KmNHIm8ttDq
         Bks2stimgLOvFVJQItiUR5/PRMlbKl+phA7Xv9HPYVLBfOPHmi0Pe4aBpjhiBQVGMDkv
         79kI9CWfM9KpEdG5BmmmJiF0Os5zOMDpXooN47ezGyj20NWDXdPKbsxMKdMYE5ymtqrY
         TsFi9x6U09Zm3VCskS7SHC1+K8Nyp3gWWSUBG0F5n7SNs9XVERIS8yQe/eH18XV/FAa6
         JziARIMvcd2O/eHduXBxL5oBffQW11WNJ7KbQC2nKkekjyTLX7KXgL7a0p7rAyN7twNv
         HExg==
X-Forwarded-Encrypted: i=1; AJvYcCX1rYZ0Op6U+lnDAdHpqpPboqRKuoR9XF6q+Haodin7sZWEVzBBu3C7ZdSOQV9rrX+/d2x8OdLMcYdRMB9v@vger.kernel.org
X-Gm-Message-State: AOJu0YwxYhElTuaav8OD7PfEtShoK/iFjyue4VLx1Q2jLnpyU2LZWZK4
	RRHmNiuzNHU1Z0AKlkGIl7naBrzfuOpAl8BFKkD2zR66474Lz5/GhBch+3mHz1w=
X-Gm-Gg: ASbGncsIuWI8HTNniFtQlCn3rq6UCDS7dhUKJwIclkT/vLgBcw+sLeLU7OU1aYziUje
	zf/GS/P0Wlfctx37FB9BTPBBqZClCtykyZjeLQ2r3oY34ULPxLHZtEbcy0lYgZku+55LgrHGMrP
	RWtWHp5Rs0wOwVuisH2ALBddv0baTPqJnt0ij/D1RqoffZiUgFw6fv9fR37g3ROv3vTXSFFlWmj
	DuV0VzwRWR8uXT9HrFWbEu1lUWHjPv8TEw9Lvzbpw/lAozsj2U8CoPEBt4LaOs+GXr2BcShO16c
	V598lPSSwXpzkN+ZH1bUIIgIg0DI6Nny049jTYBHn+hYYqlPoOSBeSk=
X-Google-Smtp-Source: AGHT+IG40UPaAgLiyyOp9k8XqW2vPy2P2eyTWxZSuqMQTAARXLtkQgcz7lH63J8oRPI229SK+RLglg==
X-Received: by 2002:a17:902:ce92:b0:216:4169:f9d7 with SMTP id d9443c01a7336-219e6e8bc7cmr41107195ad.2.1734695174995;
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:680a:144b:d927:5a3b? ([2409:8a28:f44:3764:680a:144b:d927:5a3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9939b5sm5267286a91.1.2024.12.20.03.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Message-ID: <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
Date: Fri, 20 Dec 2024 19:46:04 +0800
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kevin,

On 2024/12/20 18:49, Kevin Brodsky wrote:
> Hi Peter, Qi,
> 
> On 19/12/2024 18:19, Peter Zijlstra wrote:
>> On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
>>> Besides the ptlock management at PTE/PMD level, all the
>>> pagetable_*_[cd]tor have the same implementation. Introduce common
>>> helpers for all levels to reduce the duplication.
>> Uff, I forgot to Cc you on the discussion here, sorry!:
>>
>>    https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com
>>
>> we now have two series doing more or less overlapping things :/
>>
>> You can in fact trivially merge the all the implementations -- the
>> apparent non-common bit (ptlock_free) is a no-op for all those other
>> levels because they'll be having ptdesc->lock == NULL.
> 
> Ah that is good to know, thanks for letting me know about that and Qi's
> series! Fortunately there isn't that much overlap between our series - I
> think we can easily sort this out.
> 
> Qi, shall we collaborate to make our series complementary? I believe my
> series covers patch 2 and 4 of your series, but it goes further by
> covering all levels and all architectures, and patches introducing
> ctor/dtor are already split as Alexander suggested on your series. So my
> suggestion would be:
> 
> * Remove patch 1 in my series - I'd just introduce
> pagetable_{p4d,pgd}_[cd]tor with the same implementation as
> pagetable_pud_[cd]tor.
> * Remove patch 2 and 4 from your series and rebase it on mine.

I quickly went through your patch series. It looks like my patch 2 and
your patch 6 are duplicated, so you want me to remove my patch 2.

But I think you may not be able to simple let arm64, riscv and x86 to
use generic p4d_{alloc_one,free}(). Because even if
CONFIG_PGTABLE_LEVELS > 4, the pgtable_l5_enabled() may not be true.

For example, in arm64:

#if CONFIG_PGTABLE_LEVELS > 4

static __always_inline bool pgtable_l5_enabled(void)
{
	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
		return vabits_actual == VA_BITS;
	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
}

Did I miss something?

My patch series is not only for cleanup, but also for fixes of
UAF issue [1], so is it possible to rebase your patch series onto
mine? I can post v3 ASAP.

[1]. 
https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Thanks!

> 
> Let me know if that makes sense, if so I'll post a v2.
> 
> Cheers,
> - Kevin

