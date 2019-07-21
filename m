Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7EA6F438
	for <lists+linux-hexagon@lfdr.de>; Sun, 21 Jul 2019 18:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfGUQxv (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sun, 21 Jul 2019 12:53:51 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36288 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfGUQxv (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sun, 21 Jul 2019 12:53:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so35201738ljj.3
        for <linux-hexagon@vger.kernel.org>; Sun, 21 Jul 2019 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5u5pYqXEq+IeJ5qYP8FGZejReb4Nr/dgdEELXviWuQ=;
        b=SfsRifqu+/ZSthpm4gGscjWytOn4AblnNEKGWQiyBnd3PO0tY2AUD1Dw9bLJkXVq6l
         bi7L001ejkx8PoKwPhLRRscBLevCouzWJTl1UCqvNgOy0GG+3IBFVFZSuRizDg6/6ob+
         yCDdDMR+6ZXuFfvVtmBzj0aLDjFeTHeOeokhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5u5pYqXEq+IeJ5qYP8FGZejReb4Nr/dgdEELXviWuQ=;
        b=oirFAsGzU2ehhk98f0v+7Ry7Vo+3Q9OfPVwXFw75qzwHnjNfqBgUR6RReUqiYecjdf
         ULHrpaJ3Vf4KuiZAfH1OiYTb+VtJDs/T432qrwMmCi49CJ8GYiL+LiSp31m/bsY7XAiv
         rAnKVEiPK42mzAd7Si2Z0mO5FOUvs+YO9L9zNtVs5/kONpN358t0w20QG7rYK1msmVBD
         7trVg4yX9SGYO933f6ZVcgWXS0IxnuOgJeGWEz1V14djASdFo5B5eR9sVNpTeYmot35T
         cWrqRPLMkZICrjWqVeSjswQ1cxJqu+mVmZLFcoidbvguf8ZkDQscx+YNj/wMIUUcwQzj
         qqAA==
X-Gm-Message-State: APjAAAWuce3KTtxQx7SxY1R0wHnexCptKpUrsdO5uSWMd0qzFNCGri/X
        No5A732HF8Ru141hrSY6FDQ/r1BOSbI=
X-Google-Smtp-Source: APXvYqwUFX2aZEg+x9/6Los9pGsPR78TdehgbaHcdKXwo2j7Laf59utmmn8VvVhHFFS4hUqzNkyhqw==
X-Received: by 2002:a2e:b0d0:: with SMTP id g16mr33451798ljl.161.1563728028234;
        Sun, 21 Jul 2019 09:53:48 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id v86sm7056192lje.74.2019.07.21.09.53.47
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 09:53:47 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id m8so1593339lji.7
        for <linux-hexagon@vger.kernel.org>; Sun, 21 Jul 2019 09:53:47 -0700 (PDT)
X-Received: by 2002:a2e:9192:: with SMTP id f18mr4208181ljg.52.1563728026894;
 Sun, 21 Jul 2019 09:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190721141914.GD26312@rapoport-lnx>
In-Reply-To: <20190721141914.GD26312@rapoport-lnx>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 21 Jul 2019 09:53:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whbd8UWeX-O-Zpn5iKdC6YMxef9UuH3R=TL14W5N86h0g@mail.gmail.com>
Message-ID: <CAHk-=whbd8UWeX-O-Zpn5iKdC6YMxef9UuH3R=TL14W5N86h0g@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 06/14] hexagon: switch to generic version of pte allocation
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Richard Kuo <rkuo@codeaurora.org>,
        linux-hexagon@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Sun, Jul 21, 2019 at 7:19 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> I understand that merge window is going to close in couple of hours, but
> maybe this may still go in?

Applied.

              Linus
