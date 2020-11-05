Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C562A8358
	for <lists+linux-hexagon@lfdr.de>; Thu,  5 Nov 2020 17:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKEQTG (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 5 Nov 2020 11:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKEQTF (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 5 Nov 2020 11:19:05 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECB1C0613CF
        for <linux-hexagon@vger.kernel.org>; Thu,  5 Nov 2020 08:19:04 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id n12so2371991ioc.2
        for <linux-hexagon@vger.kernel.org>; Thu, 05 Nov 2020 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KEND0Z5F1AbeDY7nmskXasNMlfybI+Yed7+GImwShSQ=;
        b=kJrYwBhOa9De32ik7HBahKvGc7OKoVFaeMZcdaQ/1+jXz2tyG10cNbxRJGPKGU239x
         n7yuISY1BsXm3U4g7H/y4h4XVd/W4/dMMt+oW5IqhKWiWa2V26UjxMg6zZhMcgE28js+
         XwFIChOOP0tQaL2kTVNdJqyNfNeTqNCFeIGBbIJ+gXsowc4F1nUl3cBHfWeXbeHbPgCq
         v/LoeJey7lOTsUGEnDdQRbmG5zz5lk0Wjz6Z15V60IpKvYhajknlZyn3PzrCm1a3vTiY
         yL1hUvBsz+zR9Tlr7GZK0ZYyvxxFWogyq0pQWmPJ70Tp+40EbBJfVUGXqEIfSduCuQQP
         VhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KEND0Z5F1AbeDY7nmskXasNMlfybI+Yed7+GImwShSQ=;
        b=GHLiuBtLKaofYt8/nhje7LKkJIJrLk0ADkvRlPZTtJMGo9jq0sQYMwte2ajqPeTDrb
         47COT7bmvB0lxEYpbo+kZailo8HzOPJIBrgrR+gHTW1BXr0/4A8LBqgTtsk2qBvjR4tu
         SywCpbo1l/eExErbJlAQqQM58SXax8/UlSXKMkrBD1x7VyythljGkIjjN47lxnhb2eMu
         C+pOuCbxT/TrshH+gyBLJLtfVy1w1YqA/kfGYsnBcXsYpcuptd1Us5Vp7PtCDmLIRouI
         LqEIv06xcEiVgUhQ2MiEb64YnGSyC/HEVMB6nsAt6baaVTQHpF4nyyD/Jw+dT4z5omjm
         XNyA==
X-Gm-Message-State: AOAM531YkfKJqVP/0r1hp5djudO6F/utgy/TxkO459n4GNUQP7a8sKJO
        UjIOMizGr4u94Rjkww3pMcqOkoCI9eSXHQ==
X-Google-Smtp-Source: ABdhPJwbNKNWpWVN12tUz4Aisyfup8hppQoJ4wBZn+QxgSFyW8Sl98EAgVTW7nwa3KPAGQLe6tpz8A==
X-Received: by 2002:a02:ceb2:: with SMTP id z18mr2602296jaq.101.1604593143376;
        Thu, 05 Nov 2020 08:19:03 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id w12sm1346477iou.42.2020.11.05.08.19.02
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 08:19:02 -0800 (PST)
Subject: Re: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-hexagon@vger.kernel.org
References: <249d67ab-c3ea-0802-c06a-0f35ae3673d2@kernel.dk>
Message-ID: <940b6ee7-1794-cddc-1565-dd86b11f4226@kernel.dk>
Date:   Thu, 5 Nov 2020 09:19:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <249d67ab-c3ea-0802-c06a-0f35ae3673d2@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Gentle nudge on this one.

On 10/29/20 10:14 AM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for hexagon.
> 
> Cc: linux-hexagon@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/hexagon/include/asm/thread_info.h | 2 ++
>  arch/hexagon/kernel/process.c          | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/hexagon/include/asm/thread_info.h b/arch/hexagon/include/asm/thread_info.h
> index 563da1986464..535976665bf0 100644
> --- a/arch/hexagon/include/asm/thread_info.h
> +++ b/arch/hexagon/include/asm/thread_info.h
> @@ -95,6 +95,7 @@ register struct thread_info *__current_thread_info asm(QUOTED_THREADINFO_REG);
>  #define TIF_NEED_RESCHED        3       /* rescheduling necessary */
>  #define TIF_SINGLESTEP          4       /* restore ss @ return to usr mode */
>  #define TIF_RESTORE_SIGMASK     6       /* restore sig mask in do_signal() */
> +#define TIF_NOTIFY_SIGNAL	7       /* signal notifications exist */
>  /* true if poll_idle() is polling TIF_NEED_RESCHED */
>  #define TIF_MEMDIE              17      /* OOM killer killed process */
>  
> @@ -103,6 +104,7 @@ register struct thread_info *__current_thread_info asm(QUOTED_THREADINFO_REG);
>  #define _TIF_SIGPENDING         (1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED       (1 << TIF_NEED_RESCHED)
>  #define _TIF_SINGLESTEP         (1 << TIF_SINGLESTEP)
> +#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  
>  /* work to do on interrupt/exception return - All but TIF_SYSCALL_TRACE */
>  #define _TIF_WORK_MASK          (0x0000FFFF & ~_TIF_SYSCALL_TRACE)
> diff --git a/arch/hexagon/kernel/process.c b/arch/hexagon/kernel/process.c
> index 5a0a95d93ddb..82cd7a026eb3 100644
> --- a/arch/hexagon/kernel/process.c
> +++ b/arch/hexagon/kernel/process.c
> @@ -174,7 +174,7 @@ int do_work_pending(struct pt_regs *regs, u32 thread_info_flags)
>  		return 1;
>  	}
>  
> -	if (thread_info_flags & _TIF_SIGPENDING) {
> +	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
>  		do_signal(regs);
>  		return 1;
>  	}
> 


-- 
Jens Axboe

