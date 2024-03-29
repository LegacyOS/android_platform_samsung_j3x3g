LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := mali.ko
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_RELATIVE_PATH := modules/../../../root/lib/modules
LOCAL_SRC_FILES := mali/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

ifeq ($(TARGET_BUILD_VARIANT),user)
  DEBUGMODE := BUILD=no
else
  DEBUGMODE := $(DEBUGMODE)
endif

ifeq ($(TARGET_ARCH),arm64)
ARCH_ := arm64
CROSS_COMPILE_ := aarch64-linux-android-
else
ARCH_ := arm
CROSS_COMPILE_ := arm-eabi-
endif

$(LOCAL_PATH)/mali/mali.ko: $(TARGET_PREBUILT_KERNEL)
	$(MAKE) -C $(shell dirname $@) ARCH=$(ARCH_) CROSS_COMPILE=$(CROSS_COMPILE_) MALI_PLATFORM=$(TARGET_BOARD_PLATFORM) USING_PP_CORE=$(TARGET_GPU_PP_CORE) $(DEBUGMODE) KDIR=$(ANDROID_PRODUCT_OUT)/obj/KERNEL clean
	$(MAKE) -C $(shell dirname $@) ARCH=$(ARCH_) CROSS_COMPILE=$(CROSS_COMPILE_)$(EXT_FLAGS) MALI_PLATFORM=$(TARGET_BOARD_PLATFORM) USING_PP_CORE=$(TARGET_GPU_PP_CORE) $(DEBUGMODE) KDIR=$(ANDROID_PRODUCT_OUT)/obj/KERNEL
