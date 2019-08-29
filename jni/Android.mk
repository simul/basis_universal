LOCAL_PATH := $(call my-dir)

#--------------------------------------------------------
# Basis_universal.a
#
# Crossplatform Texture Compression for SimulCasterClients (PC and Android)
#--------------------------------------------------------
include $(CLEAR_VARS)				# clean everything up to prepare for a module

LOCAL_MODULE    := Basis_universal	        # generate Basis_universal.a

include $(LOCAL_PATH)/../../../client/cflags.mk

LOCAL_C_INCLUDES += $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/transcoder
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

LOCAL_SRC_FILES  := 	../basisu_backend.cpp\
						../basisu_basis_file.cpp\
						../basisu_comp.cpp\
						../basisu_enc.cpp\
						../basisu_etc.cpp\
						../basisu_frontend.cpp\
						../basisu_global_selector_palette_helpers.cpp\
						../basisu_gpu_texture.cpp\
						../basisu_pvrtc1_4.cpp\
						../basisu_resampler.cpp\
						../basisu_resample_filters.cpp\
						../basisu_ssim.cpp\
						../basisu_tool.cpp\
						../lodepng.cpp\
						../transcoder/basisu_transcoder.cpp\

LOCAL_CFLAGS += -D__ANDROID__
LOCAL_CPPFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden -fPIC -fno-strict-aliasing -D_LARGEFILE64_SOURCE=1 -D_FILE_OFFSET_BITS=64 -Wall -Wextra -Wno-unused-local-typedefs -Wno-unused-value -Wno-unused-parameter -Wno-unused-variable -Wno-reorder
LOCAL_CPP_FEATURES += exceptions
include $(BUILD_STATIC_LIBRARY)		# start building based on everything since CLEAR_VARS