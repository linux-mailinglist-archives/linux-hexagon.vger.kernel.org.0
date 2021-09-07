Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A9540223F
	for <lists+linux-hexagon@lfdr.de>; Tue,  7 Sep 2021 04:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbhIGCYS (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 6 Sep 2021 22:24:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:53349 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhIGCYJ (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 6 Sep 2021 22:24:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630981383; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=Vf+adD7w2aYCznZWbb7pqeirNPG3QO9k1TYBCSLXyEs=; b=BLAdG2QB8CNrI+BsK//Tgbo7D98gDtD0n5q2SSayxy+m48BypDZ5QbYLKHJWRtCC5Ph4+Jdc
 U3lpg0ZI+zMY4Y1o5E8J1Ia5V4J1s/7GSpf96lzJFWKXeXjORgXucqIbd4HDhBf8CPQhdp0v
 KEfn4I+6GoABMx560zFbBMfnwMQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIwOTBiMiIsICJsaW51eC1oZXhhZ29uQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6136cd064d644b7d1cd2e182 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Sep 2021 02:23:02
 GMT
Sender: bcain=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D4F6C43460; Tue,  7 Sep 2021 02:23:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net [104.54.226.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bcain)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 39DFEC4338F;
        Tue,  7 Sep 2021 02:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 39DFEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Reply-To: <bcain@codeaurora.org>
From:   "Brian Cain" <bcain@codeaurora.org>
To:     "'Jiapeng Chong'" <jiapeng.chong@linux.alibaba.com>
Cc:     <linux-hexagon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1630920794-81114-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1630920794-81114-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Subject: RE: [PATCH] trap: Fix warning comparing pointer to 0
Date:   Mon, 6 Sep 2021 21:23:01 -0500
Message-ID: <0bcb01d7a38f$48dd1c20$da975460$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJRnG986NR9eU5XtbXbE4uuM19CKw0kYjg
Content-Language: en-us
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

> -----Original Message-----
> From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Sent: Monday, September 6, 2021 4:33 AM
> To: bcain@codeaurora.org
> Cc: linux-hexagon@vger.kernel.org; linux-kernel@vger.kernel.org;
> chongjiapeng <jiapeng.chong@linux.alibaba.com>
> Subject: [PATCH] trap: Fix warning comparing pointer to 0
> 
> From: chongjiapeng <jiapeng.chong@linux.alibaba.com>
> 
> Fix the following coccicheck warning:
> 
> ./arch/hexagon/kernel/traps.c:138:6-7: WARNING comparing pointer to 0.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: chongjiapeng <jiapeng.chong@linux.alibaba.com>
> ---
>  arch/hexagon/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
> index edfc35d..3b6e0de 100644
> --- a/arch/hexagon/kernel/traps.c
> +++ b/arch/hexagon/kernel/traps.c
> @@ -135,7 +135,7 @@ static void do_show_stack(struct task_struct *task,
> unsigned long *fp,
>  		}
> 
>  		/* Attempt to continue past exception. */
> -		if (0 == newfp) {
> +		if (!newfp) {
>  			struct pt_regs *regs = (struct pt_regs *) (((void
*)fp)
>  						+ 8);
> 

Reviewed-by: Brian Cain <bcain@codeaurora.org>


