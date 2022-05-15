Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2AB5274BE
	for <lists+linux-hexagon@lfdr.de>; Sun, 15 May 2022 02:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbiEOAb3 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 14 May 2022 20:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiEOAb2 (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 14 May 2022 20:31:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD46F13DF2
        for <linux-hexagon@vger.kernel.org>; Sat, 14 May 2022 17:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=eZAXC+k+tR5S6s/jXIC4fOUMN3Hkrv/eDiD122qcZmE=; b=V4rcHE1nZ/iUOgz2JH94xXYXdh
        9DN+XVybbo5oROzliqtOxHNkttQKTrf7dx1TfIPaI/JzsxJpog1jgoS16c/IoUd9vGQyCKJ9oMrHx
        B77VTJwExqH5TmcA5kQd8pqvx+GV+XMl0EjNtqMoQMcgjqPTXwl9jNSmFakfr3xJN0Kxf8hpirOEq
        bPe4BldG+V7MS+ZPnmmaFXME+QzflpnvbXOKDkMR/dmbHSFjUIJKIc6OGLNfI2MoUcxKngSXjft0Y
        5pO4eFcJQPdQfAvhJIPOkk0zQfYPiL5meibUw2/6s4GdMQw6tdl/5CyuBznYiymCd2hzKD2htpIBn
        l4RyhFsg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nq29s-008eag-Be; Sun, 15 May 2022 00:30:52 +0000
Date:   Sun, 15 May 2022 01:30:52 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Brian Cain <bcain@quicinc.com>, kernel test robot <lkp@intel.com>,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-hexagon@vger.kernel.org
Subject: Re: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning:
 stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Message-ID: <YoBJvJ9pVPtiRbUo@casper.infradead.org>
References: <202205150051.3RzuooAG-lkp@intel.com>
 <Yn/YsTpOh898B30l@casper.infradead.org>
 <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Sat, May 14, 2022 at 02:57:18PM -0700, Nathan Chancellor wrote:
> On Sat, May 14, 2022 at 05:28:33PM +0100, Matthew Wilcox wrote:
> > On Sun, May 15, 2022 at 12:23:46AM +0800, kernel test robot wrote:
> > > commit: 2c69e2057962b6bd76d72446453862eb59325b49 [9995/11651] fs: Convert block_read_full_page() to block_read_full_folio()
> > > config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150051.3RzuooAG-lkp@intel.com/config)
> > > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
> > ...
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio' [-Wframe-larger-than]
> > >    int block_read_full_folio(struct folio *folio, get_block_t *get_block)
> > >        ^
> > >    1 warning generated.
> > 
> > Now show the warnings that were removed.  This patch renames the
> > function, and I bet there was a similar warning before this patch.
> > 
> > But basically, I don't care about stack usage on hexagon with clang.
> > AIUI, it's a known bug.
> 
> For what it's worth, it seems like this is just 256K pages being 256K
> pages... MAX_BUF_PER_PAGE is PAGE_SIZE / 512 so *arr is 2048 bytes big
> in this configuration. You'd see a similar warning with PowerPC but that
> configuration is non-standard:

Ahh!  Yes, I'd forgotten that Hexagon has that crazy config option.
I think I can get rid of that enormous array of pointers, it just wasn't
a high priority for me.

> fs/buffer.c: In function ‘block_read_full_page’:
> fs/buffer.c:2337:1: warning: the frame size of 2064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>  2337 | }
>       | ^
> 
> It would be nice if the Intel folks could look at recognizing a function
> rename so that you are not bothered by reports like this.
> 
> As a side note... Brian, is there any reason for 256K pages to exist for
> Hexagon? This has been an option since Hexagon's introduction but is it
> actually used? 4K pages is the default and the help text says "use with
> caution". Perhaps the choice should be turned off altogether for
> CONFIG_COMPILE_TEST so that we cannot select this configuration and
> bother developers with these reports.
> 
> Cheers,
> Nathan
