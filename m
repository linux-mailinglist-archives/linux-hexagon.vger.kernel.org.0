Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D304717168
	for <lists+linux-hexagon@lfdr.de>; Wed, 31 May 2023 01:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbjE3XOF (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 30 May 2023 19:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbjE3XOE (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 30 May 2023 19:14:04 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D6EEC
        for <linux-hexagon@vger.kernel.org>; Tue, 30 May 2023 16:14:03 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b02085bf8dso27058145ad.0
        for <linux-hexagon@vger.kernel.org>; Tue, 30 May 2023 16:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685488442; x=1688080442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43Cq77dQ/zrfTfrqcrXS896rxBWu+H66vhJzdZh3Sqc=;
        b=RhGkv/UgqOw2a+M5Bu2/ULyGBQHPPzkrDPUyaz2nTpMZKESlZL2wEfrXpNPy/E35Hr
         ib+DwzUKBebWVZvTvFVKLXFT2yOi+8DwafPBMdk6e5LBlSa0kUzutXwe+POZ6/MXpZUy
         jLVOubfaaSTjXFX0n7gXFj1P1vIMR+TjHUfLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685488442; x=1688080442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43Cq77dQ/zrfTfrqcrXS896rxBWu+H66vhJzdZh3Sqc=;
        b=O+Tj+O4dZ7su7PZDFAudKhEnneTfF0EtYBaRQYStbR4RL4Z5NzmCtRFUf9YTq1C79z
         HMLY3W8oR8d5BeVSQkpdSeiQtK1aikA+6twNc3QaDoa3hGkV/r3EfB691Ua5h34kf4n1
         hnGOc3VPb0ZvcmSym8gGdYc5vuk62q1KXufrj1/6vuKIB4WoW8kz0ry5AKgIWTu3Sk2U
         TqyGtYCtF64uVMEGSByihyeKsQ4+I3B35ot/xnY9JqKg2NVLxD2L429BTtCcGL1bGvCa
         Ls7C57AZXSCLGSLLNPg3f9NrYhSvqWYghhmPEw2KdQdDJ0K8WA8enXaKS7gyNcYyD2L1
         NStQ==
X-Gm-Message-State: AC+VfDxkVe367RXcgH3Yalc0ulL50N3QUqA1C6jTiQuQMi4JiDcuktV9
        XKVwSxL82xmCjCwZPIhm0JM8Gw==
X-Google-Smtp-Source: ACHHUZ65FWUItcUf79HFJFx/RNnYWxTpv8uDabV3FhL81dPYe9ilgTGRoNtG+QxQx+Q9YoS1u+jcwg==
X-Received: by 2002:a17:902:dac2:b0:1ac:859a:5b5a with SMTP id q2-20020a170902dac200b001ac859a5b5amr4166825plx.0.1685488442697;
        Tue, 30 May 2023 16:14:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001a9bfd4c5dfsm10739003pll.147.2023.05.30.16.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 16:14:02 -0700 (PDT)
Date:   Tue, 30 May 2023 16:14:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     maninder1.s@samsung.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "bcain@quicinc.com" <bcain@quicinc.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
        "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>,
        "ustavoars@kernel.org" <ustavoars@kernel.org>,
        "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
        "gary@garyguo.net" <gary@garyguo.net>,
        "ojeda@kernel.org" <ojeda@kernel.org>,
        "pmladek@suse.com" <pmladek@suse.com>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Onkarnath <onkarnath.1@samsung.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: Re: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array size
Message-ID: <202305301611.34F0A680A2@keescook>
References: <20230529052821.58175-1-maninder1.s@samsung.com>
 <CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcms5p1>
 <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
 <20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
 <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Mon, May 29, 2023 at 04:50:45PM +0200, Miguel Ojeda wrote:
> Kees: what is the current stance on `[static N]` parameters? Something like:
> 
>     const char *kallsyms_lookup(unsigned long addr,
>                                 unsigned long *symbolsize,
>                                 unsigned long *offset,
>     -                           char **modname, char *namebuf);
>     +                           char **modname, char namebuf[static KSYM_NAME_LEN]);
> 
> makes the compiler complain about cases like these (even if trivial):
> 
>     arch/powerpc/xmon/xmon.c:1711:10: error: array argument is too small;
>         contains 128 elements, callee requires at least 512
> [-Werror,-Warray-bounds]
>             name = kallsyms_lookup(pc, &size, &offset, NULL, tmpstr);
>                  ^                                           ~~~~~~
>     ./include/linux/kallsyms.h:86:29: note: callee declares array
> parameter as static here
>             char **modname, char namebuf[static KSYM_NAME_LEN]);
>                                  ^      ~~~~~~~~~~~~~~~~~~~~~~

Wouldn't that be a good thing? (I.e. complain about the size mismatch?)

> But I only see 2 files in the kernel using `[static N]` (from 2020 and
> 2021). Should something else be used instead (e.g. `__counted_by`),
> even if constexpr-sized?.

Yeah, it seems pretty uncommon. I'd say traditionally arrays aren't
based too often, rather structs containing them.

But ultimately, yeah, everything could gain __counted_by and friends in
the future.

-- 
Kees Cook
