#
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

PRODUCT_AAPT_CONFIG := normal large
PRODUCT_AAPT_PREF_CONFIG := tvdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := hdpi

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    tf.enable=y \
    persist.sys.media.legacy-drm=true \
    drm.service.enabled=true

# disable Captive portal check
PRODUCT_PROPERTY_OVERRIDES += \
    ro.disable_captive_portal=1

# libhwui flags
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/asus/grouper/rootdir/init.grouper.usb.rc:root/init.grouper.usb.rc \
    device/asus/grouper/rootdir/ueventd.grouper.rc:root/ueventd.grouper.rc \
    device/asus/grouper/config/bin/gps_daemon.sh:system/bin/gps_daemon.sh \
    device/asus/grouper/config/bin/touch_fw_update.sh:system/bin/touch_fw_update.sh \
    device/asus/grouper/config/etc/gps.conf:system/etc/gps.conf \
    device/asus/grouper/config/etc/twrp.fstab:recovery/root/etc/twrp.fstab

ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcm4329.ko
endif

# permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

PRODUCT_COPY_FILES += \
    device/asus/grouper/config/usr/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    device/asus/grouper/config/usr/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/grouper/config/usr/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
    device/asus/grouper/config/usr/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc

PRODUCT_PACKAGES := \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

#help GL work in M
PRODUCT_PACKAGES += \
    libdgv1

PRODUCT_PACKAGES += \
    lights.grouper \
    audio.primary.grouper \
    power.grouper \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    librs_jni \
    libemoji \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    keystore.grouper

# NFC packages
PRODUCT_PACKAGES += \
    libnfc\
    nfc.grouper \
    Nfc \
    Tag

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    setup_fs

PRODUCT_CHARACTERISTICS := tablet,nosdcard

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/asus/grouper/config/etc/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/asus/grouper/config/etc/media_codecs.xml:system/etc/media_codecs.xml

# audio mixer paths
PRODUCT_COPY_FILES += \
    device/asus/grouper/config/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/asus/grouper/config/etc/audio_policy.conf:system/etc/audio_policy.conf

WIFI_BAND := 802_11_BG
 $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
