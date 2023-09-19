Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E126B7A6AEC
	for <lists+linux-hexagon@lfdr.de>; Tue, 19 Sep 2023 20:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjISSxN (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 19 Sep 2023 14:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbjISSxJ (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 19 Sep 2023 14:53:09 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545E8F7
        for <linux-hexagon@vger.kernel.org>; Tue, 19 Sep 2023 11:53:03 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9adcb89b48bso596649066b.2
        for <linux-hexagon@vger.kernel.org>; Tue, 19 Sep 2023 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695149581; x=1695754381; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qoumeRTE+qtQQI/kZW10ezE5GjBnHd3+HNtP5YPVTpo=;
        b=ZnOBn9+r3kNXiEgMv8k7e4kUJs9/Xcp4A2WWs+J1tPBr+fqElE7YWVzIpPF0fSkW5Y
         lBfwDTdqSsqKTaCLX6ViNVW+GYY45im36aMRmYWxh0EwHz0CbSbhVwWD7LcFQoKLobFv
         TNWVHowB+C6jGMZ/EQKNiyHYyL6ACosNto0JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149581; x=1695754381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoumeRTE+qtQQI/kZW10ezE5GjBnHd3+HNtP5YPVTpo=;
        b=HlHBqTelopSAy1axSCnlMxGw6ajpumCur2bbWRN14TbWOISOK5nyd4Hqk4jKTx8FUO
         sT2LzXev8BK+1GGI4sheRq/XlyR+menGK/YcB0aCaONS2o1Eximm1IBG+MtZPiK45aFL
         b7/pzOoOcbs4Vej8RoUfa/hHoqIAzbr+W+6JI1ncBH7ymG3PKxi1QtF3GGuybhKMD727
         rzWZvnfHuAFzbVvxAMvJr4ZngObZ9iEsbb4Tb/Mx87nI0ZUaDzD6BSKSyip3zslNbMmI
         YIrolaKlzfn46zWZ6IfmtQlk8PDvcYQ9W7ZZbGw8q8xy3Ju4HYYUrWAiPI754ldhZBoj
         34DA==
X-Gm-Message-State: AOJu0YxuPlYgXGphET0kpfpm8rL6wyiP9wLiX/lkYa0XzT8gLPl35+GM
        LaMYDmAWNMkbtMSWe5/Zyq/03Pi+PGxQ+h/dyTyHbbSJ
X-Google-Smtp-Source: AGHT+IGTudQiCPY43VPQW45VjjL4z5/MF9nvojorIe208y2tJLk8tmgk24zeXAA8LowrBgu5e9ffsw==
X-Received: by 2002:a17:906:13:b0:9a9:e73a:3dd4 with SMTP id 19-20020a170906001300b009a9e73a3dd4mr208151eja.64.1695149581329;
        Tue, 19 Sep 2023 11:53:01 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id gz2-20020a170906f2c200b009ae05f9eab3sm3734747ejb.65.2023.09.19.11.53.00
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so7624330a12.0
        for <linux-hexagon@vger.kernel.org>; Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
X-Received: by 2002:a50:fc0e:0:b0:532:e71b:5ead with SMTP id
 i14-20020a50fc0e000000b00532e71b5eadmr258934edr.32.1695149559235; Tue, 19 Sep
 2023 11:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <87zg1u1h5t.fsf@oracle.com> <CAHk-=whMkp68vNxVn1H3qe_P7n=X2sWPL9kvW22dsvMFH8FcQQ@mail.gmail.com>
 <20230911150410.GC9098@noisy.programming.kicks-ass.net> <87h6o01w1a.fsf@oracle.com>
 <20230912082606.GB35261@noisy.programming.kicks-ass.net> <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx> <ZQmbhoQIINs8rLHp@casper.infradead.org>
 <0e69f7df80dc5878071deb0d80938138d19de1d1.camel@physik.fu-berlin.de>
 <20230919134218.GA39281@noisy.programming.kicks-ass.net> <a6c84803274116ec827cd4bdd4e72a8d0c304c27.camel@physik.fu-berlin.de>
 <CAHk-=wgUimqtF7PqFfRw4Ju5H1KYkp6+8F=hBz7amGQ8GaGKkA@mail.gmail.com>
 <87pm2eui95.ffs@tglx> <20230919143816.1741760a@gandalf.local.home>
In-Reply-To: <20230919143816.1741760a@gandalf.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 Sep 2023 11:52:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizB-G40OxALNnz3-uNxuEAPf95H9hubAPeG2r2mrhwHA@mail.gmail.com>
Message-ID: <CAHk-=wizB-G40OxALNnz3-uNxuEAPf95H9hubAPeG2r2mrhwHA@mail.gmail.com>
Subject: Re: Arches that don't support PREEMPT
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, mgorman@suse.de,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        jgross@suse.com, andrew.cooper3@citrix.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Brian Cain <bcain@quicinc.com>,
        linux-hexagon@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Tue, 19 Sept 2023 at 11:37, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> We could simply leave the cond_resched() around but defined as nops for
> everything but the "nostalgia club" to keep them from having any regressions.

I doubt the nostalgia club cares about some latencies (that are
usually only noticeable under extreme loads anyway).

And if they do, maybe that would make somebody sit down and look into
doing it right.

So I think keeping it around would actually be both useless and
counter-productive.

              Linus
