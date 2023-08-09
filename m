Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9A87767D7
	for <lists+linux-hexagon@lfdr.de>; Wed,  9 Aug 2023 21:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjHITEp (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 9 Aug 2023 15:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjHITEp (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 9 Aug 2023 15:04:45 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D56110DE
        for <linux-hexagon@vger.kernel.org>; Wed,  9 Aug 2023 12:04:44 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379HGMUU020490;
        Wed, 9 Aug 2023 19:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=veOTtxOYvvtEWgQLPaVIUz8sBAiab8SQ5VEgKWgiXXA=;
 b=ipTLirKGJsLafbMSqBwZWYQMaoKExndPkruXJbJwEpryx1u5MGCBBAQunt0AQBL1UkDe
 h3AwaB4TT3+4N/jJpUA4Cf1XKO1S3MKAu20l4XXqM86rD56AOFbIavUBQOzDknFlskuS
 fjXjP9bBvMyduGiIiI7WyIciQeWvJ+/ravabeU9n2O7AfSzJmjPQR9JveYNZ6KdCUaWL
 5roOv8xRT3wLmLq0fp+51NXrNCyuIoEXBPiGtLK4cR8Ui2Pw9PvU/8VDJpyjfSwTFmlw
 hQJpB2ZpSFB3k6ajGqDv3uDgbJFYRHFzJ/S3jMF+1/D4GY0YfCjbf1lsTPUKtCPaMb2y 1Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc5es1n2b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Aug 2023 19:04:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+GynDI4iKVyRSx34ELpgCPU01J9XwGNKHePTxOesmFlLneQmOsYKqiHwwwlneluVUffOib0aCYnWYYEt31OxfNwoLraiAjVAQfFgPWZiuzOHx5U460kPF4Jtfp7eBBW4lpcmNDCyxFJ6RqQh1uPsoGb2AAyJNj3xLuHBHXjaX8SW2N/SxZm+dumZl6kvoPL5TONigRkTW/BZusn9MumOzBk7ADXM8l6TTk20krZxpORtaf860dmSb7HzM1gKd+ZRbuGL5c7yb1uJfu8nSXCb+EoZGQsWIRcNtHOGtndmAXRTNsXXpb+o0bPO7OhkIm0J55EGDnN0jF3JB8NIV22GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veOTtxOYvvtEWgQLPaVIUz8sBAiab8SQ5VEgKWgiXXA=;
 b=I64jNLhDlZnu6+GDOTedFQ5Ow4Lec6b4ec4MZoK55U7lHLvp2fRnHIngIyt8CSy0D8U6wUl7YgfFlDCPnGknbUATUcYtke81ToaSbVwjWN0D6c08BDdNCM+DRwFyyzZErKburaPywr2c0ZJp9asLKZEM4yAR099nAb9F/K57BMtWIOl65FW4L07ZM3ICFDKhwD/n4HuKSJ+sYdBZluIl7uQbhp2UuZp6dsNfaO8YGwQruHtO1qSib1XH5bCNdYyCJWteatX8XgLRg+IFyRCMks5vM1RZPcSWyIBqI0c4LzeeRip43N+030R+MCt/G9uSeQASf4IrNP4Ny5PQiso9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by CO6PR02MB7700.namprd02.prod.outlook.com (2603:10b6:303:a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 19:04:34 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::1329:89ed:4c1e:a28d]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::1329:89ed:4c1e:a28d%5]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 19:04:34 +0000
From:   Brian Cain <bcain@quicinc.com>
To:     Atul Raut <rauji.raut@gmail.com>
CC:     "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: RE: hexagon: fix warning comparing pointer to 0
Thread-Topic: hexagon: fix warning comparing pointer to 0
Thread-Index: AQHZyvMPySa6VvImSE6p944YodO7OK/iUrKg
Date:   Wed, 9 Aug 2023 19:04:33 +0000
Message-ID: <SN6PR02MB420564C1F86A0BB6E76E24DEB812A@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20230809185147.98262-1-rauji.raut@gmail.com>
In-Reply-To: <20230809185147.98262-1-rauji.raut@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|CO6PR02MB7700:EE_
x-ms-office365-filtering-correlation-id: 9d344dfc-26eb-4085-a737-08db990b7804
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hcMxA5pbKkZ8iCcIBdJTUwYlJ7PIb+PhwFlFMJ1QQq1Gneg6q2oT2abER1uXq+7VG5CIfC4ynC71bUCa5l5OT4qo8VQ0Nft8RtzrfBX/vEW6eiokdH0+pCamJ0bySAkZWU8qPJRlv9ylFnlopnJMAIdGuhRFXJzFHFQM//ii1mkdtZPJSKeInGm6ichricr/dTmiX0fKHsCSv8trmuI65Lqs5pPi/NiOxHzuUjqLafKbwCiZ9/bzRhttETMIQJBkM3q4QY92qpvtkUFACyG0jh5AN3TPRaj9HrmnKHC9sKTB2ylVdUY1SYh2qI/oUQDyReEOAyCXvMm2EuZayJFsZzVjBQLO7f3LDUBKe3hzWiS1VsQpDDMshvyW8MylX0dtaYmCkjs+CeWaGOh0VmFnbozlIw1SY752SbxxbMZn3XyPXSc9tDQBKszjljlhFK6QF4a5N69aS2JtmGVyh7DfPGSGp29blfpvMHk+D9BSJbLdlU1Js4Djmu54xg3fF1P7aJu3R/UNYhvXTId/N3HwKSYLUxwB14gcN8fx6YIXyr7IqhIxIsQwmyDjXSwbOuzD98z+2NvMHhOZX5RKQSjEmhkxOCE5eJG8vnivB0EsGwKsyDpOHTfufLVskCOsK/+O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4205.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(1800799006)(186006)(55016003)(26005)(7696005)(9686003)(71200400001)(86362001)(33656002)(478600001)(122000001)(41300700001)(53546011)(6506007)(8676002)(38070700005)(5660300002)(64756008)(52536014)(66556008)(2906002)(4326008)(54906003)(6916009)(66446008)(76116006)(38100700002)(316002)(66476007)(66946007)(8936002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w4jrq6cF1a8WLV6rDYMEE3iyWztWrMpVAZXcuB7RBRK5z9eek5MEOZFvu41J?=
 =?us-ascii?Q?VJQ1kgt1A9r1XQirj/NnvMwTCXBzIO+KUCOvtsyreWqt+nSnY1bBeI366bDY?=
 =?us-ascii?Q?M8a7cH4G5srW82JoPRXIm8V57Gywv064VJ+9JQvs0SjlpvFMpJhO8JfnILDK?=
 =?us-ascii?Q?4nAdICp6k8xcjYsppykhCrjmUJOrNUsCRGjHq96iDtfjfRRPe/Ln04wyTfSj?=
 =?us-ascii?Q?38RXg2WpZW6hmmo/O9cJEWvJV0O8+Olu615I0QzxMCCvItJ9ZpG9+K8gtsyp?=
 =?us-ascii?Q?TshiWg5ja6zyRM60EvI3pWggueraN01ljhHsobqzENxsA+eGSVuNeWC/u4xE?=
 =?us-ascii?Q?wbaJvczMCJ9B4QivjUcXfR5bMMl99v/XsQfH73InEBpX9JW9XZFhQV5PFe1v?=
 =?us-ascii?Q?QYuGW+zZFUCCtACDsmrdzHsrpV9ta4HVgeRbn+JGDWxUrOXhvB6C6teaPC9z?=
 =?us-ascii?Q?YgjVewNRUIgdGX5i77IvL79IztAnhLfCqylxdIlje+hE+Cn+gYSp5okMFo9R?=
 =?us-ascii?Q?858XdVXH4WjrijE0uD0EkNWCv/NxW5IrCt5GM/VS9GQ85bsFZFx6M/xILxdw?=
 =?us-ascii?Q?mu5Pfrc9id5tgG5bPRcdRUON/MCvqiPrlOX/YemxOrd0ahZtVSEKUEgTOosj?=
 =?us-ascii?Q?hoiJBxQD9fsVOfB08/kmq95cW20DETnVSSZNL56ojiAWQt33JZJq06A017KT?=
 =?us-ascii?Q?z8Dv59HLBChTF0p2jrQNR8ci8P96pjwvEJYiXUfkuUZ2723nW4Vq1gR5ZqlH?=
 =?us-ascii?Q?rkXn415feggF4Z5HpHQB4d2QNrGQ5ulsVEMTip2eEAPL4IXTCv89zajMdIdd?=
 =?us-ascii?Q?hQ2pskjmukpDl73y5w9xJLMG0Es1MqvwscTaHC/ZnRl+Yiy/5m2rkwFqpv32?=
 =?us-ascii?Q?Hzk8HXsuprEJoETZ76YHEO6OkMC4dyRJqvQ5A+x/4aMmh3Nru2Ykji9uqaEE?=
 =?us-ascii?Q?8AuhJpzf21FmOGBEKlGd55UuDRfzHVJvqKdeV5cwGscSmNRgM5UbQumgITg4?=
 =?us-ascii?Q?ZOC5MEApN6JfBm2CnUX9mnT6Qk8UDkqzyix/zCSHVHzSvTDkBBmAeiE6kFrS?=
 =?us-ascii?Q?bUO1mVnZd6uVVbCb3Zh3+OcJTpLWEYRKqJMolq4wf+IyrVLteMbmch9t1kYE?=
 =?us-ascii?Q?i9UVTzk98ntsE1Sl8YKYyM0Eu4wecNydlh3VtP492lQ9mWaL6AE4syC/tweY?=
 =?us-ascii?Q?tsw2QsTrKjWiqtPh8bAqBeUumXjNwwEOnViyeLpARXdXB/g+vZ9IAkhomC2S?=
 =?us-ascii?Q?A6GOjoTVr02V9YDHu1OX+s1eVMXmyHUhRyG3I6SCLdPUQcVLiXNU38uirgJI?=
 =?us-ascii?Q?rlv6YlyIkewed5ECbkzubYhbmD5jIzzBnjqqPe5o+KL/HGhGDbI66MSR4Y1M?=
 =?us-ascii?Q?R/hwtKTZPYUYytdR2D5ZZyrF4tGjoqKanN/7vNRQ+gU6zWcHmJkBErZtumR0?=
 =?us-ascii?Q?SwB/3DdX35qYgo3T2iB+2Qz6iTijMnx3fvvuYg7dgbjNe5xvCRCgjS6sag4K?=
 =?us-ascii?Q?PsYVPLnidr3zAkVM4rdC/9qGGhCMr+PrD6D83j/xwfrL038uor80Vc1umeae?=
 =?us-ascii?Q?epJGcfPq40hVb07TESOL+5tYQXeoUiBGZgtqvbWL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jN8dSSJTw8UIJ9QEbmuFO8rYpNYm5yRnFnkaRiH/co+T2amrmlizOcqLLT/z5r4Xez4Th6UgO33kXqugqyIWJXxfcPe2cbjSiyg12Medq2j9hPU1MTnzBp/pKxGhh3eNBxZjeGHNBHMxp06WdfyU4g8D5emMJlCgfU5YRyQXIvi0NWGBG0uksYPDjsGS7btSZ37NPMiphUKfRfxTv87Hl6Dn/Rw5klEnmlRsihWbiaU6ZiFqDnnXOVTz9A6cEcOOvBeRtfnyFX6agK+p9HDv5RBD/LBRwD+Gr+M/LHqfRETqKlNA/kReUNro0pcaiJv8Jm48Ga8XoNKuasBfrMjk3Evm6k6MXZfNA3UDZh/KQbXkS/oVz8CafuJ2/FG5r9BWJnOSeV/JJsjB/o0Ym60ZliSHDUPdtnyQc1fXJXd3/7p68nUJVPsaeKU0o8DN8ADXTT0k9XW38EX+bwIipO5m+02oZjKVQZaSWG2cYB7KNIApKaJ3CcUWye/FPhT9VJVgBLWwSANnq1KTBqRLRWa6E3fa4H7eU+mP6D+T5zGWv+SNIjMislLt0OZPe61gmJ0m8M7q0SWenwaqmcWLyGSGPNxYtJ71tI9weMKbRSTiksnIZjPZbFDR8+ck8ExUlGSmG6MDeU24oJilkBhDwdnuT0u4JSv90kGunyYistO6Qwu1yHX6HOmZNBigRoukUDwF6nykMNHb3rmfbvni1FjYpRoOu933oBfTeskbfcZSNnlSVyagzKlnKySJwclxa+svWcmkCWZq2sJlroXGFJsW69gwEspOJrCiDquiQkGf0x8rMO32/ybkkOQEWUbaKMjNhvFytrsDmnWS5wMFLzeI3mMNqEh338vX2/1PPbwS+0mpE4E5kkJ2/vn1vcd/TexM
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d344dfc-26eb-4085-a737-08db990b7804
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 19:04:34.0096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxloteMJeUR5bGwuJg0MRrW/r3CBtN+dqJLx+98jrsYQ/YfsLjTrml1qREikWplocDCrDlhpLdXwNcDVxRuoWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7700
X-Proofpoint-ORIG-GUID: o-A1GBH-2LqGbLvLbYfOM2svDZwLvZYY
X-Proofpoint-GUID: o-A1GBH-2LqGbLvLbYfOM2svDZwLvZYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_16,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=589
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308090167
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org



> -----Original Message-----
> From: Atul Raut <rauji.raut@gmail.com>
> Sent: Wednesday, August 9, 2023 1:52 PM
> To: Brian Cain <bcain@quicinc.com>
> Cc: linux-hexagon@vger.kernel.org; linux-kernel-
> mentees@lists.linuxfoundation.org
> Subject: hexagon: fix warning comparing pointer to 0
>=20
> WARNING: This email originated from outside of Qualcomm. Please be wary o=
f
> any links or attachments, and do not enable macros.
>=20
> Fix the following coccicheck warning:
> ./arch/hexagon/kernel/traps.c:138:6-7: WARNING comparing pointer to 0
>=20
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> ---
>  arch/hexagon/kernel/traps.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
> index 6447763ce5a9..78486eea77d7 100644
> --- a/arch/hexagon/kernel/traps.c
> +++ b/arch/hexagon/kernel/traps.c
> @@ -80,7 +80,7 @@ static void do_show_stack(struct task_struct *task,
> unsigned long *fp,
>         int kstack_depth_to_print =3D 24;
>         unsigned long offset, size;
>         const char *name =3D NULL;
> -       unsigned long *newfp;
> +       unsigned long *newfp =3D NULL;
>         unsigned long low, high;
>         char tmpstr[128];
>         char *modname;
> @@ -135,7 +135,7 @@ static void do_show_stack(struct task_struct *task,
> unsigned long *fp,
>                 }
>=20
>                 /* Attempt to continue past exception. */
> -               if (0 =3D=3D newfp) {
> +               if (!newfp) {
>                         struct pt_regs *regs =3D (struct pt_regs *) (((vo=
id *)fp)
>                                                 + 8);
>=20
> --
> 2.34.1

Acked-by: Brian Cain <bcain@quicinc.com>=20
