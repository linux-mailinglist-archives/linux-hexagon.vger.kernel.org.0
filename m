Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104FE531CE5
	for <lists+linux-hexagon@lfdr.de>; Mon, 23 May 2022 22:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiEWTnX (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 23 May 2022 15:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbiEWTmU (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 23 May 2022 15:42:20 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FC711466
        for <linux-hexagon@vger.kernel.org>; Mon, 23 May 2022 12:39:15 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id m1so13998567plx.3
        for <linux-hexagon@vger.kernel.org>; Mon, 23 May 2022 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9i0mf5EWjId+dJhDG42zI0t8gO1U5xR/fPTtg8h/guQ=;
        b=G67mgEOcbKAzzfRqWT2tyqM6K9pitcq9pbTVcwT0LjmKZNi0oiqVsX8V97hEFwl2hf
         AMnpF3tfbp0thJvNCE4CX5dI4O8ELTGwmxs1K5fhCNP737yCqZGbfIr/xW9c33Xf+LOK
         scdJ+18kS7hWnfRSUS9ItgijmeteaopgZF3uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9i0mf5EWjId+dJhDG42zI0t8gO1U5xR/fPTtg8h/guQ=;
        b=q5Be4Wvjg4RPJHjJ7C/9ezErHK/AI4nBN6Gb/iK5znk6+Wyy6TEnaCVALg3yTEyrTE
         fvV8wDriKsACNpxGHwq7uBTyXIEJD/ORJZi46i7U4OBgk7t0i4X9Ae+wQA8l9A6mXIzb
         FwfFDWhICeuRvKnW41d0V/lnJtcnW6Auyy6QWpn7OPJv6BA0t62cGzpbku6Uy6yyuu+G
         oWDHpd7LUcXDaN0uj+056b23blwWb2ShFx3tk8CicROZ/msqNEzhVFy+cNEcdL56aAQN
         cGnv7e/CD8vmWKfLC9AyMDO1+PRjDpSew+g+7f54Yg9ttdPLCKpfWUyGf9X6VMLEz4sR
         YjyQ==
X-Gm-Message-State: AOAM531lDMD8hTrYRoJqwygfhSnplHQe/O/JFxTRT7pIShr/X/Jtw7oR
        ZCyyR2Nh13CG8CgeHTTSt3y2Hg==
X-Google-Smtp-Source: ABdhPJwpmlrfLvCqOEAWUHk/iFb9vTBCFvDV+XiSslGuIShWmQMdDaruCMB2aTz4o4uZEjpK38rAug==
X-Received: by 2002:a17:902:f605:b0:14d:9e11:c864 with SMTP id n5-20020a170902f60500b0014d9e11c864mr24236615plg.54.1653334755308;
        Mon, 23 May 2022 12:39:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a9-20020a62bd09000000b0051827128aeasm7543246pff.131.2022.05.23.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 12:39:14 -0700 (PDT)
Date:   Mon, 23 May 2022 12:39:12 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Maninder Singh <maninder1.s@samsung.com>, pmladek@suse.com,
        bcain@quicinc.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, satishkh@cisco.com, sebaddel@cisco.com,
        kartilak@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
        mcgrof@kernel.org, jason.wessel@windriver.com,
        daniel.thompson@linaro.org, dianders@chromium.org,
        naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
        davem@davemloft.net, mhiramat@kernel.org, peterz@infradead.org,
        mingo@redhat.com, will@kernel.org, longman@redhat.com,
        boqun.feng@gmail.com, rostedt@goodmis.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        linux@rasmusvillemoes.dk, akpm@linux-foundation.org, arnd@arndb.de,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-modules@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net, v.narang@samsung.com,
        onkarnath.1@samsung.com
Subject: Re: [PATCH 0/5] kallsyms: make kallsym APIs more safe with scnprintf
Message-ID: <202205231238.FAF6D28@keescook>
References: <CGME20220520083715epcas5p400b11adef4d540756c985feb20ba29bc@epcas5p4.samsung.com>
 <20220520083701.2610975-1-maninder1.s@samsung.com>
 <YonTOL4zC4CytVrn@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YonTOL4zC4CytVrn@infradead.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Sat, May 21, 2022 at 11:07:52PM -0700, Christoph Hellwig wrote:
> On Fri, May 20, 2022 at 02:06:56PM +0530, Maninder Singh wrote:
> > kallsyms functionality depends on KSYM_NAME_LEN directly.
> > but if user passed array length lesser than it, sprintf
> > can cause issues of buffer overflow attack.
> > 
> > So changing *sprint* and *lookup* APIs in this patch set
> > to have buffer size as an argument and replacing sprintf with
> > scnprintf.
> 
> This is still a pretty horrible API.  Passing something like
> a struct seq_buf seems like the much better API here.  Also with
> the amount of arguments and by reference passing it might be worth
> to pass them as a structure while you're at it.

Yeah, I agree. It really seems like seq_buf would be nicer.

-- 
Kees Cook
