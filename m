Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94DAFE75A6
	for <lists+linux-hexagon@lfdr.de>; Mon, 28 Oct 2019 16:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731636AbfJ1P5b (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 28 Oct 2019 11:57:31 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:34017 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731549AbfJ1P5b (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 28 Oct 2019 11:57:31 -0400
Received: by mail-pg1-f201.google.com with SMTP id w9so1004361pgl.1
        for <linux-hexagon@vger.kernel.org>; Mon, 28 Oct 2019 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=vl1oAr7RM/zca7FwT/vXMjuwpEGjQxC9D0ySoZ6dSQg=;
        b=rwx1pjEeHweipdLqJFc0f5AUWZAt8f6HXKzgo85WscfDfpxJvb0YoHuhVcrwDm/Y2K
         +j9mtodjaOIEYD8wniTDB2wvsC67omtrPVrl+aass6UblAf/IrU0nPkok+Y/zg4LYLWp
         9A+UQLVPy7bHJBX8av35/sm9p+KV+5GMkLv70djWsjb00967Q9Qs1y7jyblGPK2+h3mh
         o2DYex0fmo7JSQn5aOlfvOiKm8EAOoaT6HFrbMKPssgQbz5uUOP+4IsJ3eDKyUUiwlHf
         oCkBDsYEROwNTcs5tUAd5qatUOz92rhtqKg3UAI1IVzpdOdd3w60mCa0kPsIhyzMEQOX
         4ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=vl1oAr7RM/zca7FwT/vXMjuwpEGjQxC9D0ySoZ6dSQg=;
        b=rRO8XyyqubVJRIP73j5wJ9n0WPBjdkVt/zeoHX+aSHuxqEvgt9FoE5pmqGF4741Ry/
         7Usfh5NIf+XrEsSeJnnF1dDg4TFyATKRHxdQO8AMRsCXS5ibsWn9V9iuAfGuA2kGuGqk
         oN23nAOu3PJyMIYyeLOcGGWNJzOdcSzklXelrnWhwQeNy8ONLfcsPIPqcgtctW1lBIvM
         WlQR+v1xpErgJBPdK4obiUpjfVuwdO5CPhw0gjeX+5mNJowng33+k1SWJRnZzKsBQytD
         i4QNsWyimWSHlSWvV51dG8HM8jtzx2ssx7iPbJOxrtp8/my9atMcPK3xiesvJm6ElZF6
         03dw==
X-Gm-Message-State: APjAAAW0nWLms5RXk8Mi7qD6x8ECr5UPr2zu7Sdn5lcobuyfvhZLkm2J
        Cb1NHrD6nSp9AFdfmLzletBM3u2ITjnqVYFsjBk=
X-Google-Smtp-Source: APXvYqyACCtE23M53x7JIppCj6n56w5xm+Bre24NDBG6Yh3Xzq93jVDklOc8ZlKnuEOUwwg24ZyZ+c7vs/ZnU6fPlZ0=
X-Received: by 2002:a63:9a09:: with SMTP id o9mr21533674pge.276.1572278250647;
 Mon, 28 Oct 2019 08:57:30 -0700 (PDT)
Date:   Mon, 28 Oct 2019 08:57:21 -0700
Message-Id: <20191028155722.23419-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
Subject: [PATCH] hexagon: work around compiler crash
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     bcain@codeaurora.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Sid Manning <sidneym@quicinc.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Clang cannot translate the string "r30" into a valid register yet.

Link: https://github.com/ClangBuiltLinux/linux/issues/755
Suggested-by: Sid Manning <sidneym@quicinc.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/hexagon/kernel/stacktrace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/hexagon/kernel/stacktrace.c b/arch/hexagon/kernel/stacktrace.c
index 35f29423fda8..5ed02f699479 100644
--- a/arch/hexagon/kernel/stacktrace.c
+++ b/arch/hexagon/kernel/stacktrace.c
@@ -11,8 +11,6 @@
 #include <linux/thread_info.h>
 #include <linux/module.h>
 
-register unsigned long current_frame_pointer asm("r30");
-
 struct stackframe {
 	unsigned long fp;
 	unsigned long rets;
@@ -30,7 +28,7 @@ void save_stack_trace(struct stack_trace *trace)
 
 	low = (unsigned long)task_stack_page(current);
 	high = low + THREAD_SIZE;
-	fp = current_frame_pointer;
+	fp = (unsigned long)__builtin_frame_address(0);
 
 	while (fp >= low && fp <= (high - sizeof(*frame))) {
 		frame = (struct stackframe *)fp;
-- 
2.24.0.rc0.303.g954a862665-goog

