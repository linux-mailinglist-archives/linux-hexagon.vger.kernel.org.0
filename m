Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D444A38C5A4
	for <lists+linux-hexagon@lfdr.de>; Fri, 21 May 2021 13:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbhEUL1i (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Fri, 21 May 2021 07:27:38 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51395 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhEUL1i (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Fri, 21 May 2021 07:27:38 -0400
Received: from leknes.fjasle.eu ([92.116.73.138]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N9Mh8-1lMuD03k5U-015Lu9 for <linux-hexagon@vger.kernel.org>; Fri, 21 May
 2021 13:26:10 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id F35A23C4CC; Fri, 21 May 2021 13:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1621596369; bh=GsepezfK7SCDw4QRe3az2jXkhTITx9Jxd1jiPnHi2vo=;
        h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:
         References:In-Reply-To:From;
        b=EnXTdh+59c3U9fBjVCFH72W/xp1GUyhCJwdqYkQsk3K2RRS87eSiN/Ah/tJ9c4La8
         V9smSdj5BdBCuLRCCOAsnNRs0rJT9g51ldJkJhi8doggDLnvQmcBlYrOZoAz3tAb9g
         WwkcGOfmudcJphh1n3oYZRpSdnonnnbqjE7DUepg=
X-Spam-Checker-Version: SpamAssassin 3.4.5-pre1 (2020-06-20) on leknes
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.5-pre1
X-Original-To: nicolas@fjasle.eu
Received: from lillesand.fjasle.eu (unknown [IPv6:fd00::ba:f4ff:fe3b:a745])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "lillesand.fjasle.eu", Issuer "Fake LE Intermediate X1" (not verified))
        by leknes.fjasle.eu (Postfix) with ESMTPS id 83B3C3C071;
        Fri, 21 May 2021 12:29:53 +0200 (CEST)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by lillesand.fjasle.eu (Postfix, from userid 1000)
        id 17497101F68; Fri, 21 May 2021 12:29:53 +0200 (CEST)
Date:   Fri, 21 May 2021 12:29:52 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] hexagon: move core-y in arch/hexagon/Makefile to
 arch/hexagon/Kbuild
Message-ID: <YKeLoDy3QddLd6jb@lillesand.fjasle.eu>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210512075729.60291-1-masahiroy@kernel.org>
 <20210512075729.60291-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210512075729.60291-4-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux 11.0
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:i2T+tpfWK6yIl7PLcV4iFIcnGsetgXzypi9c0/geISwcax3MjBU
 73xXWefGOvFbJS8lzzQoqVX6MjjbTBR2XbbbI5nSX1RMwUCMwT2N/JpGheBLQ+tyvr3kD66
 rmI9ilscUvuvuqTtfStkLZ7bscUR1q3WGfCB3yGxrXb3IKeIrXXfYRRAURNsadFSDkI66jm
 eDz6OxWdJmsjvSr8oLy1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:spqLe623Wgw=:n6Sy6x8hoqHOAzPWvcH9XL
 tV9jtmn83tUfgQ1K5n9m+nHlrnwOA2O9PpOBrBK1a+DcIJrxGgs8pFI9TmT6qeloO5EuSMiAl
 SfggWtR2hUONVgyKAHO03QcawO7rzwMLDUzDs1Z2IGvUn0MHq1oeSLsmxvf7REEDl3w/IVxd6
 XJLUKMClA9awmrmO3tEu337bph7Ah5XIlaTpWpmbSCMWz/yMVuAyP5pVnkkogOQ42RstOVHnS
 7M+D3MCN3yUYgYuTZlJDfs7srO1WK/5vpxrRkqyEKu9EM9QWKoofgrkORjHcmjzPhaeblADS/
 0zFacCqMkaNHzOKg9WN4REmtDUvANtVzRw5W5bsKUM+nJxyVxk//Zp8ia/XRzW+iH+EuEiOhF
 bqgqGyj6leKNekpCr5kusLyBC/6Yip9fHDW0d1S5qjG0NsI2hek59yvCypZHCi1svPnSlLLi0
 v85nGGLeZsZIe5y0fkew9b4IZCxt7tEUO9SFVHTk7GiYt1JI5yM01KnfhaU18+djgBierOmWI
 Owhkx1cYHl9n/KSXdawHhI=
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Hi Masahiro,

On Wed 12 May 2021 16:57:28 GMT, Masahiro Yamada wrote:
> Use obj-y to clean up Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/hexagon/Kbuild   | 1 +
>  arch/hexagon/Makefile | 4 ----
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
> index a4e40e534e6a..d930c2f954d5 100644
> --- a/arch/hexagon/Kbuild
> +++ b/arch/hexagon/Kbuild
> @@ -1 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj += kernel/ mm/ lib/

This should probably be 'obj-y' instead of 'obj'?

Kind regards,
Nicolas
