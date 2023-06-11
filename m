Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6DEE72B065
	for <lists+linux-hexagon@lfdr.de>; Sun, 11 Jun 2023 07:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjFKFkz (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sun, 11 Jun 2023 01:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKFky (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sun, 11 Jun 2023 01:40:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFEFE62;
        Sat, 10 Jun 2023 22:40:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D65D061B03;
        Sun, 11 Jun 2023 05:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0583EC433D2;
        Sun, 11 Jun 2023 05:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686462052;
        bh=AOePUCdk8HH40/kO3zeZTnh0lgUCybcEtMlUeFBOGCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z0quu/rX+FbryYUYKQ18xzpR8z1AVRioRfsP5sjIGjKogfKOfOA5hf2HfZVhMcn3E
         udpi5Fz1C3V57rmqP7EFhZ6J8osvGRQ8lIDyXLee7dRqXjxXCjidMPSuP74BPE9WRs
         XPcBXhe6XuW1tXUo4UUfQMysojEW/eKpcKz7GepBE2N/mmD9Q9W4xenLeRHQa3bXmV
         2PsDZkwdfA0yBqg/RipIi2ScYmwxNGkDDzn0Xo7xLO5G0HNMh70cMbSa9JZSYhQIiq
         2gfuFz1zvUKFBOEBQgSpi6FHtb8MvG+1EKfcPevj7/J0k0slVBXv85IlW1nurlBA8p
         8Mq+aelN40+Fg==
Date:   Sun, 11 Jun 2023 08:40:19 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Baoquan He <bhe@redhat.com>
Cc:     kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-arch@vger.kernel.org, linux-mm@kvack.org, arnd@arndb.de,
        christophe.leroy@csgroup.eu, hch@lst.de, willy@infradead.org,
        agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
        schnelle@linux.ibm.com, David.Laight@aculab.com, shorne@gmail.com,
        deller@gmx.de, Brian Cain <bcain@quicinc.com>,
        linux-hexagon@vger.kernel.org
Subject: Re: [PATCH v6 02/19] hexagon: mm: Convert to GENERIC_IOREMAP
Message-ID: <20230611054019.GL52412@kernel.org>
References: <20230609075528.9390-3-bhe@redhat.com>
 <202306091859.NhlW2nny-lkp@intel.com>
 <ZIQzrRo0JhfBLDes@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIQzrRo0JhfBLDes@MiWiFi-R3L-srv>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Hi Baoquan,

On Sat, Jun 10, 2023 at 04:26:21PM +0800, Baoquan He wrote:
> On 06/09/23 at 07:09pm, kernel test robot wrote:
> > Hi Baoquan,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on akpm-mm/mm-everything]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/asm-generic-iomap-h-remove-ARCH_HAS_IOREMAP_xx-macros/20230609-160014
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20230609075528.9390-3-bhe%40redhat.com
> > patch subject: [PATCH v6 02/19] hexagon: mm: Convert to GENERIC_IOREMAP
> > config: hexagon-randconfig-r041-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091859.NhlW2nny-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce (this is a W=1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
> >         git fetch akpm-mm mm-everything
> >         git checkout akpm-mm/mm-everything
> >         b4 shazam https://lore.kernel.org/r/20230609075528.9390-3-bhe@redhat.com
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon prepare
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306091859.NhlW2nny-lkp@intel.com/
> 
> Thanks for reporting. I reproduced them on my local machine. Below patch
> can fix them. And by the way, I also saw the clone3 warning, and have to 
> made change in scripts/checksyscalls.sh to mute it, wondering how you
> handle it in your testing.

I think the warning kbuild reported is rather this one:

>> include/asm-generic/io.h:1078:6: error: conflicting types for 'iounmap'
    1078 | void iounmap(volatile void __iomem *addr);
         |      ^
 
> ------
> stdin>:1520:2: warning: syscall clone3 not implemented [-W#warnings]
>  1520 | #warning syscall clone3 not implemented
>       |  ^
> 1 warning generated.
> 
> ------
> diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
> index 1e5d2eeb726d..3a369b78edb7 100755
> --- a/scripts/checksyscalls.sh
> +++ b/scripts/checksyscalls.sh
> @@ -148,6 +148,7 @@ cat << EOF
>  #define __IGNORE_nanosleep
>  #define __IGNORE_io_getevents
>  #define __IGNORE_recvmmsg
> +#define __IGNORE_clone3
>  #endif
> 
> 
> From 6a86f4360a61a2b7b4d71172e5c03be554367553 Mon Sep 17 00:00:00 2001
> From: root <root@dell-pem620-01.dell2.lab.eng.bos.redhat.com>
> Date: Fri, 9 Jun 2023 21:21:36 -0400
> Subject: [PATCH] hexagon: mm: fix warning in asm/io.h
> Content-type: text/plain
> 
> Remove the old iounmap() declaration which is not consistent with the
> standard one in asm-generic/io.h, let's use the standard one.
> 
> And also add macro definition of inb/w/l and outb/w/l to override
> the definition of them in asm-generic/io.h.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  arch/hexagon/include/asm/io.h | 8 ++++++--
>  scripts/checksyscalls.sh      | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/hexagon/include/asm/io.h b/arch/hexagon/include/asm/io.h
> index dcd9cbbf5934..efe9cb00ebf8 100644
> --- a/arch/hexagon/include/asm/io.h
> +++ b/arch/hexagon/include/asm/io.h
> @@ -27,8 +27,6 @@
>  extern int remap_area_pages(unsigned long start, unsigned long phys_addr,
>  				unsigned long end, unsigned long flags);
>  
> -extern void iounmap(const volatile void __iomem *addr);
> -
>  /* Defined in lib/io.c, needed for smc91x driver. */
>  extern void __raw_readsw(const void __iomem *addr, void *data, int wordlen);
>  extern void __raw_writesw(void __iomem *addr, const void *data, int wordlen);
> @@ -207,16 +205,19 @@ static inline void memset_io(volatile void __iomem *addr, int value,
>   *
>   * Operates on "I/O bus I/O space"
>   */
> +#define inb inb
>  static inline u8 inb(unsigned long port)
>  {
>  	return readb(_IO_BASE + (port & IO_SPACE_LIMIT));
>  }
>  
> +#define inw inw
>  static inline u16 inw(unsigned long port)
>  {
>  	return readw(_IO_BASE + (port & IO_SPACE_LIMIT));
>  }
>  
> +#define inl inl
>  static inline u32 inl(unsigned long port)
>  {
>  	return readl(_IO_BASE + (port & IO_SPACE_LIMIT));
> @@ -227,16 +228,19 @@ static inline u32 inl(unsigned long port)
>   * @data: data to write to
>   * @addr:  address in I/O space
>   */
> +#define outb outb
>  static inline void outb(u8 data, unsigned long port)
>  {
>  	writeb(data, _IO_BASE + (port & IO_SPACE_LIMIT));
>  }
>  
> +#define outw outw
>  static inline void outw(u16 data, unsigned long port)
>  {
>  	writew(data, _IO_BASE + (port & IO_SPACE_LIMIT));
>  }
>  
> +#define outl outl
>  static inline void outl(u32 data, unsigned long port)
>  {
>  	writel(data, _IO_BASE + (port & IO_SPACE_LIMIT));
> 

-- 
Sincerely yours,
Mike.
