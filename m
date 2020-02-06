Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA13B153F19
	for <lists+linux-hexagon@lfdr.de>; Thu,  6 Feb 2020 08:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgBFHHQ (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Thu, 6 Feb 2020 02:07:16 -0500
Received: from smtp4.tjgo.jus.br ([45.71.214.102]:27661 "EHLO mx2.tjgo.jus.br"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725895AbgBFHHP (ORCPT <rfc822;linux-hexagon@vger.kernel.org>);
        Thu, 6 Feb 2020 02:07:15 -0500
X-Greylist: delayed 803 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Feb 2020 02:07:14 EST
Received: from sv-email-p02.tjgo.jus.br (sv-email-p02.tjgo.jus.br [45.71.214.97])
        by mx2.tjgo.jus.br (Postfix) with ESMTPS id 054912C827C;
        Thu,  6 Feb 2020 03:51:29 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id A0A7F63B21;
        Thu,  6 Feb 2020 03:51:28 -0300 (-03)
Received: from sv-email-p02.tjgo.jus.br ([127.0.0.1])
        by localhost (sv-email-p02.tjgo.ldc [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id soxsJAhSi4vY; Thu,  6 Feb 2020 03:51:28 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id 12F5563902;
        Thu,  6 Feb 2020 03:51:25 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 sv-email-p02.tjgo.ldc 12F5563902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tjgo.jus.br;
        s=DB6EB6C0-19CB-11E9-B608-74AECE7D716B; t=1580971885;
        bh=N7ic5LlI94J/87ZUuJbnr2MyW1XAh52HpvlLWUizZd4=;
        h=Date:From:Message-ID:MIME-Version;
        b=EPi2Gk781vujd2ZHkTZaOaAbCTdGui9DT8OrZP6KEkk/zHDwzBGhbPUYtkf90HbRm
         GpiItJfh9urF4DPOraV2rtfBD0g19EyaRMXcnUMPn1U91dvWUOyn2jMnxIKLt72yxf
         Jwu01kTIOIdJymuN3XTzqsBDdL0OzjLoS+dN1ygQibVPmLnIQ/aagdtNJsa7MYzyX0
         EhM5X1dXv+tBFEe7ducVc6psUpypHR8bAUmnGjCVKtSLZ1zeGOR+u53lLKDRBIgZtp
         PaLQW2+1pW/u1zYzBvY+xdF6v8amrKO45Ch3wL/dG5HFWeb9+Yrwcb4lmnS8znb27G
         t+KjfgUWaPcxQ==
X-Virus-Scanned: amavisd-new at sv-email-p02.tjgo.ldc
Received: from sv-email-p02.tjgo.jus.br ([127.0.0.1])
        by localhost (sv-email-p02.tjgo.ldc [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Y6VpgpYna4Q3; Thu,  6 Feb 2020 03:51:24 -0300 (-03)
Received: from sv-email-p00.tjgo.ldc (sv-email-p00.tjgo.ldc [45.71.214.95])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id 2EE896387A;
        Thu,  6 Feb 2020 03:51:19 -0300 (-03)
Date:   Thu, 6 Feb 2020 03:51:19 -0300 (BRT)
From:   Viviane Jose Pereira <vjpereira@tjgo.jus.br>
Reply-To: Tom Crist <cristtom063@gmail.com>
Message-ID: <277406600.1011929.1580971879114.JavaMail.zimbra@tjgo.jus.br>
Subject: Re:
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [109.70.100.26]
X-Mailer: Zimbra 8.8.15_GA_3829 (zclient/8.8.15_GA_3829)
Thread-Index: rCMEvftRfzk4MlpDXbUDQruVbx1KMA==
Thread-Topic: 
X-HSC-Mail_Inspector-From: vjpereira@tjgo.jus.br
X-HSC-Mail_Inspector-IP: 45.71.214.97
X-HSC-Mail_Inspector-Point: 2
X-HSC-Mail_Inspector-ID: 054912C827C.AA8EB
X-HSC-Brasil-HSC_MailInspector: Mensagem OK
X-HSC-Brasil-HSC_MailInspector-SpamCheck: Nao e SPAM,
        HSC MailInspector (cached, Pontuacao=5.168, requerido 6,
        BAYES_00 -3.00, DKIM_VALID_AU -0.10, HELO_NO_DOMAIN 0.00,
        HSC_MAIL_REPUTATION 4.90, LOTS_OF_MONEY 0.00, MISSING_HEADERS 1.02,
        RDNS_NONE 0.79, REPLYTO_WITHOUT_TO_CC 1.55)
X-HSC-Brasil-HSC_MailInspector-SpamScore: 5
X-HSC-Brasil-HSC_MailInspector-From: vjpereira@tjgo.jus.br
X-Spam-Status: No
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-hexagon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org



--=20
Hallo, ich entschuldige mich daf=C3=BCr, dass ich deine Privatsph=C3=A4re g=
est=C3=B6rt habe. Ich kontaktiere Sie f=C3=BCr eine =C3=A4u=C3=9Ferst dring=
ende und vertrauliche Angelegenheit.

Ihnen wurde eine Spende von 15.000.000,00 EUR angeboten Kontakt: cristtom06=
3@gmail.com f=C3=BCr weitere Informationen.

Dies ist keine Spam-Nachricht, sondern eine wichtige Mitteilung an Sie. Ant=
worten Sie auf die obige E-Mail, um immer mehr Informationen =C3=BCber die =
Spende und den Erhalt von Geldern zu erhalten.
