LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := blackscholes
LOCAL_SRC_FILES := blackscholes.c

include $(BUILD_SHARED_LIBRARY)

