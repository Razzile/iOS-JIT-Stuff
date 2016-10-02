ARCHS = arm64
TARGET_CODESIGN_FLAGS = -Sent.plist
include $(THEOS)/makefiles/common.mk

TOOL_NAME = jitstuff
jitstuff_FILES = main.mm

include $(THEOS_MAKE_PATH)/tool.mk
