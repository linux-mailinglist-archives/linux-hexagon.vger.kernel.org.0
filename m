Return-Path: <linux-hexagon+bounces-18-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98A7F309B
	for <lists+linux-hexagon@lfdr.de>; Tue, 21 Nov 2023 15:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2291C21772
	for <lists+linux-hexagon@lfdr.de>; Tue, 21 Nov 2023 14:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243B054F9F;
	Tue, 21 Nov 2023 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UW9ckZHW"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F75AD6C
	for <linux-hexagon@vger.kernel.org>; Tue, 21 Nov 2023 06:25:02 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so4847849b3a.3
        for <linux-hexagon@vger.kernel.org>; Tue, 21 Nov 2023 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576702; x=1701181502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma7hrIwqvDM4lCpBvbnn1WZG4yWufWgrZRtOwNFwz5Q=;
        b=UW9ckZHW8W7pnYJbKIM/+E86k6AjyG3KWPYF7p1lDxUKXH63MHhA+pEmmILOd5OseX
         /GuTXcmZE8r8mR6P9gc2dPF7z0271cbf+xlqjssqQZTX3MhZEQnHdSxlAvR9DbOwfu4j
         orhpbXhuMorz+HTFrvwBu3WxCW1tZGC67GrwQVfNo3/qnYDzeYiSIm6f+P3vIZ30GvIQ
         OrqlGqNXbOVV4CAI9o0q2jQrLPGIBRMDL6DeHVKUCKIlynjGqWuRE5HKG/5+I5ic/JTm
         //TyEvFIbWPy8/+FpftXIq1N8VGOe8WYSGH4Zye8m8xwomMy1WN2/k9SX+asjr1tnnfr
         OYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576702; x=1701181502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma7hrIwqvDM4lCpBvbnn1WZG4yWufWgrZRtOwNFwz5Q=;
        b=rwDBHFkWnhvY6A/XdeF0xz+KeTsCg76br/Rf1SZAsYiOLBVB00kNthue/V21TqQyco
         dZozpNJYYdbw5Hx1VYZiApLcl03rxb6m+x0vF1rH+xqa02agq0HF3rMqCE7ZJc1qI8Da
         z+2dLQzXbgKzCPq6Ao9+yfO5NLDGxPFlq3qmoPMCiTOrA8039201KnDTHYO4RbA47lxZ
         uFbe8flVp8aLeC+XDJYyVQomJE+ZTqufq2zEY2O6w56EyYSE+r+YMoeCJ4Z096whUGv3
         PXOgU7iQnY/LILucw0Sbo6+WI8yntoErubE2JdoAqkffKyhUUil7Je0H0LoSw1Bm/zrn
         qLSw==
X-Gm-Message-State: AOJu0Yym1XtRRsIsnv0MKvQ8qps3awpJuAnFxyYyZDl+dFavvrr2G3SA
	5sh+St7ALs6z2IY1Mp8C32jtwA==
X-Google-Smtp-Source: AGHT+IHISvT3HOK4Q8QdxNY25egV5B1w+H+S5nFIY6gWXptDkpevoMSwLQoow/dwb6Z7gSO9fV5N9w==
X-Received: by 2002:a05:6a00:3923:b0:68e:3eab:9e18 with SMTP id fh35-20020a056a00392300b0068e3eab9e18mr9207536pfb.12.1700576701929;
        Tue, 21 Nov 2023 06:25:01 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:25:01 -0800 (PST)
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
	"wuqiang.matt" <wuqiang.matt@bytedance.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 3/5] arch,locking/atomic: openrisc: add arch_cmpxchg[64]_local
Date: Tue, 21 Nov 2023 22:23:45 +0800
Message-Id: <20231121142347.241356-4-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

openrisc hasn't arch_cmpxhg_local implemented, which causes
building failures for any references of try_cmpxchg_local,
reported by the kernel test robot.

This patch implements arch_cmpxchg[64]_local with the native
cmpxchg variant if the corresponding data size is supported,
otherwise generci_cmpxchg[64]_local is to be used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
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


