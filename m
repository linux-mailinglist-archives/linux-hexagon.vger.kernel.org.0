Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F743689BC4
	for <lists+linux-hexagon@lfdr.de>; Fri,  3 Feb 2023 15:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbjBCOcO (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 3 Feb 2023 09:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjBCOcH (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 3 Feb 2023 09:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A83FA2A5A
        for <linux-hexagon@vger.kernel.org>; Fri,  3 Feb 2023 06:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675434676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bBuUxRqwVpT90qSSvu23sLwWbKqZ02KC/SRu5tcTWNA=;
        b=KoCvTALGset8w6k1Si6CZ6l/74I0+l5J/fxz9/c71cc6sQogROtaYrOAQo01YgoYvBfzrC
        q/3LKjhGqMHX5kY8yrNk80Qy/RpbK+qE8oRrud0H8y+CB6t5xX/mDDkf3Jcvz8Ofnv+gqE
        Zxtn52h1d7tdsFFEMfyeGja/aYjxP64=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-xNPNQiXXNX2Bbnhr6QOu_g-1; Fri, 03 Feb 2023 09:31:15 -0500
X-MC-Unique: xNPNQiXXNX2Bbnhr6QOu_g-1
Received: by mail-wm1-f72.google.com with SMTP id o5-20020a05600c4fc500b003db0b3230efso4686464wmq.9
        for <linux-hexagon@vger.kernel.org>; Fri, 03 Feb 2023 06:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBuUxRqwVpT90qSSvu23sLwWbKqZ02KC/SRu5tcTWNA=;
        b=fOOrSU8iCLgoBaKGrIzmfTgc54V96giBo0CDOXbThvvjaK1XJAUWSrEORAafTEl7t7
         zwHZuGiktXB2FiqamqJR+Rd8B9cCmoi1JfwGjtfPYlcNrzr9bvsa7h0w5Os2nW/3FEpV
         j0g3kNzdhPSm7Y353CEgvhLmX7Xcqs1f3Uj0zpgO3kLiCcTHO+SSAf1j1goqjWK5GAB6
         Ov64nMcDSgNQ1bKhrvlRsR2aj/N2AFUOfdiYYRPMT0dhqfuFZiUd+J6gd909tGKQersc
         eAghbF+b6hMbmyuJuRjdZ11CilqcWFbWwEOxTbARt2pPQVK0RWPlejJRH/LMTTlK4JSm
         frgA==
X-Gm-Message-State: AO0yUKV+K/OKNlzaom6iJKfIxy/Sou0vgiiWcygFSOdJrHFkHHwNqVJq
        SuZxE0F1RHXvfGnfqGeRN+McW1xH+jd59dH5DxlFeWOTKO1ukgz968BpD5UCFHLdAXi3/ZGd0lp
        QYrkti4r8OX/vJiIQXERUwWHnFw==
X-Received: by 2002:a05:600c:4707:b0:3df:e6bb:768 with SMTP id v7-20020a05600c470700b003dfe6bb0768mr2347078wmo.24.1675434673740;
        Fri, 03 Feb 2023 06:31:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8jlKBL+3VH/Q/zFxtw4x3QAOrg1CgHYVk1aVg00PiHMhqeIMC/qbmUMqYVh9aDbNcRdczHvA==
X-Received: by 2002:a05:600c:4707:b0:3df:e6bb:768 with SMTP id v7-20020a05600c470700b003dfe6bb0768mr2347047wmo.24.1675434673459;
        Fri, 03 Feb 2023 06:31:13 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6376.dip0.t-ipconnect.de. [91.12.99.118])
        by smtp.gmail.com with ESMTPSA id w14-20020a05600c474e00b003dfe57f6f61sm2479833wmo.33.2023.02.03.06.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:31:12 -0800 (PST)
Message-ID: <862cb71f-0775-916d-b0c9-5247f772d637@redhat.com>
Date:   Fri, 3 Feb 2023 15:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] m68k: use asm-generic/memory_model.h for both MMU
 and !MMU
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
        x86@kernel.org
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-3-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230129124235.209895-3-rppt@kernel.org>
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
> The MMU variant uses generic definitions of page_to_pfn() and
> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> good reason.
> 
> Include asm-generic/memory_model.h in the common include/asm/page.h and
> drop redundant definitions.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

