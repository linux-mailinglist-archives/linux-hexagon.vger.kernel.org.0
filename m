Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75253546A73
	for <lists+linux-hexagon@lfdr.de>; Fri, 10 Jun 2022 18:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349721AbiFJQdx (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 10 Jun 2022 12:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346465AbiFJQdd (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 10 Jun 2022 12:33:33 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2489F56FB1
        for <linux-hexagon@vger.kernel.org>; Fri, 10 Jun 2022 09:33:15 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id t32so3372513ybt.12
        for <linux-hexagon@vger.kernel.org>; Fri, 10 Jun 2022 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bhv02q67MOioDvIeN4y+a/ybeIh94RUFpBdk0EW721Q=;
        b=gTSqAdTJjftykkKV3LvI3BgIEdnFPO1tIX2Ja3yrYtQNH7qkYO5md+ofkXUFp0r5AW
         G6gcWOkM0lg+gYk1xVlJLK69IVjiD2uEY/paaLVpsJSAUJr3ix3CnTM3jTjnVHIGrITZ
         8qOTeStSyYFo4Xt1uIWq/JcAZJafn7HdU8yhoSTqaMMSwSE/odkOqaPLeyUKWL5sO4fY
         YvCEOzFgGYsioj0kFMpYKr9Y6KDxyzq/x30hfjgDctRhz4XpICUW+ZTe11KlQpTSKF0Q
         MmwpTmp6Vj4zz6mr/A1YZvGF2iMEYWObj9GWEHshf9njpmcmcbzr60kAblJRSOIE1DnE
         +7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bhv02q67MOioDvIeN4y+a/ybeIh94RUFpBdk0EW721Q=;
        b=VH9ZNv5PQjeCnZNXbDsAwKkHGLC7HtYB46vWdbTD2xjxVy8j0/xDpuFRkg+YbNW7kk
         LNQ8MR17gOSudx/9GV0RQiMsOcfctg+djo8QzPj1gV0QBTGCnr5QoIYui7aHBJiz4zfw
         kBVMZ0CX367IdnGhOP9nvwnKc7ohJ38MyDeJeKh9y627jvcd/8SqDM0pN6s6Tw5wWi6T
         krzR2sPGSraRJXk7lU8wCFBqbQv/XrLSba6AM7GLI674W7xgKmX6Uar3xDv3okwvQbop
         IXm6yM+36Mbi/1K7B6XEFm6MXU/d2oPFFBV3GMEHP0nr0BJJ1a0I7EA2OQjLx9W3Y6j1
         5dSQ==
X-Gm-Message-State: AOAM532AI5KQNq9BsGXS9q/lRzk84G+uCWqgabMtzDtnYjNR+ug+AQVk
        4Ykn6RA6roeB8qaskcwoq/Bt6fqcAjhihyc1/KGo1w==
X-Google-Smtp-Source: ABdhPJyJqY4ELta1f6MtdpBF9FmmN+1Swnl8abwrpU7Envy5QN/0+FxiY8CXqHJVU09kzIn9KX5saZ7waQDwoeJx/U8=
X-Received: by 2002:a05:6902:102c:b0:663:32b8:4b24 with SMTP id
 x12-20020a056902102c00b0066332b84b24mr37019234ybt.1.1654878793763; Fri, 10
 Jun 2022 09:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220610113427.908751-1-alexandr.lobakin@intel.com>
 <20220610113427.908751-3-alexandr.lobakin@intel.com> <YqNMO0ioGzJ1IkoA@smile.fi.intel.com>
 <22042c14bc6a437d9c6b235fbfa32c8a@intel.com>
In-Reply-To: <22042c14bc6a437d9c6b235fbfa32c8a@intel.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 10 Jun 2022 18:32:36 +0200
Message-ID: <CANpmjNNZAeMQjzNyXLeKY4cp_m-xJBU1vs7PgT+7_sJwxtEEAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] bitops: always define asm-generic non-atomic bitops
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Lobakin, Alexandr" <alexandr.lobakin@intel.com>,
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

On Fri, 10 Jun 2022 at 18:02, Luck, Tony <tony.luck@intel.com> wrote:
>
> > > +/**
> > > + * generic_test_bit - Determine whether a bit is set
> > > + * @nr: bit number to test
> > > + * @addr: Address to start counting from
> > > + */
> >
> > Shouldn't we add in this or in separate patch a big NOTE to explain that this
> > is actually atomic and must be kept as a such?
>
> "atomic" isn't really the right word. The volatile access makes sure that the
> compiler does the test at the point that the source code asked, and doesn't
> move it before/after other operations.

It's listed in Documentation/atomic_bitops.txt.

It is as "atomic" as READ_ONCE() or atomic_read() is. Though you are
right that the "atomicity" of reading one bit is almost a given,
because we can't really read half a bit.
The main thing is that the compiler keeps it "atomic" and e.g. doesn't
fuse the load with another or elide it completely, and then transforms
the code in concurrency-unfriendly ways.

Like READ_ONCE() and friends, test_bit(), unlike non-atomic bitops,
may also be used to dependency-order some subsequent marked (viz.
atomic) operations.

> But there is no such thing as an atomic test_bit() operation:
>
>         if (test_bit(5, addr)) {
>                 /* some other CPU nukes bit 5 */
>
>                 /* I know it was set when I looked, but now, could be anything */

The operation itself is atomic, because reading half a bit is
impossible. Whether or not that bit is modified concurrently is a
different problem.

Thanks,
-- Marco
