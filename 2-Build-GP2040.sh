#! /bin/bash

# PLEASE NOTE
# The following line must be changed depending on which pico board is used:
export GP2040_BOARDCONFIG=Pico
# Supported Boards (choose one):
# ARCController              OpenCore0MIXUP
# ASiLVLABC                  OpenCore0WASD
# ASiLVLWASD                 PXPGamepad
# BentoBox                   Pico
# Blank                      Pico2
# FlatboxRev4                PicoAnn
# FlatboxRev5                PicoFightingBoard
# FlatboxRev5RGB             PicoW
# FlatboxRev5Southpaw        RP2040AdvancedBreakoutBoard
# FlatboxRev5USBPassthrough  RP2040AdvancedBreakoutBoardUSBPassthrough
# FlatboxRev8                RP2040MiniBreakoutBoard
# Granola                    RP2040MiniBreakoutBoardUSBPassthrough
# GranolaBeacon              ReflexCtrlGenesis6
# Haute42COSMOX              ReflexCtrlNES
# Haute42COSMOXMLite         ReflexCtrlSNES
# Haute42COSMOXMUltra        ReflexCtrlSaturn
# Haute42COSMOXXAnalog       ReflexCtrlVB
# KB2040                     ReflexEncodeV1.2
# KeyboardConverter          ReflexEncodeV2.0
# Liatris                    SGFDevices
# MavercadeRev1              SeeedXIAORP2040
# MavercadeRev2              SparkFunProMicro
# MavercadeRev3              SparkFunProMicroRP2350
# MiSTercadeV2               Stress
# OSUMGP-RP2040              WaveshareZero
# OpenCore0                  ZeroRhythm

export PICO_SDK_PATH="$HOME/pico-sdk/"
\. "$HOME/.nvm/nvm.sh"

# clean install
cd "$HOME/GP2040-CE/www/"
npm ci

# Build WWW
CI=false npm run build --if-present
cd ..

# Pico Build Configure CMake
SKIP_WEBBUILD=TRUE cmake -B ./build -DCMAKE_BUILD_TYPE=Release

# Pico Build
cmake --build ./build --config Release
cd ..
