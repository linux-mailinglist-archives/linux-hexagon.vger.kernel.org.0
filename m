Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F313E2A97C9
	for <lists+linux-hexagon@lfdr.de>; Fri,  6 Nov 2020 15:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgKFOi6 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 6 Nov 2020 09:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgKFOi6 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 6 Nov 2020 09:38:58 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2C0C0613CF
        for <linux-hexagon@vger.kernel.org>; Fri,  6 Nov 2020 06:38:56 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id e21so1067448pgr.11
        for <linux-hexagon@vger.kernel.org>; Fri, 06 Nov 2020 06:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=k9MVexHhsCQYAbTIlzM9U3zpnKnUWgjhpsgc0swB1UU=;
        b=1+c4T3c7UfdNbidxS4xqcg9BX5gdmxIqeBmc4okb8Bli1sGaD5eQvvLAQUBP4NhNPt
         JjuHRD479ATHM55bPlQUfWIaI8NHizQwaYeYmWCcA3vmmL0tgfnBFdNKhnGFtqoicY/j
         XdXnGOLptzSBU8TLy5hYwbktM9V0XsxtffiJ0vdb26TsFwWxd0pEUGqLRbVpTT4LJLFR
         wLWDWWvb+xv1qdPRFwHnQXheXz9e+0rnmwYIkc/2cnd3xX38k2BX3Ynq+K3UgxeuGerE
         q0Amcmd7eF5GRd66mw58m3debGe2egN3/s5MqspHnbEstm1ezHaKMOTEgVeOHLvj/sAg
         kS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k9MVexHhsCQYAbTIlzM9U3zpnKnUWgjhpsgc0swB1UU=;
        b=p8wsCnqZdvG5KG+msFZsvVudJYXjz3nDiO57yCRzI8MG7+bhgs9azE0aSNzTp7hF5q
         nne1mX7jgARl3m57k+bWZxoemg863PCJpxZP5ctgz38eFzodu1khQmH2iU5IxCAXEhja
         /iwV4N3DXtAeI1XmnSWJ19DiXoy8cWWi7isA7odiFwu7OVoL/2zrq0LjbMp4iyQut6km
         oLTDiJdGAaWtfnQx8K/miRUP90aafakRERTZgHaD6yZY78KJtKl7HBNcV0qpHiJQYgXu
         2ig4+H8fC/+BkgJFoghvCXY5x6LSMphIW9yxGBVEQ2AAbKpkA0ClTngn4UTN01VYoPgF
         twag==
X-Gm-Message-State: AOAM530SJUI0uYmovaTzOns11p18iNureoDNQfAXXOlgECS4d+K1bFFX
        B6jevLcCPz4FNhSmSkZKcFEEzj8FW/FOZQ==
X-Google-Smtp-Source: ABdhPJzz5Hxbj6mEJp9MZdBJJ0UC+G4tnoN1JDGwd/4GhvtYLfXd3+yGGvs05cgCp9+eKa14DUGZRw==
X-Received: by 2002:a63:5c42:: with SMTP id n2mr2030221pgm.14.1604673536103;
        Fri, 06 Nov 2020 06:38:56 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id j20sm2022605pgl.40.2020.11.06.06.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2020 06:38:55 -0800 (PST)
Subject: Re: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
To:     bcain@codeaurora.org, linux-hexagon@vger.kernel.org
References: <249d67ab-c3ea-0802-c06a-0f35ae3673d2@kernel.dk>
 <246d01d6b3ff$918170a0$b48451e0$@codeaurora.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <98246feb-68f5-5bc5-9009-05062b5c14a8@kernel.dk>
Date:   Fri, 6 Nov 2020 07:38:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <246d01d6b3ff$918170a0$b48451e0$@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On 11/5/20 10:42 PM, Brian Cain wrote:
>> -----Original Message-----
>> From: Jens Axboe <axboe@kernel.dk>
>> Sent: Thursday, October 29, 2020 11:14 AM
>> To: linux-hexagon@vger.kernel.org
>> Subject: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
> ...
>> --- a/arch/hexagon/kernel/process.c
>> +++ b/arch/hexagon/kernel/process.c
>> @@ -174,7 +174,7 @@ int do_work_pending(struct pt_regs *regs, u32
>> thread_info_flags)
>>  		return 1;
>>  	}
>>
>> -	if (thread_info_flags & _TIF_SIGPENDING) {
>> +	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>> {
>>  		do_signal(regs);
>>  		return 1;
>>  	}
>> --
>> 2.29.0
>>
> 
> Acked-by: Brian Cain <bcain@codeaurora.org>

Thanks Brian!

-- 
Jens Axboe

