#
# Copyright (C) 2011 The Evervolv Project
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
#
# Setup device specific product configuration.
#

# Inherit Vendor Files
$(call inherit-product-if-exists, vendor/twisted/twisted-vendor.mk)
$(call inherit-product-if-exists, vendor/twisted/google-vendor.mk)

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/shooter/shooter-vendor.mk)

# Inherit Language Files
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# These are the OpenMAX IL configuration files
#PRODUCT_COPY_FILES += \
#    device/htc/shooter/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := htc_shooter
PRODUCT_DEVICE := shooter
PRODUCT_MODEL := HTC Evo 3D
PRODUCT_MANUFACTURER := HTC

# Set up the product codename, build version & MOTD.
#PRODUCT_CODENAME := e3d
#PRODUCT_VERSION_DEVICE_SPECIFIC := alpha10

#PRODUCT_MOTD :="Welcome to ics-deck"

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/shooter/prebuilt/system/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-sprint-us \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

PRODUCT_COPY_FILES += \
    device/htc/shooter/prebuilt/root/init.shooter.rc:root/init.shooter.rc \
    device/htc/shooter/prebuilt/root/init.msm8660.usb.rc:root/init.msm8660.usb.rc \
    device/htc/shooter/prebuilt/root/ueventd.shooter.rc:root/ueventd.shooter.rc

#Add touchscreen config file
PRODUCT_COPY_FILES += \
    device/htc/shooter/prebuilt/system/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/shooter/prebuilt/system/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/shooter/prebuilt/system/usr/idc/shooter-keypad.idc:system/usr/idc/shooter-keypad.idc

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/shooter/prebuilt/system/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/shooter/prebuilt/system/etc/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    device/htc/shooter/prebuilt/system/etc/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/shooter/shooter-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.clientidbase.yt=android-sprint-us \
	ro.com.google.clientidbase.am=android-sprint-us \
	ro.com.google.clientidbase.vs=android-sprint-us \
	ro.com.google.clientidbase.gmm=android-sprint-us \
	ro.com.google.clientidbase.ms=android-sprint-us \
	ro.phone.min_match=7 \
	ro.product.model=PG86100 \
	ro.cdma.home.operator.alpha=sprint \
	gsm.sim.operator.alpha=sprint \
	gsm.operator.alpha=sprint \
	ro.cdma.home.operator.numeric=310120 \
	gsm.sim.operator.numeric=310120 \
	gsm.operator.numeric=310120 \
	gsm.sim.operator.iso-country=us \
	gsm.operator.iso-country=us \
	ro.com.google.locationfeatures=1 \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/shooter/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml


# CameraHal
PRODUCT_PACKAGES += \
   libcamera \
   Camera

# Audio try default
PRODUCT_PACKAGES += \
    libaudioutils \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    libtinyalsa \

# Video
PRODUCT_PACKAGES += \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    overlay.msm8660

# QCOM OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVenc \
    libOmxVdec

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    librs_jni \
    gps.shooter \
    sensors.shooter \
    lights.shooter

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/shooter/prebuilt/system/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/shooter/prebuilt/system/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/shooter/prebuilt/system/usr/keychars/shooter-keypad.kcm.bin:system/usr/keychars/shooter-keypad.kcm.bin \
    device/htc/shooter/prebuilt/system/usr/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/shooter/prebuilt/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/shooter/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/shooter/prebuilt/system/usr/keylayout/shooter-keypad.kl:system/usr/keylayout/shooter-keypad.kl \
    device/htc/shooter/prebuilt/system/usr/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/shooter/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Kernel Modules
PRODUCT_COPY_FILES += $(shell \
    find device/htc/shooter/prebuilt/system/lib/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_LOCALES += en

PRODUCT_COPY_FILES += \
    device/htc/shooter/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/shooter/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/shooter/prebuilt/root/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# media profiles and capabilities spec
$(call inherit-product, device/htc/shooter/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/shooter/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := htc_shooter
PRODUCT_DEVICE := shooter
PRODUCT_MODEL := Full Android on Shooter
