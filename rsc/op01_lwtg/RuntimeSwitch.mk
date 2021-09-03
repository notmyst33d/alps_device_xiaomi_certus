# For CMCC USB requirement - need active by SIM when using USB by first time.
MTK_RSC_VENDOR_PROPERTIES += ro.vendor.mtk_usb_cba_support=1

# For rat config
include device/mediatek/vendor/common/rsc/RatMode5mFddBase.mk

# for China Mobile customization certification
include device/mediatek/vendor/common/rsc/Op01Base.mk

