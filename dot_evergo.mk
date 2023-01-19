#
# Copyright (C) 2022 ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common ArrowOS stuff.
$(call inherit-product, vendor/dot/config/common.mk)

# Inherit from evergo device
$(call inherit-product, device/xiaomi/evergo/device.mk)

#dot stuffs
WITH_GMS := true
TARGET_BOOT_ANIMATION_RES := 1080
DOT_BUILD_TYPE := UNOFFICIAL

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := evergo
PRODUCT_NAME := dot_evergo
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 11T 5G
PRODUCT_MANUFACTURER := Xiaomi

# Build info
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Redmi/evergo_in/evergo:12/SP1A.210812.016/V13.0.5.0.SGBINXM:user/release-keys
