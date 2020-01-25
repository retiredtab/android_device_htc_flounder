LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := camera.cpp
LOCAL_MULTILIB := 32
LOCAL_MODULE := libcamera_shim
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := zygote_whitelist.cpp
LOCAL_C_INCLUDES := frameworks/base/core/jni \
                    system/core/base/include
LOCAL_CFLAGS += -DPATH_WHITELIST_EXTRA=$(ZYGOTE_WHITELIST_PATH_EXTRA)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libshim_zw
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
