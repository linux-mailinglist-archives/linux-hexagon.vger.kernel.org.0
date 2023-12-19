Return-Path: <linux-hexagon+bounces-58-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF18191EF
	for <lists+linux-hexagon@lfdr.de>; Tue, 19 Dec 2023 22:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F1661C24DEA
	for <lists+linux-hexagon@lfdr.de>; Tue, 19 Dec 2023 21:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A3A3B2AD;
	Tue, 19 Dec 2023 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SdyBwol3"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62F3B1A4
	for <linux-hexagon@vger.kernel.org>; Tue, 19 Dec 2023 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 19 Dec 2023 16:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703019891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtSKyAckkxhjq+mnW87LkvbNUGR2ScfrAJFYbRib6nQ=;
	b=SdyBwol3Kp/o1zBy6GYlx4AAwo9vgPVf8/cCA8HvevOKNZ5KL53mvtLDAihJ2FPy4GvpH/
	hSm69+tqAGiBsdATfyy+GXkP+sexxdHHeM8VOGBhhPW6d2nP2VWWv2juCVSlloDuqgFYfV
	v8l7XadMw/SY47RXX/HpFOwh0DhjmXo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@quicinc.com>,
	linux-hexagon@vger.kernel.org
Subject: Re: [bcachefs:header_cleanup 21/51] /bin/bash: line 1: 19420
 Segmentation fault LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux drivers/misc/eeprom/at24.ko
Message-ID: <20231219210448.azc3fbex3z6nc5ky@moria.home.lan>
References: <202312192107.wMIKiZWw-lkp@intel.com>
 <20231219205348.wvvxyicaatmljxm2@moria.home.lan>
 <CAKwvOdmrvwdbFrtzsOjoLJJZ1pDZOBWBiEb=Mx5bCHuKU2wPzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmrvwdbFrtzsOjoLJJZ1pDZOBWBiEb=Mx5bCHuKU2wPzQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Dec 19, 2023 at 12:58:28PM -0800, Nick Desaulniers wrote:
> On Tue, Dec 19, 2023 at 12:54 PM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Tue, Dec 19, 2023 at 09:40:09PM +0800, kernel test robot wrote:
> > > tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
> > > head:   89188fceb7a49e3c4b0578d86f6f6e647f202821
> > > commit: 1db61740aeb7d6b1c7bfb2a98708a65a6679d068 [21/51] locking/seqlock: Split out seqlock_types.h
> > > config: hexagon-randconfig-r005-20220913 (https://download.01.org/0day-ci/archive/20231219/202312192107.wMIKiZWw-lkp@intel.com/config)
> > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312192107.wMIKiZWw-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202312192107.wMIKiZWw-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    die__process_unit: DW_TAG_member (0xd) @ <0xc689> not handled!
> > >    die__process_unit: tag not supported 0xd (member)!
> > >    die__process_function: DW_TAG_compile_unit (0x11) @ <0xc697> not handled!
> > >    die__process_function: tag not supported 0x11 (compile_unit)!
> > >    die__process_function: DW_TAG_member (0xd) @ <0xc6db> not handled!
> > >    die__process_function: DW_TAG_compile_unit (0x11) @ <0xc6e5> not handled!
> > >    die__process_class: DW_TAG_compile_unit (0x11) @ <0xc778> not handled!
> > >    namespace__recode_dwarf_types: couldn't find 0xc689 type for 0xc66b (member)!
> > >    namespace__recode_dwarf_types: couldn't find 0xc638 type for 0xc674 (member)!
> > >    namespace__recode_dwarf_types: couldn't find 0xc638 type for 0xc67e (member)!
> > > >> /bin/bash: line 1: 19420 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/misc/eeprom/at24.ko
> >
> > Not sure how likely a header cleanup is to cause a segfault in
> > llvm-objcopy and I don't have the toolchain to repro this - could
> > hexagon people take a look?
> >
> 
> Is it a segfault in llvm-objcopy, or pahole?

Whoops, I think you're right :)

