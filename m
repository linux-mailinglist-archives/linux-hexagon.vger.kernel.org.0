Return-Path: <linux-hexagon+bounces-15-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ECB7F3093
	for <lists+linux-hexagon@lfdr.de>; Tue, 21 Nov 2023 15:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6326C1C21561
	for <lists+linux-hexagon@lfdr.de>; Tue, 21 Nov 2023 14:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B3654FAB;
	Tue, 21 Nov 2023 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="M/kuTVt8"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2820D1A3
	for <linux-hexagon@vger.kernel.org>; Tue, 21 Nov 2023 06:24:38 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6c4d06b6ddaso4702016b3a.3
        for <linux-hexagon@vger.kernel.org>; Tue, 21 Nov 2023 06:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576677; x=1701181477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rO5gvBC9Yj9Gj9iwFUnYV9+FlJPZ82+bI2tRklE6bkQ=;
        b=M/kuTVt87qu0ZVJhQdMlOZPBlWefKfiRPkds/vddzN4iL6j32QUXBT68wPQRj6qWuy
         41gGIlSFf9+s0p8J+B+ZSNX+C+bBq66hdA9w71LyXK3/KFSMdXSI6FNZc35F3Vh9DvA7
         J8JOOS2+GQE6CQkS92puHF/BaXzAcqCIfZD8aRimjqnw6Zy/SUHykh4b6t1KtVYvnAw5
         3a6D3C7nh8z9qXxaWySLKMqqtFs+gQ1hVzdNnbDUL7odkMKyh65O03idtJrhAuW0uMHb
         +s+ndXS4XblI6bQ6g6e7XNxgSBKBa0gB4I+Tq2hd/TbVl2iaoDm0u0QM1EyQG/JW5lgC
         J5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576677; x=1701181477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rO5gvBC9Yj9Gj9iwFUnYV9+FlJPZ82+bI2tRklE6bkQ=;
        b=eyS8UkPk0TeJcThLWcoC3T5tRjTKAX5rg9yrGS5guI/wHsFRrllji4MWEOe8khu7fH
         0YEez+TTg5S+FgVSf59tpHqxY/BJwYGc5xmzNlSD+GUg+/BDJOjWycvsh2b/ej9XRZxk
         1mJE0b+2kXP44dpzQjtd9BCMu1cNjdSb7v4NYP6IouD4EeUPyCHdhXMzuJQYGp9Zrntq
         BR6dbAj6rIwvaBIOoNdnG5g/t2NVEnpjdtNxh5J8CB8q5sEkjycRsfCntzlps4e0uZCZ
         +MuxGeffBVLlwOgxsrqVL65RIn5N+EIJVnTOOBOh6onXRgeqlt+o8JOOz6PGVufONLBj
         VSxg==
X-Gm-Message-State: AOJu0Yxm3B2OfDrhTSNBdTJSnamHbw4GNbsZBrdEGcegQt0PCgqKAr8W
	dHndww7UfwIHStFAYSObY1p7Rw==
X-Google-Smtp-Source: AGHT+IGZ0cj3qTxHGElldELTLLVk70f7H8QJHy0DgUxvrRtGVlmmImJxGtalz8fEj5aiHrvaElF8fg==
X-Received: by 2002:a05:6a20:1591:b0:18a:716d:4ac with SMTP id h17-20020a056a20159100b0018a716d04acmr6231274pzj.47.1700576677576;
        Tue, 21 Nov 2023 06:24:37 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:24:36 -0800 (PST)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: ubizjak@gmail.com,
	mark.rutland@arm.com,
	vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.org,
	mhiramat@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.net,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>
Subject: [PATCH v3 0/5] arch,locking/atomic: add arch_cmpxchg[64]_local
Date: Tue, 21 Nov 2023 22:23:42 +0800
Message-Id: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Archtectures arc, openrisc and hexagon haven't arch_cmpxchg_local()
defined, so the usecase of try_cmpxchg_local() in lib/objpool.c can
not pass kernel building by the kernel test robot.

Patch 1 improves the data size checking logic for arc; Patches 2/3/4
implement arch_cmpxchg[64]_local for arc/openrisc/hexagon. Patch 5
defines arch_cmpxchg_local as existing __cmpxchg_local rather the
generic variant.

wuqiang.matt (5):
  arch,locking/atomic: arc: arch_cmpxchg should check data size
  arch,locking/atomic: arc: add arch_cmpxchg[64]_local
  arch,locking/atomic: openrisc: add arch_cmpxchg[64]_local
  arch,locking/atomic: hexagon: add arch_cmpxchg[64]_local
  arch,locking/atomic: xtensa: define arch_cmpxchg_local as
    __cmpxchg_local

 arch/arc/include/asm/cmpxchg.h      | 40 ++++++++++++++++++----
 arch/hexagon/include/asm/cmpxchg.h  | 51 ++++++++++++++++++++++++++++-
 arch/openrisc/include/asm/cmpxchg.h |  6 ++++
 arch/xtensa/include/asm/cmpxchg.h   |  2 +-
 4 files changed, 91 insertions(+), 8 deletions(-)

-- 
2.40.1


