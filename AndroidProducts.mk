#
# Copyright (C) 2022 The ArrowOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/arrow_evergo.mk \
    $(LOCAL_DIR)/lineage_evergo.mk

COMMON_LUNCH_CHOICES := \
    arrow_evergo-user \
    arrow_evergo-userdebug \
    arrow_evergo-eng \
    lineage_evergo-user \
    lineage_evergo-userdebug \
    lineage_evergo-eng
