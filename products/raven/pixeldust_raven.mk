# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440
TARGET_BOOT_ANIMATION_RES := 1440

# Bootanimation
BOOTANIMATION := 1440

export TARGET_DEVICE := raven

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# All components inherited here go to product image
#
$(call inherit-product, vendor/pixeldust/build/product/pixeldust_product.mk)

# New Google Assistant
TARGET_SUPPORTS_NGA := true

WITH_GMS := true
DEVICE_REQUIRES_CARRIER_APPS := true
REMOVE_GAPPS_PACKAGES += \
    CalculatorGooglePrebuilt \
    Photos \
    Maps \
    pixel_experience_2019_midyear \
    pixel_experience_2019 \
    pixel_experience_2020_midyear \
    pixel_experience_2020 \
    pixel_experience_2021_midyear \
    pixel_experience_2021

# Google Apex
WITH_GOOGLE_APEX := true
 
 # Inherit PixelDust telephony package
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)

$(call inherit-product, vendor/pixelgapps/pixel-gapps.mk)

EXTRA_UDFPS_ANIMATIONS := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_USES_BLUR := true

# Inherit device configuration
$(call inherit-product, device/google/raviole/aosp_raven_64.mk)
$(call inherit-product, device/google/raviole/device-derp.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_raven
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_BRAND := google

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.uwb.calibration.calibrationpaths=/vendor/etc/calib_paths

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=raven \
    PRIVATE_BUILD_DESC="raven-user 12 SQ3A.220605.009.B1 8650216 release-keys"

BUILD_FINGERPRINT := google/raven/raven:12/SQ3A.220605.009.B1/8650216:user/release-keys

$(call inherit-product, vendor/google/raven/raven-vendor.mk)
