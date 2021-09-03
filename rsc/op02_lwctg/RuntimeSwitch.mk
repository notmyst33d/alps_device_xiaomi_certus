# Disable CT register in CU 6M project
MTK_RSC_VENDOR_PROPERTIES += \
        ro.vendor.mtk_devreg_app=0 \
        ro.vendor.mtk_ct4greg_app=0

# optional: inherit from base makefile
include device/mediatek/vendor/common/rsc/Op09Base.mk
