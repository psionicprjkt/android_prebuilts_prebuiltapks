#
# Copyright (C) Android Open Source Project
# Copyright (C) NusantaraROM Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Install the prebuilt 'Bromite' webview apk.
#   see https://www.bromite.org/

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_OVERRIDES_PACKAGES := webview

LOCAL_MODULE := bromite-webview
LOCAL_MODULE_CLASS := APPS
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support

LOCAL_MODULE_TARGET_ARCH := arm arm64 
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/BromiteSystemWebView.apk

LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libwebviewchromium.so
LOCAL_PREBUILT_JNI_LIBS_arm64 := @lib/arm64-v8a/libwebviewchromium.so

include $(BUILD_PREBUILT)
