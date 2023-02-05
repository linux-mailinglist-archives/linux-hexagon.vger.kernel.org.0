Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFBE68B1A9
	for <lists+linux-hexagon@lfdr.de>; Sun,  5 Feb 2023 21:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjBEUlx (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sun, 5 Feb 2023 15:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjBEUlq (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sun, 5 Feb 2023 15:41:46 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158961C5B5
        for <linux-hexagon@vger.kernel.org>; Sun,  5 Feb 2023 12:41:39 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id r3so134483edq.13
        for <linux-hexagon@vger.kernel.org>; Sun, 05 Feb 2023 12:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=RAXg4fKD/6SPLwBhZz74xHccwCI6WZIYpGpGHWQ9ObJeCvGoohTSAtwCqfiD+ZaDQ1
         aIRLI8OL+avYEEBlM4uINCdq7A3GKoZhraxTCpB9pYCimwQ4kIElEWhkml7G/7PEKTT6
         Vy21ly1st4HkkM+1bI4kXV+bK57J6A6HvWAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=3xjqHHy6X4hhfj7eMEVQm6B2LxlCiWpImmFOGaADEYs8CIpQSwjSQ5yQhYDNNIjtfN
         tPc8xCedAqoNb0U9DxW9oV6qZ3Ez6Mr6CU4zd+5fdarPhfQvi46S1stKbv8FtXe/kLe7
         cGq/KF/Ni8RPyu7MZqbKh2hL8/flEKse8daFIA1RNDwk2BqJjNANEsv5cYdt4k1Ml9WP
         K4Gpf40iOEdw/O24wy1bvzyuUdf+fGPPMXx8mOkp7ZKdWA6vc0NDbzfzyEcpgoy/CVEv
         jHqddVJUQqQKOr3iJOdlp1rxszl+oRC8iIvQbII0UHCTsEo+hGDwBDUGOACz4hq7MyOl
         ZPpA==
X-Gm-Message-State: AO0yUKXdZn8GxHLiNdVgki9mPa3QwmAPtoM8pAF1lqfwHqv0JQOMB7+X
        PelSB4erj2GiujBjNoJqX/D/QBzGb4jSEJwtstA=
X-Google-Smtp-Source: AK7set98SQluW7xUTcTW6VamAM1RcW2Oh5qbEdxzfUji9qU4XVkoidSlGNS2gbORVwFbUh7mstdFrw==
X-Received: by 2002:a05:6402:1f83:b0:4a2:51db:c7c6 with SMTP id c3-20020a0564021f8300b004a251dbc7c6mr17929857edc.8.1675629697321;
        Sun, 05 Feb 2023 12:41:37 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id b9-20020a0564021f0900b004a21304f5a0sm4206639edb.72.2023.02.05.12.41.35
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id dr8so28886301ejc.12
        for <linux-hexagon@vger.kernel.org>; Sun, 05 Feb 2023 12:41:35 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4402604eje.78.1675629695651; Sun, 05
 Feb 2023 12:41:35 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV>
 <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org> <Y+AUEJpWYdUzW0OD@ZenIV>
In-Reply-To: <Y+AUEJpWYdUzW0OD@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Feb 2023 12:41:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Finn Thain <fthain@linux-m68k.org>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Sun, Feb 5, 2023 at 12:39 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, since these patches would be much easier to backport than any unification
> work, I think the right thing to do would be to have further unification done on
> top of them.

Ack. I'm not NAKing the patches, I was just hoping that we also have
some way forward.

So "fix the issues, then unify" sounds like the right thing to do to me.

               Linus
