Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426067E1739
	for <lists+linux-hexagon@lfdr.de>; Sun,  5 Nov 2023 23:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjKEWAw (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sun, 5 Nov 2023 17:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjKEWAu (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sun, 5 Nov 2023 17:00:50 -0500
X-Greylist: delayed 5207 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:47 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D2BD9
        for <linux-hexagon@vger.kernel.org>; Sun,  5 Nov 2023 14:00:47 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 4AFE5198F1;
        Mon,  6 Nov 2023 01:58:19 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 4424A198ED;
        Mon,  6 Nov 2023 01:58:19 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id D644F1B8250F;
        Mon,  6 Nov 2023 01:58:20 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 60goaum0GG6w; Mon,  6 Nov 2023 01:58:20 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 9FC981B8223A;
        Mon,  6 Nov 2023 01:58:20 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 9FC981B8223A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210700;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=Ghuz6A8f/KV4FDQP/0kqFW9sm6L7+f6esqZuFpoKjmnqQZWskJO05qz6rO9fj/oWO
         mgXiJB2IJatljV4H+LNgxT0j0u9p37m5v+BKXBjFHcGQP/ZSifkX8QLwOA+NBuGBoL
         DNDw81x7MX9XS+eVzP0aLeVdwmyaS5uAmDDFJoFo7zOMVIAHVNCug0vbqhabUcX+Gb
         iBMrtk3ZFE4VjtC0bknKXZ8g8c25TOkEyX3VhT1v/XmynYJEq9R5Fg5s1dGvTBu2FN
         HTZIysuZhqqMCNDzmcvMrMUGIGo8YlCyycJ4mbNs2MgqCQ9aaafZBHQ1LKHcPkLz6/
         zUwEBwIsXVFsg==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id fxI6g9f6lewj; Mon,  6 Nov 2023 01:58:20 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 253761B8253C;
        Mon,  6 Nov 2023 01:58:13 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:58:03 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185814.253761B8253C@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

