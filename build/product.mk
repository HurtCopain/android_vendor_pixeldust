# Copyright (C) 2021 The PixelDust Project
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

$(call inherit-product, vendor/pixeldust/build/packages.mk)

# Inherit vendor submodules
$(call inherit-product, vendor/pixeldust/overlay/overlay.mk)
$(call inherit-product, vendor/pixeldust/prebuilt/audio/audio.mk)
$(call inherit-product, vendor/pixeldust/prebuilt/bootanimation/bootanimation.mk)
$(call inherit-product, vendor/pixeldust/fonts/fonts.mk)
$(call inherit-product-if-exists, vendor/pixeldust/signing/dev.mk)
$(call inherit-product, vendor/pixeldust/telephony/telephony.mk)

# Gapps
ifeq ($(WITH_GMS),true)

$(call inherit-product, vendor/pixelgapps/pixel-gapps.mk)

# SetupWizard and Google Assistant properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.setupwizard.rotation_locked=true \
    setupwizard.theme=glif_v3_light \
    ro.opa.eligible_device=true \

endif

# Flatten APEXs for performance
OVERRIDE_TARGET_FLATTEN_APEX := true
# This needs to be specified explicitly to override ro.apex.updatable=true from
# prebuilt vendors, as init reads /product/build.prop after /vendor/build.prop
PRODUCT_PRODUCT_PROPERTIES += ro.apex.updatable=false

# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false

# Enable one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# AOSP userdebug/eng CLI tools
PRODUCT_PACKAGES += \
    arping \
    dmuserd \
    gdbserver \
    idlcli \
    iotop \
    iperf3 \
    iw \
    procrank \
    profcollectd \
    profcollectctl \
    showmap \
    sqlite3 \
    ss \
    strace \
    tracepath \
    tracepath6 \
    traceroute6 \
    procmem \
    curl \

# LineageOS CLI tools
PRODUCT_PACKAGES += \
    7z \
    bash \
    htop \
    nano \
    pigz \
    vim \
    zip \
    rsync \

# AOSP OpenSSH
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh \

# Gboard side padding
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.kb_pad_port_l=4 \
    ro.com.google.ime.kb_pad_port_r=4 \
    ro.com.google.ime.kb_pad_land_l=64 \
    ro.com.google.ime.kb_pad_land_r=64 \
