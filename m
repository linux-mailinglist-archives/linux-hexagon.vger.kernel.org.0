Return-Path: <linux-hexagon+bounces-1035-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8FB5660A
	for <lists+linux-hexagon@lfdr.de>; Sun, 14 Sep 2025 06:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCD151A2189C
	for <lists+linux-hexagon@lfdr.de>; Sun, 14 Sep 2025 04:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A13D2777FE;
	Sun, 14 Sep 2025 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJiHGrro"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0369273D6B
	for <linux-hexagon@vger.kernel.org>; Sun, 14 Sep 2025 04:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822488; cv=none; b=VobEYzbmWcbpu9i6WaE2tZUyXP67pCx2UkWs/Y0n7PT+xquv4OYSnSK6ngGXGPhWTdoaRjobIFHBK9XD2qypmpE4La5cJQf/HLe+1CZnfNPYjToDve6KKqXaNrwtYqAT9goaZmkzFNj4by0Guk8AZNUJbyU2+r7kQooHpdI242E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822488; c=relaxed/simple;
	bh=sakDOyHfnSb4jjAr1r+9WRDw8CL8MGXlnh4FVRPIUR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrvP27dGSQvRIeJmwIdVvZHlbTyNflGKux7VeAqM/tNE3NIOvMZRBptuq7is76peR4KGe6eZ4+N8Ic3qKbk12q9wt6wHckCmj8rpo2MgLHdIMsajTZt5u5R+fO8LVsRQagwhi+ijl5KRKQA/YDqu21LlobYgjd889qw7LbnaSjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJiHGrro; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62f1987d53aso720674a12.0
        for <linux-hexagon@vger.kernel.org>; Sat, 13 Sep 2025 21:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822481; x=1758427281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwNZ1dGhSyiZay2XNiU9ezAgD/oIZHhpGCNy2W223z4=;
        b=aJiHGrroK8krdhQ7cqAGwUNHHrbGo15z5SUlo3bx2+hL7bN60HjzFXBVts3oCEbBHK
         RGcJG/Vg7CIxiTs96KODQCBeM1ZXEd9OZUzzM810Bq3q66HQ5jFWPLsAIT19lExk5oeM
         PixMrb1Mpay3oLfPHJMz3MA2kpRSzP6eZNY4WmDzJhVhDl8DLFg9lqVOi6SAvWYaSz5+
         ABlG+M93QPE4MG6dVcBwBRlNLSUTJHI0v3d8X0JPg77Qm/I/c0SKgOF3BHWs87+uHefR
         yRLILMAOr/JEHkUe3N495YLVXkxb9nmSMbdf4Wb/Cj8JdaT4DbdYrqIUSgT9uXE24Ob5
         CPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822481; x=1758427281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwNZ1dGhSyiZay2XNiU9ezAgD/oIZHhpGCNy2W223z4=;
        b=UgJEb+31+3nmjZNPVr33TtUBrmdQ/BZbHIZ9JqvHsK40NT6Cq3+J+mYoYxuaj9QlcQ
         y14b4V0uSI28I1JSYQkASQTmil+6QSxaAQFZyb62YnVgOnFdZMPpnB9KxzZnuElMIzFn
         G2lWSUqCn6+4dr/Qm9tw9XtgW8fUUFl1fJ6sjyG+U8BMT7mx8JPihsYidWgA2FmfAekb
         SV3dpFmqfhILigZK+S3SUhuNtE4M82iSBSYFIvJEjVbh6G2x/dbvTizgEDKkJ9JgcYzL
         /mxxUAiT7H0D+eCxBUQK8VUgjzW6JQyynMwyTZ2kAq6ZtWsXyoRozD6hg8aG959UKX2x
         lxhA==
X-Forwarded-Encrypted: i=1; AJvYcCWEhpbi0XObLqcpKiqApqQ1a5d8ghn/iE063TWGleIGpBz6QVOtRuY37sAZIt/4aQM5nb0ZeWREcLm3LHHN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10b5ggldX9J7djfYQUa1ouBLSZNPP4gpwXjJeXSech/41MayU
	SS3nQGECkOa83ezMsPcUX71OJArQerQFF79VZ2NEKeVivWK17Iqs2aYR
X-Gm-Gg: ASbGnctDeikAf/j0avVTpDgUcI3aN+nshR3QAZ3/436mo45xhsWKACHFZCbYMkA2YIS
	8kyZiCD4/ItNGHhXvRgIjq7uO3S1eRbKnJPYf8w/+/tla48eDE53SSdsWvI//QmrSqSrgzXn9Ev
	35GQIyFrqu2ydhlXrZryKkr3JAulwR07Bqo8A+5cpDD1+70dxNgruJh3l8eslhAO9ieDAUbLS65
	eTmtGgErplbg02luvz4AQLz+7saSrG3pnS6DH1V4AxoOh9IiwefNTt+Cw3lYk4HkuRjLYa8vnDC
	FTuszNXFTa4GKPyG3HGAaDrVXSqYgX3qKQKkXlDrMAVHmUviMBDHsuLTolCChcDNnQ5buYq7vwT
	wS4RMWrTWbRO+drSm40N02Vnzzm0TtlOZ7vQwP8Jy
X-Google-Smtp-Source: AGHT+IFULnpNvXsN8iyaJQvxHQtijyFN7+GqapflbxpSh737GK1sqeditLl7Ifn9jo0c7UhvyyAB9w==
X-Received: by 2002:a05:6402:5107:b0:62a:82e8:e1bd with SMTP id 4fb4d7f45d1cf-62ed82b22cbmr8144850a12.32.1757822480960;
        Sat, 13 Sep 2025 21:01:20 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f57dbsm6450117a12.25.2025.09.13.21.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:01:19 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 56/62] init: rename CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZIP
Date: Sun, 14 Sep 2025 07:01:13 +0300
Message-ID: <20250914040114.3796281-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initrd support was removed,
and CONFIG_RD_GZIP has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arc/configs/tb10x_defconfig           | 2 +-
 arch/arm/configs/sp7021_defconfig          | 2 +-
 arch/mips/configs/ath25_defconfig          | 2 +-
 arch/mips/configs/ath79_defconfig          | 2 +-
 arch/mips/configs/bmips_stb_defconfig      | 2 +-
 arch/mips/configs/rt305x_defconfig         | 2 +-
 arch/mips/configs/xway_defconfig           | 2 +-
 arch/openrisc/configs/or1ksim_defconfig    | 2 +-
 arch/openrisc/configs/simple_smp_defconfig | 2 +-
 arch/powerpc/configs/mgcoge_defconfig      | 2 +-
 arch/powerpc/configs/skiroot_defconfig     | 2 +-
 arch/riscv/configs/nommu_k210_defconfig    | 2 +-
 usr/Kconfig                                | 4 ++--
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 26a06eb336df..f177600a527a 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -13,7 +13,7 @@ CONFIG_INITRAMFS=y
 CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
 CONFIG_INITRAMFS_ROOT_UID=2100
 CONFIG_INITRAMFS_ROOT_GID=501
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_AIO is not set
 CONFIG_EXPERT=y
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..30cfafc49ec9 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -5,7 +5,7 @@ CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index cb16a1f18db8..58ae5f9726a0 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -3,7 +3,7 @@ CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/mips/configs/ath79_defconfig b/arch/mips/configs/ath79_defconfig
index 014bb1107b86..500b94dfc6c1 100644
--- a/arch/mips/configs/ath79_defconfig
+++ b/arch/mips/configs/ath79_defconfig
@@ -2,7 +2,7 @@
 CONFIG_SYSVIPC=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_AIO is not set
 # CONFIG_KALLSYMS is not set
 CONFIG_EXPERT=y
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index ed4d4be772be..2217a3ca5b72 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -14,7 +14,7 @@ CONFIG_SMP=y
 CONFIG_NR_CPUS=4
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 CONFIG_RD_XZ=y
diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
index bf4dd5930876..9102f9ebcf88 100644
--- a/arch/mips/configs/rt305x_defconfig
+++ b/arch/mips/configs/rt305x_defconfig
@@ -3,7 +3,7 @@ CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_AIO is not set
 CONFIG_KALLSYMS_ALL=y
diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
index 41d0d7d8cb6c..fa49183a4147 100644
--- a/arch/mips/configs/xway_defconfig
+++ b/arch/mips/configs/xway_defconfig
@@ -3,7 +3,7 @@ CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_AIO is not set
 CONFIG_KALLSYMS_ALL=y
diff --git a/arch/openrisc/configs/or1ksim_defconfig b/arch/openrisc/configs/or1ksim_defconfig
index 96578bfb7159..56ddb48f7955 100644
--- a/arch/openrisc/configs/or1ksim_defconfig
+++ b/arch/openrisc/configs/or1ksim_defconfig
@@ -1,7 +1,7 @@
 CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_EXPERT=y
 # CONFIG_KALLSYMS is not set
 # CONFIG_EPOLL is not set
diff --git a/arch/openrisc/configs/simple_smp_defconfig b/arch/openrisc/configs/simple_smp_defconfig
index f7c807b32d50..e4aaaeaec7a8 100644
--- a/arch/openrisc/configs/simple_smp_defconfig
+++ b/arch/openrisc/configs/simple_smp_defconfig
@@ -2,7 +2,7 @@ CONFIG_LOCALVERSION="-simple-smp"
 CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
diff --git a/arch/powerpc/configs/mgcoge_defconfig b/arch/powerpc/configs/mgcoge_defconfig
index 1b782855c84a..6d543b9f0bc6 100644
--- a/arch/powerpc/configs/mgcoge_defconfig
+++ b/arch/powerpc/configs/mgcoge_defconfig
@@ -6,7 +6,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_PCSPKR_PLATFORM is not set
 CONFIG_EXPERT=y
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 1611e15a72f3..9a6ef1d8ca44 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -10,7 +10,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=20
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 7824f13e84f3..a1fa77563bb8 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -1,7 +1,7 @@
 # CONFIG_CPU_ISOLATION is not set
 CONFIG_LOG_BUF_SHIFT=13
 CONFIG_INITRAMFS=y
-# CONFIG_RD_GZIP is not set
+# CONFIG_INITRAMFS_DECOMPRESS_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index 8899353bd7d5..cf3c7539e3dc 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -52,7 +52,7 @@ config INITRAMFS_ROOT_GID
 
 	  If you are not sure, leave it set to "0".
 
-config RD_GZIP
+config INITRAMFS_DECOMPRESS_GZIP
 	bool "Support initial ramfs compressed using gzip"
 	default y
 	select DECOMPRESS_GZIP
@@ -134,7 +134,7 @@ choice
 
 config INITRAMFS_COMPRESSION_GZIP
 	bool "Gzip"
-	depends on RD_GZIP
+	depends on INITRAMFS_DECOMPRESS_GZIP
 	help
 	  Use the old and well tested gzip compression algorithm. Gzip provides
 	  a good balance between compression ratio and decompression speed and
-- 
2.47.2


