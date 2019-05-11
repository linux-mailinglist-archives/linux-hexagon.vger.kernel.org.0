Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D931A9CB
	for <lists+linux-hexagon@lfdr.de>; Sun, 12 May 2019 01:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfEKXsb (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 11 May 2019 19:48:31 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:41207 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfEKXsb (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 11 May 2019 19:48:31 -0400
Received: by mail-oi1-f179.google.com with SMTP id y10so6958357oia.8
        for <linux-hexagon@vger.kernel.org>; Sat, 11 May 2019 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=LzknJ3lRrLxqdIX/5trKGI+aRcwmg6Oz29ljvO0jD54=;
        b=VNfin4yWIrS47LOFQVe8crNZJVTrXq5jyofYupW+CAk+728he8qqvsa4UKV0MNSKJQ
         PVxGhIIGxFeltnkp4Yn3B/J1ixNwbxA8VETK3Easnlt4LKLAH2cGhleB3rclyXbpBGw9
         9sC348jIUg5SJziyu0xiXO96e/lBUfzg3b0u8EMIk4IjcAJFe8cCGx9ChkUftElVVyr+
         Vu06JqTw/TkUCJSXnielpm8hp5/z6IYHORU0X3R0Zz4G14aq106qXskuCiManB/hEKLw
         4pPhlMJYnEZWq48yKx9ZGrlZ/mXHrMJj/DiCIraRKWsuRLv98Pp3af2/MAB952uqb4NP
         48nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=LzknJ3lRrLxqdIX/5trKGI+aRcwmg6Oz29ljvO0jD54=;
        b=X2pmqVh1ZuqR42tZ3+rA1w6aXkWnvUNYGr0fTa4CCTqzxbJ9RhX3dHZqOTKDhddxdW
         pmeenN+p7dXgBeRKSUV88CcXCXb8cDfb6Fn6iRVzbIjSqOMk7uE9eADhIBfntF/qXUBl
         lq0btV2vl94Xfu414Rwtd0m17Way5WF+YTnwqxWXUTuhBEABUv4UerpN0dbONprryPzq
         J0Mf2lIbaF8y7pLAK6FwEe1H25//Zk8cSRqDkq2nKshWJA0+DbJmJbGxh2Yuh/GcKqH/
         Lx7LIKfz+nZBY9XP2yCredxnYB0/2rYB4RzgwoMx6obf428hj5ClmmEcTx/CnGF1curC
         8HXg==
X-Gm-Message-State: APjAAAVUiXDOSTWiKY+Koiw/1333bSJ81lPnl3GpRxSJlVPOj5l/KkgQ
        ZixI+DFyTvj0F7/YSCnxBnrMmnp9FW0=
X-Google-Smtp-Source: APXvYqz2pX/43wGSxSER0dgnDX6H4F6utk8CvpEBfUwehpshzgBG5SvSLGOCT5dW5A1JfYoQdMqk2A==
X-Received: by 2002:aca:c450:: with SMTP id u77mr6645784oif.119.1557618510095;
        Sat, 11 May 2019 16:48:30 -0700 (PDT)
Received: from [192.168.43.9] ([172.58.99.220])
        by smtp.googlemail.com with ESMTPSA id w20sm3677577otm.41.2019.05.11.16.48.29
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 16:48:29 -0700 (PDT)
To:     linux-hexagon@vger.kernel.org
From:   Rob Landley <rob@landley.net>
Subject: Running hexagon Linux on a pixel 3.
Message-ID: <56a536f1-f7e4-2daf-4b5c-9fe0dad4ba03@landley.net>
Date:   Sat, 11 May 2019 18:48:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

I'm looking at buying an unlocked Pixel 3 axl, and I'd like to be able to reboot
it into Hexagon Linux. What would be involved in doing this?

(I can even buy a spare one to play with if it would help. Probably wouldn't
have a data plan, but there's always wireless...)

Rob
