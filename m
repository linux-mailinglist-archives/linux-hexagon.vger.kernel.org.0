Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDDA5AB529
	for <lists+linux-hexagon@lfdr.de>; Fri,  2 Sep 2022 17:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236401AbiIBPaO (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 2 Sep 2022 11:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbiIBPaD (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 2 Sep 2022 11:30:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C0D2A94B
        for <linux-hexagon@vger.kernel.org>; Fri,  2 Sep 2022 08:08:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0EFACB82C75
        for <linux-hexagon@vger.kernel.org>; Fri,  2 Sep 2022 15:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681B2C433B5;
        Fri,  2 Sep 2022 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662131285;
        bh=xO8wxI5N3x/3nL9IXG1D9c8+CTbJsEtvXnnMKHgpngI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OSHfQDZ4IVdwsFFGcyaN6sp7emXn9AYu/ulI/2q++SAvlmWN/WhNqA2XikoBsFIxL
         z02PVQL1E3F0NqiiwGkdVDidzgGcYeEpKA4oBVp7p47RN+qLv1GdcXbnIzqGtfJZcD
         wxO4sL4J2hLqW/UwVqHiJJoiP/YaAlWVscM06YfpqIXhQ8h6MKF9XWlRObYJX9MdOf
         6ccB5YMWZkG/IETFR26iPkE3/MztuFWl/csrHaCxGEVV7mnEVMRC8qiiRWjrMukDNp
         yR1sai+zQjYClu4ct2bhbm55A4f/XsOIF8a1F159V+l3oKFKz91FljzrP4bF+WGQDU
         h+nP+2rNPtGow==
Date:   Fri, 2 Sep 2022 08:08:03 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Brian Cain <bcain@quicinc.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        clang-built-linux <llvm@lists.linux.dev>,
        linux-hexagon@vger.kernel.org
Subject: Re: [masahiroy-kbuild:kbuild 18/19] ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151];
 references __vmnewmap
Message-ID: <YxIcU9LW3OLHjAnm@dev-arch.thelio-3990X>
References: <202209020450.jH1ovepP-lkp@intel.com>
 <YxEoo8M++9tyaLOO@thelio-3990X>
 <CAK7LNAS9BtiQ8oSX+oOZ8Wewaed+p7Kj8kaObpVddBuR308Nww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS9BtiQ8oSX+oOZ8Wewaed+p7Kj8kaObpVddBuR308Nww@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

On Fri, Sep 02, 2022 at 09:36:33AM +0900, Masahiro Yamada wrote:
> On Fri, Sep 2, 2022 at 6:48 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > + Masahiro
> >
> > On Fri, Sep 02, 2022 at 04:41:09AM +0800, kernel test robot wrote:
> > > CC: linux-kbuild@vger.kernel.org
> > > TO: Masahiro Yamada <masahiroy@kernel.org>
> > >
> > > Hi Masahiro,
> > >
> > > First bad commit (maybe != root cause):
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > > head:   67c0e0cf21cd5065fba45a6a00dd252ae4b9417a
> > > commit: 0b1de512cba77e11bdf0305264c56ab61b23b3e1 [18/19] kbuild: use obj-y instead extra-y for objects placed at the head
> > > config: hexagon-randconfig-r041-20220831 (https://download.01.org/0day-ci/archive/20220902/202209020450.jH1ovepP-lkp@intel.com/config)
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=0b1de512cba77e11bdf0305264c56ab61b23b3e1
> > >         git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > >         git fetch --no-tags masahiroy-kbuild kbuild
> > >         git checkout 0b1de512cba77e11bdf0305264c56ab61b23b3e1
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151]; references __vmnewmap
> > >    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> > > --
> > > >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2313056 is not in [-2097152, 2097151]; references __vmsetvec
> > >    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> > > --
> > > >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152, 2097151]; references memset
> > >    >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://01.org/lkp
> > >
> 
> 
> Thanks for the forwarding.
> 
> This is not a regression.
> 
> The hexagon was already broken.
> 
> It is just that it was deemed to be a new breakage
> due to slightly different error messages.

Thanks a lot for checking! Something for the Hexagon folks to look at
then.

The original report is at

https://lore.kernel.org/202209020450.jH1ovepP-lkp@intel.com/

with the original config file.

Cheers,
Nathan

> Compare the before/after.
> 
> 
> 
> 
> [Before]
> 
> 
>   LD      .tmp_vmlinux.kallsyms1
> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4):
> relocation R_HEX_B22_PCREL out of range: 2313200 is not in [-2097152,
> 2097151]; references __vmnewmap
> >>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)
> 
> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x120):
> relocation R_HEX_B22_PCREL out of range: 2313124 is not in [-2097152,
> 2097151]; references __vmnewmap
> >>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)
> 
> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x12c):
> relocation R_HEX_B22_PCREL out of range: 2313072 is not in [-2097152,
> 2097151]; references __vmsetvec
> >>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)
> 
> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x160):
> relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152,
> 2097151]; references memset
> >>> defined in ./built-in.a(arch/hexagon/lib/memset.o)
> make: *** [Makefile:1170: vmlinux] Error 1
> make: Target '__all' not remade because of errors.
> 
> 
> 
> 
> [After]
> 
>   LD      .tmp_vmlinux.kallsyms1
> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4):
> relocation R_HEX_B22_PCREL out of range: 2313200 is not in [-2097152,
> 2097151]; references __vmnewmap
> >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> 
> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x120):
> relocation R_HEX_B22_PCREL out of range: 2313124 is not in [-2097152,
> 2097151]; references __vmnewmap
> >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> 
> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c):
> relocation R_HEX_B22_PCREL out of range: 2313072 is not in [-2097152,
> 2097151]; references __vmsetvec
> >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> 
> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160):
> relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152,
> 2097151]; references memset
> >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)
> make: *** [Makefile:1180: vmlinux] Error 1
> make: Target '__all' not remade because of errors.
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada
