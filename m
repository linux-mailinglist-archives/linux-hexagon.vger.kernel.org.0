Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2213528184
	for <lists+linux-hexagon@lfdr.de>; Mon, 16 May 2022 12:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbiEPKJg (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 16 May 2022 06:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235887AbiEPKJX (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 16 May 2022 06:09:23 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1887669
        for <linux-hexagon@vger.kernel.org>; Mon, 16 May 2022 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652695762; x=1684231762;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=0iuQqxuydIJZPFNzzRya7Q5thdN33xJWufGwf1DqOaI=;
  b=hgOacexZtkGyaiLUKTTdXdjo9cR0dyX29Vn/GHfn8FHJntw8L+hdWfdb
   IqUQrV3rlF2OXvHxuGaFpVfwt7vmmx06Z2d89Ksm7Fwp5z3hOF8z4FvI6
   7YDjvhDChUw4AZSpxw/660sEmyXMS0p/t1qrvIymG3fV4QHZb5Y4eiWZP
   37alBLQHAZxlJdsUVIKmhRkrBBoJWPqxnrYceIatPgpl0noOdUzd9LbNX
   vu+RHIVxGTMGWzL5wh5Jkt+q+r9oq+sYQ0l4fuIMCLtKyQigysdGHIaLY
   yI+CVOnHYiVdqbPtdR66wFJJz5zEqpfh7TLyw5yklFjIKdGlCB8eyaMbp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="270740664"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="270740664"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 03:09:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="568253695"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.169.165]) ([10.249.169.165])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 03:09:18 -0700
Subject: Re: [kbuild-all] Re: [linux-next:master 9995/11651]
 fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in
 'block_read_full_folio'
To:     Nathan Chancellor <nathan@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Brian Cain <bcain@quicinc.com>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-hexagon@vger.kernel.org
References: <202205150051.3RzuooAG-lkp@intel.com>
 <Yn/YsTpOh898B30l@casper.infradead.org>
 <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
From:   "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <416aa517-6813-2227-ddce-34c8b63696e2@intel.com>
Date:   Mon, 16 May 2022 18:09:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org



On 5/15/2022 5:57 AM, Nathan Chancellor wrote:
> On Sat, May 14, 2022 at 05:28:33PM +0100, Matthew Wilcox wrote:
>> On Sun, May 15, 2022 at 12:23:46AM +0800, kernel test robot wrote:
>>> commit: 2c69e2057962b6bd76d72446453862eb59325b49 [9995/11651] fs: Convert block_read_full_page() to block_read_full_folio()
>>> config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150051.3RzuooAG-lkp@intel.com/config)
>>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
>> ...
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio' [-Wframe-larger-than]
>>>     int block_read_full_folio(struct folio *folio, get_block_t *get_block)
>>>         ^
>>>     1 warning generated.
>>
>> Now show the warnings that were removed.  This patch renames the
>> function, and I bet there was a similar warning before this patch.
>>
>> But basically, I don't care about stack usage on hexagon with clang.
>> AIUI, it's a known bug.
> 
> For what it's worth, it seems like this is just 256K pages being 256K
> pages... MAX_BUF_PER_PAGE is PAGE_SIZE / 512 so *arr is 2048 bytes big
> in this configuration. You'd see a similar warning with PowerPC but that
> configuration is non-standard:
> 
> fs/buffer.c: In function ‘block_read_full_page’:
> fs/buffer.c:2337:1: warning: the frame size of 2064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>   2337 | }
>        | ^
> 
> It would be nice if the Intel folks could look at recognizing a function
> rename so that you are not bothered by reports like this.

Hi Nathan, Matthew,

Sorry about this, we'll take a look.

Best Regards,
Rong Chen


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
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
