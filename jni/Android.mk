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

LOCAL_SRC_FILES  := 	../encoder/basisu_backend.cpp\
						../encoder/basisu_basis_file.cpp\
						../encoder/basisu_comp.cpp\
						../encoder/basisu_enc.cpp\
						../encoder/basisu_etc.cpp\
						../encoder/basisu_frontend.cpp\
						../encoder/basisu_global_selector_palette_helpers.cpp\
						../encoder/basisu_gpu_texture.cpp\
						../encoder/basisu_pvrtc1_4.cpp\
						../encoder/basisu_resampler.cpp\
						../encoder/basisu_resample_filters.cpp\
						../encoder/basisu_ssim.cpp\
						../basisu_tool.cpp\
						../encoder/lodepng.cpp\
						../transcoder/basisu_transcoder.cpp\

LOCAL_CFLAGS += -D__ANDROID__
LOCAL_CPPFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden -fPIC -fno-strict-aliasing -D_LARGEFILE64_SOURCE=1 -D_FILE_OFFSET_BITS=64 -DBASISD_SUPPORT_KTX2_ZSTD=0 -Wall -Wextra -Wno-unused-local-typedefs -Wno-unused-value -Wno-unused-parameter -Wno-unused-variable -Wno-reorder
LOCAL_CPP_FEATURES += exceptions
include $(BUILD_STATIC_LIBRARY)		# start building based on everything since CLEAR_VARS