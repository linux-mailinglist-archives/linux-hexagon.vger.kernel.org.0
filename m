Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7B875975C
	for <lists+linux-hexagon@lfdr.de>; Wed, 19 Jul 2023 15:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjGSNun (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 19 Jul 2023 09:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbjGSNum (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 19 Jul 2023 09:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13044E4C
        for <linux-hexagon@vger.kernel.org>; Wed, 19 Jul 2023 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689774555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7gvBqRrgzjiPOFgHQxEB0Nm34S2dkYf27eWyqPPlFhY=;
        b=O5Rd1URVjeh3tsQBpWBdG/ni9Q3s6GpVO5o+5lMdTSIxTxC+ZR8bzquFK10YAccDsOvlyR
        XoUlHlrpd9iy1eW3Y5ZuTwxhSmAJ2kSf7aAHMhuzHBiDNAKzpDLTlcbtMEQn5sMrw1uVPi
        5zZ0MaBdd4Gn7k9rsO3tfhQ+uj8OS+A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-9C4cB8PIMISaA8-U66CLeg-1; Wed, 19 Jul 2023 09:49:13 -0400
X-MC-Unique: 9C4cB8PIMISaA8-U66CLeg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31701b27d19so375595f8f.1
        for <linux-hexagon@vger.kernel.org>; Wed, 19 Jul 2023 06:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689774552; x=1690379352;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gvBqRrgzjiPOFgHQxEB0Nm34S2dkYf27eWyqPPlFhY=;
        b=luYwPkKYOsRZM0je0EgqyAPjjBpW3zXS+KXu2EpxAcLbYiYyZArhQfE9RJlEY4AWw2
         c3wedJcYRb1pX9yhLLV9FZ6o2mUvL4vcACk/sfQPlWDhoB/AXRKO1dX/4yyUoeNgzRm6
         wzCtG4y7nkUzH6Zi0nFSpNqQKO9+MuB+H0qKBhXFjA/Se3YH12C3lTSNWJe8EIJkWfmk
         2w/SIRATowm60ZJd5Ef1R7naHo1C3BXnrW39taai9VDHZhBjjH5zWiJhVbq5TaaY1HBL
         jpjjuhMBBTgT4MoFs7gF0u0KRahWEvfnl7AiBqrBE9k/NL+4OM7d3qG6qP2mwLbr1gtW
         3lTg==
X-Gm-Message-State: ABy/qLa0OUupMZz+DNid8iqBdZw76DWDyGV/rhLI6C4sxEMpUUCZNRQs
        sLKYFrQc1wuWaJZx2mVMzb8winEye8VQny/k9HdFWF7o3GVeuNzEL2YnXUd8cN3x7lQ4YaM2/uu
        b8Aq4gr4/n0gwdE5qcpK1RDgOzg==
X-Received: by 2002:a5d:6a04:0:b0:314:3369:df57 with SMTP id m4-20020a5d6a04000000b003143369df57mr1948317wru.5.1689774552639;
        Wed, 19 Jul 2023 06:49:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFD8G6VPVcqqGeSjptpNDnOnSs3W+CAZM63rDbbbVz9hymKgoyuOl3Kik6r5ce0mC8oQNhizg==
X-Received: by 2002:a5d:6a04:0:b0:314:3369:df57 with SMTP id m4-20020a5d6a04000000b003143369df57mr1948300wru.5.1689774552274;
        Wed, 19 Jul 2023 06:49:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q2-20020a5d6582000000b003143bb5ecd5sm5381303wru.69.2023.07.19.06.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 06:49:11 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Deepak Rawat <drawat.floss@gmail.com>,
        Dexuan Cui <decui@microsoft.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guo Ren <guoren@kernel.org>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Khalid Aziz <khalid@gonehiking.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>,
        Will Deacon <will@kernel.org>, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 5/9] vgacon: remove screen_info dependency
In-Reply-To: <20230719123944.3438363-6-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-6-arnd@kernel.org>
Date:   Wed, 19 Jul 2023 15:49:11 +0200
Message-ID: <87fs5khuzs.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The vga console driver is fairly self-contained, and only used by
> architectures that explicitly initialize the screen_info settings.
>
> Chance every instance that picks the vga console by setting conswitchp
> to call a function instead, and pass a reference to the screen_info
> there.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

