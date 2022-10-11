Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3267F5FB867
	for <lists+linux-hexagon@lfdr.de>; Tue, 11 Oct 2022 18:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiJKQkh (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 11 Oct 2022 12:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiJKQkf (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 11 Oct 2022 12:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088C6A2A80
        for <linux-hexagon@vger.kernel.org>; Tue, 11 Oct 2022 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665506431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3pR097ooCx/8nlTemhEf/WDhel/4mmcsp3Jh/tnUV8M=;
        b=aR64lta4URzsOh4BoZtpeEgMTfH2Y03edlWNLfGp3deHQt+ABtM/ZZdgnwPJCdCAnuf9IL
        fQyFwvr2QODGLMTV9sMmrBf4l+HbbAsd4203JPkgUarUH1cIIW3tQkh2YILGi18rD6f4ed
        SKAc61ZPxNNDximesoWki92jxwW/qDw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-c2GkXy1XOJmtsspUYNoxyg-1; Tue, 11 Oct 2022 12:40:29 -0400
X-MC-Unique: c2GkXy1XOJmtsspUYNoxyg-1
Received: by mail-wm1-f72.google.com with SMTP id az35-20020a05600c602300b003c5273b79fdso5240750wmb.3
        for <linux-hexagon@vger.kernel.org>; Tue, 11 Oct 2022 09:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pR097ooCx/8nlTemhEf/WDhel/4mmcsp3Jh/tnUV8M=;
        b=OBNjKSqqDPAAxs5AynfD7wNl64Q6A1qX1i/XVImOiF0CTBriVfndMlx3XzONmelRLH
         VpPQb2VpEjUhmKUVFHRDZrASdHcmXtSOrwPA9t/b6kfic0AU4vU4eOeoscfCyULqVnHx
         bSCNfPKP7MdXOPacYc28JltoUrGvYOrMe3hzPXNI1N0HmtMP/rKld//dkr5zhRzaHn5X
         12GSoJGbQQawqg05/Ei87Pwi4/P6WZhadrjpsNYgzBPKSQf3z6NDp10gKHbZ0DCQGVaW
         F6Q8/3CjqHpVdCQWE8Pwjn3ltF+baDxRECfEn1IW4MiEqqgUUMEfSE9buun0AZcB4rp/
         6ajw==
X-Gm-Message-State: ACrzQf3kfvBM5VAEulGUGnf8XJIr0VXvCxBEy4tsemIcz1yWVc2wr8tD
        asJmP2Xyk8KbuBrdvuMTFVW03mEd+5wAf3wcA7KihHscycKE1xBsMA/gggM0apwz7Kig7Y0feF9
        0cuFQxEwHKeBM3hBrNjfdhUFuww==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr8455632wrr.308.1665506428138;
        Tue, 11 Oct 2022 09:40:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XCj7SFWdE6E5DxEmMGEk+A0mlMYyEPprqhbmdn8jGtDu/Z9OxlEVw6NK6vPTlYZN68wZltQ==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr8455591wrr.308.1665506427912;
        Tue, 11 Oct 2022 09:40:27 -0700 (PDT)
Received: from vschneid.remote.csb ([104.132.153.106])
        by smtp.gmail.com with ESMTPSA id y3-20020a7bcd83000000b003a3170a7af9sm7900578wmj.4.2022.10.11.09.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 09:40:27 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Douglas RAILLARD <douglas.raillard@arm.com>
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
In-Reply-To: <3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <Y0CFnWDpMNGajIRD@fuller.cnet> <xhsmhilkqfi7z.mognet@vschneid.remote.csb>
 <3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
Date:   Tue, 11 Oct 2022 17:40:26 +0100
Message-ID: <xhsmhfsfufh51.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On 11/10/22 18:22, Daniel Bristot de Oliveira wrote:
> On 10/11/22 18:17, Valentin Schneider wrote:
>> Thinking out loud, it makes way more sense to record a cpumask in the
>> tracepoint, but perhaps we could have a postprocessing step to transform
>> those into N events each targeting a single CPU?
>
> My approach on the tracers/rtla is to make the simple things in kernel, and beautify
> things in user-space.
>
> You could keep the tracepoint as a mask, and then make it pretty, like cpus=3-5,8
> in user-space. For example with a trace-cmd/perf loadable plugin, libtracefs helper.
>

That's a nice idea, the one downside I see is that means registering an
event handler for all events with cpumasks rather than directly targeting
cpumask fields, but that doesn't look too horrible. I'll dig a bit in that
direction.

> For rtla I was thinking to make a new tool to parse them. and make it pretty there.
>
> -- Daniel

