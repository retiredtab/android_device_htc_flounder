LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := zygote_whitelist.cpp
LOCAL_C_INCLUDES := frameworks/base/core/jni \
                    system/core/base/include
LOCAL_CFLAGS += -DPATH_WHITELIST_EXTRA=$(ZYGOTE_WHITELIST_PATH_EXTRA)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libshim_zw
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
