Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7485A3294
	for <lists+linux-hexagon@lfdr.de>; Sat, 27 Aug 2022 01:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiHZXZH (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 26 Aug 2022 19:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiHZXZF (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 26 Aug 2022 19:25:05 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2892D45F44
        for <linux-hexagon@vger.kernel.org>; Fri, 26 Aug 2022 16:25:04 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id m1so3820457edb.7
        for <linux-hexagon@vger.kernel.org>; Fri, 26 Aug 2022 16:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=a3WYMeaYaKAXqi2vNnTDqTlRNok0/Jvq98Wuc+dfeDo=;
        b=HEiGlMlGQUJaVg6lEvjGY+FKjsfHMo57rRYGePuvlcz/0r2RbwWl9AtQ0dGbw3JwQF
         3nm0V4DsSpmJ1F/Qb1N3WOegj48Mjuee1S0ycHZCQsGeThmAHohlwZ89qr/K5ZO79OUZ
         SfLgX1wpW84KIwtOyBasYRFkKxE4seAGCIO8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=a3WYMeaYaKAXqi2vNnTDqTlRNok0/Jvq98Wuc+dfeDo=;
        b=vqseF/D+1HoYUDdZtuwEfIa0uc0eallmMPdOV94RZu8paDAl54J4WIYghBWiO3gLid
         CmRB+Qu+dMxLJUzV5IQdwcuu/JA+EP6xMWmcTVpi0dudhzxOwVR1IfE1dm3O3E28Z5ab
         rOu+81Pe5E4i2ZSman7fx4FCcIKehQyxMlwQFn5QZ6TLGwyXCuNMC2K87nn6aCeFZTbx
         os5RxIvptESZmsTiUTpkRulLkrhAHn3gVjd3j9NqHLmi3t8/ExLRfsSqqllWCHzrRyd3
         BSWoxj3tI1fG08agdzO8byxtDOAYvJR0JleV60jiOcIFXxuRfX32+ZWMtwQ7AFEbNBzI
         Y29A==
X-Gm-Message-State: ACgBeo1hxIhkYuHwqNI9lZc8nTGf8dgLsBZygYU5azO2GzQEegYuyPKx
        9Ky96GxPREg2Ra7q9oET/tJtuzZUDeR83MaJL70=
X-Google-Smtp-Source: AA6agR6PBb5jdGdV/r1ADnknNGwJ05w/AkKtMxLX9p4yLqXt8LhWzWBuqIe+8oFoSs4kzIIXUz2pYw==
X-Received: by 2002:a05:6402:5205:b0:447:ede:e2ef with SMTP id s5-20020a056402520500b004470edee2efmr8439389edd.130.1661556302428;
        Fri, 26 Aug 2022 16:25:02 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906230d00b00722e50dab2csm1395309eja.109.2022.08.26.16.25.02
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 16:25:02 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id j26so1556749wms.0
        for <linux-hexagon@vger.kernel.org>; Fri, 26 Aug 2022 16:25:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4ece:b0:3a6:28:bc59 with SMTP id
 g14-20020a05600c4ece00b003a60028bc59mr923809wmq.154.1661555931704; Fri, 26
 Aug 2022 16:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2208220530050.32093@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh-6RJQWxdVaZSsntyXJWJhivVX8JFH4MqkXv12AHm_=Q@mail.gmail.com>
 <CAHk-=whfZSEc40wtq5H51JcsBdB50ctZPtM3rS3E+xUNvadLog@mail.gmail.com>
 <alpine.LRH.2.02.2208251501200.31977@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh7ystLBs7r=KrgFhuYpNULoTY1FFPgq=a=Kr2mxc3jdg@mail.gmail.com>
 <alpine.LRH.2.02.2208260508360.26588@file01.intranet.prod.int.rdu2.redhat.com>
 <CAMuHMdWQXqi__8q66R7cL4VVgr4r7WwqNmDExFFsi4aC=K3NPw@mail.gmail.com>
 <CAHk-=wh91FqN2sNSRFZPxfGnqAbJ1o66ew8TXh+neM9hW0xZiA@mail.gmail.com>
 <alpine.LRH.2.02.2208261620210.9648@file01.intranet.prod.int.rdu2.redhat.com> <CAHk-=whO2sd233T8AXNMhYztPiF9hae+1ePOX1fEMEu6Ow1CQQ@mail.gmail.com>
In-Reply-To: <CAHk-=whO2sd233T8AXNMhYztPiF9hae+1ePOX1fEMEu6Ow1CQQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 26 Aug 2022 16:18:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+vA+V_vYjC7gcy2mEJhwp6VB8u_RCizAF4rmH0TZb2A@mail.gmail.com>
Message-ID: <CAHk-=wi+vA+V_vYjC7gcy2mEJhwp6VB8u_RCizAF4rmH0TZb2A@mail.gmail.com>
Subject: Re: [PATCH] provide arch_test_bit_acquire for architectures that
 define test_bit
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Fri, Aug 26, 2022 at 4:10 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Looks good to me, except I'd just do
>
> #define arch_test_bit_acquire arch_test_bit
>
> on hexagon rather than duplicate that function.

Oh, except you didn't quite duplicate it, you added the "memory"
clober to it to make sure it's ordered.

Which looks correct to me, even if the "almost entirely duplicated" is
a bit annoying.

                   Linus
