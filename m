Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8285963FE
	for <lists+linux-hexagon@lfdr.de>; Tue, 16 Aug 2022 22:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237314AbiHPUuv (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 16 Aug 2022 16:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236571AbiHPUun (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 16 Aug 2022 16:50:43 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E0089917
        for <linux-hexagon@vger.kernel.org>; Tue, 16 Aug 2022 13:50:41 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id k26so21115876ejx.5
        for <linux-hexagon@vger.kernel.org>; Tue, 16 Aug 2022 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RO5o1zeDBrbGGgJvigCNf9N1FTIpLD7LsdR8FYAUFCA=;
        b=mbX6DctOgYFtFo87NIsVH6sCTW5XCGD7g/WUQ50Jx9DEGnIygGgzlyAhWZDWVsI6M8
         smAAFtMa3exakMnltpq8T7dxRMzBG2pwz9164F9LalzD4IbgieCepjXRrXPhfWWoae4z
         o+G4TZzVamOcu9v9ovcbWbd/AV7nQbuKQHsRBqo/GFzMEdPG2pgfbrRdaf22EdH2ZQ/9
         1vrjYAjg+18lO17dFBMcUc20I9huOs5sk0CdN4zjoLOQ0l57P5ylIX3coxFr6Ijfkr/m
         UQfCsdy1IGBqrnqLjeG/ybPyxTV0Wt4XpJV5NijX32crbQJN54oIv1EmOvsngHXl9U+T
         pDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RO5o1zeDBrbGGgJvigCNf9N1FTIpLD7LsdR8FYAUFCA=;
        b=K7NeNLOhpo6ON5Zh7PT+dPm3FOWm8sZkeHznld1uAlQXXC+JoqsIJbU9hFKhxORryT
         sc0P1hDdbTWEjPLQks3tvsntpoJdecraVJdZiqHf2QdqBI283HXMn/Z4BUdG9NSnJeLu
         OddBHiUre6decM1G7VHq9hr5xZblzxxAgWOV9gYoUbT5rYoER+i6LAyRc1AI2wns2VcR
         YKiZfktb8hMoDCvd+WTTc/ynoO5hyPxIkSfb8zEhadO2b/HWpdeDC0ZwrdMJcMemQ42Z
         T7Tc71QyDn4eI6hUgP4MO5rwmBpsdOJZLVI7hMmAQEcjgGaO6fugbrtPHysVF7GPPqyF
         VR2g==
X-Gm-Message-State: ACgBeo31hZe3H6Ym7mZnyAqRu2jwLZholfPekwLp78LKwjybrn/QzcOH
        pJJys3hQQo3kCsyXJKbdACtwTOnm94rQciEYAaYugg==
X-Google-Smtp-Source: AA6agR5xeSAOjjzSY3u1UNusAfZ85+ssmMsNDrZIKPKiBG6aJaZr+H1+HfTdBJX+iAMFcv/AhR8JfftZ91By+JjVnV8=
X-Received: by 2002:a17:907:9628:b0:731:1e3:b168 with SMTP id
 gb40-20020a170907962800b0073101e3b168mr15076465ejc.526.1660683040495; Tue, 16
 Aug 2022 13:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220816130823.97903-2-linus.walleij@linaro.org> <202208170316.UKonQfhi-lkp@intel.com>
In-Reply-To: <202208170316.UKonQfhi-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Aug 2022 22:50:29 +0200
Message-ID: <CACRpkdbHvQm-_X4cpRRfeRSNUpTQbeyyQpBPD6TfeomY0nzSsg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] regmap: mmio: Support accelerared noinc operations
To:     kernel test robot <lkp@intel.com>
Cc:     Mark Brown <broonie@kernel.org>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-hexagon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Tue, Aug 16, 2022 at 9:45 PM kernel test robot <lkp@intel.com> wrote:

> >> drivers/base/regmap/regmap-mmio.c:212:3: error: call to undeclared function 'writesb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    writesb(ctx->regs + reg, (const u8 *)val, val_count);
>                    ^
>    drivers/base/regmap/regmap-mmio.c:212:3: note: did you mean 'writeb'?
>    arch/hexagon/include/asm/io.h:122:20: note: 'writeb' declared here
>    static inline void writeb(u8 data, volatile void __iomem *addr)
>                       ^
> >> drivers/base/regmap/regmap-mmio.c:366:3: error: call to undeclared function 'readsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    readsb(ctx->regs + reg, (u8 *)val, val_count);
>                    ^
>    drivers/base/regmap/regmap-mmio.c:366:3: note: did you mean 'readb'?
>    arch/hexagon/include/asm/io.h:83:18: note: 'readb' declared here
>    static inline u8 readb(const volatile void __iomem *addr)
>                     ^
>    2 errors generated.

Yeah Hexagon breaks the <asm/io.h> contract and does not provide
readsb/writesb.

OK I just fix Hexagon as part of patch 2, I hope.

Yours,
Linus Walleij
