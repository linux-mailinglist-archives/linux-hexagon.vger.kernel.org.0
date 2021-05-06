Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED6D37581F
	for <lists+linux-hexagon@lfdr.de>; Thu,  6 May 2021 18:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbhEFQEy (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 6 May 2021 12:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235176AbhEFQEx (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 6 May 2021 12:04:53 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA24C061761
        for <linux-hexagon@vger.kernel.org>; Thu,  6 May 2021 09:03:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c3so8520550lfs.7
        for <linux-hexagon@vger.kernel.org>; Thu, 06 May 2021 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qyVEBL+xt1SQPCegOBTUU+QFYg0wXbsBFOTlu91fBI0=;
        b=T0KSrzdSGE888MPYuUq4G9EM95hI7x6fGzbOVXyDI1FWHmes4gTalsGxdVnFz4ykq7
         XPdAI1NUBLfokLmeJRjRLyh5mwLSByqOeNom7T0l5aonABz7mxnLRjEMkTgWBgBtRAGP
         kki0T4yJ3PI9LTsSAcQCEI1a/QXBHL3xJR3O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qyVEBL+xt1SQPCegOBTUU+QFYg0wXbsBFOTlu91fBI0=;
        b=eXv1R/LHVLQaf+j5EfhFRbDTnWeAxx7j9hcHUwHrTU1L6j1Xy0GvRVPBi7+PMMHqJ7
         KsAC1HHG6+MoeGSi5fPrKwVSJeisBoLYhYe5l6U9KKLt6iiidqxFv+BUVnu48fU4KGCF
         F9qZwFwNxABVZ5z/aC9uMy+4vCxpux7ImcjL0tWDwUecojLk0vTnDRrHoGAK1TinLPuT
         6EdpaIU+m7xIyJoGrqWncLBa+CWjHLoju7q0aDSXMsC6p4ZncXcmfeJEkJ2Brs1509CI
         V3BeX22C4UP5d06HVwqyGIEE8P+JyXkbdAPGpBZa8M8+FY5GrBvylnk7wGMnP/WQ6h6X
         PADQ==
X-Gm-Message-State: AOAM530jXfyhqyEN/ucLsNCmtXIkMaf+MZnzYgOajVBlLMSD8jWVF1EG
        hCA4h2qzUiidUGVDAKlm80oASSWQgV2JPqG/AVc=
X-Google-Smtp-Source: ABdhPJzXLaFFcTRf4KCZXOXAIutcawnavnQhu8aly4H0Hpbb9IqOrXjPePSaqc8GUYBePL+Soxvi5A==
X-Received: by 2002:ac2:4346:: with SMTP id o6mr3311700lfl.615.1620317033256;
        Thu, 06 May 2021 09:03:53 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id d7sm779600lfg.253.2021.05.06.09.03.49
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 09:03:50 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id v5so7702915ljg.12
        for <linux-hexagon@vger.kernel.org>; Thu, 06 May 2021 09:03:49 -0700 (PDT)
X-Received: by 2002:a05:651c:3de:: with SMTP id f30mr4067041ljp.251.1620317028967;
 Thu, 06 May 2021 09:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <a81e116ba3d64aab8d379703bedcf032@codeaurora.org>
In-Reply-To: <a81e116ba3d64aab8d379703bedcf032@codeaurora.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 6 May 2021 09:03:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgU-ERpeM0CJnN8JTVVUsBRtgpvU33sKke67V6pZj6A=g@mail.gmail.com>
Message-ID: <CAHk-=wgU-ERpeM0CJnN8JTVVUsBRtgpvU33sKke67V6pZj6A=g@mail.gmail.com>
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

On Wed, May 5, 2021 at 2:10 PM <bcain@codeaurora.org> wrote:
>
> Please pull the following changes for Hexagon: they contain build fixes.

The pull looks fine, but I'm wondering what key you've signed this with?

I find your key 175C464E541B6D47 in the kernel.org pgpkeys archive,
but your tag was signed with RSA key 1A54AFB8E5646C32, which I don't
find.

And the standard keyservers are - as usual - not very helpful.

I'd have loved to see a key I recognize, and I was hoping to also see
that key signed by Richard Kuo. And maybe it is, but I can't find it..

Anyway, pulled, just hoping for some clarification,

                Linus
