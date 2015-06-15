LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := sevseg
LOCAL_SRC_FILES := sevseg.c

include $(BUILD_SHARED_LIBRARY)

