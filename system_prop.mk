# API
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.monitorRotation=true
# Reduce client buffer size for fast audio output tracks
# and configure audio low latency for 128 frames per buffer
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    vendor.audio_hal.period_size=128

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/sys/module/flounder_bdaddress/parameters/bdaddress

# Charger
# Allows healthd to boot directly from charger mode rather than initiating a reboot.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.enable_boot_charger_mode=1

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m
# N9 has only two CPUs, so drop dex2oat pressure after boot at runtime
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-threads=1

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609 \
    ro.sf.lcd_density=320 \
    persist.tegra.compositor=glcomposer \
    persist.tegra.decompression=cde-client \
    debug.hwc.force_gpu=1 \
    persist.sys.ui.hw=false \
    debug.hwui.use_buffer_age=false \
    debug.hwui.renderer=opengl \
    debug.sf.latch_unsignaled=1

# drmservice prop
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# facelock properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.facelock.black_timeout=700 \
    ro.facelock.det_timeout=2500 \
    ro.facelock.rec_timeout=3500 \
    ro.facelock.est_max_time=500

# Frp
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/platform/sdhci-tegra.3/by-name/PST

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.def.agps.mode=1

# WIFI
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

PRODUCT_PROPERTY_OVERRIDES += \
        net.dns1=8.8.8.8 \
        net.dns2=8.8.4.4
