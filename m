Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 537D9620EA5
	for <lists+linux-hexagon@lfdr.de>; Tue,  8 Nov 2022 12:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbiKHLVb (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 8 Nov 2022 06:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbiKHLVW (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 8 Nov 2022 06:21:22 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E4545EE0
        for <linux-hexagon@vger.kernel.org>; Tue,  8 Nov 2022 03:21:21 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-36ad4cf9132so130635207b3.6
        for <linux-hexagon@vger.kernel.org>; Tue, 08 Nov 2022 03:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=WGKRB/pLaIjpmGXOx2LuwSkikxvZJWCPzj3t5FrAdj35xH9byZDFkulm2wmKuPrHcW
         BXlWOJ64Tk2V1TFItuyRjbEG64JpFDnOfR4G1ElhijqzCv+/iTDTwHlpfvMlxmbM4BMh
         mdxB9KfnY1DCz1XbT06CMT/qkkgOuWuXPxw9oWOGZ8iw0/62EIvhKoa4IDxoVL9Db1jM
         ahOgc2W+cmdzEXjJYKj8kAyHCGsyj4J8oqLzjWS2Txo69AztjfoBgv/fT6ncVpuswC5r
         kjpUAvsSlgO08sSAjPDLsWyg4bdZkb88WQvlipWLscUclIAVTPIQ3ZzAs926L27Ix25J
         A4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=rpi68Rpgzr/Nu9YGd7mrx1OJ96UKLUlVm37dyq8bjNUcNKQkWHcUiyseiP42rg+wLD
         nnBfSqWupfx2ECFmkkoQlmmqyYbtOkj3EgXvxwyQLhNpNt788INz/kVdh5D67d/YBunU
         Y56UVD72ZRlw650zK3XdsZZyLBTCiCchJKzG/c3iqJI31taxKkdntsYuI/vfRIVi+z+n
         ZUX1hfGff3w6E7igL7DwDyxBqP3lZmNyVjimEqetTLf47LkN2kvt+/4ZwUJglGfoRWYN
         xdcODZjYsC7FVKDEc0E7PkKDt3XNbaHM0v50N2VtLA2nGM4a91m+Xk3p3vP82AFQxpfb
         SSsg==
X-Gm-Message-State: ACrzQf1GSTfSud56iVvjQ71eXmPS21cC7gqYqLOEyH9dDtqaHSAGkGO6
        S1oYuYXYWnM9MvPj4zhPEa7Wbo8vt3I/BaBYoT8=
X-Google-Smtp-Source: AMsMyM4FUZeyScKefVyfEIrOJHG3QP81BEZo0LPg3KK8qCTVuoCycevGJkKBG7F2M9IXRYrx7GH6JAFcOsYbyBtHgzo=
X-Received: by 2002:a0d:de83:0:b0:337:c0bf:12ee with SMTP id
 h125-20020a0dde83000000b00337c0bf12eemr50480942ywe.289.1667906480773; Tue, 08
 Nov 2022 03:21:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:a38a:b0:313:c983:1d7e with HTTP; Tue, 8 Nov 2022
 03:21:20 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik2@gmail.com>
Date:   Tue, 8 Nov 2022 03:21:20 -0800
Message-ID: <CAC9COZeS659=-gSvoR3SCbj2pRfVsjsKRciV6Wdz6fvX9r=dBg@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1134 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5115]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik2[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

-- 
Hi

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

If you are interested for more details.....

Sincerely,
Kairi Andrew
