Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6172668B142
	for <lists+linux-hexagon@lfdr.de>; Sun,  5 Feb 2023 19:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjBESwU (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sun, 5 Feb 2023 13:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBESwT (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sun, 5 Feb 2023 13:52:19 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC001CAC7
        for <linux-hexagon@vger.kernel.org>; Sun,  5 Feb 2023 10:52:17 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so28567947ejc.4
        for <linux-hexagon@vger.kernel.org>; Sun, 05 Feb 2023 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=HW9XJWDNzeOCSuB6xjuHzGjlFrFpNWXt04d038AYbQHAwGjnEJnVJFaDX127TnFYpL
         ydEGn0SwgrZ26RVkS0s0lgFAxMQXSWztEh7hBcLvV0G2Q3rBSAhctrbX0nTU4l9fQ760
         cFueFrfradqcL9O/I0nJrdeB83AKu6+dYCVG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=fcBpE3WKz3qwktAUoKJCzEe5IwCrKDhxgh9Vt2JznnM2Oa+ZwAf9P+udyo5JNPKMdI
         ByoAzXu64juCSwFxOM3pmgWgHGTvD79fz8IQgePnxLHd6i1cBtAyScbZSnhxj/TBSDl9
         LyAW394Hml4CkREvfKHh+Adykt+2XqZ6hLw8zneSeIZRrZJu4SKXg2bugUcwm/Kk548e
         zjpdaWKPu76IT3FMJKEMiKs2J59gciRpowJoK7pt5QBhFn/iwf/AKsEa5NlzzGcT9pOs
         DePLOupaRTtU+YUrhKqE62ISkGtljkkWZp8uWM+i2mgZF/gNwRc7loWjtY+MsjNWtYP0
         VgNQ==
X-Gm-Message-State: AO0yUKXdq8oL3KC3kJZIoqsewVOS7WoChdU8IeJ/OD1DkMMcQ/gNpY4s
        6gpilVcdn++Ls3EuQo4duHTB9DNr+D78atCnm68=
X-Google-Smtp-Source: AK7set91vl/OZ3AJ6q01U+rRxZ62i5IlpRhI0m8jb30iVz1j60OnVw/Li6TkaemMSh/lViwP/I4R4w==
X-Received: by 2002:a17:906:194e:b0:87f:d17:66db with SMTP id b14-20020a170906194e00b0087f0d1766dbmr17989015eje.52.1675623135757;
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id m9-20020a170906580900b00877ec3b9b8bsm4403300ejq.153.2023.02.05.10.52.14
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id dr8so28453727ejc.12
        for <linux-hexagon@vger.kernel.org>; Sun, 05 Feb 2023 10:52:14 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4354270eje.78.1675623134603; Sun, 05
 Feb 2023 10:52:14 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV> <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
In-Reply-To: <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Feb 2023 10:51:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Sat, Feb 4, 2023 at 10:16 PM Finn Thain <fthain@linux-m68k.org> wrote:
>
> That could be a bug I was chasing back in 2021 but never found. The mmap
> stressors in stress-ng were triggering a crash on a Mac Quadras, though
> only rarely. Sometimes it would run all day without a failure.
>
> Last year when I started using GCC 12 to build the kernel, I saw the same
> workload fail again but the failure mode had become a silent hang/livelock
> instead of the oopses I got with GCC 6.
>
> When I press the NMI button after the livelock I always see
> do_page_fault() in the backtrace. So I've been testing your patch. I've
> been running the same stress-ng reproducer for about 12 hours now with no
> failures which looks promising.
>
> In case that stress-ng testing is of use:
> Tested-by: Finn Thain <fthain@linux-m68k.org>

Could you test the thing that Mark Rutland pointed to? He had an
actual test-case for this for the arm64 fixes some years ago.

See

   https://lore.kernel.org/all/Y9pD+TMP+%2FSyfeJm@FVFF77S0Q05N/

for his email with links to his old test-case?

                Linus
