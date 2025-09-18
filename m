Return-Path: <linux-hexagon+bounces-1029-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AAB5658F
	for <lists+linux-hexagon@lfdr.de>; Sun, 14 Sep 2025 05:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F46A1A22B45
	for <lists+linux-hexagon@lfdr.de>; Sun, 14 Sep 2025 03:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A4C274FD0;
	Sun, 14 Sep 2025 03:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0pjvupp"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049D26B747
	for <linux-hexagon@vger.kernel.org>; Sun, 14 Sep 2025 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822270; cv=none; b=j05OJ1gtnYHKPg6+ybzNwIn19Xeerd4imXydq6N/sq2Io2hWM4QGzuTQl2Sh29UltunImn8IdPHWVIQ72dCk4zMSKlJRrRNJ/nKIJ2Z+4WRg3Nn2F4yRSPZ9q81wlpoed1gTzSoEwTUbu5uCqc7x8+SZ/QRV1bjg9gFwDmzPnV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822270; c=relaxed/simple;
	bh=oKU/He6fgnkGxFwiXzfMSQvpywViA2YaDdh3D2HgJ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGSm6EphLvgmsjLv3AQP76LfPrdxt2wLJGpbbOU3k4ZMDv1A315CvDNvGVVnk1v6i0gPpwfCD4NTLsK9xm/HU33chl0sxrH4W6LVc3z6Zv5s3dVVVn/XMRC4WhDI5+aW4xkRTXfhS/e9x3/cJpljTIsa8bvmmjqYbMrkJ7D/87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0pjvupp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0787fa12e2so446711466b.2
        for <linux-hexagon@vger.kernel.org>; Sat, 13 Sep 2025 20:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822264; x=1758427064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=Z0pjvupp9oiKINjNbyeuSobzmzNc3O235l4XZaJq6+xnV8xiQNvmcPRhTjA0wy8g9j
         1e/VnNr8qqUxIu704AIAXUk3hdIHvQA2i+7JMtdyUSLBNWCch2mJfUrX3kek54B00jIX
         cpkdx+SF3alQFdxuMwBpZmAMcBz1Fkvbhqc+rqW0oPJBw3vuPYmCSOvsKe8xp+b9RN/V
         gAdtsX4NIFWKTmhvWP3oEqv1ZMtJ8kBfRF67kPO2/akOjOYC2dMCZGY8BqZAd+ytSz+V
         h3rnckiFQSpaBVNrFt5iWUY1JpIoQK/ePVg8RRD6OraLlYp4RCO48NNQFUqRkIYcPgQk
         HyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822264; x=1758427064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=Q4mj3uWtxmh8gGkpBrASMVkqLbPoGVZrOAyXy2A+6epXtQmgO5j5zeORHrQh7PR9jn
         m8Ve5aN8tj5F2QWdcv91mxoPn/Q33e5m7ioUA3c2AKk3RxsRY/pGj/tKnmNKmXWcilWx
         E1N+7NS4n090gZ+KjCq8NMsh1NuG4DHkP06VejZ8jjUfnZPlipnbOnll6U+XotkCq5+1
         0tgRfeCS8BwXBknmuHYnBWwvheRNEjXCB7nxnPOuatB7lMvEDOKigSF+D//M5ZIjWt7m
         xzlfPU3YJQD2HSK5id1ZHToUgZfBhE89VYNhXjkYKJp6JOS/I3wp/PJy6IHhceQxT5/O
         Fc4g==
X-Forwarded-Encrypted: i=1; AJvYcCUvorOINTIjsrJTjP6bsuFQY/4iJKMevCogZMviRD3qArTylr3BouzwM8yKXEIskuLYhzmHcsqvK4e/XLRw@vger.kernel.org
X-Gm-Message-State: AOJu0YyTreH7cydsELQynzXW9qfFe3Kl3EldNQkTMC38Ym5KFhQ7fYZg
	UE1SymPf7o6gwFS9kW8eJRDMfo1bfZSntEJLveZcCFiWPDT1yexhT22i
X-Gm-Gg: ASbGnctVmaa5EPq+aX3kKWiYf0vljZSHlwKYYemWAYQoFL5QW+4t6yWIuvtJSfoJ5VL
	Xitlyvt3a4GdZ1qMiUtsNykhF+qIM6/qAWe2s9hLqivLaOo2F9irOJ5IZl/OwClwSSMP7BVDsqI
	72siL2vu1tJAEWkTxMcdm6lGID/eAhxXd/BlXCKW8K8Ph6OJAcrtPf1+CMHSeDTjd3pY4FKNcZ0
	72Dxk9UjmbXyoScW3F9uZ3ZJU1lUjlrjFphe6YnI9AaeSnbYqmDy0kfZVotChH/ndpkjbxj58N6
	9ubDj4FqH/JVOYAj8klqw65uxySuv09es1yuyhk7h7H4nNc4CSJD9qwaoU+iYN3UQsywE74BIwp
	VOCMNi5Suo9sqT1c5SvV4fG0oeGfR5A==
X-Google-Smtp-Source: AGHT+IGOdPvfXOVddm8G6LJhfH2nNJDoTTLKR/3NE7kowNRoQPIuzhxmV+feQvXrrMYzfjsz5Ubcxg==
X-Received: by 2002:a17:906:a84d:b0:b07:cf04:8a43 with SMTP id a640c23a62f3a-b07cf049441mr520202566b.41.1757822263792;
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31287cesm676665366b.30.2025.09.13.20.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
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
Subject: [PATCH RESEND 50/62] init: rename ramdisk_command_access to initramfs_command_access
Date: Sun, 14 Sep 2025 06:57:38 +0300
Message-ID: <20250914035738.3741007-1-safinaskar@gmail.com>
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index cbebd64f523c..a42f1f0fce84 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1587,11 +1587,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(initramfs_execute_command);
-	if (ramdisk_command_access != 0) {
+	int initramfs_command_access;
+	initramfs_command_access = init_eaccess(initramfs_execute_command);
+	if (initramfs_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			initramfs_execute_command, ramdisk_command_access);
+			initramfs_execute_command, initramfs_command_access);
 		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.47.2


