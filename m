Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267B5662FBF
	for <lists+linux-hexagon@lfdr.de>; Mon,  9 Jan 2023 20:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbjAITC7 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 9 Jan 2023 14:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236994AbjAITCz (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 9 Jan 2023 14:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6B338AF6
        for <linux-hexagon@vger.kernel.org>; Mon,  9 Jan 2023 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673290890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
        b=NOt/j2pQ30uerawH0+X7lv3BSG0Q3QRQQsO+laAminXxtRnPi2sg78vn5sD1X5W/JQZ/wk
        0vrdhSxMdz6Zkf0FkB6B+1pfrxT5KiIVObpRjx1suFyhCq2iSKh8FGm7ldA2B781ExMm/g
        46U0I+4WWQwnC0hmBH36ZGXRSz6BK1c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-LHrcSbq4Ocq5G5BCpu4c2g-1; Mon, 09 Jan 2023 14:01:28 -0500
X-MC-Unique: LHrcSbq4Ocq5G5BCpu4c2g-1
Received: by mail-qt1-f198.google.com with SMTP id p20-20020ac84614000000b003a977d7a2ecso4305309qtn.23
        for <linux-hexagon@vger.kernel.org>; Mon, 09 Jan 2023 11:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
        b=dxfluD4Tkak4jc4HXYuMH7bvI3KOmVUYPxmJSPjZ/fvwtFvZXsm2yJtSDFAWGx0hnJ
         nN/m8PPa0yVI6q74TGmxrs3KIK2uSXFWhCIsQAAsBV4US5FIYvvNTLtRciUdw8dXr8JS
         NHFI0OW5Qsu2TEuvkUSuoSvGDkSIG8G0bZ2HFrju1Gjj8zJ0/0qxmtVO4VVPAeEeu2GV
         j3yYIszjicTf1IL0XzLsDdftCcneGK45RlmpMdu7FOKwg5d781b1QSTrAnZNjxlWQiV1
         KmI1CjCEoPkE3KPMRaDzRDzJsFKYfzXnqOKVOFEWUv/1Up5z6yl5Xf8EO4xfAvWeDwG+
         e6bw==
X-Gm-Message-State: AFqh2kpPGNnRtXsR3SK2LmZWTIXaL7JBUihoyOqescY/GIs/PcrvndIL
        OzntqPbj2QFtJshqTvtOVVTXs9oX0RiiQ37+uSTd++tLQEZl/X44RlpvycbCX5jmCyu0PxwtAiF
        pz8Jai7OymUb2ODDIkZGkjLdhVQ==
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336688qtp.7.1673290887991;
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseRLv5+JCaBFPqzT7E7Yv2YOrloRSyhYUUSWRG6zA8srvH9gyrV5oV35teC9nwwkDxbanAYA==
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336646qtp.7.1673290887764;
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id cj12-20020a05622a258c00b0039cc0fbdb61sm4985479qtb.53.2023.01.09.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, Guo Ren <guoren@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
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
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 6/8] treewide: Trace IPIs sent via smp_send_reschedule()
In-Reply-To: <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
 <20221202155817.2102944-7-vschneid@redhat.com>
 <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
Date:   Mon, 09 Jan 2023 19:01:22 +0000
Message-ID: <xhsmh5ydfedml.mognet@vschneid.remote.csb>
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

On 08/01/23 20:17, Huacai Chen wrote:
> Hi, Valentin,
>
> On Fri, Dec 2, 2022 at 11:59 PM Valentin Schneider <vschneid@redhat.com> wrote:
>> @@ -83,7 +83,7 @@ extern void show_ipi_list(struct seq_file *p, int prec);
>>   * it goes straight through and wastes no time serializing
>>   * anything. Worst case is that we lose a reschedule ...
>>   */
>> -static inline void smp_send_reschedule(int cpu)
>> +static inline void arch_smp_send_reschedule(int cpu)
>>  {
>>         loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>>  }
> This function has been moved to arch/loongarch/kernel/smp.c since 6.2.
>

Thanks! I'll make sure to rerun the coccinelle script for the next version.

