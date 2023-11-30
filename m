Return-Path: <linux-hexagon+bounces-42-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B477FFED7
	for <lists+linux-hexagon@lfdr.de>; Thu, 30 Nov 2023 23:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 258C51C20BCD
	for <lists+linux-hexagon@lfdr.de>; Thu, 30 Nov 2023 22:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D92B61FA8;
	Thu, 30 Nov 2023 22:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6mBi2AH"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6861FA9;
	Thu, 30 Nov 2023 22:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDF0C433CB;
	Thu, 30 Nov 2023 22:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701385113;
	bh=CKJOyhXIEqz9+nT2U6/b3frXins7VIeFc5nWD/ZGVEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o6mBi2AHuto7n5ueYhoPdKuhLuYU6djI2Wp9whUFxc90py9ZgWemfDx3YmYykqGGz
	 KB7MiQDKa1QI/U/YZtF2Eqj4QGZ89CgFyL7thNEFzkFTFCGZRzCMl9UOkOoQYncE8F
	 ITC54O6WYhchr5KbwOhmQlgHl8cQIkWpAsIn84wVFtC/P69Tds5yGBt9QprPcXI6mk
	 /Cpz18i8JYDU9Om2eH3fChCfxNx0h9vthjHpmTu2GRU3KTuQCEaCx+fX0QXpFTJwW7
	 JXNr+QAsRHi9X1Bqay7cJUt1WOeRH/3K3Xo9ooYF3+2luDr9+U9fJUwjdTjt/u6eA7
	 LRbft+R8N9S5w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 30 Nov 2023 15:58:29 -0700
Subject: [PATCH 16/19] hexagon: vm_events: Remove unused dummy_handler()
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-hexagon-missing-prototypes-v1-16-5c34714afe9e@kernel.org>
References: <20231130-hexagon-missing-prototypes-v1-0-5c34714afe9e@kernel.org>
In-Reply-To: <20231130-hexagon-missing-prototypes-v1-0-5c34714afe9e@kernel.org>
To: bcain@quicinc.com, akpm@linux-foundation.org, arnd@arndb.de
Cc: linux-hexagon@vger.kernel.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=nathan@kernel.org;
 h=from:subject:message-id; bh=CKJOyhXIEqz9+nT2U6/b3frXins7VIeFc5nWD/ZGVEY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmZwv1mafEVMQ0CKivaT1/1kX0kmOd7I4xtR4SYl8Ci4
 /OecOd2lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIlkv2FkWHN48pwHPwIymWUj
 Bb4HXpE2dbh9rrohdX/U1etulTf+/Gb4X9FarLfI6dzRdY1TTc7JrbjBu/WvgvLLqkvHTB9vfqG
 UwggA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns:

  arch/hexagon/kernel/vm_events.c:76:6: warning: no previous prototype for function 'dummy_handler' [-Wmissing-prototypes]
     76 | void dummy_handler(struct pt_regs *regs)
        |      ^
  arch/hexagon/kernel/vm_events.c:76:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     76 | void dummy_handler(struct pt_regs *regs)
        | ^
        | static

This function appears to be entirely unused, so remove it.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/hexagon/kernel/vm_events.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/hexagon/kernel/vm_events.c b/arch/hexagon/kernel/vm_events.c
index 59ef72e4a4e5..2b881a89b206 100644
--- a/arch/hexagon/kernel/vm_events.c
+++ b/arch/hexagon/kernel/vm_events.c
@@ -73,13 +73,6 @@ void show_regs(struct pt_regs *regs)
 		pt_psp(regs), pt_badva(regs), ints_enabled(regs));
 }
 
-void dummy_handler(struct pt_regs *regs)
-{
-	unsigned int elr = pt_elr(regs);
-	printk(KERN_ERR "Unimplemented handler; ELR=0x%08x\n", elr);
-}
-
-
 void arch_do_IRQ(struct pt_regs *regs)
 {
 	int irq = pt_cause(regs);

-- 
2.43.0


