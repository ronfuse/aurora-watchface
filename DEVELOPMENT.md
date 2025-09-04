# Aurora Watch Face Development Setup

## Prerequisites

### 1. Install Garmin Connect IQ SDK
1. Download the SDK from [Garmin Developer Portal](https://developer.garmin.com/connect-iq/sdk/)
2. Install the SDK to a location like `C:\Garmin\ConnectIQ`
3. Add the SDK bin directory to your PATH environment variable

### 2. Install Visual Studio Code Extensions
Install these recommended extensions:
- **Monkey C** by Garmin (garmin.monkey-c)
- **Connect IQ** by Garmin (garmin.connectiq)

### 3. Generate Developer Key
```bash
openssl genrsa -out developer_key.pem 4096
openssl pkcs8 -topk8 -inform PEM -outform DER -in developer_key.pem -out developer_key.der -nocrypt
```

## Build Commands

### Build for Simulator
```bash
monkeyc -f .\monkey.jungle -d forerunner965 -o aurora.prg -y developer_key.der
```

### Build for Device
```bash
monkeyc -f .\monkey.jungle -d forerunner965 -o aurora.prg -y developer_key.der --release
```

### Run in Simulator
```bash
connectiq
# Then load aurora.prg in the simulator
```

## Development Workflow

1. **Edit Code**: Modify files in `source/` directory
2. **Build**: Use the build commands above
3. **Test**: Run in simulator or on device
4. **Debug**: Use VS Code debugger with Connect IQ extension

## Key Files
- `manifest.xml` - App configuration and permissions
- `monkey.jungle` - Build configuration
- `source/AuroraWatchFaceView.mc` - Main watch face logic
- `resources/strings/strings.xml` - UI strings
- `resources/properties/properties.xml` - Default settings

## Device Testing
1. Enable Developer Mode on your Garmin device
2. Copy the .prg file to the APPS folder on your device
3. Restart your device to install the watch face

## Common Issues
- **Build Errors**: Check syntax and imports
- **Memory Issues**: Optimize graphics operations
- **Performance**: Use partial updates and power saving modes
