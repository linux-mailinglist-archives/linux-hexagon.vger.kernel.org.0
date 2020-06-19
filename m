Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26022013F8
	for <lists+linux-hexagon@lfdr.de>; Fri, 19 Jun 2020 18:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394235AbgFSQGw (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 19 Jun 2020 12:06:52 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54645 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405543AbgFSQF5 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 19 Jun 2020 12:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592582756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SagB2x6xDXMHuNfH0nszNoiVH7/+fXWLgMfhv8WOo7E=;
        b=SXuQscfIp84Jam/3SNag7zZHTrGwnKri/xm+9Yk4bv7VuxQWefJbFQq4NZY2De8nCxOs6R
        1mXbMC6ZG3ckJuBNrVEiNUYsea5P6aOF4kG2MDm8bfcnqAku/gO6u2oh3RECEVxm3CVA9s
        FER3YW8QvV85Uw3gyq4cDyy2Z8+IJp4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-ryki6p4POCea9VPWqphaFQ-1; Fri, 19 Jun 2020 12:05:54 -0400
X-MC-Unique: ryki6p4POCea9VPWqphaFQ-1
Received: by mail-qt1-f200.google.com with SMTP id e8so7376720qtq.22
        for <linux-hexagon@vger.kernel.org>; Fri, 19 Jun 2020 09:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SagB2x6xDXMHuNfH0nszNoiVH7/+fXWLgMfhv8WOo7E=;
        b=lXnlT9W6v61giDbDPjmeNSeYsu92Sv3+XfTWSNHKO2WfIPD0mnw3i+uiM/myk6AMGG
         4AkkyeeaE+3tsQgvkccsPJz9e0joVdQmUlvHNcRegNDcc/rJr3xDrXbMxx6TiUH3Ry6k
         /nhbTqYE6evw4R/t2r1BFMxgomJzJWnoExQjoonFU3Hmy6m12RTfa0qoilyK4v4LUald
         ojY8hnwnjKVUAo3SGrehsCQQR7wj11oX3qwnRoHh6DjKzbqTgam6gHGrBMEcXor2FZdk
         8wRFI21c4We8Ar3ECvgz+UJLfLjW0rgiR4aHpM194fUUo6tU2ZLan1PVSy5jo/dpKFwj
         7oMA==
X-Gm-Message-State: AOAM531cMDU4ZlHxIGL9LgndtlCksWfoY5Q2lbuDh3BpBSFANvLpbDbJ
        aUDwBMTRaSmHIiSmb21xrtQIP75NQll7VUYBUEWhh+fL3i+uakq2JNllh8lzq1B/19r63cGmWhq
        R47wsy4VbTrWvGMakg5mHIG0tVQ==
X-Received: by 2002:a37:9e52:: with SMTP id h79mr3975290qke.467.1592582753476;
        Fri, 19 Jun 2020 09:05:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd2Ml6f1U4IsoXVUG+sGmbZtZswjvwyuO+DQ4aozpetfpM522QVCnolfKkgB3x792Y2yKCcA==
X-Received: by 2002:a37:9e52:: with SMTP id h79mr3975266qke.467.1592582753231;
        Fri, 19 Jun 2020 09:05:53 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id g11sm6412604qkk.123.2020.06.19.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 09:05:52 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>, peterx@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org
Subject: [PATCH 07/26] mm/hexagon: Use general page fault accounting
Date:   Fri, 19 Jun 2020 12:05:19 -0400
Message-Id: <20200619160538.8641-8-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
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
index f04cd0a6d905..1b1802f30862 100644
--- a/arch/hexagon/mm/vm_fault.c
+++ b/arch/hexagon/mm/vm_fault.c
@@ -19,6 +19,7 @@
 #include <linux/signal.h>
 #include <linux/extable.h>
 #include <linux/hardirq.h>
+#include <linux/perf_event.h>
 
 /*
  * Decode of hardware exception sends us to one of several
@@ -54,6 +55,8 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	down_read(&mm->mmap_sem);
 	vma = find_vma(mm, address);
@@ -89,7 +92,7 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 		break;
 	}
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -97,10 +100,6 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
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

