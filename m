Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A62C26C7DA
	for <lists+linux-hexagon@lfdr.de>; Wed, 16 Sep 2020 20:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgIPSfm (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 16 Sep 2020 14:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728200AbgIPSfJ (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 16 Sep 2020 14:35:09 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E57BC06174A
        for <linux-hexagon@vger.kernel.org>; Wed, 16 Sep 2020 11:35:09 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so6782646ljk.8
        for <linux-hexagon@vger.kernel.org>; Wed, 16 Sep 2020 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AxuwlCpSO8TsaLIcauC4aS5tgqsK9SeD3UYfP7DN7g0=;
        b=ZKGyeh6DjOj0P0poUJri2yvAXd4omTbSKkycPwhZ3i+69eOgCicq7HjntIxGCUS9d/
         zNZFDIECDK4GwkaKDrKuGgCWjAAnhqqHdcPPPF/38HaA25t0OpynH7kdnV1WYZaxFMxz
         W50ov+r+RFsylVih7TsRScGj6r7RgJSz63qJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxuwlCpSO8TsaLIcauC4aS5tgqsK9SeD3UYfP7DN7g0=;
        b=fTP2kHZm7AwEa7C1MUZMuOXvaesiJ61EhASesydFaeNEvAaX4/xSYMCmGNkSU1aYRB
         Y/WvIes22UNiI+wx2zPm57vQrgv2+QcyJksx3jKxAU+IHXh0uodp13I0uggDmq5R9J0x
         I3vRAJSxDNnJW32FxFZoSjp0hyGnSyYf3OCThH6ob/oHsvjDZxx5+/vm2e3J1K4Z0n68
         Ka4lBdTsy5Ofwt7nebAlbQudxrW9CFfxbC3HlxynGvJ+ZZ3zEuCjKTNo6EcXm7uxqPTG
         pUSHkPzNkbwoCC8ydA/UYnDFWruKuMoOzEuFrK+dTKYXDmPiQX3PMnMKmZU6Tcspr1AG
         IbdQ==
X-Gm-Message-State: AOAM530OQOJABr9BLfUdGxvflXQ/yHyrlX35IzrtG7EGhyErXrp1+eEK
        1CZD+TTGGhhSMJsmXQ0qpJTeeV2x/9aorQ==
X-Google-Smtp-Source: ABdhPJxtd0CMXzfTams1hayj3z77gBWn3JNDoZOLrvWvl6n/quV2rgWG/RbsBViKbqTc+X7VsaNZYQ==
X-Received: by 2002:a2e:86c7:: with SMTP id n7mr9301836ljj.229.1600281307844;
        Wed, 16 Sep 2020 11:35:07 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id h11sm5065280lfd.21.2020.09.16.11.35.07
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 11:35:07 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id z17so8018028lfi.12
        for <linux-hexagon@vger.kernel.org>; Wed, 16 Sep 2020 11:35:07 -0700 (PDT)
X-Received: by 2002:a19:521a:: with SMTP id m26mr9002648lfb.133.1600281306776;
 Wed, 16 Sep 2020 11:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de> <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de> <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de> <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
 <87y2la4xu6.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87y2la4xu6.fsf@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Sep 2020 11:34:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvULv3M2dQzPra1W-uGiX=_6Z_YeGnRDodbtXgJpihWA@mail.gmail.com>
Message-ID: <CAHk-=whvULv3M2dQzPra1W-uGiX=_6Z_YeGnRDodbtXgJpihWA@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
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
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
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

On Tue, Sep 15, 2020 at 12:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> You wish. I just found a 7 year old bug in a 10G network driver which
> surely would have been found if people would enable debug configs and
> not just run the crap on their PREEMPT_NONE, all debug off kernel. And
> that driver is not subject to bitrot, it gets regular bug fixes from
> people who seem to care (distro folks).

That driver clearly cannot be very well maintained. All the distro
kernels have the basic debug checks in place, afaik.

Is it some wonderful "enterprise hardware" garbage again that only
gets used in special data centers?

Becasue the "enterprise" people really are special. Very much in the
"short bus" special kind of way. The fact that they have fooled so
much of the industry into thinking that they are the competent and
serious people is a disgrace.

              Linus
