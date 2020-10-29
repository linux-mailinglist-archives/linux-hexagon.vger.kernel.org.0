Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC38529F0E5
	for <lists+linux-hexagon@lfdr.de>; Thu, 29 Oct 2020 17:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgJ2QO2 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 29 Oct 2020 12:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgJ2QO1 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 29 Oct 2020 12:14:27 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF80C0613CF
        for <linux-hexagon@vger.kernel.org>; Thu, 29 Oct 2020 09:14:27 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id k21so4078479ioa.9
        for <linux-hexagon@vger.kernel.org>; Thu, 29 Oct 2020 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=7mALKINqLYfxoHF1hVcRnp1bQETJW6jJOL3z9Zr8PKs=;
        b=hca5CQJiOZP4j5J9BnMNfZ9z2agIBD5RRjb+hkDEmn++g0ECZqM5kBLegGfJpDpepu
         MGEAOPdbRL8N4qyZBU7BUk6pUI33gM2jBkEW+seCS9s8bB8ooS6Rd+Rqm/iuPnv23zSo
         rllWi1d6V9WSOA/imzBcoMXhpdpRNA59wPL6WW99lDQ/IY+LdSCGw0y6820Ewx50i8Zt
         Vlz9yx+aL24clO+OGrxIa/50LBcDd+s4Nz5i35aNuV+lPiPu90/tRHtJ9yNvu9CflKWM
         DsKvm2Iwu9fRbtPPyax4lX3joJ3dmo562xzBN7fwuB0+sjey8OrC13101u5UTAbuVHO0
         QCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=7mALKINqLYfxoHF1hVcRnp1bQETJW6jJOL3z9Zr8PKs=;
        b=Convpe44qZY+LzIMX50UEOy08lo7ZvDtht6oiTXGUDQRqRFGHUZEu/2fsldnZT0gIh
         kZ0+YQKbkNVNCipqPH4EhQYg8N8dUJuB5v2Ow5x9jOda2QM6JG8mzxfHhsT8/X1BvzZH
         PBWIAcczlpru9JQsMT5zoJsQlwWuYYyxdXt2uReETVcZ1Oh2/mrdGyBf3GGWJE4HU7VQ
         6NsmtyK5ustbEsOfmV6h7NpaGe4OAPs3M7XfGm4HkRnu6mE5/Ir3JqBWD0C/A5Oc8GeK
         YnOmI5tZC3SuUbu7FEu6Wg913R7PLw7KZnC65lOhFszFmGB++ZZG0nXubZD11VYZVD1y
         Bfng==
X-Gm-Message-State: AOAM5328/zFATZBM5TNEzLjZgTZA9hq2BphvOP3h3bz1rGzPLWTz4Cuh
        3rCJ3+5VL7KmT62aOuuKXTQzUsR3xcYmWA==
X-Google-Smtp-Source: ABdhPJxM5rGcmQ3NzHih5fBqfw3W/8CE20rjTl/EcV/u8Xzf2OLKOKouQDV6alinWLXhCWGV3i4cVg==
X-Received: by 2002:a6b:920b:: with SMTP id u11mr4058829iod.191.1603988066613;
        Thu, 29 Oct 2020 09:14:26 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id m15sm2751592ila.32.2020.10.29.09.14.26
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:14:26 -0700 (PDT)
To:     linux-hexagon@vger.kernel.org
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
Message-ID: <249d67ab-c3ea-0802-c06a-0f35ae3673d2@kernel.dk>
Date:   Thu, 29 Oct 2020 10:14:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for hexagon.

Cc: linux-hexagon@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/hexagon/include/asm/thread_info.h | 2 ++
 arch/hexagon/kernel/process.c          | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/hexagon/include/asm/thread_info.h b/arch/hexagon/include/asm/thread_info.h
index 563da1986464..535976665bf0 100644
--- a/arch/hexagon/include/asm/thread_info.h
+++ b/arch/hexagon/include/asm/thread_info.h
@@ -95,6 +95,7 @@ register struct thread_info *__current_thread_info asm(QUOTED_THREADINFO_REG);
 #define TIF_NEED_RESCHED        3       /* rescheduling necessary */
 #define TIF_SINGLESTEP          4       /* restore ss @ return to usr mode */
 #define TIF_RESTORE_SIGMASK     6       /* restore sig mask in do_signal() */
+#define TIF_NOTIFY_SIGNAL	7       /* signal notifications exist */
 /* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_MEMDIE              17      /* OOM killer killed process */
 
@@ -103,6 +104,7 @@ register struct thread_info *__current_thread_info asm(QUOTED_THREADINFO_REG);
 #define _TIF_SIGPENDING         (1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED       (1 << TIF_NEED_RESCHED)
 #define _TIF_SINGLESTEP         (1 << TIF_SINGLESTEP)
+#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 
 /* work to do on interrupt/exception return - All but TIF_SYSCALL_TRACE */
 #define _TIF_WORK_MASK          (0x0000FFFF & ~_TIF_SYSCALL_TRACE)
diff --git a/arch/hexagon/kernel/process.c b/arch/hexagon/kernel/process.c
index 5a0a95d93ddb..82cd7a026eb3 100644
--- a/arch/hexagon/kernel/process.c
+++ b/arch/hexagon/kernel/process.c
@@ -174,7 +174,7 @@ int do_work_pending(struct pt_regs *regs, u32 thread_info_flags)
 		return 1;
 	}
 
-	if (thread_info_flags & _TIF_SIGPENDING) {
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
 		do_signal(regs);
 		return 1;
 	}
-- 
2.29.0

-- 
Jens Axboe

