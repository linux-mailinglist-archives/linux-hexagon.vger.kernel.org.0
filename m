Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64EB26C812
	for <lists+linux-hexagon@lfdr.de>; Wed, 16 Sep 2020 20:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgIPSk1 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 16 Sep 2020 14:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgIPSkO (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 16 Sep 2020 14:40:14 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE869C06174A
        for <linux-hexagon@vger.kernel.org>; Wed, 16 Sep 2020 11:40:11 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so6780413ljg.9
        for <linux-hexagon@vger.kernel.org>; Wed, 16 Sep 2020 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oa2KOKBruJIa8JzwEuXDvn8lq/AyW8Gh05WzKpjKQjk=;
        b=UEueMUHZ3w1bML4TffC03SPtwmMbG26ZS04QoHTBFtkbazq0zj1LMx+FyboyvzzASg
         nydFo8G58LEHhfHuiZfy7mbpmIDsIlzAJfeeTzYG6VJXbIqW/NS9VqvGKvKAt1o7QE3H
         aEBuUY03yHBMaYNPFFjhHL22z9bGvgl38mViw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oa2KOKBruJIa8JzwEuXDvn8lq/AyW8Gh05WzKpjKQjk=;
        b=sICqIOFKbFSfaRzPujjZEmpX0gB7V5hA5qf4wskUspoZD+og9Ngu7+3+sOcUHB8+E2
         XMWX6NEVOqz1W4FHuHENVmkV7apNKbQbjEVosohD74tBgU9xlmbZw7L8Up4tWjEMEUB8
         892fjpc45Hk2cM+8C86+MsCAOSqAGOsuQNZqbhjvDTOjn7qsI4CEdTgSkm2SwsAr2uMc
         +/FzS6tcg/fTwB67GRTWAc7qqCJs9meNbTAWEVRW9Q6vwwLYsXcNfTxnKU78vF279Jst
         D5jrckOsMoIgwlsLwzT8Cbwn1u5TuyxHBD9TapM6mjM5/Qc3XkkqpyjXdUSDaZiHRL5d
         0oBA==
X-Gm-Message-State: AOAM531ilorkh2OAJ8gRZQnbwPxVgdnt6X8P/dbnXLiAN9hV0MmfVN3h
        KCq8vJ8nGrJ/NEdLDMBiqMzuUW2CXOiKOA==
X-Google-Smtp-Source: ABdhPJyBRWMclM/iELq4P9px9HL+WVUBuzWS+VUHpwSEqSo0OfltYqPiAY6Dv2u3jesRtaBlssRV2g==
X-Received: by 2002:a2e:b00e:: with SMTP id y14mr8406459ljk.427.1600281610065;
        Wed, 16 Sep 2020 11:40:10 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id l16sm5486308ljb.72.2020.09.16.11.40.09
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 11:40:09 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id b19so6782976lji.11
        for <linux-hexagon@vger.kernel.org>; Wed, 16 Sep 2020 11:40:09 -0700 (PDT)
X-Received: by 2002:a19:e00a:: with SMTP id x10mr9071213lfg.603.1600281136741;
 Wed, 16 Sep 2020 11:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de> <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de> <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de> <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
 <CAKMK7uHAk9-Vy2cof0ws=DrcD52GHiCDiyHbjLd19CgpBU2rKQ@mail.gmail.com> <20200916152956.GV29330@paulmck-ThinkPad-P72>
In-Reply-To: <20200916152956.GV29330@paulmck-ThinkPad-P72>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Sep 2020 11:32:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsMycgMHJrCmeetR3r+K5bpSRtmVWfd8iaoQCYd_VYAg@mail.gmail.com>
Message-ID: <CAHk-=wjsMycgMHJrCmeetR3r+K5bpSRtmVWfd8iaoQCYd_VYAg@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Shuah Khan <shuah@kernel.org>, rcu@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Wed, Sep 16, 2020 at 8:29 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> All fair, but some of us need to write code that must handle being
> invoked from a wide variety of contexts.

Note that I think that core functionality is different from random drivers.

Of course core code can (and will) look at things like

        if (in_interrupt())
            .. schedule work asynchronously ..

because core code ends up being called from odd places, and code like
that is expected to have understanding of the rules it plays with.

But something like RCU is a very different beast from some "walk the
scatter-gather list" code.

RCU does its work in the background, and works with lots of different
things. And it's so core and used everywhere that it knows about these
things. I mean, we literally have special code explicitly to let RCU
know "we entered kernel context now".

But something like a driver list walking thing should not be doing
different things behind peoples back depending on whether they hold
spinlocks or not. It should either just work regardless, or there
should be a flag (or special interface) for the "you're being called
in a crtitical region".

Because dynamically changing behavior really is very confusing.

               Linus
