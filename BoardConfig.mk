# Use the non-open-source part, if present
-include vendor/mediatek/certus/BoardConfigVendor.mk

MTK_PTGEN_CHIP_OVERRIDE := MT6762

# Use the 6765 common part
include device/mediatek/mt6765/BoardConfig.mk


MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$(strip $($(t)))\"))

MTK_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)

ifneq ($(MTK_K64_SUPPORT), yes)
BOARD_KERNEL_CMDLINE = bootopt=64S3,32S1,32S1
else
BOARD_KERNEL_CMDLINE = bootopt=64S3,32N2,64N2
endif

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_SEPOLICY_DIRS += device/xiaomi/certus/sepolicy

# ptgen
MTK_PTGEN_CHIP := $(shell echo $(TARGET_BOARD_PLATFORM) | tr '[a-z]' '[A-Z]')
-include device/mediatek/build/build/tools/ptgen/$(MTK_PTGEN_CHIP)/ptgen.mk

#Config partition size
-include $(MTK_PTGEN_OUT)/partition_size.mk
ifneq ($(strip $(MTK_AB_OTA_UPDATER)), yes)
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
endif
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_COPY_OUT_PRODUCT := system/product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := 

BOARD_AVB_VBMETA_SYSTEM := system

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368

# Dynamic partitions
BOARD_CERTUS_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_SUPER_PARTITION_BLOCK_DEVICES := cust vendor system
BOARD_SUPER_PARTITION_GROUPS := certus_dynamic_partitions
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2684354560
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 805306368
BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 536870912
BOARD_CERTUS_DYNAMIC_PARTITIONS_SIZE := 4022337536
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_SIZE := 4026531840
BOARD_USES_METADATA_PARTITION := true

-include device/mediatek/build/core/soong_config.mk
