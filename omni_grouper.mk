# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#
TARGET_BOOTANIMATION_SIZE := 800x450

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, device/asus/grouper/device.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_grouper
PRODUCT_DEVICE := grouper
PRODUCT_BRAND := Android
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
PRODUCT_RESTRICT_VENDOR_FILES := false

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/asus/grouper
TARGET_KERNEL_CONFIG := tegra3_android_defconfig
