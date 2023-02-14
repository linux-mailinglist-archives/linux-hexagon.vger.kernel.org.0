Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64CC69663C
	for <lists+linux-hexagon@lfdr.de>; Tue, 14 Feb 2023 15:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbjBNONm (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 14 Feb 2023 09:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjBNONW (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 14 Feb 2023 09:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBE32A6E4
        for <linux-hexagon@vger.kernel.org>; Tue, 14 Feb 2023 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676383859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
        b=VC2T0c+pMT+ZwcTPsRMOkgw8kvRoOvI6LaBspRDk/gAdI8Ny4vTRUZAEpEhJuthebP979H
        H55ct2IEgBaJa9TSBlmxJ6MMrGnR+vTdIFzsj8UNGjdBU6CctJ0G99F1l2FzLw1GMai/VK
        g8qXMHE3vmSOjiaNJqO8WcPogOzq4OA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-iiFARYWvO_uMUfp1qkmL5Q-1; Tue, 14 Feb 2023 09:10:50 -0500
X-MC-Unique: iiFARYWvO_uMUfp1qkmL5Q-1
Received: by mail-qt1-f197.google.com with SMTP id z12-20020ac8710c000000b003b829a0eda2so9433933qto.21
        for <linux-hexagon@vger.kernel.org>; Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
        b=3I6CtTftwvLLmCWxSzkBfUvB/yJx5CiQl9MBYOxQT0u2WcMhsW1di5kBPjteS54kqK
         2sxdkLRaEw0KWCv4DuADtzmn9hZ9AicIFElYcK3ZJKEUdFPFZIguR7RfVkBF+pExDSbF
         1xCQeCcVPrD7cuOHX9XygDvRJUwgJDMMSa7/9V0dJlsHaK0OwYq6kbwY+szYKz7zive0
         42qjjzF+C/zDOTXU2HeEbDdr3ywO0fyZGW4uoIjQ2xOI7UbNUPG+EXScKAgi5QOgVd6Z
         bX9BsGE4ocGIcegyibO5bJgzi+7xXI9N2YYfh28S8/HbspWJfvkwo4JPnjY1QIInpbJ3
         +wlA==
X-Gm-Message-State: AO0yUKWAEGyKWD2lGfiI+P2sLuxOknzkGBGp2IUKugDihJZ/4Au3uHXV
        +aPl0b0O+llg8U5SS6rtwivbRGQTa0oc9EiuSpHj5o51zxMPR2q6l7/vTUaOPg6NQQOSVxHKe+0
        fDovcI46A31nei7h1+v6U3yZh/g==
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3386038qtw.63.1676383850324;
        Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-Smtp-Source: AK7set98OEMKfsGkU19OgnlE6heJ9O6LLo1g6QDlcHkAXfWHsX591p7/3MvgrPqMUwlWB9z0tPx4tA==
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3385969qtw.63.1676383849978;
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id s184-20020ae9dec1000000b0073b38652b9csm4892065qkf.122.2023.02.14.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
From:   Valentin Schneider <vschneid@redhat.com>
To:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 0/7] Generic IPI sending tracepoint
In-Reply-To: <20230119143619.2733236-1-vschneid@redhat.com>
References: <20230119143619.2733236-1-vschneid@redhat.com>
Date:   Tue, 14 Feb 2023 14:10:43 +0000
Message-ID: <xhsmhh6voqqvw.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org


Hey folks,

On 19/01/23 14:36, Valentin Schneider wrote:
> Patches
> =======
>
> o Patches 1-5 spread out the tracepoint across relevant sites.
>   Patch 5 ends up sprinkling lots of #include <trace/events/ipi.h> which I'm not
>   the biggest fan of, but is the least horrible solution I've been able to come
>   up with so far.
>
> o Patch 7 is trying to be smart about tracing the callback associated with the
>   IPI.
>
> This results in having IPI trace events for:
>
> o smp_call_function*()
> o smp_send_reschedule()
> o irq_work_queue*()
> o standalone uses of __smp_call_single_queue()
>

This still rebases cleanly on top of the latest tip/sched/core, any
objections to parking it there?

