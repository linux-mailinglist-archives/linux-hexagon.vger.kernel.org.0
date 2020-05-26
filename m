Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B631AF4D6
	for <lists+linux-hexagon@lfdr.de>; Sat, 18 Apr 2020 22:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgDRUUM (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 18 Apr 2020 16:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728407AbgDRUUL (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 18 Apr 2020 16:20:11 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EBAC061A10
        for <linux-hexagon@vger.kernel.org>; Sat, 18 Apr 2020 13:20:11 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j1so1743407wrt.1
        for <linux-hexagon@vger.kernel.org>; Sat, 18 Apr 2020 13:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6R0TdYOcG5Bv2SRfLD1msXELfsMKoMz98rYdKts12dM=;
        b=VdZ2T7boD+7pyETQjAzc4RbuYi6fxXG4Z5oQiGzEBK+nNHz0rCq8g4ilLEw3HUB0s3
         4ygAY5J/AoKL9Z3jaAvMjPZ+HsodIJWsmKCrBXtJieioQL2kFfUYiBHWooDG/6sjOeBH
         zILlEyARTMxMhGX/xgXncIZ72O7JxiiQDFLrvKrzOLS6TOqGgRLnnB6K2YOFnDZLfAQ3
         Phj/rb0p5rTfTaieM9TZkihFdD9SnoeU24WPx2XC7D9jtHka0wPAimqBnhS0+sfv8XrS
         ZVdyQgzxHilfOZezkcCWS55ZF1Pie7qR1BrwUJtmeJTnz/jv69G9MNr9rdPJpb2YPtIN
         n1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6R0TdYOcG5Bv2SRfLD1msXELfsMKoMz98rYdKts12dM=;
        b=EycevwODoeoVxblRoyOsQMes4IksixbYE7ru4LfyFJeCWWwvPc4gwT/XiJKxt+PrGr
         U3GjKPVlJ2PoefZdaIjLChblUytQO1mVMoTzMgjV3R0ShsBP9iOi4UUCquRsZY7xEzkH
         cEBO0303YkEUZItrvz+J6+1BW2xUcYSu8HgPRGli+GLt1F9bJeoBvGvyt0IK3HFwvQ/Z
         f1hYYkdWDoLT3QUtS1Bz8p+SPO9pVbSODYnmL3+GwN+Y3/pk5rquaMxGxAw/We+THyWo
         wUdgvqvkmarN+M4KLPDtHHwu3cklgfQQiMFgfoDO3Q4KJEs8NyLydN/ZwjaQPLYw6fZm
         y/GQ==
X-Gm-Message-State: AGi0PubjcrRl+g9xxPhBr1qsvhnKDu65LE3ptnKX28mm4i9AdDUfw1Ri
        066DUGPZKdJo6B8z7PBD71OEEA==
X-Google-Smtp-Source: APiQypKl/a/ofi+POa6bfu6oURFAiXiKBg0hSHzz9OTd9QhmIvENM/EKJg+k7Bs+odYiC2apOcHQCA==
X-Received: by 2002:a5d:6589:: with SMTP id q9mr9905349wru.136.1587241209683;
        Sat, 18 Apr 2020 13:20:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:09 -0700 (PDT)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org
Subject: [PATCHv3 14/50] hexagon: Add show_stack_loglvl()
Date:   Sat, 18 Apr 2020 21:19:08 +0100
Message-Id: <20200418201944.482088-15-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

As a good side-effect die() now prints the stacktrace with KERN_EMERG
aligned with other messages.

Cc: Brian Cain <bcain@codeaurora.org>
Cc: linux-hexagon@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Acked-by: Brian Cain <bcain@codeaurora.org>
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/hexagon/kernel/traps.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
index 69c623b14ddd..a8a3a210d781 100644
--- a/arch/hexagon/kernel/traps.c
+++ b/arch/hexagon/kernel/traps.c
@@ -79,7 +79,7 @@ static const char *ex_name(int ex)
 }
 
 static void do_show_stack(struct task_struct *task, unsigned long *fp,
-			  unsigned long ip)
+			  unsigned long ip, const char *loglvl)
 {
 	int kstack_depth_to_print = 24;
 	unsigned long offset, size;
@@ -93,9 +93,8 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 	if (task == NULL)
 		task = current;
 
-	printk(KERN_INFO "CPU#%d, %s/%d, Call Trace:\n",
-	       raw_smp_processor_id(), task->comm,
-	       task_pid_nr(task));
+	printk("%sCPU#%d, %s/%d, Call Trace:\n", loglvl, raw_smp_processor_id(),
+		task->comm, task_pid_nr(task));
 
 	if (fp == NULL) {
 		if (task == current) {
@@ -108,7 +107,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 	}
 
 	if ((((unsigned long) fp) & 0x3) || ((unsigned long) fp < 0x1000)) {
-		printk(KERN_INFO "-- Corrupt frame pointer %p\n", fp);
+		printk("%s-- Corrupt frame pointer %p\n", loglvl, fp);
 		return;
 	}
 
@@ -125,8 +124,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 
 		name = kallsyms_lookup(ip, &size, &offset, &modname, tmpstr);
 
-		printk(KERN_INFO "[%p] 0x%lx: %s + 0x%lx", fp, ip, name,
-			offset);
+		printk("%s[%p] 0x%lx: %s + 0x%lx", loglvl, fp, ip, name, offset);
 		if (((unsigned long) fp < low) || (high < (unsigned long) fp))
 			printk(KERN_CONT " (FP out of bounds!)");
 		if (modname)
@@ -136,8 +134,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 		newfp = (unsigned long *) *fp;
 
 		if (((unsigned long) newfp) & 0x3) {
-			printk(KERN_INFO "-- Corrupt frame pointer %p\n",
-				newfp);
+			printk("%s-- Corrupt frame pointer %p\n", loglvl, newfp);
 			break;
 		}
 
@@ -147,7 +144,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 						+ 8);
 
 			if (regs->syscall_nr != -1) {
-				printk(KERN_INFO "-- trap0 -- syscall_nr: %ld",
+				printk("%s-- trap0 -- syscall_nr: %ld", loglvl,
 					regs->syscall_nr);
 				printk(KERN_CONT "  psp: %lx  elr: %lx\n",
 					 pt_psp(regs), pt_elr(regs));
@@ -155,7 +152,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 			} else {
 				/* really want to see more ... */
 				kstack_depth_to_print += 6;
-				printk(KERN_INFO "-- %s (0x%lx)  badva: %lx\n",
+				printk("%s-- %s (0x%lx)  badva: %lx\n", loglvl,
 					ex_name(pt_cause(regs)), pt_cause(regs),
 					pt_badva(regs));
 			}
@@ -178,10 +175,16 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 	}
 }
 
-void show_stack(struct task_struct *task, unsigned long *fp)
+void show_stack_loglvl(struct task_struct *task, unsigned long *fp,
+		       const char *loglvl)
 {
 	/* Saved link reg is one word above FP */
-	do_show_stack(task, fp, 0);
+	do_show_stack(task, fp, 0, loglvl);
+}
+
+void show_stack(struct task_struct *task, unsigned long *fp)
+{
+	show_stack_loglvl(task, fp, 0, KERN_INFO);
 }
 
 int die(const char *str, struct pt_regs *regs, long err)
@@ -207,7 +210,7 @@ int die(const char *str, struct pt_regs *regs, long err)
 
 	print_modules();
 	show_regs(regs);
-	do_show_stack(current, &regs->r30, pt_elr(regs));
+	do_show_stack(current, &regs->r30, pt_elr(regs), KERN_EMERG);
 
 	bust_spinlocks(0);
 	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
-- 
2.26.0

