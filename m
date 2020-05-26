Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1641E25A2
	for <lists+linux-hexagon@lfdr.de>; Tue, 26 May 2020 17:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729889AbgEZPk1 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 26 May 2020 11:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbgEZPk1 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 26 May 2020 11:40:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C95C03E96D
        for <linux-hexagon@vger.kernel.org>; Tue, 26 May 2020 08:40:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id n15so1494144pjt.4
        for <linux-hexagon@vger.kernel.org>; Tue, 26 May 2020 08:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kjnl/JxEGriKorXrTPs6RAu94HRZLs85s5QetpCKq1Q=;
        b=qFcDYd0iBnzGrt/TK7N0lwbAK6KbDETo97IeZd0WVVyBA+aJoUp4jzuPFO8ypMc/Gb
         L7Rqn9kLpHYSHEuuUHDRpPNWXmcnhoSRFQjlBFEUwhxfO22bW9twODIuQad+Y80bvEpv
         lrjug32IiXaSGIopv6PKagvIJpdH/CqiY2+Pnj/Fv1fD1k4IgUiOALE7G113xZAJGbQW
         fFSTKNTEYvpG2/5PMP8CkjAnwhhDiqBMHvW0pzdPaIg7bX/0Pzj7ppU34ipPTNcrjeL9
         OBzYWILVYCRBQaNaU7bUS5GZufm9vccOIjcJsKArMM+nOnz2ee4qt7h50anJgJuBDpPj
         CqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjnl/JxEGriKorXrTPs6RAu94HRZLs85s5QetpCKq1Q=;
        b=iZO/V5qXZtAadixyeTspwUXCVqlVl/RY6cJVqUnYkakV5hJ9UTc558nTdD8iIiLKq3
         gzxxNFDSiYgvBsChgwvGO5JrjPTAQDrtuXbXsS6D5Qx2g3E/a44P6s8+nxjaRHcm/tBW
         Bp6g7FI/VZI014G33Vuhpg5bxYs4D2CmBY6WuVOHnfmKUAk3bAbmdTanGzRjgpYSKiVI
         eV1ScS5mcKCKqZa6HN9Pcmi29esWpl1eszR/H7rGugMKCnbiMdQbUz5JDf+YWuzGvwC2
         oFvpl6JcVUt+eLbt5owvhRnamMiBmj/+X3kJ+SZMQHlUOyvCFs+lrSR+0+vgx/dXtw9T
         gDiQ==
X-Gm-Message-State: AOAM53083Va0YZGQkTtKIDGW8BSVS4TqQ42wttG1QN3WwuqVoRToulIm
        MxKzHg/NqnguJ0QCqNtmNh1MzeSCs6H+b++7ksjhsQ==
X-Google-Smtp-Source: ABdhPJxfpkQUxfSc6ou5v2IxmRJgcqi1Vr3ymUZE6sf+XL1RdUwRbloUHEHRLK7kfH+MWGd6ubn/wPOf+1IFDoA5SX0=
X-Received: by 2002:a17:902:724a:: with SMTP id c10mr1595124pll.223.1590507625356;
 Tue, 26 May 2020 08:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200526153004.GA74229@roeck-us.net>
In-Reply-To: <20200526153004.GA74229@roeck-us.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 May 2020 08:40:14 -0700
Message-ID: <CAKwvOdnrsCCt_HU+fows6kBCs2jGcikDtMm_otQSKFEgqfojJw@mail.gmail.com>
Subject: Re: [PATCH] compiler/gcc: Raise minimum GCC version for kernel builds
 to 4.8
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Will Deacon <will@kernel.org>, Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Tue, May 26, 2020 at 8:30 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, May 11, 2020 at 09:41:37PM +0100, Will Deacon wrote:
> > It is very rare to see versions of GCC prior to 4.8 being used to build
> > the mainline kernel. These old compilers are also known to have codegen
> > issues which can lead to silent miscompilation:
> >
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
> >
> > Raise the minimum GCC version to 4.8 for building the kernel and remove
> > some tautological Kconfig dependencies as a consequence.
>
> My hexagon compiler is v4.6.1, and I have been unable to find a more
> recent version. Does anyone happen to have a pointer to a hexagon toolchain
> with gcc 4.8 or later ?

IIUC, hexagon moved to LLVM, though that target still has issues
building the kernel.
https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22%5BARCH%5D+hexagon%22
-- 
Thanks,
~Nick Desaulniers
