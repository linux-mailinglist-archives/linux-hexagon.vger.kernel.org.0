Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055783C199E
	for <lists+linux-hexagon@lfdr.de>; Thu,  8 Jul 2021 21:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhGHTLk (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 8 Jul 2021 15:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHTLk (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 8 Jul 2021 15:11:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A48BC061574
        for <linux-hexagon@vger.kernel.org>; Thu,  8 Jul 2021 12:08:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q18so18304298lfc.7
        for <linux-hexagon@vger.kernel.org>; Thu, 08 Jul 2021 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yxq/oYeE5el0szoQlSwnFi3D5C8UV0iamECRppUCTb8=;
        b=CS3c/rCTZLRhfSZCtAFxKSJZw+1e1IR2isTofp5binEMsCyeotR+El3bf6mQCQ7wzV
         jWJVrjKqwkUrl/VQ13p+AJp8e9SLTn3+uYldNdocc5FmU6w/ISh4Hjnj12WnLq/EThgO
         RbZbkm4tf7VyU3WqQYrHzFeeclUlFPuNKfF+ya3FOwYmCiWCvShmMWhtzPePt/2e6muW
         holGzqrc5CfzyDkjL6U+Obpw4PhbRyRoFodiF7RVOGG4BUOmfOSeC11wHIYOKds4+G3B
         DC2PS92JFmb/Unb81kfVM9358a4QlEBNkQ13Q/EUOUtc2N7DO9nV0/mST0Mi/s2lpHWG
         e87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yxq/oYeE5el0szoQlSwnFi3D5C8UV0iamECRppUCTb8=;
        b=PqFIHoDxz5UTSZFXJ6DI7ChdJlrAETp1uKsgXVgtU5+4vbBFIyzdk7Ix6rn6Z3XbWf
         iYZ5P4fEsyXJJRDgBWTRNdocSrpDpt/GbnOFsM97Ap7JV9tjjQWsdisrzZU/WwtF5CO6
         DZu78Xa7q6aRPvhHyzDjahha+11Ktjt7OOk/8QPOt88T5LTBG/H1+Xwzia7L1P0AwU8m
         lzHQHZAfFywybr2AJTD8+T21s8ej8xMZJmCw6RsqBprPE8hQ6yD5fWg1DYiTa2xEZPGs
         60qkQEhvEi4O38dlwZCFP8Old8s3F0d9JD6S8LyAHzuuYIBr7pfdvKZepMVKHLbSmO64
         AHFA==
X-Gm-Message-State: AOAM530MMCyUYui8kEKEgyWqfVVeUMiw6dBN7LvJcMIFqSJfyXnlk9dx
        ayd7ttBPQvfbVpP+ArOroervn4nOp02txydTGLL7gA==
X-Google-Smtp-Source: ABdhPJwhUiU2hH+eK040L2z7DvLsOjcyahjvGYkBvhI4UVYaDBykLuhSrSWwAE71GJGyfHanhk2MomjJhdWec0wQ9ck=
X-Received: by 2002:ac2:4c55:: with SMTP id o21mr21895033lfk.122.1625771334722;
 Thu, 08 Jul 2021 12:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210623141854.GA32155@lst.de> <08df01d7683d$8f5b7b70$ae127250$@codeaurora.org>
 <CAK8P3a28_0KJpcLRQrDhFk8-ndxmfk7-Q2_qcRRiYkyh-NNZUQ@mail.gmail.com>
 <08e101d76842$94f78a60$bee69f20$@codeaurora.org> <20210623151746.GA4247@lst.de>
 <CAK8P3a2bG64ARjpwQ0ZhQ9P0g8B-=AwcHHAbYBXBS4B6Fy9pQw@mail.gmail.com>
 <YNQE0YJzC2xmWg+2@Ryzen-9-3900X.localdomain> <20210707141054.GA24828@lst.de>
 <1ee8fc44-3e8c-91c0-7909-a636757dbda4@kernel.org> <20210708052751.GA18789@lst.de>
 <CAKwvOd=iRLQPum8-jaCG90TPyxDptNB31yRHMEWgSMxjv=KuHA@mail.gmail.com> <0a6801d77428$13c88060$3b598120$@codeaurora.org>
In-Reply-To: <0a6801d77428$13c88060$3b598120$@codeaurora.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 8 Jul 2021 12:08:44 -0700
Message-ID: <CAKwvOdkQhq-hPr=S52D=kJVPGP507F78hY2PbC+hbuq3MZUkDw@mail.gmail.com>
Subject: Re: how can we test the hexagon port in mainline
To:     bcain@codeaurora.org
Cc:     Christoph Hellwig <hch@lst.de>,
        "Manning, Sid" <sidneym@quicinc.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Sid Manning <sidneym@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Thu, Jul 8, 2021 at 11:36 AM Brian Cain <bcain@codeaurora.org> wrote:
>
> > From: Nick Desaulniers <ndesaulniers@google.com>
> > We're looking into statically linked images of clang to prevent these
> > kinds of games.
>
> Statically linking against libc++/libc++abi at least seems like a good idea.  Let me know if we can help.

Consider subscribing/reading/posting to
https://github.com/ClangBuiltLinux/tc-build/issues/150.
-- 
Thanks,
~Nick Desaulniers
