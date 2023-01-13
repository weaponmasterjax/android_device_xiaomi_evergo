#
# Copyright (C) 2022 The ArrowOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/arrow_evergo.mk \
    $(LOCAL_DIR)/aosp_evergo.mk

COMMON_LUNCH_CHOICES := \
    aosp_evergo-user \
    aosp_evergo-userdebug \
    aosp_evergo-eng \
    arrow_evergo-user \
    arrow_evergo-userdebug \
    arrow_evergo-eng
