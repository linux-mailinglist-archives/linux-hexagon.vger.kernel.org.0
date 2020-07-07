Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBED4217B62
	for <lists+linux-hexagon@lfdr.de>; Wed,  8 Jul 2020 00:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgGGWv6 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 7 Jul 2020 18:51:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30977 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729572AbgGGWuj (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 7 Jul 2020 18:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594162238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+4zIYRHOACURUfy9t13d60Z4Yb5Zt+j+VbtnlH1sD2o=;
        b=BTg7Tj5fsYvk1DAKcyFIK0dRGwIKCyrigCi+dW6L13rnrI5kuwVbqgM9GaqTu9luUJTHOz
        xZ99kZ1IkVZbqBnDJFkx7+coQWkJ2CwLzPN6LRO2FemT1J63fvy/M80XNLS5EOuQxqW0rn
        IwcKegNOj5/7VDTfg8ILJ18hLLXCRGk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-zLf-8am3P1mMTUNUMO9jCA-1; Tue, 07 Jul 2020 18:50:36 -0400
X-MC-Unique: zLf-8am3P1mMTUNUMO9jCA-1
Received: by mail-qt1-f199.google.com with SMTP id e4so31851942qtd.13
        for <linux-hexagon@vger.kernel.org>; Tue, 07 Jul 2020 15:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+4zIYRHOACURUfy9t13d60Z4Yb5Zt+j+VbtnlH1sD2o=;
        b=S5pYAbwHxxeRSCDgQmFJFKK6ASlNj8JHQKdjAXlRYVwjxNliPUXzK1uraSsIVbAv2h
         Pwh1p79ecfVZ1HeqDPvRZrLGocGh9KMPOZDWdQudKt1rM9xy7QqlMGhVCHiReM4Km4gk
         M1FffvsKZ730hR9F3Lcqlc4Sg5R7fcjqABrsQbB+uqoQZ/DbnJUHtCx6XVfGpYksfr9k
         wNVUxsXL5Nie1CCA9UEACxDD9xzX4r5ienOSoudlPhSxflwdvTOvZ+g/AQ2ohli4V1ct
         tQrYhjQ5eJ0gBoPi8M+/vsHhn/6OT7SNHK349ChkiwmX3tGiA1qF1I7nAYoXHPAx4v4a
         5iGA==
X-Gm-Message-State: AOAM5338pOIC6+1/8K8mdYzwYF3/DdO5eWg/m0dY0qo3j1PmFCP6jHwO
        NrLcIYj0B2wXUzAG3DhrSclLL4sWUCRAUlD+9fZI9KSohOvJ6yksIoV2EvbHkHG2QpfQhSdLeJi
        Be1io9OLG8P8JS69oX5O8qntGmg==
X-Received: by 2002:a05:620a:121a:: with SMTP id u26mr53672522qkj.398.1594162236049;
        Tue, 07 Jul 2020 15:50:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzluayj3u4Yocf5HHLjWUxuZvg566IRp972A3KvRd3pkGDQoJgxfIqJJmQTZ0tYxp6Eo8C2mQ==
X-Received: by 2002:a05:620a:121a:: with SMTP id u26mr53672502qkj.398.1594162235782;
        Tue, 07 Jul 2020 15:50:35 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:50:35 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        peterx@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org
Subject: [PATCH v5 07/25] mm/hexagon: Use general page fault accounting
Date:   Tue,  7 Jul 2020 18:50:03 -0400
Message-Id: <20200707225021.200906-8-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
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
Acked-by: Brian Cain <bcain@codeaurora.org>
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

