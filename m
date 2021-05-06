Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD163758BE
	for <lists+linux-hexagon@lfdr.de>; Thu,  6 May 2021 18:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbhEFQxp (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 6 May 2021 12:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236124AbhEFQxp (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 6 May 2021 12:53:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD57C0613ED
        for <linux-hexagon@vger.kernel.org>; Thu,  6 May 2021 09:52:45 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t11so8716885lfl.11
        for <linux-hexagon@vger.kernel.org>; Thu, 06 May 2021 09:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWUyBsKmAFKnzuyTle8X+IqQwBw635MonpJL6f0XlXs=;
        b=Toi2dF2JP14eu4kDfyv/A1fcV9pf6T+Oy+B/5i1euIBOSEjCs0r1EEBYOP0PvA837S
         F3eZH0yldWBxMDKkApRB8/r4ihrk53nSarJ8P+bAJKHUUjAZxB6tuMnMXudJJCPPXAdJ
         ANsg5C6zlsR30xcTNcPKU1hbbeizg3CKUy4gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWUyBsKmAFKnzuyTle8X+IqQwBw635MonpJL6f0XlXs=;
        b=HZ3J0KaZ/Fj2NtlVIJqeFIQsKHvDhQBT8VcgqR0+psaEDIEI2xbUrRfdDfqjto57QI
         wku0sbfmlzFBOft/WJdAS282WaZTMp0sarsulLktXykW8BxGXSl7gYPadf7KjH289Xdv
         3fopQOIeduMaWnJOlNhYJ3XCgqGxogg9wd0a5uL1mwh8tstB6a6l8BqZfcsh1jWoZYm7
         huHf/eVFk/VWX0ob9YV7qUSXyiIksKUC5+ZX0AjiFrlVd8FweISszpAIpaS38ILPouh8
         wtSuQ3oA5LyZOVAFFe/Idy3xl144A9dH2oCmvwNqzxC8YFQmQheylxsmLbq7yyRTl/nK
         dH4w==
X-Gm-Message-State: AOAM532r14b4OCcwWH0zNy2Hy4KUEgs7vnksNWfBN6TLh4KpnuI9YKGU
        b3gslQjr4Fpw87bmRhWZz1nxlSUj9AVe5Dr91Y8=
X-Google-Smtp-Source: ABdhPJyZTP+OYjHxCnL0VlNpGCHTBPJ7FcUA5NFdKM3BKCLxKpzzW08LXLCkBrsdS6+/MelJdNCEeA==
X-Received: by 2002:ac2:4e44:: with SMTP id f4mr3728297lfr.380.1620319964158;
        Thu, 06 May 2021 09:52:44 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id t5sm1065106ljc.78.2021.05.06.09.52.42
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 09:52:43 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id x19so8775738lfa.2
        for <linux-hexagon@vger.kernel.org>; Thu, 06 May 2021 09:52:42 -0700 (PDT)
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr3512256lfg.40.1620319962710;
 Thu, 06 May 2021 09:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <a81e116ba3d64aab8d379703bedcf032@codeaurora.org>
 <CAHk-=wgU-ERpeM0CJnN8JTVVUsBRtgpvU33sKke67V6pZj6A=g@mail.gmail.com> <81ecc015b1bd773f583cc86490e392a0@codeaurora.org>
In-Reply-To: <81ecc015b1bd773f583cc86490e392a0@codeaurora.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 6 May 2021 09:52:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiOp-Q0sFhmzGy2R=uMNV7Q26yqjeKNnwCnXgffnuDc9Q@mail.gmail.com>
Message-ID: <CAHk-=wiOp-Q0sFhmzGy2R=uMNV7Q26yqjeKNnwCnXgffnuDc9Q@mail.gmail.com>
Subject: Re: [GIT PULL] hexagon changes for v5.13
To:     Brian Cain <bcain@codeaurora.org>
Cc:     linux-hexagon <linux-hexagon@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        sidneym@codeaurora.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Thu, May 6, 2021 at 9:17 AM <bcain@codeaurora.org> wrote:
>
> I apologize -- in my initial account setup I'd done the key creation
> without a signing feature/capability.  So in order to sign the tag I
> realized I needed a new subkey for signing.  I tried broadcasting the
> new key but perhaps I did not send it correctly.  I'll try it again
> today.
>
> http://keyserver.ubuntu.com/pks/lookup?search=bcain&fingerprint=on&op=index

Ok, that ubuntu keyserver worked for me now, and I can verify the tag. Thanks.

         Linus
