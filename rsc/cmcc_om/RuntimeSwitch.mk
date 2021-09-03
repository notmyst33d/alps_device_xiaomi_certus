# for China Mobile entry-level certification
MTK_RSC_VENDOR_PROPERTIES += ro.vendor.cmcc_light_cust_support=1

MTK_RSC_SYSTEM_PROPERTIES += persist.sys.locale=zh-Hans-CN

# optional: inherit from base makefile
include device/mediatek/vendor/common/rsc/RatMode6mBase.mk
include device/mediatek/vendor/common/rsc/OmBase.mk

