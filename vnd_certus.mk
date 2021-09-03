MTK_TARGET_PROJECT := certus
MTK_BASE_PROJECT := certus
ifndef MTK_TARGET_PROJECT_FOLDER
MTK_TARGET_PROJECT_FOLDER := $(LOCAL_PATH)
endif
MTK_PROJECT_FOLDER := $(MTK_TARGET_PROJECT_FOLDER)

include $(MTK_TARGET_PROJECT_FOLDER)/ProjectConfig.mk
include $(wildcard $(MTK_TARGET_PROJECT_FOLDER)/RuntimeSwitchConfig.mk)
$(call inherit-product, $(MTK_TARGET_PROJECT_FOLDER)/device.mk)
ifeq ($(strip $(MTK_K64_SUPPORT)),yes)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
endif
$(call inherit-product, $(SRC_TARGET_DIR)/product/runtime_libart.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)
ifneq ($(strip $(MTK_K64_SUPPORT)),yes)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32
endif

ifndef SYS_TARGET_PROJECT
PRODUCT_BUILD_SYSTEM_IMAGE := false
PRODUCT_BUILD_PRODUCT_IMAGE := false
endif
PRODUCT_LOCALES := en_US zh_CN zh_TW es_ES pt_BR ru_RU fr_FR de_DE tr_TR vi_VN ms_MY in_ID th_TH it_IT ar_EG hi_IN bn_IN ur_PK fa_IR pt_PT nl_NL el_GR hu_HU tl_PH ro_RO cs_CZ ko_KR km_KH iw_IL my_MM pl_PL es_US bg_BG hr_HR lv_LV lt_LT sk_SK uk_UA de_AT da_DK fi_FI nb_NO sv_SE en_GB hy_AM zh_HK et_EE ja_JP kk_KZ sr_RS sl_SI ca_ES
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_NAME := vnd_certus
PRODUCT_DEVICE := $(strip $(MTK_BASE_PROJECT))
PRODUCT_MODEL := Redmi 6
PRODUCT_POLICY := android.policy_phone
PRODUCT_BRAND := xiaomi

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEFCONFIG ?= certus_debug_defconfig
else
KERNEL_DEFCONFIG ?= certus_defconfig
endif
PRELOADER_TARGET_PRODUCT ?= certus
LK_PROJECT ?= certus
TRUSTY_PROJECT ?= certus
