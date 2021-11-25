Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C06A45D4D3
	for <lists+linux-hexagon@lfdr.de>; Thu, 25 Nov 2021 07:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347904AbhKYGe2 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 25 Nov 2021 01:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347947AbhKYGc1 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 25 Nov 2021 01:32:27 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C42C06139A
        for <linux-hexagon@vger.kernel.org>; Wed, 24 Nov 2021 22:26:43 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso8031622otj.1
        for <linux-hexagon@vger.kernel.org>; Wed, 24 Nov 2021 22:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/ZqZmF+q1iwRbg9wNdhq1jqh+3PguSzbZtWn7yBzt60=;
        b=VXJK1TU4jtMYNycpca5aWKzvU2ukuz5F3VcffWGQ35/7f5+0a5nkSfmje3P5MmNNEh
         Nk1NVVjwGiXgvwlILu4bS1RdSTlwvfUCho51xcj5F7NATF1zXfminVNZVln4nVrlDs7P
         MUMjgTdSUmhvorKebKb5NeZO3Yic2TdikmqGtQ30C/jKg1mbAd41pTbJgEIdLLxeLc+/
         q9dcj67TjFjA7DVwJLcBAK226K07md0+lMmDnKmsJLNTfRu7zGptcMHukdZ4yqcvvcOz
         LthwSHLoLRB7GZCwDqpzfGgzlbVWO83k4/tModrYJzr9eQ5qCwWYJDxZWxmiC9EkxvWz
         QfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/ZqZmF+q1iwRbg9wNdhq1jqh+3PguSzbZtWn7yBzt60=;
        b=FIejoyO/ustOqbyJHVtRkEiIspU6oahtWTdegjR5wx+2YjAZXRMomrdBUALPxBq9qo
         N9WXdpTt4Ud5K9wFIDuiw9CrIEuuZwtjrykYb/42+dJQgnyE+qBWXahF0d/1dNet91yS
         HOIL5lW9nWMh9FtsRNKL6JK7Z50VaDE69PDCdLUjJjjajsMh03AcppZA20uxEG4Ye+1Y
         GGPcIifoDYPJ58bbs4WolLgN8+v3q1v25xrH2Kq1A9a+C/lhWg9GcDEeN3Cy9mm1t7yQ
         uhU86fv91fqfDgBPZQuInNwluS9eg0LL3+z+cRqMIaO5SP2bI28eyabQtY66sthk+k6c
         Uh/g==
X-Gm-Message-State: AOAM530SBob/2teJDdQqQZAjJN428NTzcPp8Gi0/BDKCaaNJsWOzxXGa
        LZzMAMRTs+l+YwKrP3yNtoqyrQ==
X-Google-Smtp-Source: ABdhPJwxe15CfBYTPAm6MvjSJ3XBxtkRHNRT2cSEX8f+3r5Z3D0Uy6nf6uzlcL/4gtVAALCKD2n8Vg==
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr19252926otp.373.1637821603040;
        Wed, 24 Nov 2021 22:26:43 -0800 (PST)
Received: from [192.168.86.163] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id n6sm392870otj.78.2021.11.24.22.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 22:26:42 -0800 (PST)
Subject: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
To:     Taylor Simpson <tsimpson@quicinc.com>,
        Sid Manning <sidneym@quicinc.com>,
        Brian Cain <bcain@quicinc.com>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>
Cc:     "ale@rev.ng" <ale@rev.ng>,
        "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
        "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
        "philmd@redhat.com" <philmd@redhat.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
 <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
 <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
 <8845de00-ddc7-86a3-600f-6ede81e168c2@landley.net>
 <8192e9bb-a0de-1b2a-271c-ac7323be8244@landley.net>
 <BYAPR02MB48863186EDD71439C60792A0DEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <ee0ee7c5-22e5-2c79-695d-e66ae39bb5fb@landley.net>
Date:   Thu, 25 Nov 2021 00:26:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48863186EDD71439C60792A0DEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On 7/26/21 8:59 AM, Taylor Simpson wrote:
> We're working on system mode support for Hexagon, and we plan to upstream it when it is ready.
> 
> Thanks,
> Taylor

Any progress on this? (Is there a way for outsiders to track the status?)

Thanks,

Rob
