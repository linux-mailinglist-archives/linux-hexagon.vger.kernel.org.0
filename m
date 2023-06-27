Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B5F73F526
	for <lists+linux-hexagon@lfdr.de>; Tue, 27 Jun 2023 09:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjF0HQF (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 27 Jun 2023 03:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjF0HQE (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 27 Jun 2023 03:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CAD1FC7
        for <linux-hexagon@vger.kernel.org>; Tue, 27 Jun 2023 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687850078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N1scKhPxxz/YxysE64BuheSdyQmgV4XhiinPf6icWX8=;
        b=XxaFVNmF/TH0Zv6CgN6ewrrLWdpJUq/ZdFhk9dJ57rLaT1vzaW6+tUal79+ru/1LTKpZp1
        P0RASTQV0m6BtxkAtEbWCg03LQkW/LrvR63/vVPw9F5S2q74cT5pypyrJuzKnLYNky/fEn
        SZeevAsncu7pLKIO+yr26O85+ettFfA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-ckyzA4zKPACRazhK9fCBNQ-1; Tue, 27 Jun 2023 03:14:33 -0400
X-MC-Unique: ckyzA4zKPACRazhK9fCBNQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f814f78af2so17782745e9.0
        for <linux-hexagon@vger.kernel.org>; Tue, 27 Jun 2023 00:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687850072; x=1690442072;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1scKhPxxz/YxysE64BuheSdyQmgV4XhiinPf6icWX8=;
        b=cFTtfrEFbNbCBau+BfqnzBF8DhIo0GgpC8v/wIQSgmtzCuv2G8F8C/i/P5VetmZfgz
         +Fx3twdY7LDaBj1FNVP2WCJOkAdwz9yDbijRmBoeOnRGDShXIHFPeSAaZvFRz8xdeR6s
         smK6icn82ohL7c6UOPx/cu4RjhwsvfDo1V/XV8C+8Sstx4OyhwgcoZzFSCwaSwOrqlvm
         CyxhHBM4BU31RN4TgSjH7V2IfOQA5glq7qai9GfNEzENWVyGky9iYps+gehjOS715Xly
         pLLN/hxgESeJzvHh80deOhYk82NpbM+edq23IDajD9MvLqf79FEIW/Z/rWJIcHxVPDdm
         HJyQ==
X-Gm-Message-State: AC+VfDz28XSNOqYCmHOeDp5deCr/H+p+S4y3lhLveGU8Ntu7ZIyiZLvM
        KvsGUYRr3ZAEUEaTN8qJ0xqKMvj2+vywFgw0ERXe6V9lq4KWNdohgNC5zE6CcJzYYgtSYWkZdM9
        xnQBuaYGUFsBQKUsK5951N7/hDg==
X-Received: by 2002:a05:600c:3655:b0:3fa:9d0f:f1e1 with SMTP id y21-20020a05600c365500b003fa9d0ff1e1mr2936798wmq.35.1687850072227;
        Tue, 27 Jun 2023 00:14:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HIpOGvancvhac5jw2GR0kOhKc72MxDndtCuN9HZ1pSF+uaoBl/D52ddajPiSHV9uK1Eb9sw==
X-Received: by 2002:a05:600c:3655:b0:3fa:9d0f:f1e1 with SMTP id y21-20020a05600c365500b003fa9d0ff1e1mr2936755wmq.35.1687850071891;
        Tue, 27 Jun 2023 00:14:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:4900:68b3:e93b:e07a:558b? (p200300cbc737490068b3e93be07a558b.dip0.t-ipconnect.de. [2003:cb:c737:4900:68b3:e93b:e07a:558b])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c22d500b003f96d10eafbsm9778433wmg.12.2023.06.27.00.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 00:14:31 -0700 (PDT)
Message-ID: <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
Date:   Tue, 27 Jun 2023 09:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
Content-Language: en-US
To:     Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
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
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "David S. Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <e8992eee-4140-427e-bacb-9449f346318@google.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e8992eee-4140-427e-bacb-9449f346318@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On 27.06.23 06:44, Hugh Dickins wrote:
> On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:
> 
>> The MM subsystem is trying to shrink struct page. This patchset
>> introduces a memory descriptor for page table tracking - struct ptdesc.
> ...
>>   39 files changed, 686 insertions(+), 455 deletions(-)
> 
> I don't see the point of this patchset: to me it is just obfuscation of
> the present-day tight relationship between page table and struct page.
> 
> Matthew already explained:
> 
>> The intent is to get ptdescs to be dynamically allocated at some point
>> in the ~2-3 years out future when we have finished the folio project ...
> 
> So in a kindly mood, I'd say that this patchset is ahead of its time.
> But I can certainly adapt to it, if everyone else sees some point to it.

I share your thoughts, that code churn which will help eventually in the 
far, far future (not wanting to sound too pessimistic, but it's not 
going to be there tomorrow ;) ).

However, if it's just the same as the other conversions we already did 
(e.g., struct slab), then I guess there is no reason to stop now -- the 
obfuscation already happened.

... or is there a difference regarding this conversion and the previous 
ones?

-- 
Cheers,

David / dhildenb

