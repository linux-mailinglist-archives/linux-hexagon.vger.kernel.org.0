Return-Path: <linux-hexagon+bounces-1086-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B85DBBD1E37
	for <lists+linux-hexagon@lfdr.de>; Mon, 13 Oct 2025 09:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2213BAB1E
	for <lists+linux-hexagon@lfdr.de>; Mon, 13 Oct 2025 07:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB6D1E7C2E;
	Mon, 13 Oct 2025 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b="gexv/UmN"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail.commetrax.com (mail.commetrax.com [141.95.18.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916AC2EB5BF
	for <linux-hexagon@vger.kernel.org>; Mon, 13 Oct 2025 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.18.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342194; cv=none; b=JyAkbDGP3yA0vKypLu+4mQLLsM0pRca1VhNMV6CVVdn1uyvRgtqS9Eh2P0kquXA2ior17t+wLa4mJQ4GWyfGueOiIXCnWkjQwMSIviJ+7ZjAp709RYAD2cgmN5Cn/5Uz+klRnib/IdYZfUjhRk8ioKatrTV81sEFbJi3u7+bksM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342194; c=relaxed/simple;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=RSMSO+NWiyTu0w6DDZ9vSCWl/sT7TYwWOPIaVRiqGib34P15EyKxIZNeTiW1QuUPzsisyoJ34BTEC+d8ZeUFUWIAezbFM574j5IJQWFEb/ybKUXdjnRBx1WnGWje5Rkn/bB0v1qfv6D+xmHdG1w4e2agTKSm2GafPm5qchYiwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com; spf=pass smtp.mailfrom=commetrax.com; dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b=gexv/UmN; arc=none smtp.client-ip=141.95.18.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=commetrax.com
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 017E423B24; Mon, 13 Oct 2025 09:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1760342184;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Date:From:To:Subject:From;
	b=gexv/UmNgnwsZkZ1k6AlR35q1cLZVe8mPuK7044b24lGv27ScAebunns4/SFaDIrM
	 nPr/GIq8QJEiVB3bwm1bA57OjfdwmhI2cOb+kMkee30ueKq/T0OCZJSR9VqBDwmYX8
	 nl1m1TW4BN1mal9lU/GnFi4f3SEC5pY33UklyVge+sbgkqAbcddBzvbtfSxCI4BmfF
	 PgmGKRFxTuxYTs7aVMgLuHtjs53PTbRxtp9JDkd95qxxU/PIYflC9zxdB2UTmUbTHu
	 tUPG5ey4j1Jh+z8aWSKtZyFkAeWbkxMDCAG2GKwqRX0jVytzdMbK1BrlZqlpFiBBBH
	 w0GVQbNOUdvYg==
Received: by mail.commetrax.com for <linux-hexagon@vger.kernel.org>; Mon, 13 Oct 2025 07:55:41 GMT
Message-ID: <20251013084500-0.1.c8.16dle.0.qkdzlf35lq@commetrax.com>
Date: Mon, 13 Oct 2025 07:55:41 GMT
From: "Luke Walsh" <luke.walsh@commetrax.com>
To: <linux-hexagon@vger.kernel.org>
Subject: Welders ready to work
X-Mailer: mail.commetrax.com
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

we support companies in carrying out industrial projects by providing wel=
ding and assembly of steel structures =E2=80=93 both on-site and in-house=
=2E

In practice, this means we enter with a ready team of welders and fitters=
, take responsibility for preparing the components, their installation an=
d quality control.=20

The client receives a complete, safe and timely delivered structure.

If you have projects that require steel solutions, we would be happy to t=
alk about how we can take over this part of the work and relieve your tea=
m.

Would you be open to a short conversation?


Best regards
Luke Walsh

