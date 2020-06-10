Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2EF1F597F
	for <lists+linux-hexagon@lfdr.de>; Wed, 10 Jun 2020 18:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgFJQyP (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 10 Jun 2020 12:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbgFJQyN (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 10 Jun 2020 12:54:13 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072AFC03E96B
        for <linux-hexagon@vger.kernel.org>; Wed, 10 Jun 2020 09:54:09 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 9so3373955ljv.5
        for <linux-hexagon@vger.kernel.org>; Wed, 10 Jun 2020 09:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PGXejVSpqx4L2PlHIfd5JVBtSOWL/TuutZfvvE958Z8=;
        b=ZFce94Usj6EkI4Lk9l8ZbLgBKcrOaOEIKI+lsoHoWwucoH5PaFSFEUF5nSpDfmtX/m
         zpiTKIsyT2HuVYK0uUKJl0hfSDP//4+ueTqu4gfQUH9jmW1Fx7086RKZCkNC01IFk27w
         7I94+DibpxplQFqh0putGbec4FKBVLxsfzedA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PGXejVSpqx4L2PlHIfd5JVBtSOWL/TuutZfvvE958Z8=;
        b=eb14PyvgoK0NLcz2MFdoShBLlUxOX1lflWYcVAhq4P50cCb1kiq0qGf5LEvG4SIcNf
         WM03uA6NPJKePB66EdR9yJm4mNvSc1MsxRGZFCihBqtcxanfNxCFaMWiDO6LDmOwjvCp
         Ks/Hv/A/8Fq624JTr0snH5MwiizQJz11LIeASkE11yqjwpEbJT7WORzCgvmU/qdT3CtF
         vkxH09MAZHVPDFVe+0SC0fHL5uoTRNodFbwJV0Pt5K3v0bi74GzZmMlrFvxnyISrvWeF
         fJRKuSjPXQ9goKSw1iUbstyxlcRins3uHXMIRqDRyHihT5jnlMSaF+7I1ikcAw1JHxFg
         VWug==
X-Gm-Message-State: AOAM533JZ1+6lGoUSb5wDt5ZKtZa6Cu74tbKV+i2QCRlyacRO4LJ4/Md
        UZr7/4PIYkrPvJK1goKz7KfsrsK02MA=
X-Google-Smtp-Source: ABdhPJzhA6OikluqXocftRL1938usR0M12+9f45Rie9z7N1VVeqzpNPTXEN9RZk6EaS+JJ/pT63pkg==
X-Received: by 2002:a2e:7215:: with SMTP id n21mr2058387ljc.315.1591808047534;
        Wed, 10 Jun 2020 09:54:07 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id f10sm58944lfm.34.2020.06.10.09.54.05
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 09:54:06 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id a9so3373299ljn.6
        for <linux-hexagon@vger.kernel.org>; Wed, 10 Jun 2020 09:54:05 -0700 (PDT)
X-Received: by 2002:a2e:8991:: with SMTP id c17mr1979736lji.421.1591808045437;
 Wed, 10 Jun 2020 09:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200610174811.44b94525@thinkpad>
In-Reply-To: <20200610174811.44b94525@thinkpad>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 10 Jun 2020 09:53:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgm0_0PjXaSVbrpDfgtn6UbDyWjSRnXvfdebweUYSZ+eA@mail.gmail.com>
Message-ID: <CAHk-=wgm0_0PjXaSVbrpDfgtn6UbDyWjSRnXvfdebweUYSZ+eA@mail.gmail.com>
Subject: Re: Possible duplicate page fault accounting on some archs after
 commit 4064b9827063
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     Peter Xu <peterx@redhat.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>, linux-mips@vger.kernel.org,
        Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org,
        linux-um <linux-um@lists.infradead.org>,
        Guan Xuetao <gxt@pku.edu.cn>, linux-xtensa@linux-xtensa.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Wed, Jun 10, 2020 at 8:48 AM Gerald Schaefer
<gerald.schaefer@de.ibm.com> wrote:
>
> This was found by coincidence in s390 code, and a quick check showed that
> there are quite a lot of other architectures that seem to be affected in a
> similar way. I'm preparing a fix for s390, by moving the accounting behind
> the retry loop, similar to x86. It is not completely straight-forward, so
> I leave the fix for other archs to the respective maintainers.

Hmm. I wonder if we could move the handling into  handle_mm_fault() itself.

It's _fairly_ trivial to do on the arch side, just as long as you
remember to make the VM_FAULT_MAJOR bit sticky like x86 does with that

        major |= fault & VM_FAULT_MAJOR;

right after handle_mm_fault(). But it certainly doesn't seem like it
would be hard to move into common code in handle_mm_fault() either, by
just not doing the accounting if it's about to return VM_FAULT_RETRY
or VM_FAULT_ERROR.

That said, we want that perf_sw_event() accounting too, so we'd have
to pass in a 'struct regs *' as well. And it's not clear which way
accounting should go for other callers of handle_mm_fault() (ie gup
etc).

So I guess just having architectures fix it up individually and make
sure they don't do it for retry conditions is the right thing to do..

             Linus
