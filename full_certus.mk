ifeq ($(strip $(MTK_K64_SUPPORT)),yes)
SYS_TARGET_PROJECT := mssi_64_ww
else
SYS_TARGET_PROJECT := mssi_32_ww
endif
SYS_TARGET_PROJECT_FOLDER := device/mediatek/system/$(SYS_TARGET_PROJECT)
MTK_TARGET_PROJECT := certus
MTK_TARGET_PROJECT_FOLDER := $(LOCAL_PATH)

-include $(SYS_TARGET_PROJECT_FOLDER)/sys_$(SYS_TARGET_PROJECT).mk
-include $(MTK_TARGET_PROJECT_FOLDER)/vnd_$(MTK_TARGET_PROJECT).mk

PRODUCT_NAME := full_certus

PRODUCT_BUILD_PROP_OVERRIDES += \
    ro.product.system.name=cereus \
    PRIVATE_BUILD_DESC="cereus-user 9 PPR1.180610.011 V11.0.5.0.PCGMIXM release-keys"

BUILD_FINGERPRINT := xiaomi/cereus/cereus:9/PPR1.180610.011/V11.0.5.0.PCGMIXM:user/release-keys
PRODUCT_PROPERTY_OVERRIDES += ro.product.vendor.name=cereus
