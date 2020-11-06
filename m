Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C951A2A8EF9
	for <lists+linux-hexagon@lfdr.de>; Fri,  6 Nov 2020 06:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgKFFmS (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 6 Nov 2020 00:42:18 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:20256 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgKFFmR (ORCPT <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 6 Nov 2020 00:42:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604641337; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: To:
 From: Reply-To: Sender;
 bh=l3xVv4fUlyNXeiFyHav1PYFEEJzdPnHccCBwqokY+MI=; b=WI0UmGtPc+RsNpd0QageN+RD3tpvHS1HG8e0cNugs2t9mWw1x/lD09fGqy+OLmu1aPVg1CRU
 Y1iRp6XMjwu1DLwwctOKNTu0DT4GsPi86UcH/0jAnrU1TGJmNnhZZgVBSWtzSLD/iznOjFWF
 jxnOc7gwWPJsRuxulTDEZBgirIk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIwOTBiMiIsICJsaW51eC1oZXhhZ29uQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fa4e2331f7506a997b9183a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 05:42:11
 GMT
Sender: bcain=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 824D1C433C8; Fri,  6 Nov 2020 05:42:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from BCAIN (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bcain)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24852C433C6;
        Fri,  6 Nov 2020 05:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24852C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bcain@codeaurora.org
Reply-To: <bcain@codeaurora.org>
From:   "Brian Cain" <bcain@codeaurora.org>
To:     "'Jens Axboe'" <axboe@kernel.dk>, <linux-hexagon@vger.kernel.org>
References: <249d67ab-c3ea-0802-c06a-0f35ae3673d2@kernel.dk>
In-Reply-To: <249d67ab-c3ea-0802-c06a-0f35ae3673d2@kernel.dk>
Subject: RE: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
Date:   Thu, 5 Nov 2020 23:42:07 -0600
Message-ID: <246d01d6b3ff$918170a0$b48451e0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI0o2K/fukCz5iEf6pil2HrCjCuSqj+menQ
Content-Language: en-us
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

> -----Original Message-----
> From: Jens Axboe <axboe@kernel.dk>
> Sent: Thursday, October 29, 2020 11:14 AM
> To: linux-hexagon@vger.kernel.org
> Subject: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
...
> --- a/arch/hexagon/kernel/process.c
> +++ b/arch/hexagon/kernel/process.c
> @@ -174,7 +174,7 @@ int do_work_pending(struct pt_regs *regs, u32
> thread_info_flags)
>  		return 1;
>  	}
> 
> -	if (thread_info_flags & _TIF_SIGPENDING) {
> +	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
> {
>  		do_signal(regs);
>  		return 1;
>  	}
> --
> 2.29.0
> 

Acked-by: Brian Cain <bcain@codeaurora.org>


