Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F733688E9
	for <lists+linux-hexagon@lfdr.de>; Fri, 23 Apr 2021 00:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhDVWM5 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 22 Apr 2021 18:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236915AbhDVWM4 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 22 Apr 2021 18:12:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A812C061756
        for <linux-hexagon@vger.kernel.org>; Thu, 22 Apr 2021 15:12:19 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 12so74303003lfq.13
        for <linux-hexagon@vger.kernel.org>; Thu, 22 Apr 2021 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=IeGVP/PzjX6GEC4OpuxzmsnoF97NjtiO1q5gl5FI7JM=;
        b=SAN+kJAryw/6OAvi1tysBLGSfweOHsy2ZldSSzEZCPRLWuQEtqq2WNl7iulOF8qc1D
         BRKDUme3/zsS4b7KxFFq5q/l6TDChCgM3mO0HRtlZM4JLJw53bizREK/ojQPzuu0s1yg
         xQCRzYjptXYhJj/GayuEMLBnUMqe43nhh40gtgdshUnp/dtKF8KorrkE59RbC+U0zKF1
         3LoKWqp69J4NsQ19gthobT+D6HMObQNV8sxa+IBu3/Xv5nG1npwJXOXIdqwW4EWw59oi
         K1YbwvUvaBJ4hh2oUUhIm85tfab8MgIoOLpmv6wde2YF9/ioL008RNGVv6XBiYQcTZCk
         LXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=IeGVP/PzjX6GEC4OpuxzmsnoF97NjtiO1q5gl5FI7JM=;
        b=jHstFP472sNIgzk1Ytv6TUKrvXiKB1Qir9qrWL/tqzCyJ1xHrVFtAGdUWR0AmY+TEe
         81Z487mOIO6/ezQuGZoessTXX6icmzUHYr8Ufbmg0q/tho0qXrFry5Ku91CxW33aILpA
         XQ19ZLiAa3caVIMuwNFtcs8X7QGIHzoebLAmcaQG0jJy4OnN2XAUJHS3FyiA+sRFExyW
         ZbF5+5WSEPsdprUOtklGJzoH+uk7U5W2dvvi0F1akNUO6q4c1GLKl3gBwpM9TzlAy9gw
         xsAalYlJyaWv7XRg73a5bxyzAblJN+0EQpWnNHKm/6e/ZsqyK+tZoMtInWHXjoQoDRpY
         rwpQ==
X-Gm-Message-State: AOAM5336VKMqEJ6wtse8x95RJdUIhuFlS3OaUC15RgafTUrMOdLc5k3M
        mHotoW5cvCVw/HVm35e5pRsNfbCmf/8gVejwy1pefg==
X-Google-Smtp-Source: ABdhPJyDkrllAUM3Z9CoS08VWD4PK+KcujTjeuckyHwwKe2amTgMFl/G7Y6MSZS1ns7a0NGYjS4Ke/AhIpMOrGHMj1c=
X-Received: by 2002:ac2:46ed:: with SMTP id q13mr345430lfo.543.1619129537835;
 Thu, 22 Apr 2021 15:12:17 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 22 Apr 2021 15:12:05 -0700
Message-ID: <CAKwvOdngSxXGYAykAbC=GLE_uWGap220=k1zOSxe1ntuC=0wjA@mail.gmail.com>
Subject: ARCH=hexagon unsupported?
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-hexagon@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Brian Cain <bcain@codeaurora.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Arnd,
No one can build ARCH=hexagon and
https://github.com/ClangBuiltLinux/linux/issues/759 has been open for
2 years.

Trying to build
$ ARCH=hexagon CROSS_COMPILE=hexagon-linux-gnu make LLVM=1 LLVM_IAS=1 -j71

shows numerous issues, the latest of which
commit 8320514c91bea ("hexagon: switch to ->regset_get()")
has a very obvious typo which misspells the `struct` keyword and has
been in the tree for almost 1 year.

Why is arch/hexagon/ in the tree if no one can build it?
-- 
Thanks,
~Nick Desaulniers
