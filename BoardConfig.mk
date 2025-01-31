#
# Copyright (C) 2013-2014 The Android Open-Source Project
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

# Build a separate vendor image holding only device specific properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_COPY_OUT_VENDOR := vendor

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := denver64

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := denver

# Disable emulator for "make dist" until there is a 64-bit qemu kernel
BUILD_EMULATOR := false

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_CMDLINE += no_console_suspend=1
BOARD_KERNEL_CMDLINE += tegra_wdt.enable_on_probe=1
BOARD_KERNEL_CMDLINE += tegra_wdt.heartbeat=120
BOARD_KERNEL_CMDLINE += vmalloc=400M
BOARD_KERNEL_CMDLINE += androidboot.hardware=flounder
# BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := tegra132
TARGET_BOARD_INFO_FILE := device/htc/flounder/board-info.txt

TARGET_BOOTLOADER_BOARD_NAME := flounder

USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

TARGET_RECOVERY_FSTAB := device/htc/flounder/rootdir/fstab.flounder
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2782920704
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 13287555072
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_USES_GENERIC_INVENSENSE := false

# RenderScript
OVERRIDE_RS_DRIVER := libnvRSDriver.so
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a15
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := cortex-a57

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/flounder/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/htc/flounder/bluetooth/vnd_flounder.txt
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

BOARD_HAL_STATIC_LIBRARIES := libhealthd.flounder

BOARD_VENDOR_USE_SENSOR_HAL := sensor_hub

# GPS related defines
TARGET_NO_RPC := true
BOARD_USES_QCOM_HARDWARE_GPS := true

# Gralloc
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000

# Lineage Hardware
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/lineagehw

# HIDL
DEVICE_MANIFEST_FILE := device/htc/flounder/manifest.xml
DEVICE_MATRIX_FILE   := device/htc/flounder/compatibility_matrix.xml

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

BOARD_SEPOLICY_DIRS += device/htc/flounder/sepolicy

TARGET_USES_64_BIT_BCMDHD := true
TARGET_USES_64_BIT_BINDER := true

BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Don't dex preopt apps to avoid I/O congestion due to paging larger sized
# pre-compiled .odex files as opposed to background generated interpret-only
# odex files.
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
      WITH_DEXPREOPT_DEBUG_INFO := false
      USE_DEX2OAT_DEBUG := false
    endif
  endif
endif

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/flounder

ART_USE_HSPACE_COMPACT=true

# let charger mode enter suspend
BOARD_CHARGER_ENABLE_SUSPEND := true

MALLOC_SVELTE := true

# Shims
TARGET_LD_SHIM_LIBS += /system/vendor/lib/hw/camera.tegra132.so|/system/vendor/lib/libcamera_shim.so

# Zygote Whitelist
ZYGOTE_WHITELIST_PATH_EXTRA := \"/dev/nvhost-ctrl\",\"/dev/nvmap\",

# Forcebly use the non-open-source parts
include vendor/htc/flounder-common/BoardConfigVendor.mk
ifeq ($(TARGET_PRODUCT),lineage_flounder_lte)
include vendor/htc/flounder_lte/BoardConfigVendor.mk
else
include vendor/htc/flounder/BoardConfigVendor.mk
endif
