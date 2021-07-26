Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E05B3D5AF7
	for <lists+linux-hexagon@lfdr.de>; Mon, 26 Jul 2021 16:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbhGZN0F (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Mon, 26 Jul 2021 09:26:05 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:33016 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbhGZN0F (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Mon, 26 Jul 2021 09:26:05 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Jul 2021 09:26:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1627308393; x=1627913193;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NGuP+YzmlDDbIfqF3MMt7y2CfIODuVNaAGqkdRgzt3A=;
  b=CChW/WiIVgVnIs/sA3gjrQHbp6xAaDJim271dBIvqWUa893/7MA9Jozj
   go+ONvB24ByccCktNrmLRiFNGNWgPRX6pchrA+RRn13uSV9ENMHrm0OwI
   BzlwAQOxOrX5ARcYFbVZAQt8Tvinn6czUwPyB1GePkL3KTdrZ23tGfqiA
   s=;
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 13:59:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUotPvOVOVdCBLAdExRuJUI/Vcm1YkNmTtqVV5OeNOklYzBzgeA4dz8xYOUdcOD3n93xFin0PYhncVDXjxqUpoF0l5dn2tmyaz+/0O5sCBhZrZdl08DyZWXuliQwQ9kC6I+H4YbAzbznxVflE1ebFZuYwPnD4dlrGeoFJuZ0XE62hVIqFRVflsCVeWR92rgCpWbQGa4uBl2l2sb8mXlCHx1Bnyxk6op7BXoBbOjS/i1efRBW/hpNTmQkgP/uHKguMluAcDqnc2S6Mv1rgmTYZpq5vaF1VHRp6KrD0NsP6SfgAC4Li5NwSm6o1z9diqP+ffm76d+BM2nBs0uiid7u8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGuP+YzmlDDbIfqF3MMt7y2CfIODuVNaAGqkdRgzt3A=;
 b=lTtCFDehS0b80bkA+RW3IZdZsw4afrvQLlG+BMRuxgghRPs5hePbNd2bvHRux/SxJ7vfsWlP10xjStXz/rbysxhrvBJmU12zFhmLustRUn2SzemvmSqQRHMikxMt2Kj6WKhE4phPCrIgBKOBOQodEiBhFLD+JEOtlJqQVzD9sSY/zOyuA1oxQ/vmTHfiS5/N/RvGyPD2EGsoI9VzslkgwZjFiZP2Y8ejs5hg/lK0t2QZPAsHv8PZXEMYk4JFNgC1SKRRDQ9ZmP11JvMIjSIxvIwB8I1NZn3CP4Rc/fPFe7VmmgYfKjNK4uxuklOkSPwe7AYFY5dPR6WbPdcoWHSewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB8768.namprd02.prod.outlook.com (2603:10b6:a03:3d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 13:59:23 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 13:59:23 +0000
From:   Taylor Simpson <tsimpson@quicinc.com>
To:     Rob Landley <rob@landley.net>, Sid Manning <sidneym@quicinc.com>,
        Brian Cain <bcain@quicinc.com>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>
CC:     "ale@rev.ng" <ale@rev.ng>,
        "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
        "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
        "philmd@redhat.com" <philmd@redhat.com>
Subject: RE: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Thread-Topic: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Thread-Index: AQHXgfF3/he55WAk8kG54TKUu5AbZatU892AgABUuSA=
Date:   Mon, 26 Jul 2021 13:59:23 +0000
Message-ID: <BYAPR02MB48863186EDD71439C60792A0DEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
 <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
 <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
 <8845de00-ddc7-86a3-600f-6ede81e168c2@landley.net>
 <8192e9bb-a0de-1b2a-271c-ac7323be8244@landley.net>
In-Reply-To: <8192e9bb-a0de-1b2a-271c-ac7323be8244@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: landley.net; dkim=none (message not signed)
 header.d=none;landley.net; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a831005c-2c30-4d04-a442-08d9503d92f5
x-ms-traffictypediagnostic: SJ0PR02MB8768:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB8768D047869976CD466C5492DEE89@SJ0PR02MB8768.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: soLlSYKcl8Ftn+ouftEk6Hqbh5Jm1GWohD1lh8sUnOZcFx9RHx42/h7NIW37Dj18AT4haW2tnVflOVzz0YHmHsfdFfQ6vXuDvJX3uLjWF8/6LGlei4ohkA+ujTDp+FVKlmhljMxmttxaYZhjA7GriqgJ9DVrGKoO1W7DL5rX6mWJdSjn2BsNbI2OCfhutQR6zSLoV7sG6OfYCP8O7/3Hl6Ryk8IyKMsf5MuVQWiPMFh1yN1xq6J3ijn1YCoyCDJ7n4ZkQEcPy+irzD6Osb9CT/mmbuyg3tg1Xjf8PNYKrcLXM2F2ZgoeF8TsA3e3FiZOwKno2AGhkzTUN9wAgjaj6c7xriBhMV176LeLZflS43qUtE5sylUCg5qyVaPe7vEmbR1zxXw1F5ikK8PD0EQJ8mAERXMIvnNevIIBRaCo8oTdeHjSyLpsmHQONe9lQdf0guYCtMUl5zD3T3dUR19BN+oFkxcTrp8oKCiSXf2NaXnSIt/2GeY9WThsGA5/iHH/Q6crWJOIMjbL55n0LNrPQmMjijOw0Nlmhio9wmuBhzfJ1yVC1BzHCoo517vuq45he33jfZd9SKowERltL2f2Y00Kn4AfGtA+dDmx6X2Iwyk+TPdl9t5pNchqVBqkRTpgZmoJGfzvQ4R3U5kvUwAhIqMOiwNvRxwPsABQZGsj7mR/AHkPca+g4zC0UvqKxMsdU12r4GTErUW/+DStxlYKBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4886.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(7696005)(110136005)(86362001)(54906003)(316002)(5660300002)(26005)(53546011)(6506007)(478600001)(122000001)(33656002)(71200400001)(2906002)(52536014)(76116006)(66946007)(38100700002)(55016002)(9686003)(8936002)(186003)(66446008)(83380400001)(4326008)(8676002)(66476007)(64756008)(66556008)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3IvZlNtWDl5UVYxYkY3UDVyTThqMkJ3WG5YTDZRNnlJdzR6a09SRjZCeXBG?=
 =?utf-8?B?S3RZZENjQmYwdlgvc0ZDSnhBZHlqNitTd0RZVzUreExUQWpFYnVrVkI0eHVo?=
 =?utf-8?B?d3RvUHBiN2ZPY0Nzc1ZteXN0YzJjaUNwT2JPMGtCZW9Ec2ZJVEhDSmJBTWo1?=
 =?utf-8?B?OTNlOXJzWlJJRFN6eDNaRU5SRDZzK0JHVGVYdjZ5UHFuTzhyakltQ05yOGtX?=
 =?utf-8?B?UDd5NGRjTlFwSkVlWTdSNEkwa2YwUVZNWWhzWWRYMTF4WVFvNGZmd05QRnFF?=
 =?utf-8?B?Z1NvOTA1NkZmaEJlOUh6L2FDYTN2by9lckNrMUtaTytONmdJSzljTk5yUENz?=
 =?utf-8?B?bDlzdGU3eTVZSnpBdCtIMWR5NzBBRmora3k2QVBjUDhuVzVRRUVQY3dQV3NS?=
 =?utf-8?B?V0phbHNYR0dqODhoODk2SHI3Q0NUTmIzbzBxUEg2VnVEMWg3dzNSa21WUEpS?=
 =?utf-8?B?anRNNm5FblFCMi9OdFpaaWVqUGgyN283Z2ZFSHNRdzVvc0NFb1JDUlFkVm1I?=
 =?utf-8?B?WG1hU0hRa05ycWFQaERPdmYzZnM1MERXVTZWNzNwYk9WY1duOXhqb3dDK251?=
 =?utf-8?B?QWJJa0tvUkFFd3FXc2l4VlNEcVp3RGVEM2hPVVVrYkhWUXQ0dWdZUnZ6M3Rs?=
 =?utf-8?B?KzV3L0NDR1ZLSUdzdURNU0VqMmEva3lEN2ttU2lqN0tYbzFIRkxJbENFdS9E?=
 =?utf-8?B?ajZobDFBUWRad0szK211V2l2aHd3YUFVN1o1ak1wWFhLL3ZQdjk5bTFrNGlk?=
 =?utf-8?B?SE1GaVNuQnp4M0dkMjdiR1RtclNnOVFObG5BZFZnejUrZ2J0bGROSk5nR24x?=
 =?utf-8?B?dkUxQnBYcXpJaVJoZVRtV201b09sQjBzeE5URVlJV1dDbWY5WENnUDFubG1Z?=
 =?utf-8?B?Z3l2K0N1QU5KUTI1dUJJb0FpSGhDbjN1ZkU1QWdmWnIyOFdnaFJQREEyRWdv?=
 =?utf-8?B?Nkxtc1RvdFcvM2UzRlRhS0hycEswTE5ZeFR3R2V2TURMckxlRUhHRnp5M0g4?=
 =?utf-8?B?MjJTVU9vSHVMZDYwNGVWQ2IybFc0OVhFQW1ENUZTNlNGYUNxN1lWbW40RVVJ?=
 =?utf-8?B?dVVac1laZmtRbmRldWEzTWN0NDk5ZWg1ZWh4WW9WcFZFamxLUnlvSDJqS0tX?=
 =?utf-8?B?UUxmeHhIc0dVTmhTODVYUXZNNkljRVlqRm1OcGR5YllmaVNOQm1HRzBYKzZH?=
 =?utf-8?B?TG53TjIvQ0tESmlaSHcvMlM2OUUrcFJvT0ZKb29kck9YZStLODcwRVRZOXpO?=
 =?utf-8?B?SnNQZlFOMHF6YWVudkJNc3p2RGhQTFRWMGN0MDZqaVdRd0hhUGZxOEVKdW1v?=
 =?utf-8?B?TEdWc3VKa05ReE9MRjRQamlOS2E5cVFsMENHZzVCRHcvc2FXaWg5NElob05s?=
 =?utf-8?B?S0hBYzN4TTk4djBnR0grazJlK0V6aVFteko5Qm9LS0JObFVFVWF1amJLNzMv?=
 =?utf-8?B?U0g5VzlnM3Npb3dKbFN3Y3RRTUNsSTRiOU5LRzR2eE0rdzUydFpGTFZvcXZq?=
 =?utf-8?B?ZEJ4TlNPWTV0UjhhcEloL3R4cWFkRGwvMTg4QW5maHd4eTZLc2hKWnFuTU42?=
 =?utf-8?B?OTlRTmNwbUlOMmhHZFpybWRUZHhxUk45TGxHRlJhbnNYa2V4aXA2cTBrRm5I?=
 =?utf-8?B?bVhtVUtVc01RdlhWZlRlVWxzRlhOd0d3Sll2dUZRUVZVMWw1ZTdEdWtwYThO?=
 =?utf-8?B?MHdqckR5VjAxRytodkRIeVpPQTRwd041bGdzRjBnVDV0cTdVVTlmK1NJNTA3?=
 =?utf-8?Q?FuMnkcvHhahJYpi7z3rMnxQoMMs5l+koOxCY5+K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a831005c-2c30-4d04-a442-08d9503d92f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 13:59:23.7405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMRpCCU1rEAJ3h3QJ2CQTUsufoxtAmt2S95x+ZaAkXJWwtnake4Te1jCzROYlwDWFHdVQlIUuus+UX7zSGCYYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8768
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

V2UncmUgd29ya2luZyBvbiBzeXN0ZW0gbW9kZSBzdXBwb3J0IGZvciBIZXhhZ29uLCBhbmQgd2Ug
cGxhbiB0byB1cHN0cmVhbSBpdCB3aGVuIGl0IGlzIHJlYWR5Lg0KDQpUaGFua3MsDQpUYXlsb3IN
Cg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIExhbmRsZXkg
PHJvYkBsYW5kbGV5Lm5ldD4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDI2LCAyMDIxIDM6NTUgQU0N
Cj4gVG86IFNpZCBNYW5uaW5nIDxzaWRuZXltQHF1aWNpbmMuY29tPjsgQnJpYW4gQ2FpbiA8YmNh
aW5AcXVpY2luYy5jb20+Ow0KPiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IGxpbnV4LQ0KPiBoZXhhZ29uQHZnZXIua2VybmVsLm9y
Zw0KPiBDYzogYWxlQHJldi5uZzsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyByaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnOw0KPiBwaGlsbWRAcmVkaGF0LmNvbQ0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDAxLzIwXSBIZXhhZ29uIEhWWCAodGFyZ2V0L2hleGFnb24pIFJFQURNRQ0KPiANCj4g
T24gNy8yNi8yMSAyOjU3IEFNLCBSb2IgTGFuZGxleSB3cm90ZToNCj4gPiBBbnl3YXkuLi4gaXQg
ZG9lc24ndCBsb29rIGxpa2UgcWVtdS1zeXN0ZW0taGV4YWdvbiAoc29mdG1tdSkgaXRzDQo+ID4g
Y3VycmVudGx5IGluIHZhbmlsbGEgcWVtdT8gSXMgdGhlcmUgYSBwdWJsaWMgZm9yayB0aGF0IGhh
cyB0aGlzIHNvbWV3aGVyZT8NCj4gDQo+IEkgZGlkIGEgbGl0dGxlIHdpbGQgZmxhaWxpbmcgdG8g
Z2V0IC4vY29uZmlndXJlIHRvIGdpdmUgbWUgYSBxZW11LXN5c3RlbS1oZXhhZ29uDQo+IG9wdGlv
biAocGF0Y2ggYXR0YWNoZWQpLCBJLkUuIGp1c3QgZW5vdWdoIHRvIGdldCBtZXNvbiB0byBzaHV0
IHVwIGFuZCBxdWl0ZQ0KPiBwb3NzaWJseSBzdGlsbCBtaXNzaW5nIHNvbWV0aGluZyBpbXBvcnRh
bnQuIChJcyB0aGlzIHB5dGhvbj8gSXQgbG9va3Mga2luZCBvZiBsaWtlDQo+IHB5dGhvbi4pDQo+
IA0KPiBVbmZvcnR1bmF0ZWx5IGFmdGVyIGxpYmVyYWxseSBjcmliYmluZyBmcm9tIHRoZSBjcmlz
IGFyY2hpdGVjdHVyZSAod2hpY2ggc2VlbXMNCj4gbGlrZSB0aGUgc2ltcGxlc3Qgb25lKSBJJ20g
bGVmdCB3aXRoIHNldmVyYWwgbmV3IEMgZmlsZXMgdG8gaW1wbGVtZW50LCBhbGwNCj4gY3VycmVu
dGx5IHplcm8gbGVuZ3RoIGluIHRoZSBwYXRjaDoNCj4gDQo+ICAgaHcvaGV4YWdvbi9ib290LmMN
Cj4gICBody9oZXhhZ29uL2hleGFnb25fY29tZXQuYw0KPiAgIHRhcmdldC9oZXhhZ29uL21hY2hp
bmUuYw0KPiAgIHRhcmdldC9oZXhhZ29uL21tdS5jDQo+IA0KPiAoSW4gdGhlb3J5IHRoZXJlJ3Mg
YSAibm9uZSIgYm9hcmQgb24gYWxsIHRoZSBjdXJyZW50IHFlbXUtc3lzdGVtDQo+IGFyY2hpdGVj
dHVyZXMsIGJ1dCBJJ3ZlIG5ldmVyIGZpZ3VyZWQgb3V0IHdoYXQgdG8gRE8gd2l0aCB0aG9zZS4u
LikNCj4gDQo+IEFsbCB0aGlzIHJhaXNlcyB0d28gcHJvYmxlbXM6DQo+IA0KPiAxKSBJIGR1bm5v
IGhvdyB0aGUgaGV4YWdvbiBtbXUgd29ya3MuIChJIGNhbiBwcmVzdW1hYmx5IHJlYWQgdGhlIGtl
cm5lbA0KPiBjb2RlIGFuZCByZXZlcnNlIGVuZ2luZWVyIHdoYXQgdGhhdCdzIGxvb2tpbmcgZm9y
LCBidXQgaXQgd291bGQgYmUgcmVhbGx5IG5pY2UNCj4gbm90IHRvIF9oYXZlXyB0bz8pDQo+IA0K
PiAyKSBXaGF0J3MgYSBjb21ldCBib2FyZD8gKE1lbW9yeSBsYXlvdXQ/IEkvTyBkZXZpY2VzPyBJ
IGd1ZXNzIGFsbCBJIG5lZWQgZm9yDQo+IHNlcmlhbCBjb25zb2xlIG9uIGluaXRyYW1mcyBpcyBh
IGNvbnRpZ3VvdXMgYmxvY2sgb2YgRFJBTSwgdGltZXIgaW50ZXJydXB0IHRvDQo+IGRyaXZlIHRo
ZSBzY2hlZHVsZXIsIGFuZCBhIHNlcmlhbCBwb3J0LiBJIGtlZXAgdGhpbmtpbmcgdGhlcmUgc2hv
dWxkIGJlIGEgd2F5DQo+IHRvIHRlbGwgdGhlICJub25lIiBib2FyZCB0byBhZGQgdGhhdCBzdHVm
ZiBmcm9tIHRoZSBjb21tYW5kIGxpbmUuLi4gYnV0DQo+IGR1bm5vIGhvdy4NCj4gIm1hcCBEUkFN
IGhlcmUiLiAiYWRkIHRoaXMgY2xvY2sgaGFyZHdhcmUgYXQgaGVyZSIuICJhZGQgdGhpcyBraW5k
IG9mIHNlcmlhbA0KPiBwb3J0IGF0IGhlcmUuIiAiY2FsbCBlbGZfbG9hZCBvbiB0aGlzIGZpbGUg
YW5kIHN0YXJ0IGV4ZWN1dGluZyBhdCBpdHMgZW50cnkNCj4gcG9pbnQiLi4uKQ0KPiANCj4gMykg
UmVhZGluZyB0aGUgYXJjaC9oZXhhZ29uIGtlcm5lbCBzdHVmZiBhbGEgInNvIHdoYXQgSVMgaW4g
YSBjb21ldCBib2FyZCIuLi4NCj4gQ09ORklHX0hFWEFHT05fQ09NRVQgaXMgb25seSBldmVyIHVz
ZWQgdG8gZ3VhcmQgb25lICNkZWZpbmUgaW4gYQ0KPiBoZWFkZXIgZmlsZToNCj4gDQo+ICAgYXJj
aC9oZXhhZ29uL2luY2x1ZGUvYXNtL3RpbWVyLXJlZ3MuaDojZGVmaW5lDQo+IFJUT1NfVElNRVJf
UkVHU19BRERSDQo+IA0KPiBXaGljaCBpcyB0aGVuIHVzZWQgdG8gaW5pdGlhbGl6ZSBzdHJ1Y3R1
cmUgbWVtYmVycyBpbg0KPiBhcmNoL2hleGFnb24va2VybmVsL3RpbWUuYyB3aXRob3V0IGFueSBz
b3J0IG9mIGd1YXJkIHRoZXJlLCBhbmQgbm8gaXQgaXNuJ3QNCj4gI2RlZmluZWQgdG8gMCBieSBk
ZWZhdWx0IGFueXdoZXJlIEkgY2FuIHNlZT8gQW5kIG9mIGNvdXJzZSBvYmoteSArPSB0aW1lLm8N
Cj4gaW4gYXJjaC9oZXhhZ29uL2tlcm5lbC9NYWtlZmlsZSBoYXMgbm8gY29uZmlnIGd1YXJkIHRo
ZXJlIGVpdGhlci4gU28gaWYgaXQNCj4gd2Fzbid0IHNldCwgdGhlIGJ1aWxkIHdvdWxkIGJyZWFr
LiBBbmQgdGhhdCdzIGN1cnJlbnRseSBhbGwgdGhlIHN5bWJvbCBkb2VzPw0KPiANCj4gQW55d2F5
LCBJIHN0aWxsIGhvcGUgc29tZWJvZHkgZWxzZSBoYXMgYWxyZWFkeSBkb25lIG1vc3Qgb2YgdGhp
cyBpbiBhIGdpdCB0cmVlDQo+IHNvbWV3aGVyZS4gOikNCj4gDQo+IFJvYg0K
