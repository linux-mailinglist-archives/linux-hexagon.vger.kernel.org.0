Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88059117955
	for <lists+linux-hexagon@lfdr.de>; Mon,  9 Dec 2019 23:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfLIWaV (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 9 Dec 2019 17:30:21 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:43522 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfLIWaV (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 9 Dec 2019 17:30:21 -0500
Received: by mail-pg1-f202.google.com with SMTP id d9so9410696pgd.10
        for <linux-hexagon@vger.kernel.org>; Mon, 09 Dec 2019 14:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=t/1UStflpkba+9ZUNaSHKODK6B51M8rcDxieTuoYA4M=;
        b=gm9HwVK6fxD5suhOgCk7Tqmkef4vDSdqxt5K56QTUcNLFn1QZxRucbsJCBO5HXWsIJ
         sXBCidhNZIdgVhpJ4q9N208byXFqFjIenM5TCJoAty96z/QTJxUfLcshXlCan1Kmix4s
         O0LahjEnCOuKXPGayOFyTifTWvtYWP9dMXGZC/QiO+foAjPrABjJ2dktvJfTC0CsZmYG
         ZJy7Ha9i6tHEx13CClFg5S01ki+Kamb6Ruso+dGhqEZhJ1Yc/r1lppNmuGUnXNq8bddm
         ERMeXa8CH6HC4wcnpE1ppR7i5xJCgdRqPxOzcEDt922796CspxnpGDklNHqLfk4psCci
         6Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=t/1UStflpkba+9ZUNaSHKODK6B51M8rcDxieTuoYA4M=;
        b=pMV89rtn1ThYL1WXMKdY+TjHDK6I9f583zulrdSI4lxlv0dy/DB3G0zWp/F4tyrXRm
         jyUsmn0a1m9wYoHWHtwPFjnZhQoS032QhBvI3u8ptaWgue3cVCVnHMZgFj2BXA5XU4uU
         D87dfZlY8et8rnXH9INcJ8diD5zpkQXs0krCKuDV0nUVjhL++V+3NEXsRnwoXhrfkFbF
         iVmLd5yfUBqANup5M+mmp+ZpOd+DecgUBtLeCWzB090Yqf2ScfLhvHTyuWsc9cG8pDAf
         n57/W30h2Vl3cprJOIS8xNSMSzl0sqLxIwsqSdY2QUzRjytM631XsqVKvgF5jezGxjPH
         6quA==
X-Gm-Message-State: APjAAAV3HcHO+bXZoEjIi8H3aTkBe1gdelodT5P/lMEZat1LA1j7NcHL
        Y9y1sa9QnAxt2BgTvDQfi1oNhyoYGLUfT+3BTHA=
X-Google-Smtp-Source: APXvYqz/+vR/BO/XifTVHhuPFPKeRt5GgaHVo9pcQI3oSQy6uBUApzEgwqvvb36SYEnZAbt0EykOuPNLfVH7ZRRcZmQ=
X-Received: by 2002:a63:4f5c:: with SMTP id p28mr20715986pgl.409.1575930620462;
 Mon, 09 Dec 2019 14:30:20 -0800 (PST)
Date:   Mon,  9 Dec 2019 14:29:54 -0800
Message-Id: <20191209222956.239798-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
Subject: [PATCH 0/2] Hexagon fixes
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     bcain@codeaurora.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>, lee.jones@linaro.org,
        andriy.shevchenko@linux.intel.com, ztuowen@gmail.com,
        mika.westerberg@linux.intel.com, mcgrof@kernel.org,
        gregkh@linuxfoundation.org, alexios.zavras@intel.com,
        allison@lohutok.net, will@kernel.org, rfontana@redhat.com,
        tglx@linutronix.de, peterz@infradead.org, boqun.feng@gmail.com,
        mingo@redhat.com, akpm@linux-foundation.org, geert@linux-m68k.org,
        linux-hexagon@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Fixes 2 warnings when trying to build hexagon with Clang:
$ ARCH=hexagon CROSS_COMPILE=hexagon-linux-gnu- make -j71 \
  CC=clang AS=clang LD=ld.lld AR=llvm-ar

Fixes -Winline-asm and -Wimplicit-function-definition.

Nick Desaulniers (2):
  hexagon: define ioremap_uc
  hexagon: parenthesize registers in asm predicates

 arch/hexagon/include/asm/atomic.h   |  8 ++++----
 arch/hexagon/include/asm/bitops.h   |  8 ++++----
 arch/hexagon/include/asm/cmpxchg.h  |  2 +-
 arch/hexagon/include/asm/futex.h    |  6 +++---
 arch/hexagon/include/asm/io.h       |  1 +
 arch/hexagon/include/asm/spinlock.h | 20 ++++++++++----------
 arch/hexagon/kernel/vm_entry.S      |  2 +-
 7 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.24.0.393.g34dc348eaf-goog

