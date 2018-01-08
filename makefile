export DEVELOPER_DIR := $(shell xcode-select --print-path)

# iOS
SDK_iOS 		= $(shell xcodebuild -version -sdk iphoneos Path)
MIN_VER_iOS 	= -miphoneos-version-min=9.0
CC_iOS 			= $(shell xcrun --sdk iphoneos --find clang)

ARCH_iOS 		= -arch arm64

SDK_SETTINGS_iOS = -isysroot $(SDK_iOS) -I$(SDK_iOS)/usr/include -I$(SDK_iOS)/usr/local/include

COMPILE_iOS_BIN = $(CC_iOS) $(ARCH_iOS) $(MIN_VER_iOS) $(SDK_SETTINGS_iOS)
# ================================================================================================= #

HEADER_SEARCH_PATH		= -I.
LIB_SEARCH_PATH			= -L.
FRAMEWORK_SEARCH_PATH 	= -F.

CFLAGS					= -std=gnu99 -O2 -pthread -Wall -D_XOPEN_SOURCE=1 -DPRTS=1
LDFLAGS					= 
FRMKFLAGS				= 
# ================================================================================================= #

SRC_FILES	= dump_sys_regs.c sregs.S
TARGET		= dump_sys_regs_ios
# ================================================================================================= #

$(TARGET): dump_sys_regs.c sregs.S sregs.h
	@$(COMPILE_iOS_BIN) $(HEADER_SEARCH_PATH_IOS) $(CFLAGS) $(LDFLAGS) $(SRC_FILES) -o $(TARGET)
	@codesign -f -s- --entitlements ent.plist $(TARGET)

clean:
	rm -rf $(TARGET) *.dSYM
