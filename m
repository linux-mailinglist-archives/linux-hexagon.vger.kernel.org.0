Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBFD2A8516
	for <lists+linux-hexagon@lfdr.de>; Thu,  5 Nov 2020 18:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731638AbgKERjT (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 5 Nov 2020 12:39:19 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:64212 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731654AbgKERjS (ORCPT <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 5 Nov 2020 12:39:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604597958; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: To:
 From: Reply-To: Sender;
 bh=rn2zOrxjeO9mkJ4uA59lq1sCDCVPnIsfAPb653VGjY0=; b=sNuSNfqLDJlovisFfudBYl5DWX0pMyR0lTSvrL6G2nvT7eMEk3IerV6U8uv6nULlbW+v1aRG
 zmipZ3fkE/icXj0bQ5B83rJYSwY9j76cicbW9MjQ/K4I4IsOKt++o7l6qZGxw4LQU58PrQ1G
 m8CCfYUjUTDY1VRSomxnokJBuE4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIwOTBiMiIsICJsaW51eC1oZXhhZ29uQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fa438b2a39cfb5f6c622021 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Nov 2020 17:38:58
 GMT
Sender: bcain=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D099C433CB; Thu,  5 Nov 2020 17:38:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net [104.54.226.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bcain)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F982C433C6;
        Thu,  5 Nov 2020 17:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F982C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bcain@codeaurora.org
Reply-To: <bcain@codeaurora.org>
From:   "Brian Cain" <bcain@codeaurora.org>
To:     "'Jens Axboe'" <axboe@kernel.dk>, <linux-hexagon@vger.kernel.org>
References: <249d67ab-c3ea-0802-c06a-0f35ae3673d2@kernel.dk> <940b6ee7-1794-cddc-1565-dd86b11f4226@kernel.dk>
In-Reply-To: <940b6ee7-1794-cddc-1565-dd86b11f4226@kernel.dk>
Subject: RE: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
Date:   Thu, 5 Nov 2020 11:38:53 -0600
Message-ID: <000001d6b39a$893d26b0$9bb77410$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI0o2K/fukCz5iEf6pil2HrCjCuSgMU6JMQqOU6c2A=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

> -----Original Message-----
> From: Jens Axboe <axboe@kernel.dk>
> Sent: Thursday, November 5, 2020 10:19 AM
> To: linux-hexagon@vger.kernel.org
> Subject: Re: [PATCH] hexagon: add support for TIF_NOTIFY_SIGNAL
> 
> Gentle nudge on this one.

Sorry it slipped off my radar, I'll review it today.

-Brian

