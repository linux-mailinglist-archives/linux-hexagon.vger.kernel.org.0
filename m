Return-Path: <linux-hexagon-owner@vger.kernel.org>
X-Original-To: lists+linux-hexagon@lfdr.de
Delivered-To: lists+linux-hexagon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EE9747E81
	for <lists+linux-hexagon@lfdr.de>; Wed,  5 Jul 2023 09:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjGEHsP (ORCPT <rfc822;lists+linux-hexagon@lfdr.de>);
        Wed, 5 Jul 2023 03:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbjGEHsE (ORCPT
        <rfc822;linux-hexagon@vger.kernel.org>);
        Wed, 5 Jul 2023 03:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475731700
        for <linux-hexagon@vger.kernel.org>; Wed,  5 Jul 2023 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688543196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
        b=bvtdsMB3TTi+6muykpHIIQ0A3AvT01aPDochyxGzhVwN5XImzQvuvqiWgY30SlBNp9xbR7
        X+KIFZJfCG/FupP191BtP1KMoFSrsQZI0zvvJZuCwEve2VWRivHkRa3WedCjk6SJq62EmR
        BsMIezWaYYDX4m2P3zvIoWpVQSUA3SU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-ccphh1OFNS6nUaBmGUWR0Q-1; Wed, 05 Jul 2023 03:46:35 -0400
X-MC-Unique: ccphh1OFNS6nUaBmGUWR0Q-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-31437f02985so1847427f8f.0
        for <linux-hexagon@vger.kernel.org>; Wed, 05 Jul 2023 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688543194; x=1691135194;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
        b=VWicicczWXW3/JNkqeBk7IMj2BJwt6YGqPnmKJFfxsNdh1sy+Qao0ZTL+PzLCg/H1p
         znB/8Sf8Y1I64F4U8H33lPMZw/BsPmE/LT2FhhW1vhMdRgT+3M62Nw08DXxnY/wwky0n
         PkGJm2Pv9nU0qetIHwzzqzd2oJJ3OOWHc3NrZ7mJGZ+Ovg+gFoB6sx6FaJFw5cbglg1c
         TxOYVyNFKzL1k3EpqsYfVYu790UFI6r1/9zpU4iM3i7Ij59XxYVbcOgqC2BezppQh2zR
         9zpEo5kXvVqD3GxDRa7YdVEDbHIQ0KqQ3Emtl2rzt7ZyV/ZzdpXsgkgmPlb/+xU+YbqG
         LYVw==
X-Gm-Message-State: ABy/qLb3AgqSizVMPb3z49uRLq8iNAsecaixYV/f+BW9iRhYqmSuHysE
        POAiL/QX+kjK10ehWQRNh426NaPuOuTqLmxN1IpzWsHuJhYduzbbxwA3pN950MgHnYDYRfXhFRq
        exII9i7AtNgroZVxuTzHDJxuI2A==
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id t13-20020adfe44d000000b003142732e81emr13085712wrm.8.1688543194260;
        Wed, 05 Jul 2023 00:46:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFsu0NXA2DcqaEBs6I3Rg+ekfJ+Y9cFLpHbU/8XeUuuyRyAepiisRLN9BUbx4g3BoqHacYmEg==
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id t13-20020adfe44d000000b003142732e81emr13085694wrm.8.1688543193994;
        Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6e85000000b003063a92bbf5sm30496891wrz.70.2023.07.05.00.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
        deller@gmx.de, daniel@ffwll.ch, airlied@gmail.com
Cc:     linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        loongarch@lists.linux.dev, linux-alpha@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/12] drivers/firmware: Remove trailing whitespaces
In-Reply-To: <20230629121952.10559-9-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-9-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 09:46:32 +0200
Message-ID: <87bkgqssvb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hexagon.vger.kernel.org>
X-Mailing-List: linux-hexagon@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

