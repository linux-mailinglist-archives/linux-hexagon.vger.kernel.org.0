Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2221784E4C
	for <lists+linux-hexagon@lfdr.de>; Wed, 23 Aug 2023 03:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjHWBjd (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 22 Aug 2023 21:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjHWBjc (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 22 Aug 2023 21:39:32 -0400
X-Greylist: delayed 918 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:39:31 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12280E4A
        for <linux-hexagon@vger.kernel.org>; Tue, 22 Aug 2023 18:39:30 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-38-64e54ad37418
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 10.DA.10987.4DA45E46; Wed, 23 Aug 2023 04:55:00 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=KQF6NiE0QL1gk32GWjmU6zHz0hy809NUVNMBGLCp/i/ZIAsG+6h56bYhxYFXlWLvK
          kXMK8csXo139M1jgLbKuh+plkIG+aUYNpGPc7ZEQaRHDyrAI0uRWd7w7ELYUZKcIc
          sfodULF+YZiDIuqa8dq28QOZbY84hJIJEhWoRsERY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=ayz0B1ChNlQh2+FtyxkF/w32CQUROnX7PXij7h0/4v8y9UPL34Cpcs9xBgWNlvg56
          RSD6SQezX9Ks8Wt7b8E5+DNFE50/9NKgGj71ZRMRTX8pKP0r9O844Oyqisl8jjDaO
          lM5vlD5QpvAAObNuNAhSmncn8GVFgE2EYIa8QJij8=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:01 +0500
Message-ID: <10.DA.10987.4DA45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-hexagon@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:15 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGW/eK19MUgyNt/BbvW3awOTB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhI/F1+nLWLkYtDSGAP
        k0Tr4Y8sIA6LwGpmiYaGJ0wQzkNmiatLd0KVNTNKNK6fxALSzytgLXH91mNmEJtZQE/ixtQp
        bBBxQYmTM5+wQMS1JZYtfA1UwwFkq0l87SoBCQsLiEl8mraMHcQWEVCUOLz7IthJbAL6Eiu+
        NjOC2CwCqhLHJt0FGyMkICWx8cp6tgmM/LOQbJuFZNssJNtmIWxbwMiyilGiuDI3ERhsySZ6
        yfm5xYklxXp5qSV6BdmbGIGBeLpGU24H49JLiYcYBTgYlXh4f657kiLEmlgG1HWIUYKDWUmE
        V/r7wxQh3pTEyqrUovz4otKc1OJDjNIcLErivLZCz5KFBNITS1KzU1MLUotgskwcnFINjIfn
        tCl7uW/W3HjymcyOlKh7K4K2BhZfW+p9Mnjnzmv3f3NOv3iginHGnSKNZQ/i0rm0NxyK2tq/
        x+/53oqVHIsyveJZeKzuSmu6Pt5/Ojn/Z+qT6yY5gny7W5s6Am2jWFZOPJkbH1d4zHrL1zDv
        hKeR3Z/Dk878dxYu+ey8p3LipvY80c1eUkosxRmJhlrMRcWJAORuw6BAAgAA
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

