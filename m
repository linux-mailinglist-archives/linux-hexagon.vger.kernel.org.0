Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1655A38E2
	for <lists+linux-hexagon@lfdr.de>; Sat, 27 Aug 2022 18:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiH0QvJ (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 27 Aug 2022 12:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiH0QvI (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 27 Aug 2022 12:51:08 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8D552E7A
        for <linux-hexagon@vger.kernel.org>; Sat, 27 Aug 2022 09:51:05 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id nc14so3385355ejc.4
        for <linux-hexagon@vger.kernel.org>; Sat, 27 Aug 2022 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WAEr4zCif0zp++lZAUWZkj4GJhtO7eOsEWQzvmzftQQ=;
        b=Usv9scAAadihgjNYDL+pCD+vdqOGF1X0cWC9MSgKis7DY1nR47sOn/fUFAwpVGARg2
         R28Rkid0Z4bmdsM2qMAaJdSP1ygPFSKxdXwNRtDIYxO/YduZhQYknWZKo4dOrEu2FVgH
         hZLhNoIfLH15LdDClrvelFDdmfGzL5gJ5DcEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WAEr4zCif0zp++lZAUWZkj4GJhtO7eOsEWQzvmzftQQ=;
        b=oNsjTMKmuz86ohyW9GcuY7kVBJ5IQJhd6I1Lo9v9si0U1i7UvRRRqA7R1CSl0cuQ7/
         0rxPZpQqcgP4jyH2q3v8niGWhbsSwN8RRBf/CCWs1inyA0dTHK6azm65rbvOuRVUaQYR
         EwxSOm+K6jUNV3BMex1PEXoVFXOTLnTsposT85mX2VDC9YKA1/RBNc7nUdCLlc9Q8IMN
         AVldjnwDg4zp2x7hF+jAtWq8b2RqjChqWgdCYJQHLIkSK4TnjrXF6VGRNeCzXY6Cx3Jr
         G2tfXsnol5fj0+Ry8W33BqFN8IoNdol6Vboxrs/jRQ8wsepY/jXftMdPsiNyVi7JFyTr
         fIHw==
X-Gm-Message-State: ACgBeo2v1t9RRXNpYyOs47B1DQMxaysFJkGLquQLXHNSf8Egg2FYAGaJ
        vfDyT0y7UPyuYT4iqUHEWeUju3d5uW65XI23UpU=
X-Google-Smtp-Source: AA6agR5jLGjGEgIXEKDyGmGGsILE4VFtQw434u+GpO+BsJXUoBl/hO8MatmIvADIYmLi5QQVgZba1w==
X-Received: by 2002:a17:907:1c08:b0:73d:68cb:433a with SMTP id nc8-20020a1709071c0800b0073d68cb433amr8365231ejc.560.1661619064151;
        Sat, 27 Aug 2022 09:51:04 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906300400b00721d8e5bf0bsm2253877ejz.6.2022.08.27.09.51.01
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 09:51:02 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso5951263wmh.5
        for <linux-hexagon@vger.kernel.org>; Sat, 27 Aug 2022 09:51:01 -0700 (PDT)
X-Received: by 2002:a05:600c:2195:b0:3a6:b3c:c100 with SMTP id
 e21-20020a05600c219500b003a60b3cc100mr2617660wme.8.1661619061056; Sat, 27 Aug
 2022 09:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2208220530050.32093@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh-6RJQWxdVaZSsntyXJWJhivVX8JFH4MqkXv12AHm_=Q@mail.gmail.com>
 <CAHk-=whfZSEc40wtq5H51JcsBdB50ctZPtM3rS3E+xUNvadLog@mail.gmail.com>
 <alpine.LRH.2.02.2208251501200.31977@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh7ystLBs7r=KrgFhuYpNULoTY1FFPgq=a=Kr2mxc3jdg@mail.gmail.com>
 <alpine.LRH.2.02.2208260508360.26588@file01.intranet.prod.int.rdu2.redhat.com>
 <CAMuHMdWQXqi__8q66R7cL4VVgr4r7WwqNmDExFFsi4aC=K3NPw@mail.gmail.com>
 <CAHk-=wh91FqN2sNSRFZPxfGnqAbJ1o66ew8TXh+neM9hW0xZiA@mail.gmail.com>
 <alpine.LRH.2.02.2208261620210.9648@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=whO2sd233T8AXNMhYztPiF9hae+1ePOX1fEMEu6Ow1CQQ@mail.gmail.com> <alpine.LRH.2.02.2208270720500.18630@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2208270720500.18630@file01.intranet.prod.int.rdu2.redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 27 Aug 2022 09:50:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whyBQzofeFc1a1d2=HKcrTCLDi_FY+K2NG0R4e-9epqPw@mail.gmail.com>
Message-ID: <CAHk-=whyBQzofeFc1a1d2=HKcrTCLDi_FY+K2NG0R4e-9epqPw@mail.gmail.com>
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

On Sat, Aug 27, 2022 at 4:38 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> I compile-tested this patch on alpha, s390x, m68k, sh, sparc32, sparc64.
> So, you can commit it to close these uncompilable-kernel reports.

Thanks, done.

                Linus
