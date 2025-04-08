Return-Path: <linux-hexagon+bounces-887-lists+linux-hexagon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3DCA80FAB
	for <lists+linux-hexagon@lfdr.de>; Tue,  8 Apr 2025 17:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 262EE8A46CF
	for <lists+linux-hexagon@lfdr.de>; Tue,  8 Apr 2025 15:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2F61DEFEC;
	Tue,  8 Apr 2025 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="digW3D/B"
X-Original-To: linux-hexagon@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4C1DA612
	for <linux-hexagon@vger.kernel.org>; Tue,  8 Apr 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125373; cv=none; b=SSafMn++ue1jGqeUQf23y+JQEumdjANR1cau5riMJLL8ObitAKakbjXLBttvBQM7TGs8usdjOTbpMHJTeVcoauab8pr6URDWYlbQu/bIQRKrxaUmLEbmrHfBbp1WxqpbtOWoUeNe1jxd+Q9nRlmJ3cpOCjAwoXrL3impyJ2T5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125373; c=relaxed/simple;
	bh=y93OEpcvQTfRreoASyUGxgT7/yvoosa5h99mf4uZzdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iouQFt+huYVFCuG2QMv1pwZ3eLdtTzeE+LqKVj1brhHtXscByc72PxLBiw1x5J1/JeJHQd6qZ/KjUIsYAX+AAfztHmWruH9wtDqQeF+aQ89rKjpq3fZbc6cKOGn521mhBRokooPSAs/0ul4xjHuTa/ODVC0bUcbzrTLtzMawd3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=digW3D/B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AuXsj000956
	for <linux-hexagon@vger.kernel.org>; Tue, 8 Apr 2025 15:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUOig53W24iOjPA1XcY3WSqZ/ZqeWElsBfbuyxJUtIQ=; b=digW3D/BFMr5qasc
	Tt8wAbmK9jYiCBp+ihAuezLc5pS/L1r5eO2f6iKkP5SiEKOj/EOBiFjSDXe0Ub+Z
	I8M74Ow8J39WLsomAX8/A03RtO21QL+FEPekxgaOJZVtmK83JUfD/ZlY8tfSJgZF
	KQmu4W2wSZyO/23BxNlWJ3cjaRNd6ot24ZfHk3tZnA99oraQK5CcigpXjwq+/1z7
	gfMVR2U5+HZ+KkhmceQEOAsn6wpiadh2z0B+fQYFY13pY8i9UTeBuNz8qyWRqrWk
	oPr9LE4LkTlrpa0+6FhhidRmVde9qY5nXQTkPNnFVMIngHvbT6ItF8s4wrSJnrVJ
	RVIG1g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe895q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-hexagon@vger.kernel.org>; Tue, 08 Apr 2025 15:16:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af9b25da540so3711434a12.2
        for <linux-hexagon@vger.kernel.org>; Tue, 08 Apr 2025 08:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125369; x=1744730169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUOig53W24iOjPA1XcY3WSqZ/ZqeWElsBfbuyxJUtIQ=;
        b=FsM9Ecp2crPhuUNk8NoaQCv870L1U+wt0puPRqGtMtpzuIwBHyT5G24+LNo4uAobS0
         kNnHPIw51XIDGtduRIqBoPQXPrtOlTEM3v58x0WQJix4pTFgS1X6eilTSOOMCt3lYag8
         /QUleEqRDrlgb84KY4WpwO7qh2iMLEkoesXoDR5pB13iHZfDLmQ+gTD/LBMg+Mr5snPG
         0OVK0QUrTZaiM4B3JozrNw4qkZVk3BYixoJ2myHMxQ8PywgaYmWTH+YfZWVI1UbJm/OG
         aI5R3E2Wfm+Lzx0sAhcywVGPT603rArXV7gkSfKI26sgqWfczO8h+kHyTMAjTkRNSlpJ
         xFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAO8XwWwHLB0KYUqCuWm0LiNcJCc0L9prnuSKVZyG6rRxWoyquWon02P9nhn24nNilESGa/2dx8OLIhRP4@vger.kernel.org
X-Gm-Message-State: AOJu0YwO6Y9KpHg45zPeyhF2MwcIeKbyRj5VcupQlX8nZDWrxwduOgZk
	2eACLQlhgwgjwLuxzG8/knr3HYZSFlpMpSGJURryM/CnK3K+wxXvcf87MmjBErCelGKAwp+ZHry
	pqa05vPLLPgonfhM3NJx/cp+PNKBuXeus/woVbUWslzHV7ZDfEcslD4cz5sPf2p+t
X-Gm-Gg: ASbGncuFCYJSqn2SEvm4cfhQiXST9IhJpuCs7HXkni4/9EjeVveLbzt0IBkiWcfncki
	cVVMjEex4+BPuAEtFN2Ait08gvp91WkX98GL3Nm0RBXaVE3fk74Gw+Q+hTRkJFtzWs3dxzp6OQ+
	DS91ow6oCdYNm2PFNA1CK7+lZ/OUFY8Qg73WQDj5oWn4OtC2tul/L17/AasOX+wMvGcjT0lpXCu
	fUMwcIN9sRw+e4QL9nBiedXp+mKdabmvftib6HZThYjQ2lTiVvZf/kUVGrHQV+fjLK2fxlh8eR+
	21fhTjo41lw7iz/sIpA5CNkYe4+5KowozWhLb5GYAy4Z7sp1nl4Vr+PEj0N6SQ0R0NyruRBGWQ=
	=
X-Received: by 2002:a17:90a:d88d:b0:2ff:58a4:9db3 with SMTP id 98e67ed59e1d1-306a492058bmr25083696a91.35.1744125369558;
        Tue, 08 Apr 2025 08:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXxrXIZKfwkOZmrZDvMkp4fCYxwmYKHFndjOAryY6UMfq8uI9Wk2SXDQaOfc62/yTo1StXwg==
X-Received: by 2002:a17:90a:d88d:b0:2ff:58a4:9db3 with SMTP id 98e67ed59e1d1-306a492058bmr25083655a91.35.1744125369184;
        Tue, 08 Apr 2025 08:16:09 -0700 (PDT)
Received: from [10.222.168.90] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b976asm11061159a91.30.2025.04.08.08.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:16:08 -0700 (PDT)
Message-ID: <b0052a1e-4089-44de-a02d-a39143d5d9c3@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 10:16:06 -0500
Precedence: bulk
X-Mailing-List: linux-hexagon@vger.kernel.org
List-Id: <linux-hexagon.vger.kernel.org>
List-Subscribe: <mailto:linux-hexagon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hexagon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/41] hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 non-uapi headers
To: Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        linux-hexagon@vger.kernel.org
References: <20250314071013.1575167-1-thuth@redhat.com>
 <20250314071013.1575167-14-thuth@redhat.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20250314071013.1575167-14-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CpfwPjPsYiLhcJ0ZZVXr5R1byK1j5gLF
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f53dba cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=DQpVxa5VyoaRFQlObUkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: CpfwPjPsYiLhcJ0ZZVXr5R1byK1j5gLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080107


On 3/14/2025 2:09 AM, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize on
> the __ASSEMBLER__ macro that is provided by the compilers now.
>
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
>
> Cc: Brian Cain <brian.cain@oss.qualcomm.com>
> Cc: linux-hexagon@vger.kernel.org
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---


Acked-by: Brian Cain <brian.cain@oss.qualcomm.com>


>   arch/hexagon/include/asm/hexagon_vm.h  |  4 ++--
>   arch/hexagon/include/asm/mem-layout.h  |  6 +++---
>   arch/hexagon/include/asm/page.h        |  4 ++--
>   arch/hexagon/include/asm/processor.h   |  4 ++--
>   arch/hexagon/include/asm/thread_info.h | 12 ++++++------
>   5 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/hexagon/include/asm/hexagon_vm.h b/arch/hexagon/include/asm/hexagon_vm.h
> index 9aa2493fe7863..e1e702eb9e12a 100644
> --- a/arch/hexagon/include/asm/hexagon_vm.h
> +++ b/arch/hexagon/include/asm/hexagon_vm.h
> @@ -39,7 +39,7 @@
>   #define HVM_TRAP1_VMGETREGS		22
>   #define HVM_TRAP1_VMTIMEROP		24
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   enum VM_CACHE_OPS {
>   	hvmc_ickill,
> @@ -178,7 +178,7 @@ static inline long __vmintop_clear(long i)
>   
>   #else /* Only assembly code should reference these */
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   /*
>    * Constants for virtual instruction parameters and return values
> diff --git a/arch/hexagon/include/asm/mem-layout.h b/arch/hexagon/include/asm/mem-layout.h
> index e2f99413fe56e..8bad920d8928a 100644
> --- a/arch/hexagon/include/asm/mem-layout.h
> +++ b/arch/hexagon/include/asm/mem-layout.h
> @@ -25,7 +25,7 @@
>    */
>   
>   #ifdef CONFIG_HEXAGON_PHYS_OFFSET
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   extern unsigned long	__phys_offset;
>   #endif
>   #define PHYS_OFFSET	__phys_offset
> @@ -44,7 +44,7 @@ extern unsigned long	__phys_offset;
>   #define STACK_TOP			TASK_SIZE
>   #define STACK_TOP_MAX			TASK_SIZE
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   enum fixed_addresses {
>   	FIX_KMAP_BEGIN,
>   	FIX_KMAP_END,  /*  check for per-cpuism  */
> @@ -101,7 +101,7 @@ extern int max_kernel_seg;
>    * and pkmap_base begins.
>    */
>   #define VMALLOC_END (PKMAP_BASE-PAGE_SIZE*2)
> -#endif /*  !__ASSEMBLY__  */
> +#endif /*  !__ASSEMBLER__  */
>   
>   
>   #endif /* _ASM_HEXAGON_MEM_LAYOUT_H */
> diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
> index 137ba7c5de481..7e651428a08c0 100644
> --- a/arch/hexagon/include/asm/page.h
> +++ b/arch/hexagon/include/asm/page.h
> @@ -48,7 +48,7 @@
>   #include <vdso/page.h>
>   
>   #ifdef __KERNEL__
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   /*
>    * This is for PFN_DOWN, which mm.h needs.  Seems the right place to pull it in.
> @@ -128,7 +128,7 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>   /* XXX Todo: implement assembly-optimized version of getorder. */
>   #include <asm-generic/getorder.h>
>   
> -#endif /* ifdef __ASSEMBLY__ */
> +#endif /* ifdef __ASSEMBLER__ */
>   #endif /* ifdef __KERNEL__ */
>   
>   #endif
> diff --git a/arch/hexagon/include/asm/processor.h b/arch/hexagon/include/asm/processor.h
> index 0cd39c2cdf8f7..b93c2cc4be22e 100644
> --- a/arch/hexagon/include/asm/processor.h
> +++ b/arch/hexagon/include/asm/processor.h
> @@ -8,7 +8,7 @@
>   #ifndef _ASM_PROCESSOR_H
>   #define _ASM_PROCESSOR_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <asm/mem-layout.h>
>   #include <asm/registers.h>
> @@ -124,6 +124,6 @@ struct hexagon_switch_stack {
>   	unsigned long		lr;
>   };
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/hexagon/include/asm/thread_info.h b/arch/hexagon/include/asm/thread_info.h
> index e90f280b9ce3e..a0da6c694c87b 100644
> --- a/arch/hexagon/include/asm/thread_info.h
> +++ b/arch/hexagon/include/asm/thread_info.h
> @@ -10,7 +10,7 @@
>   
>   #ifdef __KERNEL__
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   #include <asm/processor.h>
>   #include <asm/registers.h>
>   #include <asm/page.h>
> @@ -20,7 +20,7 @@
>   #define THREAD_SIZE		(1<<THREAD_SHIFT)
>   #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   /*
>    * This is union'd with the "bottom" of the kernel stack.
> @@ -47,13 +47,13 @@ struct thread_info {
>   	unsigned long		sp;
>   };
>   
> -#else /* !__ASSEMBLY__ */
> +#else /* !__ASSEMBLER__ */
>   
>   #include <asm/asm-offsets.h>
>   
> -#endif  /* __ASSEMBLY__  */
> +#endif  /* __ASSEMBLER__  */
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #define INIT_THREAD_INFO(tsk)                   \
>   {                                               \
> @@ -73,7 +73,7 @@ struct thread_info {
>   register struct thread_info *__current_thread_info asm(QUOTED_THREADINFO_REG);
>   #define current_thread_info()  __current_thread_info
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   /*
>    * thread information flags

