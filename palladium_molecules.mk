# Copyright (C) 2020-21 Palladium-OS
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

LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Conditional FOD Animations
ifeq ($(EXTRA_FOD_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    FodAnimations
endif

# Copy fonts to system
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/palladium_molecules/fonts,$(TARGET_COPY_OUT_SYSTEM)/fonts)

# Includes accents
include vendor/palladium_molecules/accents/accents.mk

# Includes cutout shapes
include vendor/palladium_molecules/cutout/cutout.mk

# Includes icon packs/shapes
include vendor/palladium_molecules/icons/icons.mk

# Includes fonts
include vendor/palladium_molecules/fonts/fonts.mk

# Includes gvm
include vendor/palladium_molecules/gvm/gvm.mk

# Includes navbar
include vendor/palladium_molecules/navbar/navbar.mk

# Includes prebuilts
include vendor/palladium_molecules/prebuilts/prebuilts.mk

# Includes qsthemes
include vendor/palladium_molecules/qsthemes/qsthemes.mk

# Includes themes
include vendor/palladium_molecules/themes/themes.mk

ifeq ($(EXTRA_FOD_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    FodAnimationResources
endif

ifeq ($(TARGET_HAS_FOD),true)
DEVICE_PACKAGE_OVERLAYS += vendor/palladium/overlay/fod-icons
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/palladium/overlay/fod-icons
endif