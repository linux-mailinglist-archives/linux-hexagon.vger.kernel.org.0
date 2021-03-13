Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81490339EBA
	for <lists+linux-hexagon@lfdr.de>; Sat, 13 Mar 2021 16:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233486AbhCMPBc (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Sat, 13 Mar 2021 10:01:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbhCMPBc (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Sat, 13 Mar 2021 10:01:32 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BAFC061574
        for <linux-hexagon@vger.kernel.org>; Sat, 13 Mar 2021 07:01:31 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id r17so58906470ejy.13
        for <linux-hexagon@vger.kernel.org>; Sat, 13 Mar 2021 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jSorVtVLxWH4J3kb7k+aZrEFl8ESk4ScoIOSEgr3UXs=;
        b=uB/oy6PU+4GxOmZi3YJbM/6bddxOrFQsjy7WMYfGJjLurJcgw1hzPTsAGnC/+Yqpll
         FKrdWdLdip3WrPZHwvO98vNuJkFCDn9xVdrPEG49CvXUgPM/RiLrLuzoo9fRHfKDsce2
         4FCs+o44PTrtrz39LHG2ZgvgbuR4z8JeoyyLwdw5rw0hSAqnVmKO4q/9zxajxFoqygN/
         hqNAnoqqeu0Xtz52eUpZxgNItLKB6Kp4S309lOUkeNhkmQ8rQQPGQlSz7VUOnG2ugtyS
         PmM6A4C8tXq+Xb0pWSfQWrL6H+hEdKxgmApXinsckjpFzZWbtE82G1jtxfpsAI0jsFye
         hiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=jSorVtVLxWH4J3kb7k+aZrEFl8ESk4ScoIOSEgr3UXs=;
        b=IwiT0mIrK3ic0IVjQcw5MtFGi4pb8JJVuBdXvpo6BIMdV1XtPwTLAZGD3O3tx+cpBc
         UW7B4QLNp6901Uik74L0QqL6P/5dRf1dr2fF0p3RQ5xcwo/8IdbQVskSBHJtT2nteWlh
         /U4iVvU55LccYGccDXqSck8zpujUYhMJuL5YqWy0/8llG9Yps7prbt+6JSXp4Bl+WO98
         GkU6gIVdqErONKpPGD9dHWvcuqF6MPkU/DPJpCDqAGUUTOrZKa38Ho9pYpVvo8ePGZPK
         e+oi6it4i17t4/wZOiKt6+8fnzGvje2P+bZ0vRbS3UEqnt2ZSrvjtP5XadMKrvvcYBGY
         vmPA==
X-Gm-Message-State: AOAM531cV6vNdVJ+odQcfIOSjNCUBKYtUUZqRiQm13TMgUlwLk0O0IAa
        p5GCJhQrt0FG/0d856oYET6VqWluONXByNsu677PmvmCGVVaoQ==
X-Google-Smtp-Source: ABdhPJy9wsiJF+96Zzi8ib1bjSR37wJ5LnPlON9HD5KdTT3BzKeh4lm0kcqHpK8nEQ4EKh/Ej5C+93j/wDTX7ptUaW0=
X-Received: by 2002:a17:906:d938:: with SMTP id rn24mr15006318ejb.87.1615647687995;
 Sat, 13 Mar 2021 07:01:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6402:358e:0:0:0:0 with HTTP; Sat, 13 Mar 2021 07:01:26
 -0800 (PST)
In-Reply-To: <CAKN5=TYGX1HK-Y16mi2pG5BAaYZ9xbeBXmpk4to4fpFb1yTb-w@mail.gmail.com>
References: <CAKN5=TYGX1HK-Y16mi2pG5BAaYZ9xbeBXmpk4to4fpFb1yTb-w@mail.gmail.com>
From:   willson mutanda <ftyr13232@gmail.com>
Date:   Sat, 13 Mar 2021 07:01:26 -0800
Message-ID: <CAKN5=TbAWe5Yoa7Oa+QVjM_sRnh325eAmp5HndaSUjhKM-C8Ow@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Hello Dear  Ivanov

I am sorry for the inconveniences; my name is Willson J. Mutanda, from
pretoria, a Personal assistance to (Mr. Andrew Ivanov ) as I have
earlier explained to you.  Mr. Andrew Ivanov,  is Gold and Diamond
mining contractor and a business man here in South Africa who passed
away a few years ago. I am writing to you due to the urgency of the
same matter, all effort to locate his relatives after his sudden death
failed.

Since I could not locate any of his relative until now and the
Investment is about to be moved to the state treasury as unclaimed
bill, Please, I demand your consent to contact the company as his heir
as you have the same last name with him; I want you to stand as his
relative to possess his capital investment valued at (7 Million two
hundred British Pounds) with the Investment company as recorded in the
file before it will be confiscated. The fund has been dormant for long
time waiting for his successor which until now no one has showed up
and I cannot find his direct relative.

I got your contact on the internet and decided to contact you as you
have the same name as my master. And I hope you will not expose me
even if you don=E2=80=99t want to help. This deal should be a secret betwee=
n
me and you even after archiving this aim.

 I can guarantee that this case will be executed under a legitimate
arrangement that will protect you and me from any breach of law if we
can put heads together to discuss on what to do about it.  All I
require from you is your honest cooperation to enable us to see this
transaction through; I hope to hear from you immediately after you
read this message for more details.

Kindly, contact my private email below for security reasons if you are
willing to contact the institution regarding this urgent matter. I
learnt your language is not English; please respond to me with English
if you can write with English

Thanks in advance and God bless you,

Willson J. Mutanda

Email:   mutanda.j.willson@gmail.com
