Return-Path: <linux-hexagon+bounces-315-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797019590F3
	for <lists+linux-hexagon@lfdr.de>; Wed, 21 Aug 2024 01:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCBEBB21A88
	for <lists+linux-hexagon@lfdr.de>; Tue, 20 Aug 2024 23:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719A41C824A;
	Tue, 20 Aug 2024 23:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f8gJocVQ"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3FA1C823A
	for <linux-hexagon@vger.kernel.org>; Tue, 20 Aug 2024 23:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724195693; cv=none; b=rUhUwH5gcT9eQNptBTbKKVZzdhvCpehrv3FOumLPCr15cypg1RhiS5/zxLHPwQ7/ZGRhX0PoNnzGYDSbcqYUEJTBh9ghbY7989RLiOsAnVvFWgExbYPPffvEQbHoJF7P9LmQEfEY8TuAiA5qvrWaGNzkJUQJFGIJ65RZ3QLsuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724195693; c=relaxed/simple;
	bh=nckn/ACuUCXKUHZUjBc6R24Vi0Pj7RKIqrpyrBb0hK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nje/MpLNK7WWK7vAzcJJ6WJSnurQTk8HQNL3xNsBpch1JRYWQxV7JmZzUEpyC0fILWryapHjrKOi1XFDVbgCxiDB6VR+uaSNTqXrgpmlNQBlzHNa3gcfBZzv3L/25pLqPUuQ8pA+lnIiINv+DKvk8h9GX/rFh9EYQhvzXET7YIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f8gJocVQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3ce5bc7d2so39990831fa.0
        for <linux-hexagon@vger.kernel.org>; Tue, 20 Aug 2024 16:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724195689; x=1724800489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpP8ev1lBfVEjoqBrYWzcv3KCLxacpjk/n6u4rHzeVA=;
        b=f8gJocVQ08uo34U350sTAKplHFQIHRK1WbW4Hiq1N77eNiV3CdGCJ6NDxyezkGCdB6
         ZhfGMCCCicbycopomTMdTNVw96TUS+7FGBYCzJnPXL8irD5kWRvWkJIt6UGCxCHkJxOn
         xPXvrtTeckkkPsfAnIYZP8bXuDFtOwLQbO4fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724195689; x=1724800489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpP8ev1lBfVEjoqBrYWzcv3KCLxacpjk/n6u4rHzeVA=;
        b=EW4dSnuxWc+x/w3nlozGIztDlz+6lW5jKW2pA5/9bkATJxRdH+1LMX0y+b5xJW4XNH
         blB9uofYkf79f5168wI/s5hPVZiqgFVLp2gZR7hxbKL0MBWwXkosTd/e8QfrjNZlXVVo
         AGhioeYU34N0BbaWNcQR3f3p8gCupva0opB2BB3IISjJvhbhp6iEmDEqhDVufkeXo62n
         KMqkEhnm7tf0t+lbPJx8xss2yjlWpcpScPK9G2l2K0bPOl44Ag/Wp+dmoSa5MS8XKX7C
         +rI/yXco+xiizwtxreWcROz2z2Ty4r50Ok/97+T6neVSfcqTWeLdncwA08Gb833dLgDC
         CexQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg4yheuS4CJINrYRHuarChUXkekL9IVTwEfLiidH+Y0W0VUt39CBwU5VijZIG451Oo6AcwZ0hY3aibhIKj@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTCD44z9R7HLjbYrEWzn/w1uKZ1cMMTfkAPG+5lI/EZGlHZre
	9rwzRhcwYTeG+DroC3ARjG6ALxNSrl5hrGpAVQARn4cmSp6xk5e4d8f5flNqagkdV7MmcPE+cuW
	9vaYvYw==
X-Google-Smtp-Source: AGHT+IE04qGzSM5RbPoA5UNQF6Zjp6+Ui7OtZbkuTB5ns2HSctDBmhKSxKXm2O/p5pJRRyH59U2B2A==
X-Received: by 2002:a2e:7305:0:b0:2f3:f111:9bc4 with SMTP id 38308e7fff4ca-2f3f8b3ce81mr2345591fa.43.1724195688571;
        Tue, 20 Aug 2024 16:14:48 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b746cc8fsm18830191fa.6.2024.08.20.16.14.47
        for <linux-hexagon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 16:14:47 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso69165091fa.3
        for <linux-hexagon@vger.kernel.org>; Tue, 20 Aug 2024 16:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwS5sdVgk4qkDLjvpnbC3GFHXPSidjY0/3BcFcaVbdvyAeIXSK9gCyZAFIaTAqfU0Lr2por+M1RvNQPHV7@vger.kernel.org
X-Received: by 2002:a05:651c:2106:b0:2ef:20ae:d116 with SMTP id
 38308e7fff4ca-2f3f871da24mr2996741fa.0.1724195686588; Tue, 20 Aug 2024
 16:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812082605.743814-1-mpe@ellerman.id.au> <20240819185253.GA2333884@thelio-3990X>
 <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
 <20240819195120.GA1113263@thelio-3990X> <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
 <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com>
 <87y14rso9o.fsf@mail.lhotse> <CAHk-=wiS7PMtL6oR6acNgWZr0NN4Ax4PQD_CYJKCiKS0mT=Z7A@mail.gmail.com>
 <dff57198-7955-ec09-8909-671982834673@landley.net> <CAHk-=wj78UV2ep6i5JZ-1qhLPZPHV4eUOtjWqqh_3zcqJ7pK-Q@mail.gmail.com>
 <67108df9-7374-a64e-ca82-8c46d67fb55b@landley.net>
In-Reply-To: <67108df9-7374-a64e-ca82-8c46d67fb55b@landley.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Aug 2024 16:14:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvR+z=0=0gzgdfUiK70JTa-=+9vxD-4T=3BagXR6dciA@mail.gmail.com>
Message-ID: <CAHk-=whvR+z=0=0gzgdfUiK70JTa-=+9vxD-4T=3BagXR6dciA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
To: Rob Landley <rob@landley.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	christophe.leroy@csgroup.eu, jeffxu@google.com, Liam.Howlett@oracle.com, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, linux-um@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon <linux-hexagon@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000006d273206202597c9"

--0000000000006d273206202597c9
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Aug 2024 at 14:56, Rob Landley <rob@landley.net> wrote:
>
> Tested-by: Rob Landley <rob@landley.net>

Ok, here's the patch with the fixes for problems that were pointed
out, and with the beginnings of a commit message.

I'm going to be traveling for the next ~10 days, and while I'll have
my laptop and internet, I'm unlikely to work on this any more.

Andrew - I think this is good, but there may be other issues lurking.
Do with it as you see fit,

            Linus

--0000000000006d273206202597c9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mm-remove-legacy-install_special_mapping-code.patch"
Content-Disposition: attachment; 
	filename="0001-mm-remove-legacy-install_special_mapping-code.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m031kfrh0>
X-Attachment-Id: f_m031kfrh0

RnJvbSBlZjRlODRkNjljM2Q2NjllNjA2YjVkMzg2NjI1MjY3YTNiOWM5NTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IFR1ZSwgMjAgQXVnIDIwMjQgMTU6MTQ6NDcgLTA3MDAKU3ViamVjdDog
W1BBVENIXSBtbTogcmVtb3ZlIGxlZ2FjeSBpbnN0YWxsX3NwZWNpYWxfbWFwcGluZygpIGNvZGUK
CkFsbCByZWxldmFudCBhcmNoaXRlY3R1cmVzIGhhZCBhbHJlYWR5IGJlZW4gY29udmVydGVkIHRv
IHRoZSBuZXcKaW50ZXJmYWNlICh3aGljaCBqdXN0IGhhcyBhbiB1bmRlcnNjb3JlIGluIGZyb250
IG9mIHRoZSBuYW1lIC0gbm90IHZlcnkKaW1hZ2luYXRpdmUgbmFtaW5nKSwgdGhpcyBqdXN0IGZv
cmNlLWNvbnZlcnRzIHRoZSBzdHJhZ2dsZXJzLgoKVGhlIG1vZGVybiBpbnRlcmZhY2UgaXMgYWxt
b3N0IGlkZW50aWNhbCB0byB0aGUgb2xkIG9uZSwgZXhjZXB0IGluc3RlYWQKb2YgdGhlIHBhZ2Ug
cG9pbnRlciBpdCB0YWtlcyBhICJzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nIiB0aGF0CmRlc2Ny
aWJlcyB0aGUgbWFwcGluZyAoYW5kIGNvbnRhaW5zIHRoZSBwYWdlIHBvaW50ZXIgYXMgb25lIG1l
bWJlciksIGFuZAppdCByZXR1cm5zIHRoZSByZXN1bHRpbmcgJ3ZtYScgaW5zdGVhZCBvZiBqdXN0
IHRoZSBlcnJvciBjb2RlLgoKR2V0dGluZyByaWQgb2YgdGhlIG9sZCBpbnRlcmZhY2UgYWxzbyBn
ZXRzIHJpZCBvZiBzb21lIHNwZWNpYWwgY2FzaW5nLAp3aGljaCBoYWQgY2F1c2VkIHByb2JsZW1z
IHdpdGggdGhlIG1yZW1hcCBleHRlbnNpb25zIHRvICJzdHJ1Y3QKdm1fc3BlY2lhbF9tYXBwaW5n
Ii4KClRlc3RlZC1ieTogUm9iIExhbmRsZXkgPHJvYkBsYW5kbGV5Lm5ldD4gIyBhcmNoL3NoLwpM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MTkxOTUxMjAuR0ExMTEzMjYz
QHRoZWxpby0zOTkwWC8KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5v
cmc+CkNjOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+CkNjOiBNaWNoYWVs
IEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFRvcnZh
bGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KLS0tCiBhcmNoL2Nza3kva2VybmVs
L3Zkc28uYyAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIGFyY2gv
aGV4YWdvbi9rZXJuZWwvdmRzby5jICAgICAgICAgfCAxNCArKysrKysrKystLS0tCiBhcmNoL25p
b3MyL21tL2luaXQuYyAgICAgICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0KIGFyY2gvc2gva2Vy
bmVsL3ZzeXNjYWxsL3ZzeXNjYWxsLmMgfCAxNCArKysrKysrKysrLS0tCiBhcmNoL3g4Ni91bS92
ZHNvL3ZtYS5jICAgICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0KIGluY2x1ZGUvbGludXgvbW0u
aCAgICAgICAgICAgICAgICAgfCAgNCAtLS0tCiBtbS9tbWFwLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMzIgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiA3IGZpbGVzIGNoYW5n
ZWQsIDYzIGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
Y3NreS9rZXJuZWwvdmRzby5jIGIvYXJjaC9jc2t5L2tlcm5lbC92ZHNvLmMKaW5kZXggMmNhODg2
ZTRhNDU4Li4xY2QxM2EyYjM0ZWIgMTAwNjQ0Ci0tLSBhL2FyY2gvY3NreS9rZXJuZWwvdmRzby5j
CisrKyBiL2FyY2gvY3NreS9rZXJuZWwvdmRzby5jCkBAIC00NSw5ICs0NSwxNiBAQCBhcmNoX2lu
aXRjYWxsKHZkc29faW5pdCk7CiBpbnQgYXJjaF9zZXR1cF9hZGRpdGlvbmFsX3BhZ2VzKHN0cnVj
dCBsaW51eF9iaW5wcm0gKmJwcm0sCiAJaW50IHVzZXNfaW50ZXJwKQogeworCXN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hOwogCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07CiAJ
dW5zaWduZWQgbG9uZyB2ZHNvX2Jhc2UsIHZkc29fbGVuOwogCWludCByZXQ7CisJc3RhdGljIHN0
cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgdmRzb19tYXBwaW5nID0geworCQkubmFtZSA9ICJbdmRz
b10iLAorCX07CisJc3RhdGljIHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgdnZhcl9tYXBwaW5n
ID0geworCQkubmFtZSA9ICJbdnZhcl0iLAorCX07CiAKIAl2ZHNvX2xlbiA9ICh2ZHNvX3BhZ2Vz
ICsgMSkgPDwgUEFHRV9TSElGVDsKIApAQCAtNjUsMjIgKzcyLDI5IEBAIGludCBhcmNoX3NldHVw
X2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwKIAkgKi8KIAltbS0+
Y29udGV4dC52ZHNvID0gKHZvaWQgKil2ZHNvX2Jhc2U7CiAKLQlyZXQgPQotCSAgIGluc3RhbGxf
c3BlY2lhbF9tYXBwaW5nKG1tLCB2ZHNvX2Jhc2UsIHZkc29fcGFnZXMgPDwgUEFHRV9TSElGVCwK
Kwl2ZHNvX21hcHBpbmcucGFnZXMgPSB2ZHNvX3BhZ2VsaXN0OworCXZtYSA9CisJICAgX2luc3Rh
bGxfc3BlY2lhbF9tYXBwaW5nKG1tLCB2ZHNvX2Jhc2UsIHZkc29fcGFnZXMgPDwgUEFHRV9TSElG
VCwKIAkJKFZNX1JFQUQgfCBWTV9FWEVDIHwgVk1fTUFZUkVBRCB8IFZNX01BWVdSSVRFIHwgVk1f
TUFZRVhFQyksCi0JCXZkc29fcGFnZWxpc3QpOworCQkmdmRzb19tYXBwaW5nKTsKIAotCWlmICh1
bmxpa2VseShyZXQpKSB7CisJaWYgKHVubGlrZWx5KElTX0VSUih2bWEpKSkgeworCQlyZXQgPSBQ
VFJfRVJSKHZtYSk7CiAJCW1tLT5jb250ZXh0LnZkc28gPSBOVUxMOwogCQlnb3RvIGVuZDsKIAl9
CiAKIAl2ZHNvX2Jhc2UgKz0gKHZkc29fcGFnZXMgPDwgUEFHRV9TSElGVCk7Ci0JcmV0ID0gaW5z
dGFsbF9zcGVjaWFsX21hcHBpbmcobW0sIHZkc29fYmFzZSwgUEFHRV9TSVpFLAotCQkoVk1fUkVB
RCB8IFZNX01BWVJFQUQpLCAmdmRzb19wYWdlbGlzdFt2ZHNvX3BhZ2VzXSk7CisJdnZhcl9tYXBw
aW5nLnBhZ2VzID0gJnZkc29fcGFnZWxpc3RbdmRzb19wYWdlc107CisJdm1hID0gX2luc3RhbGxf
c3BlY2lhbF9tYXBwaW5nKG1tLCB2ZHNvX2Jhc2UsIFBBR0VfU0laRSwKKwkJKFZNX1JFQUQgfCBW
TV9NQVlSRUFEKSwgJnZ2YXJfbWFwcGluZyk7CiAKLQlpZiAodW5saWtlbHkocmV0KSkKKwlpZiAo
dW5saWtlbHkoSVNfRVJSKHZtYSkpKSB7CisJCXJldCA9IFBUUl9FUlIodm1hKTsKIAkJbW0tPmNv
bnRleHQudmRzbyA9IE5VTEw7CisJCWdvdG8gZW5kOworCX0KKwlyZXQgPSAwOwogZW5kOgogCW1t
YXBfd3JpdGVfdW5sb2NrKG1tKTsKIAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvYXJjaC9oZXhh
Z29uL2tlcm5lbC92ZHNvLmMgYi9hcmNoL2hleGFnb24va2VybmVsL3Zkc28uYwppbmRleCAyZTQ4
NzJkNjIxMjQuLjZmZDI3ZmYxZGY3MyAxMDA2NDQKLS0tIGEvYXJjaC9oZXhhZ29uL2tlcm5lbC92
ZHNvLmMKKysrIGIvYXJjaC9oZXhhZ29uL2tlcm5lbC92ZHNvLmMKQEAgLTUxLDcgKzUxLDExIEBA
IGludCBhcmNoX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBy
bSwgaW50IHVzZXNfaW50ZXJwKQogewogCWludCByZXQ7CiAJdW5zaWduZWQgbG9uZyB2ZHNvX2Jh
c2U7CisJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAJc3RydWN0IG1tX3N0cnVjdCAqbW0g
PSBjdXJyZW50LT5tbTsKKwlzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyB2ZHNvX21h
cHBpbmcgPSB7CisJCW5hbWUgPSAiW3Zkc29dIiwKKwl9OwogCiAJaWYgKG1tYXBfd3JpdGVfbG9j
a19raWxsYWJsZShtbSkpCiAJCXJldHVybiAtRUlOVFI7CkBAIC02NiwxNiArNzAsMTggQEAgaW50
IGFyY2hfc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhzdHJ1Y3QgbGludXhfYmlucHJtICpicHJtLCBp
bnQgdXNlc19pbnRlcnApCiAJfQogCiAJLyogTUFZV1JJVEUgdG8gYWxsb3cgZ2RiIHRvIENPVyBh
bmQgc2V0IGJyZWFrcG9pbnRzLiAqLwotCXJldCA9IGluc3RhbGxfc3BlY2lhbF9tYXBwaW5nKG1t
LCB2ZHNvX2Jhc2UsIFBBR0VfU0laRSwKKwl2ZHNvX21hcHBpbmcucGFnZXMgPSAmdmRzb19wYWdl
OworCXZtYSA9IF9pbnN0YWxsX3NwZWNpYWxfbWFwcGluZyhtbSwgdmRzb19iYXNlLCBQQUdFX1NJ
WkUsCiAJCQkJICAgICAgVk1fUkVBRHxWTV9FWEVDfAogCQkJCSAgICAgIFZNX01BWVJFQUR8Vk1f
TUFZV1JJVEV8Vk1fTUFZRVhFQywKLQkJCQkgICAgICAmdmRzb19wYWdlKTsKKwkJCQkgICAgICAm
dmRzb19tYXBwaW5nKTsKIAotCWlmIChyZXQpCisJcmV0ID0gUFRSX0VSUih2bWEpOworCWlmIChJ
U19FUlIodm1hKSkKIAkJZ290byB1cF9mYWlsOwogCiAJbW0tPmNvbnRleHQudmRzbyA9ICh2b2lk
ICopdmRzb19iYXNlOwotCisJcmV0ID0gMDsKIHVwX2ZhaWw6CiAJbW1hcF93cml0ZV91bmxvY2so
bW0pOwogCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9hcmNoL25pb3MyL21tL2luaXQuYyBiL2Fy
Y2gvbmlvczIvbW0vaW5pdC5jCmluZGV4IDM0NTlkZjI4YWZlZS4uYTIyNzg0ODVkZTE5IDEwMDY0
NAotLS0gYS9hcmNoL25pb3MyL21tL2luaXQuYworKysgYi9hcmNoL25pb3MyL21tL2luaXQuYwpA
QCAtODIsNiArODIsMTAgQEAgdm9pZCBfX2luaXQgbW11X2luaXQodm9pZCkKIHBnZF90IHN3YXBw
ZXJfcGdfZGlyW1BUUlNfUEVSX1BHRF0gX19hbGlnbmVkKFBBR0VfU0laRSk7CiBwdGVfdCBpbnZh
bGlkX3B0ZV90YWJsZVtQVFJTX1BFUl9QVEVdIF9fYWxpZ25lZChQQUdFX1NJWkUpOwogc3RhdGlj
IHN0cnVjdCBwYWdlICprdXNlcl9wYWdlWzFdOworc3RhdGljIHN0cnVjdCB2bV9zcGVjaWFsX21h
cHBpbmcgdmRzb19tYXBwaW5nID0geworCS5uYW1lID0gIlt2ZHNvXSIsCisJLnBhZ2VzID0ga3Vz
ZXJfcGFnZSwKK307CiAKIHN0YXRpYyBpbnQgYWxsb2Nfa3VzZXJfcGFnZSh2b2lkKQogewpAQCAt
MTA2LDE4ICsxMTAsMTggQEAgYXJjaF9pbml0Y2FsbChhbGxvY19rdXNlcl9wYWdlKTsKIGludCBh
cmNoX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwgaW50
IHVzZXNfaW50ZXJwKQogewogCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Ci0J
aW50IHJldDsKKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKIAogCW1tYXBfd3JpdGVfbG9j
ayhtbSk7CiAKIAkvKiBNYXAga3VzZXIgaGVscGVycyB0byB1c2VyIHNwYWNlIGFkZHJlc3MgKi8K
LQlyZXQgPSBpbnN0YWxsX3NwZWNpYWxfbWFwcGluZyhtbSwgS1VTRVJfQkFTRSwgS1VTRVJfU0la
RSwKKwl2bWEgPSBfaW5zdGFsbF9zcGVjaWFsX21hcHBpbmcobW0sIEtVU0VSX0JBU0UsIEtVU0VS
X1NJWkUsCiAJCQkJICAgICAgVk1fUkVBRCB8IFZNX0VYRUMgfCBWTV9NQVlSRUFEIHwKLQkJCQkg
ICAgICBWTV9NQVlFWEVDLCBrdXNlcl9wYWdlKTsKKwkJCQkgICAgICBWTV9NQVlFWEVDLCAmdmRz
b19tYXBwaW5nKTsKIAogCW1tYXBfd3JpdGVfdW5sb2NrKG1tKTsKIAotCXJldHVybiByZXQ7CisJ
cmV0dXJuIElTX0VSUih2bWEpID8gUFRSX0VSUih2bWEpIDogMDsKIH0KIAogY29uc3QgY2hhciAq
YXJjaF92bWFfbmFtZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKZGlmZiAtLWdpdCBhL2Fy
Y2gvc2gva2VybmVsL3ZzeXNjYWxsL3ZzeXNjYWxsLmMgYi9hcmNoL3NoL2tlcm5lbC92c3lzY2Fs
bC92c3lzY2FsbC5jCmluZGV4IDFiZDg1YTY5NDljNC4uZTJkYjI5MWQ4N2NhIDEwMDY0NAotLS0g
YS9hcmNoL3NoL2tlcm5lbC92c3lzY2FsbC92c3lzY2FsbC5jCisrKyBiL2FyY2gvc2gva2VybmVs
L3ZzeXNjYWxsL3ZzeXNjYWxsLmMKQEAgLTM2LDYgKzM2LDEwIEBAIF9fc2V0dXAoInZkc289Iiwg
dmRzb19zZXR1cCk7CiAgKi8KIGV4dGVybiBjb25zdCBjaGFyIHZzeXNjYWxsX3RyYXBhX3N0YXJ0
LCB2c3lzY2FsbF90cmFwYV9lbmQ7CiBzdGF0aWMgc3RydWN0IHBhZ2UgKnN5c2NhbGxfcGFnZXNb
MV07CitzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyB2ZHNvX21hcHBpbmcgPSB7CisJ
Lm5hbWUgPSAiW3Zkc29dIiwKKwkucGFnZXMgPSBzeXNjYWxsX3BhZ2VzLAorfTsKIAogaW50IF9f
aW5pdCB2c3lzY2FsbF9pbml0KHZvaWQpCiB7CkBAIC01OCw2ICs2Miw3IEBAIGludCBfX2luaXQg
dnN5c2NhbGxfaW5pdCh2b2lkKQogaW50IGFyY2hfc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhzdHJ1
Y3QgbGludXhfYmlucHJtICpicHJtLCBpbnQgdXNlc19pbnRlcnApCiB7CiAJc3RydWN0IG1tX3N0
cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKIAl1
bnNpZ25lZCBsb25nIGFkZHI7CiAJaW50IHJldDsKIApAQCAtNzAsMTQgKzc1LDE3IEBAIGludCBh
cmNoX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwgaW50
IHVzZXNfaW50ZXJwKQogCQlnb3RvIHVwX2ZhaWw7CiAJfQogCi0JcmV0ID0gaW5zdGFsbF9zcGVj
aWFsX21hcHBpbmcobW0sIGFkZHIsIFBBR0VfU0laRSwKKwl2ZHNvX21hcHBpbmcucGFnZXMgPSBz
eXNjYWxsX3BhZ2VzOworCXZtYSA9IF9pbnN0YWxsX3NwZWNpYWxfbWFwcGluZyhtbSwgYWRkciwg
UEFHRV9TSVpFLAogCQkJCSAgICAgIFZNX1JFQUQgfCBWTV9FWEVDIHwKIAkJCQkgICAgICBWTV9N
QVlSRUFEIHwgVk1fTUFZV1JJVEUgfCBWTV9NQVlFWEVDLAotCQkJCSAgICAgIHN5c2NhbGxfcGFn
ZXMpOwotCWlmICh1bmxpa2VseShyZXQpKQorCQkJCSAgICAgICZ2ZHNvX21hcHBpbmcpOworCXJl
dCA9IFBUUl9FUlIodm1hKTsKKwlpZiAodW5saWtlbHkoSVNfRVJSKHZtYSkpKQogCQlnb3RvIHVw
X2ZhaWw7CiAKIAljdXJyZW50LT5tbS0+Y29udGV4dC52ZHNvID0gKHZvaWQgKilhZGRyOworCXJl
dCA9IDA7CiAKIHVwX2ZhaWw6CiAJbW1hcF93cml0ZV91bmxvY2sobW0pOwpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvdW0vdmRzby92bWEuYyBiL2FyY2gveDg2L3VtL3Zkc28vdm1hLmMKaW5kZXggNzZk
OWY2Y2U3YTNkLi5mMjM4ZjdiMzNjZGQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3VtL3Zkc28vdm1h
LmMKKysrIGIvYXJjaC94ODYvdW0vdmRzby92bWEuYwpAQCAtNTIsOCArNTIsMTEgQEAgc3Vic3lz
X2luaXRjYWxsKGluaXRfdmRzbyk7CiAKIGludCBhcmNoX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMo
c3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwgaW50IHVzZXNfaW50ZXJwKQogewotCWludCBlcnI7
CisJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBj
dXJyZW50LT5tbTsKKwlzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyB2ZHNvX21hcHBp
bmcgPSB7CisJCS5uYW1lID0gIlt2ZHNvXSIsCisJfTsKIAogCWlmICghdmRzb19lbmFibGVkKQog
CQlyZXR1cm4gMDsKQEAgLTYxLDEyICs2NCwxMyBAQCBpbnQgYXJjaF9zZXR1cF9hZGRpdGlvbmFs
X3BhZ2VzKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIGludCB1c2VzX2ludGVycCkKIAlpZiAo
bW1hcF93cml0ZV9sb2NrX2tpbGxhYmxlKG1tKSkKIAkJcmV0dXJuIC1FSU5UUjsKIAotCWVyciA9
IGluc3RhbGxfc3BlY2lhbF9tYXBwaW5nKG1tLCB1bV92ZHNvX2FkZHIsIFBBR0VfU0laRSwKKwl2
ZHNvX21hcHBpbmcucGFnZXMgPSB2ZHNvcDsKKwl2bWEgPSBfaW5zdGFsbF9zcGVjaWFsX21hcHBp
bmcobW0sIHVtX3Zkc29fYWRkciwgUEFHRV9TSVpFLAogCQlWTV9SRUFEfFZNX0VYRUN8CiAJCVZN
X01BWVJFQUR8Vk1fTUFZV1JJVEV8Vk1fTUFZRVhFQywKLQkJdmRzb3ApOworCQkmdmRzb19tYXBw
aW5nKTsKIAogCW1tYXBfd3JpdGVfdW5sb2NrKG1tKTsKIAotCXJldHVybiBlcnI7CisJcmV0dXJu
IElTX0VSUih2bWEpID8gUFRSX0VSUih2bWEpIDogMDsKIH0KZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAppbmRleCA2NTQ5ZDA5NzliMjguLjdiN2U0
Nzk3YzBmZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvbW0uaApAQCAtMzM4MSwxMCArMzM4MSw2IEBAIGV4dGVybiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKl9pbnN0YWxsX3NwZWNpYWxfbWFwcGluZyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAkJCQkg
ICB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgbGVuLAogCQkJCSAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3MsCiAJCQkJICAgY29uc3Qgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyAqc3Bl
Yyk7Ci0vKiBUaGlzIGlzIGFuIG9ic29sZXRlIGFsdGVybmF0aXZlIHRvIF9pbnN0YWxsX3NwZWNp
YWxfbWFwcGluZy4gKi8KLWV4dGVybiBpbnQgaW5zdGFsbF9zcGVjaWFsX21hcHBpbmcoc3RydWN0
IG1tX3N0cnVjdCAqbW0sCi0JCQkJICAgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25n
IGxlbiwKLQkJCQkgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKTsK
IAogdW5zaWduZWQgbG9uZyByYW5kb21pemVfc3RhY2tfdG9wKHVuc2lnbmVkIGxvbmcgc3RhY2tf
dG9wKTsKIHVuc2lnbmVkIGxvbmcgcmFuZG9taXplX3BhZ2UodW5zaWduZWQgbG9uZyBzdGFydCwg
dW5zaWduZWQgbG9uZyByYW5nZSk7CmRpZmYgLS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMK
aW5kZXggZDBkZmM4NWIyMDliLi5lY2U5MmU2YzNlYWQgMTAwNjQ0Ci0tLSBhL21tL21tYXAuYwor
KysgYi9tbS9tbWFwLmMKQEAgLTM2NjUsMjcgKzM2NjUsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB2bV9vcGVyYXRpb25zX3N0cnVjdCBzcGVjaWFsX21hcHBpbmdfdm1vcHMgPSB7CiAJLm1heV9z
cGxpdCA9IHNwZWNpYWxfbWFwcGluZ19zcGxpdCwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qg
dm1fb3BlcmF0aW9uc19zdHJ1Y3QgbGVnYWN5X3NwZWNpYWxfbWFwcGluZ192bW9wcyA9IHsKLQku
Y2xvc2UgPSBzcGVjaWFsX21hcHBpbmdfY2xvc2UsCi0JLmZhdWx0ID0gc3BlY2lhbF9tYXBwaW5n
X2ZhdWx0LAotfTsKLQogc3RhdGljIHZtX2ZhdWx0X3Qgc3BlY2lhbF9tYXBwaW5nX2ZhdWx0KHN0
cnVjdCB2bV9mYXVsdCAqdm1mKQogewogCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1m
LT52bWE7CiAJcGdvZmZfdCBwZ29mZjsKIAlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOworCXN0cnVjdCB2
bV9zcGVjaWFsX21hcHBpbmcgKnNtID0gdm1hLT52bV9wcml2YXRlX2RhdGE7CiAKLQlpZiAodm1h
LT52bV9vcHMgPT0gJmxlZ2FjeV9zcGVjaWFsX21hcHBpbmdfdm1vcHMpIHsKLQkJcGFnZXMgPSB2
bWEtPnZtX3ByaXZhdGVfZGF0YTsKLQl9IGVsc2UgewotCQlzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBw
aW5nICpzbSA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOworCWlmIChzbS0+ZmF1bHQpCisJCXJldHVy
biBzbS0+ZmF1bHQoc20sIHZtZi0+dm1hLCB2bWYpOwogCi0JCWlmIChzbS0+ZmF1bHQpCi0JCQly
ZXR1cm4gc20tPmZhdWx0KHNtLCB2bWYtPnZtYSwgdm1mKTsKLQotCQlwYWdlcyA9IHNtLT5wYWdl
czsKLQl9CisJcGFnZXMgPSBzbS0+cGFnZXM7CiAKIAlmb3IgKHBnb2ZmID0gdm1mLT5wZ29mZjsg
cGdvZmYgJiYgKnBhZ2VzOyArK3BhZ2VzKQogCQlwZ29mZi0tOwpAQCAtMzc0MCw4ICszNzMwLDcg
QEAgYm9vbCB2bWFfaXNfc3BlY2lhbF9tYXBwaW5nKGNvbnN0IHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAogCWNvbnN0IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgKnNtKQogewogCXJldHVy
biB2bWEtPnZtX3ByaXZhdGVfZGF0YSA9PSBzbSAmJgotCQkodm1hLT52bV9vcHMgPT0gJnNwZWNp
YWxfbWFwcGluZ192bW9wcyB8fAotCQkgdm1hLT52bV9vcHMgPT0gJmxlZ2FjeV9zcGVjaWFsX21h
cHBpbmdfdm1vcHMpOworCQl2bWEtPnZtX29wcyA9PSAmc3BlY2lhbF9tYXBwaW5nX3Ztb3BzOwog
fQogCiAvKgpAQCAtMzc2MiwxNyArMzc1MSw2IEBAIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqX2lu
c3RhbGxfc3BlY2lhbF9tYXBwaW5nKAogCQkJCQkmc3BlY2lhbF9tYXBwaW5nX3Ztb3BzKTsKIH0K
IAotaW50IGluc3RhbGxfc3BlY2lhbF9tYXBwaW5nKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAotCQkJ
ICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBsZW4sCi0JCQkgICAgdW5zaWdu
ZWQgbG9uZyB2bV9mbGFncywgc3RydWN0IHBhZ2UgKipwYWdlcykKLXsKLQlzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSA9IF9faW5zdGFsbF9zcGVjaWFsX21hcHBpbmcoCi0JCW1tLCBhZGRyLCBs
ZW4sIHZtX2ZsYWdzLCAodm9pZCAqKXBhZ2VzLAotCQkmbGVnYWN5X3NwZWNpYWxfbWFwcGluZ192
bW9wcyk7Ci0KLQlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKHZtYSk7Ci19Ci0KIHN0YXRpYyBERUZJ
TkVfTVVURVgobW1fYWxsX2xvY2tzX211dGV4KTsKIAogc3RhdGljIHZvaWQgdm1fbG9ja19hbm9u
X3ZtYShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgc3RydWN0IGFub25fdm1hICphbm9uX3ZtYSkKLS0g
CjIuNDMuMC40OTMuZ2JjN2VlMmU1ZTEKCg==
--0000000000006d273206202597c9--

