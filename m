Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5DB527461
	for <lists+linux-hexagon@lfdr.de>; Sat, 14 May 2022 23:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiENV51 (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 14 May 2022 17:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232072AbiENV5W (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 14 May 2022 17:57:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587AC40A34
        for <linux-hexagon@vger.kernel.org>; Sat, 14 May 2022 14:57:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E664260C66
        for <linux-hexagon@vger.kernel.org>; Sat, 14 May 2022 21:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC748C340EE;
        Sat, 14 May 2022 21:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652565440;
        bh=7/bA4w4G8YLE2TIhdgRqh26nw+jS5nqBcytlMpBLt6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sLvjaR/bAqfxtbZbegiNJzcBeRj8fW3Pok6tKrFToxFQmVLDB2F6lMMHXRdMK/g2g
         nm8R7ZUJTaSHGZSllh/ylnHppOPM5fcHDcmpx3H6nyWUTwEk7YDeeiJKE71yuFYyNG
         mkF2qKCl18lDy1IcJZYwAJIvfPBYevDFdNWXQlFmJSufcl04mnF85bTkmxHmhpmikw
         ArJStkUXtR8NNb6n44njMt94gjJ14qC/T8sZ/Zv8wihkQuRNECoqQ9pGFw+FUUcqUl
         TX03OufZuA+Qy/xEG904myMtwQJTgtVIwBVkGDGm8i26ZbyVe11FgeWDx7o4qxyIyH
         5S/pwvvAuwVgQ==
Date:   Sat, 14 May 2022 14:57:18 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>,
        Brian Cain <bcain@quicinc.com>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-hexagon@vger.kernel.org
Subject: Re: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning:
 stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Message-ID: <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
References: <202205150051.3RzuooAG-lkp@intel.com>
 <Yn/YsTpOh898B30l@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yn/YsTpOh898B30l@casper.infradead.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Sat, May 14, 2022 at 05:28:33PM +0100, Matthew Wilcox wrote:
> On Sun, May 15, 2022 at 12:23:46AM +0800, kernel test robot wrote:
> > commit: 2c69e2057962b6bd76d72446453862eb59325b49 [9995/11651] fs: Convert block_read_full_page() to block_read_full_folio()
> > config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150051.3RzuooAG-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
> ...
> > All warnings (new ones prefixed by >>):
> > 
> > >> fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio' [-Wframe-larger-than]
> >    int block_read_full_folio(struct folio *folio, get_block_t *get_block)
> >        ^
> >    1 warning generated.
> 
> Now show the warnings that were removed.  This patch renames the
> function, and I bet there was a similar warning before this patch.
> 
> But basically, I don't care about stack usage on hexagon with clang.
> AIUI, it's a known bug.

For what it's worth, it seems like this is just 256K pages being 256K
pages... MAX_BUF_PER_PAGE is PAGE_SIZE / 512 so *arr is 2048 bytes big
in this configuration. You'd see a similar warning with PowerPC but that
configuration is non-standard:

fs/buffer.c: In function ‘block_read_full_page’:
fs/buffer.c:2337:1: warning: the frame size of 2064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
 2337 | }
      | ^

It would be nice if the Intel folks could look at recognizing a function
rename so that you are not bothered by reports like this.

As a side note... Brian, is there any reason for 256K pages to exist for
Hexagon? This has been an option since Hexagon's introduction but is it
actually used? 4K pages is the default and the help text says "use with
caution". Perhaps the choice should be turned off altogether for
CONFIG_COMPILE_TEST so that we cannot select this configuration and
bother developers with these reports.

Cheers,
Nathan
