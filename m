Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD00620BC88
	for <lists+linux-hexagon@lfdr.de>; Sat, 27 Jun 2020 00:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFZWbt (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 26 Jun 2020 18:31:49 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36149 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726079AbgFZWbt (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 26 Jun 2020 18:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SagB2x6xDXMHuNfH0nszNoiVH7/+fXWLgMfhv8WOo7E=;
        b=ITTHlah05ti68Dmea6pvbfrSpIyEqzFahnBKVvy6CbARQBX702+qlXM452R7OJi0lUrfLB
        LMNhZpSZjw6ksyON/bkLo4nVq5xuwmxAjo0PudQ42gU0z8IF4D/iB8M+HRlKR7U3EdWcPd
        3PArpMvMASFxqP5vdS5GGGru6Qr7hOc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-lZQWw4J2NeO_ym6hn7iYJQ-1; Fri, 26 Jun 2020 18:31:44 -0400
X-MC-Unique: lZQWw4J2NeO_ym6hn7iYJQ-1
Received: by mail-qt1-f199.google.com with SMTP id y5so7504524qto.10
        for <linux-hexagon@vger.kernel.org>; Fri, 26 Jun 2020 15:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SagB2x6xDXMHuNfH0nszNoiVH7/+fXWLgMfhv8WOo7E=;
        b=Hb1ehJV0cotrnxLb0mWiLJ5ZbUyTbnXxgmM2kceJNqCuQhfSLHFotgt5I+Ev2Xs8yh
         gsDJey7Qx4ReF0DpIvFjUoriLwccUW2/dhgO3IymlX8Vi+d08N/jnHvPiLNEplBxXmg3
         DUlJX+h2hBlleWU6qaU4Lh2zsGntTlxO+SKW2ib1YfZGWwNlR5UspB/SRibw1l53xhmf
         rsFdqVnSaQd3d+kOmD/nxWvB+pENZtLaSYo6wlHHilkgazYMh7tZUfJc0+0G+Vdb2r0/
         bdmdtv3E1baWS9YCdOf+OrvKR+icYWObIpk5ihXhM13KU2wQeLPh2F04SIoUZoUXFGut
         zozw==
X-Gm-Message-State: AOAM530F0RHjFdPGbWWcLE2gh9uAGLQuGFhIOTb+5aANTs3B0kGPFmzN
        KfNwy+kw3sKmVc/BjgkLJ3j0ukaOrCQOhhsr+Xib3UyGxT7Id6rgH5fvJQtJtPJkNkTDRz2RInx
        UViY4Du4roPkU5/fhRA95QZW6IA==
X-Received: by 2002:ac8:382b:: with SMTP id q40mr5158473qtb.11.1593210703553;
        Fri, 26 Jun 2020 15:31:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+3FP1V/Ad++bjiADIsOLnYLtWDzv+gtA2qG8ikbYulDNDze8olEwJ20DxbWqD1R+2IL+N9g==
X-Received: by 2002:ac8:382b:: with SMTP id q40mr5158456qtb.11.1593210703343;
        Fri, 26 Jun 2020 15:31:43 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id f203sm9903311qke.135.2020.06.26.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:31:42 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>, peterx@redhat.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org
Subject: [PATCH 07/26] mm/hexagon: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:31:11 -0400
Message-Id: <20200626223130.199227-8-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
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

