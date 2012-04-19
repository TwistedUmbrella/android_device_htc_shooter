USE_CAMERA_STUB := true

# inherit from common msm8660 device
-include device/htc/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/shooter/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := shooter
TARGET_NO_RADIOIMAGE := true

# TARGET_SPECIFIC_HEADER_PATH := device/htc/shooter/include
TARGET_SPECIFIC_HEADER_PATH := device/htc/msm8660-common/include

# Gps
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := shooter

TARGET_HARDWARE_3D := true
TARGET_SLIMER_CAM := true

TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
# Set to 9 for 8650A
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

# BOARD_HAVE_SQN_WIMAX := true
BOARD_USES_QCOM_LIBS := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=shooter no_console_suspend=1
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 435941376
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1394606080
BOARD_BOOTIMAGE_PARTITION_SIZE := 5242880
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/shooter/recovery/graphics.c
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# TARGET_PREBUILT_KERNEL := device/htc/shooter/prebuilt/root/kernel
TARGET_KERNEL_CONFIG := cm9_shooter_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/shooter

TARGET_RECOVERY_INITRC := device/htc/shooter/recovery/init.rc
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := 1
