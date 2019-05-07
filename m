Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E763F15F54
	for <lists+linux-hexagon@lfdr.de>; Tue,  7 May 2019 10:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfEGI1B (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Tue, 7 May 2019 04:27:01 -0400
Received: from mga01.intel.com ([192.55.52.88]:17823 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbfEGI1B (ORCPT <rfc822;linux-hexagon@vger.kernel.org>);
        Tue, 7 May 2019 04:27:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 May 2019 01:27:00 -0700
X-ExtLoop1: 1
Received: from yangj-mobl1.ccr.corp.intel.com ([10.255.31.217])
  by orsmga005.jf.intel.com with ESMTP; 07 May 2019 01:26:59 -0700
Message-ID: <1557217620.12221.20.camel@intel.com>
Subject: Question: cross-compile meets binutils problem
From:   Chao Fan <fanx.chao@intel.com>
To:     linux-hexagon@vger.kernel.org
Cc:     philip.li@intel.com, zhijianx.li@intel.com
Date:   Tue, 07 May 2019 16:27:00 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Hi all,

I am going to build the cross-compile toolchain and build
hexagon kernel on x86 machine.
The gcc version is 7.3 and the binutils version is 2.32.
Meet error:
checking for shared library run path origin... *** ld does not support
target hexagon-unknown-linux-gnu
*** see ld/configure.tgt for supported targets
config.status: creating config.h
done
Makefile:7089: recipe for target 'configure-ld' failed
make[1]: *** [configure-ld] Error 1
checking for iconv... config.status: executing default commands
yes
checking for iconv declaration...
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t
*inbytesleft, char * *outbuf, size_t *outbytesleft);
*** BFD does not support target hexagon-unknown-linux-gnu.
*** Look in bfd/config.bfd for supported targets.
Makefile:3526: recipe for target 'configure-binutils' failed
make[1]: *** [configure-binutils] Error 1
make[1]: Leaving directory '/home/cfan/cross-
gcc/buildall/hexagon/binutils'
Makefile:849: recipe for target 'all' failed
make: *** [all] Error 2

And then I checked the binutils-2.32/ld/configure.tgt,
there is no hexagon. So I am not sure whether there is other
binutils works for hexagon.

If there is something wrong in my understanding, please let me know.

Thanks,
Chao Fan
