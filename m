Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB86117957
	for <lists+linux-hexagon@lfdr.de>; Mon,  9 Dec 2019 23:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbfLIWad (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 9 Dec 2019 17:30:33 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:53603 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfLIWad (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 9 Dec 2019 17:30:33 -0500
Received: by mail-pf1-f201.google.com with SMTP id x26so10079379pfa.20
        for <linux-hexagon@vger.kernel.org>; Mon, 09 Dec 2019 14:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bQkMIXCQ6JhHHUfx0puV3Z6acwFjFfU42F7sTftKhD4=;
        b=N8rz3xkqm7uAha+HtqB5j32nTJonEkwcr0XJOzEadMjCIWHfCiKEvNoh98J/2Lq+gR
         Qi17CEKhCgxFtsRUXWRHclvtpbbcrY4TxbZJDRMcjWraSjLzsoSP7DrsHqGz/TudjqIj
         UP1GwdMnaHjBkXi/VGiETx5OOEb1iFHm4BlYMLlRjYvU3viRWC7pDR3Dj54tKtUqG9ZX
         h2PU1JYaxkUse4+qwLV/Ud0ihdxHkdmpiv/DQx/qoy62/RX3V+cHNtKfKTy/vRYv3qWj
         bmhvuupaMh0Jq5B3R8vXCZJATE9KwbXY7ImF4QzuY3/uXSY9TJOnloJ9Byefe1yNMUaX
         mftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bQkMIXCQ6JhHHUfx0puV3Z6acwFjFfU42F7sTftKhD4=;
        b=HG2nB3TdP9BMmpp2YUyqGsVhVXmfZ5c3NCPOTQuR4LGiYiYDepP0yHBKlPLBQxuXON
         is3RAB884bpYPDW7QzKO6Dofa03FVg6QE1ITubP5Cgt7MuyOSiOhd7r9cRhG2c3i/YN3
         fEA0qFtBbF8APZVH1ihXwwg6udNtOZY1yui082s1hoH7dSGgMZOU1sj+zzCQ2DyxXShE
         P0hjfgI1CjZPz7RGARWuevA1OoQzwl4WfzZovpwKxokBHbCP5UWh6mGI/7Nv72pSIOPj
         Rsx598nYlc4lN8mVGWW7fqnIcD8INytKt57Zd463KLmUmPuGsUhvVbiicCMdJe2W8wVV
         2Qkw==
X-Gm-Message-State: APjAAAVcOi4k9iaGuj81OaXViX5Q1yMXIDMp7zNzYU9BtPmb6del1TP+
        a+HKbJxZyLkwUPeW34oe0OGncx7iWimChzn6avM=
X-Google-Smtp-Source: APXvYqy9Ns8aRyuf51iARYH3cT5wQMtg+MI6dsH5JvrDtiw0Yzf8pOxzCGtsSpTnLbgw5D3otU+GAZuaxkp1CTrW1rg=
X-Received: by 2002:a63:7d6:: with SMTP id 205mr21602122pgh.131.1575930631975;
 Mon, 09 Dec 2019 14:30:31 -0800 (PST)
Date:   Mon,  9 Dec 2019 14:29:55 -0800
In-Reply-To: <20191209222956.239798-1-ndesaulniers@google.com>
Message-Id: <20191209222956.239798-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20191209222956.239798-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
Subject: [PATCH 1/2] hexagon: define ioremap_uc
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
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Similar to
commit 38e45d81d14e ("sparc64: implement ioremap_uc")
define ioremap_uc for hexagon to avoid errors from
-Wimplicit-function-definition.

Fixes: e537654b7039 ("lib: devres: add a helper function for ioremap_uc")
Link: https://github.com/ClangBuiltLinux/linux/issues/797
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/hexagon/include/asm/io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/hexagon/include/asm/io.h b/arch/hexagon/include/asm/io.h
index 539e3efcf39c..b0dbc3473172 100644
--- a/arch/hexagon/include/asm/io.h
+++ b/arch/hexagon/include/asm/io.h
@@ -173,6 +173,7 @@ static inline void writel(u32 data, volatile void __iomem *addr)
 
 void __iomem *ioremap(unsigned long phys_addr, unsigned long size);
 #define ioremap_nocache ioremap
+#define ioremap_uc(X, Y) ioremap((X), (Y))
 
 
 #define __raw_writel writel
-- 
2.24.0.393.g34dc348eaf-goog

