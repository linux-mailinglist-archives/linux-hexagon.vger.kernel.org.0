Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465A95982FA
	for <lists+linux-hexagon@lfdr.de>; Thu, 18 Aug 2022 14:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244568AbiHRMOd (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 18 Aug 2022 08:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244445AbiHRMOc (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 18 Aug 2022 08:14:32 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245609C8FB
        for <linux-hexagon@vger.kernel.org>; Thu, 18 Aug 2022 05:14:31 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u9so1853007lfg.11
        for <linux-hexagon@vger.kernel.org>; Thu, 18 Aug 2022 05:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=jwxp1KAydS2ZvfU/XwwFFINkOhcLog6j6vbpvOxklTw=;
        b=KOwUos+pq/GZt4Pp+EnUX+r8mRIeYu8foSVs8MNzP4ZzoBTzdYwYCX2xVYZwDPIolA
         dzGPKpscHVbdkOzCUDUMGPyRiAutaCEz8PfJ+BZ3H0SVHuMTuSoJLDEOo1Kgmd6ZEk+Y
         HE4vrWvqNPMNuR2Hk7gPqQx2o27O2UIKRjH8Gy1yxy8xEUYmeb9aX5qf4L36cl0CEwvc
         uxvC4m9xNsPCRD3EMPPCPxo7Ac3QPngcs1Gq2KxQ87rdyB+Y00IAd5LwQ/J/P9ZqFp22
         9rmYLoOyFmx5stKdywo+k1mEQepUa2REk5eugB2n30f9iKNRrNLP3WL8IAQEUWfA5DGS
         EbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=jwxp1KAydS2ZvfU/XwwFFINkOhcLog6j6vbpvOxklTw=;
        b=8JWxWkXmqx2B1eexvjThDnL2KeIKQyQbCTFYUKSfWmi3TvrysGqDeEA5Loj6SlVydm
         DNpFlB+T/NA8r6MVI+S/rnCRqAavpQb9ljUjUVddVKp70hb+N2zprRqokkIo0tKYIDtA
         L5tNpGho80kxSmzTbgmKkSoHPLYe81BX1LeFIzJVaNLd2blL+FufLDjJz4Cg+BVGgBMT
         sjtPouNdIKI5E68yb26557xhdTn+oKt5rGXQ08FApxy5TfyMBojUZllHgpBv5L7iOneT
         v7aFArXIKNGabA3yEXVxvmkB/1EyjR6LTemavwdx0JC4NaqvY1v5N3ieEQjdyQkvM2Bm
         yO4w==
X-Gm-Message-State: ACgBeo0fGH6LTCsnFDRXwufjQgC2YMh0+kJnCCB3wUh6WWfV9IUY7WJH
        25vELJ4SRCHw8ABcm7PVulhvMA==
X-Google-Smtp-Source: AA6agR7Fv09p/IqiOD1UkobeLwovRtZnvVY78EpPdvDM4nCoz8Qw1LC/9EKnzmBIhtdKWp2wOGcKsg==
X-Received: by 2002:a05:6512:3f02:b0:48d:244e:426f with SMTP id y2-20020a0565123f0200b0048d244e426fmr816345lfa.333.1660824869292;
        Thu, 18 Aug 2022 05:14:29 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id i9-20020a056512006900b0048b064707ebsm202917lfo.103.2022.08.18.05.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 05:14:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] regmap/hexagon: Properly fix the generic IO helpers
Date:   Thu, 18 Aug 2022 14:12:27 +0200
Message-Id: <20220818121227.151016-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

I was too naive in just including <asm-generic/io.h> into
hexagon: one has to specify defines for every call that uses
a (static) inline or this will not work.

Fix it up by providing proper defines for all shorthands that
hexagon provides.

Compile-tested with hexagon LLVM which is the only working cross
compiler for hexagon ATM after commenting out the
-fno-inline-functions-called-once switch which isn't working
with LLVM.

Cc: Brian Cain <bcain@quicinc.com>
Cc: linux-hexagon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Fixes: 81c0386c1376 ("regmap: mmio: Support accelerared noinc operations")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Mark: please apply this to the regmap tree as a fix on
my sloppy commit so your tree compiles on hexagon. I hope the hexagon
folks will not mind.
---
 arch/hexagon/include/asm/io.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/hexagon/include/asm/io.h b/arch/hexagon/include/asm/io.h
index 8e938dc1ca4b..46a099de85b7 100644
--- a/arch/hexagon/include/asm/io.h
+++ b/arch/hexagon/include/asm/io.h
@@ -308,6 +308,29 @@ static inline void outsl(unsigned long port, const void *buffer, int count)
 	}
 }
 
+/*
+ * These defines are necessary to use the generic io.h for filling in
+ * the missing parts of the API contract. This is because the platform
+ * uses (inline) functions rather than defines and the generic helper
+ * fills in the undefined.
+ */
+#define virt_to_phys virt_to_phys
+#define phys_to_virt phys_to_virt
+#define memset_io memset_io
+#define memcpy_fromio memcpy_fromio
+#define memcpy_toio memcpy_toio
+#define readb readb
+#define readw readw
+#define readl readl
+#define writeb writeb
+#define writew writew
+#define writel writel
+#define insb insb
+#define insw insw
+#define insl insl
+#define outsb outsb
+#define outsw outsw
+#define outsl outsl
 #include <asm-generic/io.h>
 
 #endif /* __KERNEL__ */
-- 
2.37.2

