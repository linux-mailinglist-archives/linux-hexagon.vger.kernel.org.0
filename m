Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89A151A9C9
	for <lists+linux-hexagon@lfdr.de>; Sun, 12 May 2019 01:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfEKXmH (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 11 May 2019 19:42:07 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:41380 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfEKXmH (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 11 May 2019 19:42:07 -0400
Received: by mail-ot1-f49.google.com with SMTP id g8so8708047otl.8
        for <linux-hexagon@vger.kernel.org>; Sat, 11 May 2019 16:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uEfGTgH06rVD4WLpHRft1LYOFDn4WA2WBKmp6rJ79bc=;
        b=BTc0WWS4I1IW20ioEQbSKZfXhbaTcAdYXYof8GH6rKB/oVj7Vlvw8W+nBpxxts8l49
         tZj9Oxeovzgk1QRLMyFuNnsBpZxEmUR+pHcPUuP3bh23KpHBFp+CTssUYyz8ITTeJSfs
         cvsoyO8os3IUqFUIedSAmthMGHuDzm4PD7r1itgJECcASpRyQpLh9wDXOrRwUmQAGZMG
         Wc0zUqOKpvRnGKflziJuTpbLhKox8lmSVoO/2AaXRUpe8W/wcxSQKR5gLPsAO6y3IM+f
         UvMOs0dbFzZ+VSzpwbMxDYghm9YKjJYgw8S/W9JDwGIJS1+9V7YRtel9VrornSzrslk4
         n4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uEfGTgH06rVD4WLpHRft1LYOFDn4WA2WBKmp6rJ79bc=;
        b=iPzkutG86WLL/rTWKOxCh/0b9OGsuoG205OmFqxTKJ7VwQuYwziQ1O7gp6Tfaue6dg
         XJVJc1SAgm+xSYITdVuYbWYly17ciV0jV3ZK9wcFgpOmBUNVvdemVdNTPoPQXctcgSvt
         wo2NY2n8mYU5+m7+xV/WBITr7MpU0HqwbbDBpansMDK6n+y5BqvD2otLZCTpH8xDRXNg
         CUTefoMAvvGMUGLchPj6+N3cTCsdr494eY/8I8vsUd+EaBIWG8Y74ah8whcZoFtJQN1D
         KHCl9wh4k2QdDVq9ORLfMhE7YMKOMiVArlk9RoNCHzs1i5sLPFdwwJ4cQSiCWw41t4ug
         qUxw==
X-Gm-Message-State: APjAAAW2KJtvAR88qWmc70AmY/rvsKKCeZAdaGqHxOCHnR4dDFBB+j3z
        TDUNLD2jhcGcXA/ryVTNenENxQ==
X-Google-Smtp-Source: APXvYqwSzzZ1q8HBFaRmi7k4mZL28C1qqnI8fF7hRXEdXBFGf2O7ZeN5NHWAs01OH0QcS+1zm0HfaA==
X-Received: by 2002:a9d:6543:: with SMTP id q3mr11097553otl.370.1557618126961;
        Sat, 11 May 2019 16:42:06 -0700 (PDT)
Received: from [192.168.43.9] ([172.58.99.220])
        by smtp.googlemail.com with ESMTPSA id a1sm4121038oiy.38.2019.05.11.16.42.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 16:42:06 -0700 (PDT)
Subject: Re: Question: cross-compile meets binutils problem
To:     Chao Fan <fanx.chao@intel.com>, linux-hexagon@vger.kernel.org
Cc:     philip.li@intel.com, zhijianx.li@intel.com
References: <1557217620.12221.20.camel@intel.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <d83da253-b9f3-0d63-12ef-933fe916ce8a@landley.net>
Date:   Sat, 11 May 2019 18:42:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557217620.12221.20.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On 5/7/19 3:27 AM, Chao Fan wrote:
> Hi all,
> 
> I am going to build the cross-compile toolchain and build
> hexagon kernel on x86 machine.
> The gcc version is 7.3 and the binutils version is 2.32.

I thought the recommended hexagon toolchain was llvm-based now? They attached
their build script to the end of
https://www.spinics.net/lists/linux-hexagon/msg01706.html and that downloaded
source when I tried it...

Rob
