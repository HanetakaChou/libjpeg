#
# Copyright (C) YuqiaoZhang(HanetakaChou)
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# https://developer.android.com/ndk/guides/android_mk

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := jpeg

LOCAL_SRC_FILES := \
	$(LOCAL_PATH)/../jaricom.c \
	$(LOCAL_PATH)/../jcapimin.c \
	$(LOCAL_PATH)/../jcapistd.c \
	$(LOCAL_PATH)/../jcarith.c \
	$(LOCAL_PATH)/../jccoefct.c \
	$(LOCAL_PATH)/../jccolor.c \
	$(LOCAL_PATH)/../jcdctmgr.c \
	$(LOCAL_PATH)/../jchuff.c \
	$(LOCAL_PATH)/../jcicc.c \
	$(LOCAL_PATH)/../jcinit.c \
	$(LOCAL_PATH)/../jcmainct.c \
	$(LOCAL_PATH)/../jcmarker.c \
	$(LOCAL_PATH)/../jcmaster.c \
	$(LOCAL_PATH)/../jcomapi.c \
	$(LOCAL_PATH)/../jconfigint.cc \
	$(LOCAL_PATH)/../jcparam.c \
	$(LOCAL_PATH)/../jcphuff.c \
	$(LOCAL_PATH)/../jcprepct.c \
	$(LOCAL_PATH)/../jcsample.c \
	$(LOCAL_PATH)/../jctrans.c \
	$(LOCAL_PATH)/../jdapimin.c \
	$(LOCAL_PATH)/../jdapistd.c \
	$(LOCAL_PATH)/../jdarith.c \
	$(LOCAL_PATH)/../jdatadst.c \
	$(LOCAL_PATH)/../jdatasrc.c \
	$(LOCAL_PATH)/../jdcoefct.c \
	$(LOCAL_PATH)/../jdcolor.c \
	$(LOCAL_PATH)/../jddctmgr.c \
	$(LOCAL_PATH)/../jdhuff.c \
	$(LOCAL_PATH)/../jdicc.c \
	$(LOCAL_PATH)/../jdinput.c \
	$(LOCAL_PATH)/../jdmainct.c \
	$(LOCAL_PATH)/../jdmarker.c \
	$(LOCAL_PATH)/../jdmaster.c \
	$(LOCAL_PATH)/../jdmerge.c \
	$(LOCAL_PATH)/../jdphuff.c \
	$(LOCAL_PATH)/../jdpostct.c \
	$(LOCAL_PATH)/../jdsample.c \
	$(LOCAL_PATH)/../jdtrans.c \
	$(LOCAL_PATH)/../jerror.c \
	$(LOCAL_PATH)/../jfdctflt.c \
	$(LOCAL_PATH)/../jfdctfst.c \
	$(LOCAL_PATH)/../jfdctint.c \
	$(LOCAL_PATH)/../jidctflt.c \
	$(LOCAL_PATH)/../jidctfst.c \
	$(LOCAL_PATH)/../jidctint.c \
	$(LOCAL_PATH)/../jidctred.c \
	$(LOCAL_PATH)/../jmemmgr.c \
	$(LOCAL_PATH)/../jmemnobs.c \
	$(LOCAL_PATH)/../jquant1.c \
	$(LOCAL_PATH)/../jquant2.c \
	$(LOCAL_PATH)/../jsimd_none.c \
	$(LOCAL_PATH)/../jutils.c

LOCAL_CFLAGS :=

ifeq (armeabi-v7a,$(TARGET_ARCH_ABI))
LOCAL_ARM_MODE := arm
LOCAL_ARM_NEON := true
else ifeq (arm64-v8a,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS +=
else ifeq (x86,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS += -mf16c
LOCAL_CFLAGS += -mfma
LOCAL_CFLAGS += -mavx2
else ifeq (x86_64,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS += -mf16c
LOCAL_CFLAGS += -mfma
LOCAL_CFLAGS += -mavx2
else
LOCAL_CFLAGS +=
endif

LOCAL_CFLAGS += -Wall
LOCAL_CFLAGS += -Werror=return-type

LOCAL_C_INCLUDES :=

LOCAL_CPPFLAGS := 
LOCAL_CPPFLAGS += -std=c++20

LOCAL_LDFLAGS :=
LOCAL_LDFLAGS += -Wl,--enable-new-dtags
LOCAL_LDFLAGS += -Wl,-rpath,\$$ORIGIN
LOCAL_LDFLAGS += -Wl,--version-script,$(LOCAL_PATH)/jpeg62-memsrcdst.map

LOCAL_STATIC_LIBRARIES :=

include $(BUILD_SHARED_LIBRARY)
