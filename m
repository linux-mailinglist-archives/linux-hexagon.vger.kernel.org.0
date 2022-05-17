Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17275298E3
	for <lists+linux-hexagon@lfdr.de>; Tue, 17 May 2022 06:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbiEQEs5 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 17 May 2022 00:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiEQEs4 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 17 May 2022 00:48:56 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6413EA8E
        for <linux-hexagon@vger.kernel.org>; Mon, 16 May 2022 21:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=6VdXU36plQ8uaQ+VdzI8WaT/aCW7YyIgVyie8C4UwZQ=; b=Lwo8VzstY2I33pwrgT6Oe7JrVv
        2Smz0NCanGwQH4Q0AquxBcma1Btb2dQHOmtEcj4lEmlS1TYhiX5jknBJYPp2IA3KwdwEI3mzIphe1
        Rr6AgqpIRbou8hwB1Bq+4WuzkEVDjBgucpYEpR8zjDEY9ufmSukNYu2j/I/Q2p6o1gnmcV0zE4aun
        bwDdQUqGlMyOqTAifEyM/qSSHAvojyIfsmHP3Of3pM9SoNl0YFia6z01a2TIYiOrHqmg3TK7LMa6D
        8/F+jpzMCaAl2WY4sLnjY4rgeJF59syaLqIdlJMyQlASBjlj0l5y2/uVbUbrJJL8M5wKxWFK1ZMoU
        tvDoXa6w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nqp8I-00AX5V-QY; Tue, 17 May 2022 04:48:30 +0000
Date:   Tue, 17 May 2022 05:48:30 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Brian Cain <bcain@quicinc.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        Sid Manning <sidneym@quicinc.com>
Subject: Re: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning:
 stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Message-ID: <YoMpHlVdH+HCMhUj@casper.infradead.org>
References: <202205150051.3RzuooAG-lkp@intel.com>
 <Yn/YsTpOh898B30l@casper.infradead.org>
 <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
 <SN6PR02MB4205A0695B4B2543A9B981FCB8CE9@SN6PR02MB4205.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4205A0695B4B2543A9B981FCB8CE9@SN6PR02MB4205.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Tue, May 17, 2022 at 04:16:45AM +0000, Brian Cain wrote:
> > -----Original Message-----
> > From: Nathan Chancellor <nathan@kernel.org>
> ...
> > As a side note... Brian, is there any reason for 256K pages to exist for
> > Hexagon? This has been an option since Hexagon's introduction but is it
> > actually used? 4K pages is the default and the help text says "use with
> > caution". Perhaps the choice should be turned off altogether for
> > CONFIG_COMPILE_TEST so that we cannot select this configuration and
> > bother developers with these reports.
> 
> It's not the most commonly used page size, yeah.  Ok, we will disable it for CONFIG_COMPILE_TEST.

Maybe the stack size limit could be raised for 256KB page size?
Presumably the minimum stack size is 256KB, so it's not a problem for an
individual function to consume 16KB of stack space?
