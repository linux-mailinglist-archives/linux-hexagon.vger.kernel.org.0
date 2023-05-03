Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45A36F51A9
	for <lists+linux-hexagon@lfdr.de>; Wed,  3 May 2023 09:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjECHdi (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 3 May 2023 03:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjECHdF (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 3 May 2023 03:33:05 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9931F44A1
        for <linux-hexagon@vger.kernel.org>; Wed,  3 May 2023 00:32:42 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9e66ce80acso2527495276.3
        for <linux-hexagon@vger.kernel.org>; Wed, 03 May 2023 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683099161; x=1685691161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy5PpAsKGu7ciMA0KH8W435+ovkPrJCw8/GzBOIehDY=;
        b=ld7X1/eOQn3jw3nscqDgK6ddNhZLhCbJd9fPsanB0OgdXTNVkQ6EYUUqBqyPM/a4vY
         CbHtyASiJA418MX0oSjMiiVC6FiPHw14WLUdEeW4Umr+YbCrJrLf7Hu5eVK7mdrvS4DL
         9OmWoG7mWW8rmfaib9lGQ1oMZzSYCCqUfliHLErQsjuMdJcbCt3LcNup8fzoyt0Y/8GR
         akHy/Cg/e08JrY/cBm35hsRfsCSXWjiae/OD5Dh8cA2PThcAjwbY7B/39CO37V9omWgv
         O4OooSmTvvfZDRD1Nt5OUOhrDwbp6u/SmztihR1xLy5JcdwnB1lQkg/5xvUiJBgW8awI
         T2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683099161; x=1685691161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy5PpAsKGu7ciMA0KH8W435+ovkPrJCw8/GzBOIehDY=;
        b=YmxLSlUhl+QulJd004STu9hUJgzdCkq6somz94LcIgr4VQT1JRAeY/1QHEiuz4j6BH
         Fq78qmsKFbx+8hsGM2P4vRlRt4od7zo2DfHW5DIiI8ssy5TxikJp26LSbolc1WGlB/d3
         WTj6asKq2TLg9LUhN2pZ107kuaHqbv6s86ADIb8jqoD/aiM9O0nFmXDNzje/7x9tXzyQ
         fkBle0PHQVNUoKVCYxa93cFUKw3II/YljlsXg08fqF529ZhSESPN9gxgyKsm17Qp9R0r
         OL6pGBVl3ghgQMx70eVskoV5ApdNfx+Ka5/WlZndKcJJyInXZMdVv+BnGlfcWgtroAg3
         b6PA==
X-Gm-Message-State: AC+VfDz+iCSuVzUyyEvNlG2gzlFC5S3g0SCci5+MEZAVgrz5CKJ4PCn4
        IrHW1evmlbKQ11s9PC9qyylgFbeZuNpPLSQhcCjAhA==
X-Google-Smtp-Source: ACHHUZ73FCxNpyBPivD8TlcnhveCdt/a/J/xcLCbn8/+GFgeEvve0a+EDCSbzNvVgcIQCyONugRorkzlO9zyElssW9s=
X-Received: by 2002:a25:4c84:0:b0:b9e:5006:42af with SMTP id
 z126-20020a254c84000000b00b9e500642afmr5598495yba.58.1683099161569; Wed, 03
 May 2023 00:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
In-Reply-To: <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 May 2023 09:32:30 +0200
Message-ID: <CACRpkdYCZ0rya3hE+BRrHwP=fASjkpp_Y=BiC=WY-_z0yyRNEg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Expect immutable pointer in virt_to_phys/isa_virt_to_bus
 prototypes
To:     Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc:     Matt Turner <mattst88@gmail.com>, x86@kernel.org,
        Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>,
        Borislav Petkov <bp@alien8.de>, linux-ia64@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        linux-kernel@vger.kernel.org, Brian Cain <bcain@quicinc.com>,
        linux-mips@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Omar Sandoval <osandov@fb.com>, Helge Deller <deller@gmx.de>,
        linuxppc-dev@lists.ozlabs.org, linux-hexagon@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Chris Down <chris@chrisdown.name>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Thu, Apr 27, 2023 at 7:41=E2=80=AFPM Stanislav Kinsburskii
<skinsburskii@linux.microsoft.com> wrote:

> This series is aimed to address compilation warnings when a constant poin=
ter
> is passed to virt_to_phys and isa_virt_to_bus functions:
>
>   warning: passing argument 1 of =E2=80=98virt_to_phys=E2=80=99 discards =
=E2=80=98const=E2=80=99 qualifier from pointer target type
>   warning: passing argument 1 of =E2=80=98isa_virt_to_bus=E2=80=99 discar=
ds =E2=80=98const=E2=80=99 qualifier from pointer target type
>
> The change(s) is the same for all architectures, but it's split into a se=
ries on
> per-arch basis to simplify applying and testing on the maintainers side.
>
> The following series implements...

This is nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I am working with an adjacent task, which is to make virt_to_pfn() and
pfn_to_virt() into static inlines. I might need to rebase my work on top
of this but it should be doable, I am currently stressing the buildbots
with this with the idea to propose it to Arnd once v6.4-rc1 is out:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git=
/log/?h=3Db4/virt-to-pfn-v6-4-rc1

Yours,
Linus Walleij
