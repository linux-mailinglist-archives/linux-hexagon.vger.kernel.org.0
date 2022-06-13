Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B95E549940
	for <lists+linux-hexagon@lfdr.de>; Mon, 13 Jun 2022 18:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238458AbiFMQpT (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 13 Jun 2022 12:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240254AbiFMQpA (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 13 Jun 2022 12:45:00 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39B31E4BE5
        for <linux-hexagon@vger.kernel.org>; Mon, 13 Jun 2022 07:33:56 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id v22so10188207ybd.5
        for <linux-hexagon@vger.kernel.org>; Mon, 13 Jun 2022 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQCwIkwNzwt5T2z3wlATn5QZJXZyj8/g94B/Y2n7Ov8=;
        b=RsztUVvqZtKDuLU8Lf83jCg2FonaZq3j7tha/V+O/QezKPXwlEvSEPOQX3hz9T78C3
         3I6j6z1A/Cq6rSJmdFgt0oN6wG+e9xT+Ae9I57CN7NuNV7UAGESXGdpL/0qjMFr6J1AO
         j5S+6qJRX5emBJ2bfvZ0aKKWa1x9S44BcdWCp78aC5PfePta2erze8nysaY1ttyVO7kx
         fWJ7ZvaryKTY+6zAJ5UhVNSOJgi3zgc40qe+mrW1Ay0ECDOBytM0OUitt40J2PFHczlR
         Z86EN3athSadQP2xV0dv7LzAY+7OnBLrfmhcH8PuFvJX/KIQYWgquzO8svWkc7MbNA5h
         H1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQCwIkwNzwt5T2z3wlATn5QZJXZyj8/g94B/Y2n7Ov8=;
        b=oVxUGGL0baa8cIV1cvHlxQ1r83YD/n31UE5tMvepa0bWjn9SWwlObllYHj+OkJCmYI
         S48vFPYbSpVL5CGnluuYONPlkL7klnUcOrTUf5vbITAr9YQ+U72HW94GtrxYGSlafw0Y
         vZGdJq9GNSmT+fKVS3O78oTJIHeCkCPOeoAIwF8A9cIE9C7EjDX1hjaihYleS3W9p9fk
         0tozxZb8noEgNCWHHm7OXRVyiUTZe5jXACpuAmTr5JcuP5rf97g4tZJ5HlDnN4AfsD5q
         dkPSXYze3+h58h9E0b8aO2UWimBNe29YJ1Mq2iiU/lNq9xBkmIHQ/0mySJtgbJ7B0N7d
         5NNQ==
X-Gm-Message-State: AOAM533Rnc4ZiFxZcZwaNA6G2LkK5Ui7nv3iRxgHAV/uv4xkdokfWimb
        uF+Y9xZ/W9E/EPElCG+9OzOYS9aCqMqbKZoM1sI8+Q==
X-Google-Smtp-Source: ABdhPJy/F93/bynfvfsm40lPj+sfF6IUeml0u74B5+XSTwKjdBKHGF9ssO+g80HeXa4n5Q7iWRh0IVOUfUGuwu/D1DY=
X-Received: by 2002:a05:6902:102c:b0:663:32b8:4b24 with SMTP id
 x12-20020a056902102c00b0066332b84b24mr51076390ybt.1.1655130835059; Mon, 13
 Jun 2022 07:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220610113427.908751-1-alexandr.lobakin@intel.com>
 <20220610113427.908751-3-alexandr.lobakin@intel.com> <YqNMO0ioGzJ1IkoA@smile.fi.intel.com>
 <22042c14bc6a437d9c6b235fbfa32c8a@intel.com> <CANpmjNNZAeMQjzNyXLeKY4cp_m-xJBU1vs7PgT+7_sJwxtEEAg@mail.gmail.com>
 <20220613141947.1176100-1-alexandr.lobakin@intel.com>
In-Reply-To: <20220613141947.1176100-1-alexandr.lobakin@intel.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 13 Jun 2022 16:33:17 +0200
Message-ID: <CANpmjNM0noP8ieQztyEvijz+MG-cDxxmfwaX_QTpnyT5G33EGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] bitops: always define asm-generic non-atomic bitops
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Yury Norov <yury.norov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Mon, 13 Jun 2022 at 16:21, Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> From: Marco Elver <elver@google.com>
> Date: Fri, 10 Jun 2022 18:32:36 +0200
>
> > On Fri, 10 Jun 2022 at 18:02, Luck, Tony <tony.luck@intel.com> wrote:
> > >
> > > > > +/**
> > > > > + * generic_test_bit - Determine whether a bit is set
> > > > > + * @nr: bit number to test
> > > > > + * @addr: Address to start counting from
> > > > > + */
> > > >
> > > > Shouldn't we add in this or in separate patch a big NOTE to explain that this
> > > > is actually atomic and must be kept as a such?
> > >
> > > "atomic" isn't really the right word. The volatile access makes sure that the
> > > compiler does the test at the point that the source code asked, and doesn't
> > > move it before/after other operations.
> >
> > It's listed in Documentation/atomic_bitops.txt.
>
> Oh, so my memory was actually correct that I saw it in the docs
> somewhere.
> WDYT, should I mention this here in the code (block comment) as well
> that it's atomic and must not lose `volatile` as Andy suggested or
> it's sufficient to have it in the docs (+ it's not underscored)?

Perhaps a quick comment in the code (not kerneldoc above) will be
sufficient, with reference to Documentation/atomic_bitops.txt.
