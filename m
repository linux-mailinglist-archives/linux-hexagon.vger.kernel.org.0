Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7E120FDF5
	for <lists+linux-hexagon@lfdr.de>; Tue, 30 Jun 2020 22:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730134AbgF3Upa (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 30 Jun 2020 16:45:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30024 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730114AbgF3Up2 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 30 Jun 2020 16:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593549926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0oSiaS0i/TrG3B4WZW/K39VImBtqNKePW8X1XXaS114=;
        b=PTcb8VCOlgCDHBpzS41F6ZA2tnwsdq7D+KRtffXAmpbjcY4Z07+uuQysYUvbkPON0vLL2B
        hhtaRRjv67EiguIwO/sPQbl9uKk79XHn+i15HETFRcXpKVYpy0JdNjiTHW+OkBflgwRrcF
        H5nSa3HQC3tqBqqiknsWmTcrVO6x594=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-O9QEj8aZPeSXVbkZUnJFLQ-1; Tue, 30 Jun 2020 16:45:24 -0400
X-MC-Unique: O9QEj8aZPeSXVbkZUnJFLQ-1
Received: by mail-qv1-f70.google.com with SMTP id m18so1555344qvt.8
        for <linux-hexagon@vger.kernel.org>; Tue, 30 Jun 2020 13:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0oSiaS0i/TrG3B4WZW/K39VImBtqNKePW8X1XXaS114=;
        b=oTH4hrZAKqDLzC4biR1ZNI1b0LYvVc3a5pQ4xEvg5B8Rdmqj4qsko1kCRbcMuV1cML
         8mSYtnjhlJ0C6po0FAJQxw9Vx9VEYpSzuosNxNlEcZJfKRa5XdwhJrAym/WvLKhsdLFZ
         AyujgzSDRU4bbQ6nJ9cEMQBcXYZV2XC53rRCWB/V3t7K5OaCGWDXb5tvzYFAViYMdWrJ
         SNktFMpA8JLYSekaDbqNpZErVzvVcRdMoLVY64MIp1B/njNmgqnBrsaE2/oUrH5VLGhB
         f2JnCRA1/+NoXz+2pYVzMbPuDRHUJLI2E+NkYllF5xi8fU931Af09N2tfY2Q97ShvYWG
         Inkw==
X-Gm-Message-State: AOAM531bxooUTiEQf95h6GVUhjmKnoEQ6ig805xzb+JkDWiCsAp13a1A
        J0rZOOkXfEUkdEIi+n2znmvuwSg80dvd4JM4BxBUD8W8KongitBI0hCWo36WNG0mq1unR8K0vrb
        S/TBdelQ7SjquAoVelOuWGA4+cQ==
X-Received: by 2002:ae9:ef4f:: with SMTP id d76mr21557579qkg.423.1593549924292;
        Tue, 30 Jun 2020 13:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiCIZOd0SFhyDP1RMP34PE1DDliFCmZMFzYzAiXHV+Itj+3kk75rVqggZCe39IF1oIv79/dg==
X-Received: by 2002:ae9:ef4f:: with SMTP id d76mr21557403qkg.423.1593549922268;
        Tue, 30 Jun 2020 13:45:22 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id s71sm4176169qke.0.2020.06.30.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:45:21 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org
Subject: [PATCH v4 07/26] mm/hexagon: Use general page fault accounting
Date:   Tue, 30 Jun 2020 16:45:19 -0400
Message-Id: <20200630204519.38809-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

Add the missing PERF_COUNT_SW_PAGE_FAULTS perf events too.  Note, the other two
perf events (PERF_COUNT_SW_PAGE_FAULTS_[MAJ|MIN]) were done in handle_mm_fault().

CC: Brian Cain <bcain@codeaurora.org>
CC: linux-hexagon@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/hexagon/mm/vm_fault.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/hexagon/mm/vm_fault.c b/arch/hexagon/mm/vm_fault.c
index f12f330e7946..ef32c5a84ff3 100644
--- a/arch/hexagon/mm/vm_fault.c
+++ b/arch/hexagon/mm/vm_fault.c
@@ -18,6 +18,7 @@
 #include <linux/signal.h>
 #include <linux/extable.h>
 #include <linux/hardirq.h>
+#include <linux/perf_event.h>
 
 /*
  * Decode of hardware exception sends us to one of several
@@ -53,6 +54,8 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma(mm, address);
@@ -88,7 +91,7 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 		break;
 	}
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -96,10 +99,6 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 	/* The most common case -- we are done. */
 	if (likely(!(fault & VM_FAULT_ERROR))) {
 		if (flags & FAULT_FLAG_ALLOW_RETRY) {
-			if (fault & VM_FAULT_MAJOR)
-				current->maj_flt++;
-			else
-				current->min_flt++;
 			if (fault & VM_FAULT_RETRY) {
 				flags |= FAULT_FLAG_TRIED;
 				goto retry;
-- 
2.26.2

