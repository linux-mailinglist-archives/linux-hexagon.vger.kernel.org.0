Return-Path: <linux-hexagon+bounces-1060-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0948B58AA3
	for <lists+linux-hexagon@lfdr.de>; Tue, 16 Sep 2025 03:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35CB23B015D
	for <lists+linux-hexagon@lfdr.de>; Tue, 16 Sep 2025 01:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3BA1FA859;
	Tue, 16 Sep 2025 01:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0I/Xm2a"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11B91A2545
	for <linux-hexagon@vger.kernel.org>; Tue, 16 Sep 2025 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757984728; cv=none; b=oIWRn2WhyOizGL/dXBLbDhWElXSydj/0xmiXjN3OG297RLex75BqlscXQkh21zZKW30XVHrGTR8SwrZ0GgrS5dEWiPAoNBlT6Lg3xCf1S9LYca7yPHgi7kdg0U5cf9QA5gQhTTaW/hprmG0gYCjItzwd0u4Bi07wOceehcZUQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757984728; c=relaxed/simple;
	bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfitUdFPu+H2skQ7qybvigddpcJ+sJAQX/QpQMo0lSKn1NvczV33UspmFQafLwdpA65tU3UK05uwnfzx8PsTyZi3GuEo/sFviZZOmWPrgVcWe7/8iqvEHSyVzcUYOldd9ATfva4Rmq4+GWtSF6XC8eg0c1Tv0Wwh9QdUXB1x7ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0I/Xm2a; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ea3f0d9150eso1951867276.0
        for <linux-hexagon@vger.kernel.org>; Mon, 15 Sep 2025 18:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757984724; x=1758589524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=T0I/Xm2a26Pz9ueMVGxxM+8PBoBl72rLmCzNxbz1k+Zf7VAgqOZWtMXsxpbWUBL8J8
         jPG2qCslo6GuL8OE/CdATF314calnEw7vxx91ORh8INwPj72HtzWCItEMHgqlS1BGB4L
         AnggdLmhtN6PrPfYWJw6oIkc2HOZ6SuTst0SQp47zn7zXDjLJdQBMyL/dFLz8br5otKI
         8dlCMxoRBNvoekrOuCctZSU/9APTEadss2NF0KJzW0tKMoYDIAsZq+yHkaxGVYfE6o2t
         SJT7LsbW215Aa9TuYPrX1VwOTxvlChId8n3HZzda/uwuRnZUTB37Ib6PO7vzKl/LFvlj
         okaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757984724; x=1758589524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=Uzx+QRmahoDX48MfmVEAhqDrL0t9uMS1MIUVLjVrMG9ptqH167AopGRn1lc5RI2sGh
         7wgIZddaLp+ymkRHclXaqw7imZAt3Xs3Qze3S8vtxHb8q03Cy86NaUAfa+hvo9vaTwTR
         FsNWMqZpp1CMHNGMLykVoW4kUb2Ks1KfxnT7cfsOZqolHnTwp7EIzlNC61IN3Fs5cK59
         XaouKYHDz6x2o/poyggSQ3iZEUA3A8Q7cbhcHo0QiE6K8z5tm6+66YJblHZ5oNF2PspM
         x4ulDCZOCMvdxC76nhSh6w9RwKM5qKFCw/5oewh6NmC6QRq3NHRLUDsfwYF2liWtXVNT
         caEA==
X-Forwarded-Encrypted: i=1; AJvYcCXbfqDL2qZ34iL0aSuk84a0kGD6NOicxDgSpaFd74WBOMDVR5VfaG+BYhLMXADyXHGpHU+2MZ889yaBBlYC@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/UqwgGiQk5ant8/VNnTTUIsx9yUPuOqCwHAlvm8KfYj1GJt/
	vKmITQH8USv1KQudPsG21dbQtmZyoWjC1mx/yl7mMZ8WJ3wq8PU3DqorKVeNu0DrUYJsLMZiRDh
	dIiiuw6mxSznRktZCKJ7vw/LDQoU9uDI=
X-Gm-Gg: ASbGncufpZQvH+PmmuKY0GJjbtK8Gv+Fi5DFGDC0Pnbab0mQxcMFv5O5nG1wp2dGLpj
	wg0flLnfrDjpGAPUkD7l3izf9Cs9Rl6ViQFowPdtxyJnqNW6FgJuCRRtzFo2kzYZzrIssvKRcgN
	3yvpj13khNjDioVspi6+AKlqBqhNef6woeZNLhENxgCqkAhL4im7FFIiodkUm3y3Tw7kq5yUSk4
	PGPPRIn3aXqO77f7g==
X-Google-Smtp-Source: AGHT+IFaJEo1gVHkPCEaCD3vWYjtreYFiQ2WOrRU9CIpbMyg97OVJtr/v3uxdpG+fiXE68E0IfjXLuECnr1bsw09sPQ=
X-Received: by 2002:a05:6902:2b02:b0:e98:9926:e5ca with SMTP id
 3f1490d57ef6-ea3d9a6c911mr10729577276.36.1757984723469; Mon, 15 Sep 2025
 18:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250915-modebranche-marken-fc832a25e05d@brauner>
In-Reply-To: <20250915-modebranche-marken-fc832a25e05d@brauner>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 04:04:47 +0300
X-Gm-Features: Ac12FXwuxsP2xoupllcCoDiRw8q2uuerrvP566PgC2Qr6qfMP36Zqdrto9P8zEU
Message-ID: <CAPnZJGAjfpHZn_VzU3ry9ZV6OUS0RN2iWos153_oM_PhVbMgVg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 4:34=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> Split it up into multiple patch series. Send a first series that
> focusses only on removing the generic infrastructure keeping it as
> contained as possible. Only do non-generic cleanups that are absolutely
> essential for the removal. Then the cleanups can go in separate series
> later.

Ok, I will do this.
I will send a minimal patchset with arch/ changes kept to absolute minimum
or even absent. Nearly all of the changes will be in init/ and docs.
Hopefully it will pass via the VFS tree.

If it gets to kernel release, I will consider sending more patchsets.


--=20
Askar Safin

