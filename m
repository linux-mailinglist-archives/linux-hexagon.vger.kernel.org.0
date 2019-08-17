Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAAA912D9
	for <lists+linux-hexagon@lfdr.de>; Sat, 17 Aug 2019 22:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfHQU6T (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 17 Aug 2019 16:58:19 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35213 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfHQU6T (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 17 Aug 2019 16:58:19 -0400
Received: by mail-io1-f68.google.com with SMTP id i22so13187055ioh.2
        for <linux-hexagon@vger.kernel.org>; Sat, 17 Aug 2019 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=NuXJCtDYAF42ezbdDjEFYfu2iBTjQndKb/Edf61OrOk=;
        b=PCXESTLeUcBNUWogs1gHv/iSg/bRj7rmybc37GwKrHxDe7CTeYQGPE82FFro2CLT61
         8Q4IgUqoS7Jmsm9wuhAF9CCdJ8jA631YD8dGqkPPvzXyvuP2itYPnDRcHbp+2vkqaUSt
         u4rxsZS9lGz/LPzZ8kGOEVrnbFqSW3syoXedbPJGimP78UP/Tg6J92XflG29pM3lwatF
         OjAvDNX5+3tv2rh85pO4hmLeTRsEGL0KJ9d8KAbhP2qYNSdGVQpqF+mf38a8oxmStDJ9
         9nvCgcj7mRwE6p6VKc6zn+f1lPTm2K1/WP8Olg56A4X8/QbiEq8e7laZGSLETkAb5Egu
         FN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=NuXJCtDYAF42ezbdDjEFYfu2iBTjQndKb/Edf61OrOk=;
        b=uZXv7MS+7BIusZqOGyvA2f5kaFbbgasfqodi/zP/RDuKJ0+K0EbMlhMA2pv/thtW8y
         1hMw64QqERMixkKvGZziLodPs6Q6Hi4jfF4Kjdewi9wZLhWttInHAIQuZ/i47m+3MOVs
         m4JDekU+sjt5nQ9Bfsk3p0HUKTYTdfhSYXJEaKA3UGOGHORKQCkQuawwJLhI1jhjBBny
         HjhwA5HW7QO7iHPDLTAwx6RhcqAoK8/JgsT+8o8Iq16k7IMf09CZbnxoltU3zkTPgM2T
         TaHxYFnsZr+GorIhwRIiU2JNynmVLfus5GiUL2TH+BtKflTeXUY4ZSgePPlY8++pgRjr
         i6Qg==
X-Gm-Message-State: APjAAAXJLnKk5TIgdSTboCEk1Jspt10CKuc2XNXhxhYuKeRvQ68rpyB4
        kCW1Mu2EsiWIjAt3bO8+hNH/0Q==
X-Google-Smtp-Source: APXvYqyKpLbmhNe3o5mV41HWvHYU+SiPLQTRVuTNOtg0cL831wKHUivDHHya6XYWHKa9ZnFnQ2CM9Q==
X-Received: by 2002:a6b:8f0d:: with SMTP id r13mr15237433iod.121.1566075498344;
        Sat, 17 Aug 2019 13:58:18 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id 6sm9905577iog.40.2019.08.17.13.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 13:58:17 -0700 (PDT)
Date:   Sat, 17 Aug 2019 13:58:16 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Christoph Hellwig <hch@lst.de>
cc:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
        linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 14/26] asm-generic: don't provide __ioremap
In-Reply-To: <20190817073253.27819-15-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de> <20190817073253.27819-15-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> __ioremap is not a kernel API, but used for helpers with differing
> semantics in arch code.  We should not provide it in as-generic.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv


- Paul
