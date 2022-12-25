/*
 * Copyright (C) 2021-2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/logging.h>
#include <android-base/properties.h>
#include <libinit_utils.h>

#include <libinit_variant.h>

using android::base::GetProperty;

#define BID_PROP "ro.boot.board_id"
#define SKU_PROP "ro.boot.product.hardware.sku"

void search_variant(const std::vector<variant_info_t> variants) {
    std::string bid_value = GetProperty(BID_PROP, "");
    std::string sku_value = GetProperty(SKU_PROP, "");

    for (const auto& variant : variants) {
        if ((variant.bid_value == "" || variant.bid_value == bid_value) &&
            (variant.sku_value == "" || variant.sku_value == sku_value)) {
            set_variant_props(variant);
            break;
        }
    }
}

void set_variant_props(const variant_info_t variant) {
    set_ro_build_prop("brand", variant.brand, true);
    set_ro_build_prop("device", variant.device, true);
    set_ro_build_prop("name", variant.name, true);
    set_ro_build_prop("marketname", variant.marketname, true);
    set_ro_build_prop("model", variant.model, true);

    if (access("/system/bin/recovery", F_OK) != 0) {
        set_ro_build_prop("fingerprint", variant.build_fingerprint);
        property_override("ro.product.bootimage.device", variant.device);
        property_override("ro.product.bootimage.name", variant.name);
        property_override("ro.product.mod_device", variant.name);
        property_override("ro.bootimage.build.fingerprint", variant.build_fingerprint);

        property_override("ro.product.board", variant.device);
        property_override("ro.build.flavor", fingerprint_to_flavor(variant.build_fingerprint));
        property_override("ro.build.product", variant.device);
        property_override("ro.build.description", fingerprint_to_description(variant.build_fingerprint));
    }

    if (variant.nfc)
        property_override(SKU_PROP, "nfc");
}
