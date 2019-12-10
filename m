Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB96F117D3A
	for <lists+linux-hexagon@lfdr.de>; Tue, 10 Dec 2019 02:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfLJBg3 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 9 Dec 2019 20:36:29 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41766 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLJBg3 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 9 Dec 2019 20:36:29 -0500
Received: by mail-pf1-f193.google.com with SMTP id s18so8171881pfd.8
        for <linux-hexagon@vger.kernel.org>; Mon, 09 Dec 2019 17:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/ArZYKEfjZPBsRcDlrm2bJB7ahGFDYf0VWt4hD0Qjo=;
        b=Tr+C241trD4TLlSStYX0RZ2/acmkFLvu/V66NWO68Pgsjf+UXw0F/g4w5jP4u51yTC
         Ka81WTRlzO2b1a8sGcma60AQvixKXlL7KWoi6ioZNPudCQab6TFW6nUrh4JeHRDj9gXh
         jHxeDC9kvh98tdCZUT8ahK2e3j/ZXtpOgvR/f2SuLRXgab7OWEEIakRHl+jLVpbYHZEK
         nnTSJJq8shG8KCZGbycub0bPoZPxZ0Aultof8x7cY01uY/eSpqT4qdfOren6OUSnshlu
         2WIPjFk7VeawrmvbAc3wFL3CU0N0IJnMQaqxn/d63coWAiw8xt7UWz7Y9XqXe6igj/Dq
         3xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/ArZYKEfjZPBsRcDlrm2bJB7ahGFDYf0VWt4hD0Qjo=;
        b=jcFKd3WAfgzSpP1Ch1DrxiTLDKHU22xwk+6q27UqcfpWtthlfNM20KyAFzqov5TdCz
         iXT270JkaWwE475s9Ga+G2qqk0UMWe4padVKG2c7EarNmR4KSVPHezhgUXY56qZLR8lh
         Wn27HbLer9OxOv/6OmGm7bqwl8E0q9l0UYlIg8iFqRE+N+WPCTBAizqhpkCv8hff5nBa
         4RWeraJUtsP2hLl9ZZhYnhWI5Ar8qQ92wKJ9qYcSZNUhDO5jXlVKmyX5iFYo1GO/p7UM
         r65+1LnJeAhIaHQ+pERMIGHdHwKnOKHKjevPvjI8ilOQnRFO/QHT5dVgppaj89TnZgc0
         6XAg==
X-Gm-Message-State: APjAAAXXkTLNHCBoSrW54k4IHq162Zw23tJzOaDxJ59aszJeTSY8dEBu
        Yxpup6eZDylKmBHEFPu69UXUIvd5qaI1mAuIYf1WYA==
X-Google-Smtp-Source: APXvYqxwnem1f63bG00bEbGyduZzAk/R1lLierSyTVIwa5R8C6fowLDYtTGyFjeHedADn6m4cS1iXI5NN8u299XjvvA=
X-Received: by 2002:aa7:9151:: with SMTP id 17mr32836592pfi.3.1575941788095;
 Mon, 09 Dec 2019 17:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20191028155722.23419-1-ndesaulniers@google.com> <002301d58dcb$a9ffaa80$fdfeff80$@codeaurora.org>
In-Reply-To: <002301d58dcb$a9ffaa80$fdfeff80$@codeaurora.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Dec 2019 17:36:16 -0800
Message-ID: <CAKwvOdkbTMj92Hj7Z2ucbJY5B_AZgANZhNoeOa2Taa2YTbCQUg@mail.gmail.com>
Subject: Re: [PATCH] hexagon: work around compiler crash
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Sid Manning <sidneym@quicinc.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-hexagon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        bcain@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

+ akpm, looks like you're picking up hexagon patches? Would you mind
please grabbing this one, too?

On Mon, Oct 28, 2019 at 1:09 PM Brian Cain <bcain@codeaurora.org> wrote:
>
> > -----Original Message-----
> > From: linux-hexagon-owner@vger.kernel.org <linux-hexagon-
> > owner@vger.kernel.org> On Behalf Of Nick Desaulniers
> ...
> > Subject: [PATCH] hexagon: work around compiler crash
> >
> > Clang cannot translate the string "r30" into a valid register yet.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/755
> > Suggested-by: Sid Manning <sidneym@quicinc.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> LGTM.  Thanks, Nick.
>
> Reviewed-by: Brian Cain <bcain@codeaurora.org>
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/002301d58dcb%24a9ffaa80%24fdfeff80%24%40codeaurora.org.



-- 
Thanks,
~Nick Desaulniers
