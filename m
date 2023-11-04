Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B542D7E0E94
	for <lists+linux-hexagon@lfdr.de>; Sat,  4 Nov 2023 10:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbjKDJRY (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 4 Nov 2023 05:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjKDJRR (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 4 Nov 2023 05:17:17 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E481AD53
        for <linux-hexagon@vger.kernel.org>; Sat,  4 Nov 2023 02:16:48 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc921a4632so20788125ad.1
        for <linux-hexagon@vger.kernel.org>; Sat, 04 Nov 2023 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699089408; x=1699694208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u81VqdenU6rFeGWkxk+k7NmV751uBEWgkJJ/j9Mn6BA=;
        b=iXZFWWqpaH4lrEjLLgW4xKnBoKhtVmWVQ6o192cCZsu/A2WluT+/ABCn+FH76UY9wb
         mFug182r1PZt5hqvYxYgHaDoWHWl+nZODIOs1iUxm4mFRK5Yw2fQlVPpesAool2Pb9oO
         cHYSJnr1t8t05HRzYt5Z6Y6rHJ8L+clIozV5ooPGIvnqOUzCcwDMFR9iurKTHioFouyi
         Hb2HDSwecBtNY705+VUJWX4n5NU3AvBuoZbHslPdjyJTs93/nMSwwvwjEAhPD2ldY2oE
         gMrElQcY49bYFh8CoVy0aot1xFBZlMXzDoRAP5K0kLIwy5ryavHTJq6LmA2Fl2CW8NoT
         nVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089408; x=1699694208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u81VqdenU6rFeGWkxk+k7NmV751uBEWgkJJ/j9Mn6BA=;
        b=MwNgjPlhkj7HJYiEe9H0p5T1BVw2JVuVsgb/p8kkrNGf436zZAXddH/t0M8/Ig4nXV
         JvFXIdGnqdJ97Zait0wSCTaYNUYw5PYecRWnYfEwIlrfoiEALZOWqRJu5toHmpGQDhDS
         LDVvZS7inS2ggHcjJFXI4Sq5HeUohIyG3IFc7D/foL/CpVAF+hOMlxJnrjhwDQykuqWn
         e6kearGktqF+TpfXwJaSJwOCCsNAYa7tTctMk2Oh6tSOpSI+j9kZ+aMIdsg3vQAzPMZT
         D8AuUq1KHLW37FpLPCXWFeLOakUCOWRa/Ks0MAMzSGRcZKocySswshKCTSY23/+70qez
         J6jw==
X-Gm-Message-State: AOJu0YwBATVhuHTTSTKhh2nzKdLyN5UauV6DsUOSu+fsGwz6EiijSZeM
        KfGcQVWK/O51ebRAkQ+RR2Xy+Q==
X-Google-Smtp-Source: AGHT+IGyFGHSId75XF/2M3hYNYvMSIwS/0Bo7S7DMpr1Hxge/taB1vX6bB3CXc+D3ltngIbF+e1EcA==
X-Received: by 2002:a17:902:ea0d:b0:1cc:4f55:db72 with SMTP id s13-20020a170902ea0d00b001cc4f55db72mr20756805plg.0.1699089408468;
        Sat, 04 Nov 2023 02:16:48 -0700 (PDT)
Received: from devz1.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc54202429sm2585127plh.288.2023.11.04.02.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:16:48 -0700 (PDT)
From:   "wuqiang.matt" <wuqiang.matt@bytedance.com>
To:     vgupta@kernel.org, bcain@quicinc.com, jonas@southpole.se,
        stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
        geert@linux-m68k.org, andi.shyti@linux.intel.com, mingo@kernel.org,
        palmer@rivosinc.com, andrzej.hajda@intel.com, arnd@arndb.de,
        peterz@infradead.orgm, mhiramat@kernel.org
Cc:     linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, mattwu@163.com,
        linux@roeck-us.ne, "wuqiang.matt" <wuqiang.matt@bytedance.com>
Subject: [PATCH v2 3/4] locking/atomic: openrisc: arch_cmpxchg[64]_local undefined
Date:   Sat,  4 Nov 2023 17:16:14 +0800
Message-Id: <20231104091615.4884-4-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

For architectures that support native cmpxchg, we'd like to
implement arch_cmpxchg[64]_local with the native variants of
supported data size. If not, the generci_cmpxchg[64]_local
will be used.

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
---
 arch/openrisc/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
index 8ee151c072e4..f1ffe8b6f5ef 100644
--- a/arch/openrisc/include/asm/cmpxchg.h
+++ b/arch/openrisc/include/asm/cmpxchg.h
@@ -139,6 +139,12 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 					       (unsigned long)(n),	\
 					       sizeof(*(ptr)));		\
 	})
+#define arch_cmpxchg_local arch_cmpxchg
+
+/* always make arch_cmpxchg64_local available for openrisc */
+#include <asm-generic/cmpxchg-local.h>
+
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
 
 /*
  * This function doesn't exist, so you'll get a linker error if
-- 
2.40.1

