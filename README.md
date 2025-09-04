# Aurora Watch Face for Garmin

An innovative and dynamic watch face designed specifically for Garmin devices, featuring time-based color themes, smooth animations, and contextual data display.

## Features

### 🎨 Dynamic Themes
- **Time-Based Color Themes**: Automatically changes throughout the day
  - **Dawn** (5:00-8:00): Soft coral and golden orange with purple-teal gradient
  - **Day** (8:00-17:00): Bright blue and emerald green with blue gradient
  - **Dusk** (17:00-20:00): Red and orange with orange-purple gradient  
  - **Night** (20:00-5:00): Purple and blue with dark blue gradient

### ✨ Animated Elements
- **Aurora-like waves**: Flowing sine wave patterns that move across the background
- **Gradient animations**: Smooth color transitions with animated offsets
- **Floating particles**: Rotating decorative elements around the watch face
- **Glowing time display**: Multi-layer text rendering for a luminous effect
- **Smooth seconds indicator**: Animated arc showing seconds progression

### 📊 Smart Complications
- **Heart Rate**: Real-time heart rate monitoring with color-coded display
- **Step Counter**: Daily step count with smart formatting (shows "k" for thousands)
- **Battery Level**: Battery percentage with color warnings (red when < 20%)
- **Weather**: Current temperature and animated weather icons

### ⚙️ Customizable Settings
- **Theme Mode**: Auto (time-based) or manual theme selection
- **Complications**: Toggle individual data fields on/off
- **Animation Control**: Enable/disable animations for battery saving
- **Power Save Modes**: Three levels of power optimization

### 🔋 Battery Optimization
- **Partial Updates**: Efficient updates for seconds hand only
- **Sleep Mode**: Reduced animations when watch is not active
- **Power Save Options**: Configurable performance levels
- **Smart Rendering**: Optimized drawing routines

### 🌤️ Weather Integration
- Real-time weather conditions with animated icons
- Temperature display in user's preferred units
- Weather condition symbols: ☀️ ⛅ ☁️ 🌧️ ❄️ 💨

## Supported Devices

- Garmin Forerunner 965 ✅
- Garmin Forerunner 955
- Garmin Forerunner 255
- Garmin Fenix 7/7S/7X
- Garmin Venu 2/2S/2 Plus
- Garmin Vivoactive 4/4S

## Installation

1. **Download and Install Connect IQ SDK**
   - Download from [Garmin Developer Portal](https://developer.garmin.com/connect-iq/sdk/)
   - Install SDK and simulator

2. **Clone or Download Project**
   ```bash
   git clone <repository-url>
   cd aurora-watchface
   ```

3. **Build the Project**
   ```bash
   monkeyc -f ./monkey.jungle -o aurora.prg -y developer_key.der
   ```

4. **Install on Device**
   - Use Garmin Express or Connect IQ app
   - Or copy to device using simulator

## Development

### Prerequisites
- Garmin Connect IQ SDK 4.0+
- Visual Studio Code (recommended)
- Connect IQ VS Code extension

### Project Structure
```
aurora-watchface/
├── manifest.xml              # App configuration
├── monkey.jungle             # Build configuration
├── source/
│   ├── AuroraWatchFaceApp.mc     # Main application
│   ├── AuroraWatchFaceView.mc    # Watch face view
│   └── AuroraWatchFaceSettings.mc # Settings UI
├── resources/
│   ├── strings/
│   │   └── strings.xml       # Localized strings
│   ├── properties/
│   │   └── properties.xml    # Default settings
│   └── images/               # Icons and assets
└── README.md
```

### Key Technologies
- **Monkey C**: Garmin's proprietary programming language
- **Connect IQ API**: For device integration and data access
- **Graphics API**: Custom drawing and animation routines
- **Weather API**: Real-time weather data integration

### Customization

The watch face is highly customizable through code modifications:

1. **Color Themes**: Modify `_colorThemes` in `AuroraWatchFaceView.mc`
2. **Animation Speed**: Adjust `_animationPhase` increment rate
3. **Complications Layout**: Change positions in `drawComplications()`
4. **Weather Icons**: Customize `getWeatherIcon()` function

### Performance Optimization

- Uses partial updates for battery efficiency
- Implements multiple power save modes
- Optimized drawing with minimal memory allocation
- Smart animation controls based on watch state

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on simulator and real device
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Credits

- Designed and developed by [Your Name]
- Weather icons from [Source]
- Inspired by aurora borealis natural phenomenon

## Support

For issues, feature requests, or questions:
- Open an issue on GitHub
- Contact: ronled@gmail.com

---

*Experience the beauty of time with Aurora Watch Face - where technology meets artistry.*
