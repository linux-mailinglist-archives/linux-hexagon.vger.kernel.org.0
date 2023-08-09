Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084F57767B0
	for <lists+linux-hexagon@lfdr.de>; Wed,  9 Aug 2023 20:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjHISzV (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 9 Aug 2023 14:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjHISzU (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 9 Aug 2023 14:55:20 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F70EE64
        for <linux-hexagon@vger.kernel.org>; Wed,  9 Aug 2023 11:55:20 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3a7aedc57ffso82138b6e.2
        for <linux-hexagon@vger.kernel.org>; Wed, 09 Aug 2023 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691607320; x=1692212120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml4dfY3mLq3SCYyf0vfwwEcWzqsDXJO/lar+p7qztwU=;
        b=CKnfz7HzOaVI1c8Xxr/EcY6QKMHJqQ7cpVvPcskHfjmo+1EB//ZE6mSGoOgQzRL0dm
         Qv3t33bzM31KbPHqwnZdkvyMtbGA7wUTrtHLiU7mkItOoAnl5Y/DaEmES9Wdy6CYGmHO
         GbdAtlOU69nBqzLiIHS08lp6pndIZCacZz+27Tpyn94Yon5/nTvm0M48Apo31BYEFDAw
         58wDsx2Ev1OQLkhzyElbGU/FAo9XNJz+F0vZrkIzNRDw50pLLbetVSmTTuPhcQ0g9SWu
         aV8dUrZj3SNr9ICs03jULfBLMdCfxBVuE4hrEE2XWTscQ55RS4cN3FOmfJieEW/8nrdR
         A8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691607320; x=1692212120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ml4dfY3mLq3SCYyf0vfwwEcWzqsDXJO/lar+p7qztwU=;
        b=eMHV+5LscZBm6ypKo30TiuVouIGstUn73Z+6d1N+fBBBiWsVqL6XQc53E8ungIL6Ps
         ndS8QJfbKUy89+i0+hIqArsWU8CjFfBEszscgMAbURhnqTw5AZCPyROwF0KFR6SnA36g
         jGiGG/EpJAEHVh0i573DvjfMW+PzxZeKvw4y9qFsR3r2SXXt8xMIRRBrpCHHJ3J1Q9cu
         omJdFG2XAZhRSF1ISn8FC2MIZ9iGHIF8eDSeZXrTtl6nzegyJpatIY/530zeLth52XIw
         YJtbqRRlP0BeR9ws5pdzAS9c0Ny9v1qli/1zqWV4ffSO2JX2Q+oZqN338UZ2Lw4tfI98
         pC2g==
X-Gm-Message-State: AOJu0YzKf8WlqRSvmkxAStRoj9/BTTZaaxc3jzOWDtCV9W5ZkoxKE+A2
        OTJy2GDvlI7IzBaPgt8MpqfbWvW4ygAbdw==
X-Google-Smtp-Source: AGHT+IF8Ar8M60cViD0YQmRBWw1G/nSZaXjCG87bLvLVP19868/xpzbfg4O/RM+YT54RsIDqP900mg==
X-Received: by 2002:a05:6808:1385:b0:3a7:a2f4:9873 with SMTP id c5-20020a056808138500b003a7a2f49873mr249905oiw.35.1691607319532;
        Wed, 09 Aug 2023 11:55:19 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net ([2601:204:df00:9cd0:d26e:9bde:5e8b:6cb6])
        by smtp.gmail.com with ESMTPSA id on14-20020a17090b1d0e00b002677739860fsm1800919pjb.34.2023.08.09.11.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 11:55:19 -0700 (PDT)
From:   Atul Raut <rauji.raut@gmail.com>
To:     bcain@quicinc.com
Cc:     linux-hexagon@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: hexagon: fix warning comparing pointer to 0
Date:   Wed,  9 Aug 2023 11:51:48 -0700
Message-Id: <20230809185147.98262-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Fix the following coccicheck warning:
./arch/hexagon/kernel/traps.c:138:6-7: WARNING comparing pointer to 0

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 arch/hexagon/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
index 6447763ce5a9..78486eea77d7 100644
--- a/arch/hexagon/kernel/traps.c
+++ b/arch/hexagon/kernel/traps.c
@@ -80,7 +80,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 	int kstack_depth_to_print = 24;
 	unsigned long offset, size;
 	const char *name = NULL;
-	unsigned long *newfp;
+	unsigned long *newfp = NULL;
 	unsigned long low, high;
 	char tmpstr[128];
 	char *modname;
@@ -135,7 +135,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 		}
 
 		/* Attempt to continue past exception. */
-		if (0 == newfp) {
+		if (!newfp) {
 			struct pt_regs *regs = (struct pt_regs *) (((void *)fp)
 						+ 8);
 
-- 
2.34.1

