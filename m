Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3BA5A3276
	for <lists+linux-hexagon@lfdr.de>; Sat, 27 Aug 2022 01:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345462AbiHZXQb (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 26 Aug 2022 19:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345425AbiHZXQb (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 26 Aug 2022 19:16:31 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972F4DFB7B
        for <linux-hexagon@vger.kernel.org>; Fri, 26 Aug 2022 16:16:29 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id s11so3769830edd.13
        for <linux-hexagon@vger.kernel.org>; Fri, 26 Aug 2022 16:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EchSFCFNESRMpkzf6LgfeMPqX9NRcEuB71WzS8HN7D8=;
        b=fFXxOFb4I403xbhy531yXT8u8qnCT6hOkiP/2jM4Zv81TC1p+0O50xRLVE70Gx9IHM
         rhSK1nbeWZ6V5/dxPLrsNIOpSsYF/cqSQcTjDQ92IZLO6kOp9BtiQqMDOigyGgxxuu5l
         NwuJw5OyNX1rmomXFegiTMi05iNP/gTP6eKhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EchSFCFNESRMpkzf6LgfeMPqX9NRcEuB71WzS8HN7D8=;
        b=29871FPC0VaevdQ3tBIpLosh71A10h9LzQmf91hqF6pmAbWUhs7xLsj1nDVaGsesk6
         GsBW/l2gR/brfmwl9b9SqH/1gUkCjvBOZV16zBrJrsUJAQzYtkoY/BWhyf0fqSFttqdZ
         mogsR7AxhD6WB9+0Ia+L5YVmGufWlrRvrnFAUsLL8zb7hOoYzu8DUd3Ipnkgo+eQSvXf
         sIewCVwTJqMVxRelDenZIvlS8Sg9HS/7qk6HG6lfH0ccWUBiF9hdhFkTAioZnvx2WUy7
         heAkLpa+/jiHzlCMTyli7ollt0hSIQGxB6Gpl5PKSD5cJDPpusPnyWpatBo3m3ap3W5D
         Jl2w==
X-Gm-Message-State: ACgBeo3rOAyaGZCqhHaKjpwVXfenXgq0M7DRN0zPuMpd93EtqJzl8Z0y
        3LnQVai4mpK5lkoeiueZWNNXxS9xHhpSIs7Rfrg=
X-Google-Smtp-Source: AA6agR7YsPmrxKUABa31ZrixzkIUtUDJj3nFvmE/+1GKqhZBAFz8QmCJuDPsVVVU2RKAxHEwMf+IQA==
X-Received: by 2002:a05:6402:2216:b0:445:eb9a:bfb5 with SMTP id cq22-20020a056402221600b00445eb9abfb5mr8386810edb.36.1661555787933;
        Fri, 26 Aug 2022 16:16:27 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id et17-20020a170907295100b0073093eaf53esm1409900ejc.131.2022.08.26.16.16.27
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 16:16:27 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so5126131wmk.3
        for <linux-hexagon@vger.kernel.org>; Fri, 26 Aug 2022 16:16:27 -0700 (PDT)
X-Received: by 2002:a05:600c:2195:b0:3a6:b3c:c100 with SMTP id
 e21-20020a05600c219500b003a60b3cc100mr852564wme.8.1661555418236; Fri, 26 Aug
 2022 16:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2208220530050.32093@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh-6RJQWxdVaZSsntyXJWJhivVX8JFH4MqkXv12AHm_=Q@mail.gmail.com>
 <CAHk-=whfZSEc40wtq5H51JcsBdB50ctZPtM3rS3E+xUNvadLog@mail.gmail.com>
 <alpine.LRH.2.02.2208251501200.31977@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh7ystLBs7r=KrgFhuYpNULoTY1FFPgq=a=Kr2mxc3jdg@mail.gmail.com>
 <alpine.LRH.2.02.2208260508360.26588@file01.intranet.prod.int.rdu2.redhat.com>
 <CAMuHMdWQXqi__8q66R7cL4VVgr4r7WwqNmDExFFsi4aC=K3NPw@mail.gmail.com>
 <CAHk-=wh91FqN2sNSRFZPxfGnqAbJ1o66ew8TXh+neM9hW0xZiA@mail.gmail.com> <alpine.LRH.2.02.2208261620210.9648@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2208261620210.9648@file01.intranet.prod.int.rdu2.redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 26 Aug 2022 16:10:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whO2sd233T8AXNMhYztPiF9hae+1ePOX1fEMEu6Ow1CQQ@mail.gmail.com>
Message-ID: <CAHk-=whO2sd233T8AXNMhYztPiF9hae+1ePOX1fEMEu6Ow1CQQ@mail.gmail.com>
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

On Fri, Aug 26, 2022 at 1:43 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> I'm wondering why do the architectures redefine test_bit, if their
> definition is equivalent to the generic one? We could just delete
> arch_test_bit and use "#define arch_test_bit generic_test_bit" as well.

I think generic_test_bit() came after many of them, and when it
didn't, people copied earlier architectures where they had already
done their own.

> Another untested patch ... tomorrow, I'll try to compile it, at least for
> architectures where Debian provides cross-compiling gcc.

Looks good to me, except I'd just do

#define arch_test_bit_acquire arch_test_bit

on hexagon rather than duplicate that function.

From my reading, Hexagon doesn't have any fancy memory ordering, it's
just the usual UP with barriers basically for instruction cache
coherence etc.

                 Linus
