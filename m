Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25FE689BEC
	for <lists+linux-hexagon@lfdr.de>; Fri,  3 Feb 2023 15:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjBCOew (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 3 Feb 2023 09:34:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbjBCOek (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 3 Feb 2023 09:34:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FD0902B
        for <linux-hexagon@vger.kernel.org>; Fri,  3 Feb 2023 06:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675434830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QVQjsvvXC5vAa55XgbnpLQZ7ycccPtxDGUTVFYgFp7U=;
        b=HFLzrleHVmbB/yMXmxu+7UXbc48chEGIyxGClGiXHVdXXZpxDw4AHy5naVJ/T1pZtlW98p
        YQ7FZ5XL3lZ2dlqmTi+pGIFXWxOl6Q3vuFnAFgY9Gqz0Sk/DWlkqhaYdqjZpeq27WK6sjn
        IMBSkvveM5MWX163BNj/Rm1LtkRTbSo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-2bxOOvpCPIqtmhSPe3LXWA-1; Fri, 03 Feb 2023 09:33:49 -0500
X-MC-Unique: 2bxOOvpCPIqtmhSPe3LXWA-1
Received: by mail-wr1-f71.google.com with SMTP id j25-20020adfd219000000b002bfd1484f9bso708592wrh.2
        for <linux-hexagon@vger.kernel.org>; Fri, 03 Feb 2023 06:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVQjsvvXC5vAa55XgbnpLQZ7ycccPtxDGUTVFYgFp7U=;
        b=xCU65CVVmsrDkZ+QimFFNiC5TzsRHYj276TObhFS1hP0b8hb18cZ5dTx6QR7Q/+oTd
         HVfq/lKILWplgIfM5yeuYOHqUbL22QJYg/VJaeMXIyNP7fJeiFkmJzq3Y5aRGdIV3xtK
         WbaKcClhM0VxkveD8S/LLVnitJDb/eKPC46s0KJ9aQMpTqgRzb5aZC7JrOcLk3BK7T1R
         t01lp3A9Ur62rqlHluN6D8wHLmJYvi6fFWfzjGjssomaocndW4h2ea/y4bZup10N+yoN
         zBqEHY09tHOiTbZE8UHWQszabRrQN+Oq22V2Sf5cSItQJ4nKpcmeLghe7VX6RdtT2E6w
         VTYw==
X-Gm-Message-State: AO0yUKWHy+s+I6rqE/dIp+ATRyTMXC/iPoINPGI5istC23tT5feNxLNR
        SISqUshMr6Wzwor393LhCM4EM1/urpT4iSNsuIbsEQ0wOzbiwFxWSC6THbk0YKmtyWKkmMLRLu5
        VW16EjrGU61XLW8coaJxYmJUCxA==
X-Received: by 2002:a05:600c:3514:b0:3df:ead3:c6fc with SMTP id h20-20020a05600c351400b003dfead3c6fcmr1739783wmq.17.1675434828386;
        Fri, 03 Feb 2023 06:33:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+nCaLsRgMPjXxFJ2S9nOzpB4vodjtO+Yac8mpKGPJpDWQMNBTnVH2IJfyVyYdKVED3TZv5Cg==
X-Received: by 2002:a05:600c:3514:b0:3df:ead3:c6fc with SMTP id h20-20020a05600c351400b003dfead3c6fcmr1739731wmq.17.1675434828065;
        Fri, 03 Feb 2023 06:33:48 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6376.dip0.t-ipconnect.de. [91.12.99.118])
        by smtp.gmail.com with ESMTPSA id o35-20020a05600c512300b003cffd3c3d6csm3239260wms.12.2023.02.03.06.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:33:47 -0800 (PST)
Message-ID: <de9cb029-b36e-efe9-9d0e-46a382e889b5@redhat.com>
Date:   Fri, 3 Feb 2023 15:33:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/4] mm, arch: add generic implementation of
 pfn_valid() for FLATMEM
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vineet Gupta <vgupta@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        x86@kernel.org, Huacai Chen <chenhuacai@loongson.cn>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-5-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230129124235.209895-5-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On 29.01.23 13:42, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Every architecture that supports FLATMEM memory model defines its own
> version of pfn_valid() that essentially compares a pfn to max_mapnr.
> 
> Use mips/powerpc version implemented as static inline as a generic
> implementation of pfn_valid() and drop its per-architecture definitions.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Guo Ren <guoren@kernel.org>		# csky
> Acked-by: Huacai Chen <chenhuacai@loongson.cn>	# LoongArch
> Acked-by: Stafford Horne <shorne@gmail.com>	# OpenRISC
> ---

LGTM with the fixup

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

