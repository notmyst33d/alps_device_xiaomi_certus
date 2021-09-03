
# For CMCC USB requirement - need active by SIM when using USB by first time.
MTK_RSC_VENDOR_PROPERTIES += ro.vendor.mtk_usb_cba_support=1

# optional: inherit from base makefile
# for China Mobile customization certification
include device/mediatek/vendor/common/rsc/Op01Base.mk
