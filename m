Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D4D77441A
	for <lists+linux-hexagon@lfdr.de>; Tue,  8 Aug 2023 20:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbjHHSPP (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 8 Aug 2023 14:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbjHHSOt (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 8 Aug 2023 14:14:49 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14CA783DB
        for <linux-hexagon@vger.kernel.org>; Tue,  8 Aug 2023 10:21:09 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bf3f59905so862425666b.3
        for <linux-hexagon@vger.kernel.org>; Tue, 08 Aug 2023 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691515268; x=1692120068;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnlwcxtfhGEad5ogPgdtYB2fKyOwYUFZ/Ow51BWBgcE=;
        b=Gty5qz43cZIYHLVTOxYSJbZftHHI9VWyTnepI9JZUXIxmxGcPHkVG+15/o5KwCW/14
         Khe0N2zP6wMO2/ZLZVuozH3lUSxfVgznVMv4DMmd416wvcxB44HD/gWrFaY40hfvKOaS
         ixwX7qMn4+A8J5gR26URk5Z6udKWZHvTVCw1hRXSoNFbCqK5/Th37/vhSp7W8rKvPJwM
         Mp6wnIgD2ZBnJxNOnPRaexHYszi2hgaWUtjVW2+bXNQtnPx3YrFNbkWa48uiCvDqcb2y
         uxWymqhX8N8YSgBAVZoBFepMdf0ADm0cSIgTTCtBSwgur+pwfqCYIThUjwFBPdcW92XN
         bQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515268; x=1692120068;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnlwcxtfhGEad5ogPgdtYB2fKyOwYUFZ/Ow51BWBgcE=;
        b=QP6TXXOAlDT0MJtwgvA17geRLmBMqsZPwpBYAiK+oqs2B0aWIIclhYyXFyxLT3bctx
         naM1WqeQgxP5cMHFc/ssl0y2yr27pz2TYjsz2wTGs/53Xxj1k2gEFzDuY03NNFV1cG6j
         ysKzh0BPztFPjG++X4pGXi7ABBVk9yQKji9SueGwasSWC4JKia+qNriz52vBOjsjCt4W
         jUdcVOFA9Xg1oiMuZiMcNgLP2BRNujyQxsXEroEcqaZE/sDy8ZTz47vbYRxWFpB+aV8W
         GnT4Btvh+QLYZ/HhYnWm1OunlIQauG6Nv1R6ZYjSlPoaF7eA7s76mSOV7BP/QGm8wNiV
         8MBA==
X-Gm-Message-State: AOJu0Yw2sGTqFgFT2wljNXwwn/H+BzlPz6zu9HTAIBaNinVAG/BTeyeH
        nc3WAJ3Sg7/xTo4JntbqLphzvr/WBA7qobkCiYM=
X-Google-Smtp-Source: AGHT+IG08+K4wBxPEIGD3wJMEod/fuqoyu/0ciCUQGh7XBhB26YPREwYWqxpWTyDWfMPFr6cHTcd3A==
X-Received: by 2002:a05:6512:401b:b0:4f8:70b8:12b1 with SMTP id br27-20020a056512401b00b004f870b812b1mr8798540lfb.4.1691483376082;
        Tue, 08 Aug 2023 01:29:36 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id o10-20020ac2494a000000b004fb7388360esm1814337lfi.188.2023.08.08.01.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:29:35 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 10:29:34 +0200
Subject: [PATCH] Hexagon: Make pfn accessors statics inlines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-hexagon-virt-to-pfn-v1-1-68d07c221f17@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO380WQC/x3MQQqAIBBA0avIrBuwUoquEi0sR52NhkoE0d2Tl
 m/x/wOFMlOBRTyQ6eLCKTb0nYAjmOgJ2TbDIIdRznLGQLfxKeLFuWJNeLqISk+71b3Rk1LQyjO
 T4/u/rtv7flKBYIZlAAAA
To:     Brian Cain <bcain@quicinc.com>
Cc:     linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

For symmetry do the same with pfn_to_virt().

For compiletime resolution of __pa() we need PAGE_OFFSET which
was not available to __pa() and resolved by the preprocessor
wherever __pa() was used. Fix this by explicitly including
<asm/mem-layout.h> where required, following the pattern of the
architectures page.h file.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/hexagon/include/asm/page.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
index 9c03b9965f07..b3d4a2c065be 100644
--- a/arch/hexagon/include/asm/page.h
+++ b/arch/hexagon/include/asm/page.h
@@ -78,6 +78,9 @@ typedef struct page *pgtable_t;
 #define __pgd(x)       ((pgd_t) { (x) })
 #define __pgprot(x)    ((pgprot_t) { (x) })
 
+/* Needed for PAGE_OFFSET used in the macro right below */
+#include <asm/mem-layout.h>
+
 /*
  * We need a __pa and a __va routine for kernel space.
  * MIPS says they're only used during mem_init.
@@ -125,8 +128,16 @@ static inline void clear_page(void *page)
  */
 #define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
 
-#define virt_to_pfn(kaddr)      (__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)        __va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void * pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn) << PAGE_SHIFT;
+}
+
 
 #define page_to_virt(page)	__va(page_to_phys(page))
 

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230808-hexagon-virt-to-pfn-457bd51a5744

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

