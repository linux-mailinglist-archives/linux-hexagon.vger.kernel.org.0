Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7145A1FA34A
	for <lists+linux-hexagon@lfdr.de>; Tue, 16 Jun 2020 00:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgFOWQc (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 15 Jun 2020 18:16:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33370 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726540AbgFOWQ1 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 15 Jun 2020 18:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PRPudttfpR19+A+wbv6ggjFdv06B9VcI4/AzH9oClaw=;
        b=SXXwbGr7pA16+zx+tpZWg50fe/cmCam1jrappswwYhNVmM4EqK/lsYRCsDX8MHvBACXgR6
        mwZY+GesVNnq96Xk1u9cipX8w00tY0CpSDisDNwMfhLgFIn7kZgyaKO3CI17x63wn51P8P
        Ke7N3HFAD3UdyqSXlegAAC0cezMa2+M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179--tDtOB1gP0e79uzkjd0g3Q-1; Mon, 15 Jun 2020 18:16:24 -0400
X-MC-Unique: -tDtOB1gP0e79uzkjd0g3Q-1
Received: by mail-qk1-f199.google.com with SMTP id p138so15384353qke.7
        for <linux-hexagon@vger.kernel.org>; Mon, 15 Jun 2020 15:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PRPudttfpR19+A+wbv6ggjFdv06B9VcI4/AzH9oClaw=;
        b=CdGsEShsgKLmngPTPnoDEdRNcyGIVEjjDQ7nmUtQWAyN9oMHgYi6LcRX+1kiVe4+5U
         FA6vJTHkpUeshMRWewc4VGCXPp4BZMycAfeF3dNXKX+4RTVhroVaQpLPmYe3zJfLYRvc
         R324ZXba/bcr3TnYPdSyrTmNecqjt5MGFkZTcEsOLFUIbCVbNjhj0MYjxaD85mWu/Nng
         i3i3yWNvy9f/in/KywGjI12AXZgcRP98LVyFyK5G6KIKQy8Ozc4MUq0V5tuvXAFW3Vg+
         1haHOqTQqRRI/xRetcTfRb4VGGh5vO2TYaQ8SoTKxw0K32W7zZ7Vape+LxMMXZamphWO
         2wnA==
X-Gm-Message-State: AOAM530Wy7k4+80tjFg18+l9plOvIgRQM0F1M88N7d+U7Xfgn4U6fbap
        DneUrW8UYY0KXAIHyNTRUKHmKG3TLv+Sql6017bi/DmSfRdETKGVEP60bCc8yLcx1wgg51Sf1b+
        l/ykDTT+c4/hhD8KNd693KzIBMQ==
X-Received: by 2002:a37:aa87:: with SMTP id t129mr17645640qke.197.1592259383815;
        Mon, 15 Jun 2020 15:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVn9dsXg/pspHC4rWZesPTS5jGhgSsBUQJJibM3Od7vDH/8Bw78Arhr5f7epMon+09gUzkdw==
X-Received: by 2002:a37:aa87:: with SMTP id t129mr17645627qke.197.1592259383603;
        Mon, 15 Jun 2020 15:16:23 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:16:22 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org
Subject: [PATCH 08/25] mm/hexagon: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:15:50 -0400
Message-Id: <20200615221607.7764-9-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

The perf event accounting will be included too if possible.  Also, do the
accounting after releasing the mmap_sem.

CC: Brian Cain <bcain@codeaurora.org>
CC: linux-hexagon@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/hexagon/mm/vm_fault.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/hexagon/mm/vm_fault.c b/arch/hexagon/mm/vm_fault.c
index 72334b26317a..5fbccfce6083 100644
--- a/arch/hexagon/mm/vm_fault.c
+++ b/arch/hexagon/mm/vm_fault.c
@@ -39,7 +39,7 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 	struct mm_struct *mm = current->mm;
 	int si_signo;
 	int si_code = SEGV_MAPERR;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	const struct exception_table_entry *fixup;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
@@ -90,6 +90,7 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 	}
 
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -97,17 +98,13 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
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
 			}
 		}
-
 		up_read(&mm->mmap_sem);
+		mm_fault_accounting(current, regs, address, major);
 		return;
 	}
 
-- 
2.26.2

