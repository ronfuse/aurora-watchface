<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# Aurora Watch Face - Copilot Instructions

This is a Garmin Connect IQ watch face project written in Monkey C. When providing assistance:

## Project Context
- **Language**: Monkey C (Garmin's proprietary language)
- **Platform**: Garmin Connect IQ
- **Target Device**: Primarily Garmin Forerunner 965, with support for multiple Garmin devices
- **Watch Face Name**: Aurora - Dynamic and animated watch face

## Key Features to Maintain
1. **Dynamic Time-Based Themes**: Four different color schemes that change based on time of day
2. **Smooth Animations**: Aurora-like waves, gradient animations, floating particles
3. **Battery Optimization**: Partial updates, power save modes, sleep state handling
4. **Weather Integration**: Real-time weather with animated icons
5. **Smart Complications**: Heart rate, steps, battery, weather data

## Code Patterns
- Use `using` statements for imports (not `import`)
- Functions use `as Type` for parameters and return types
- Color values are hexadecimal numbers (e.g., `0xFF6B73`)
- Graphics operations use `dc` (Device Context) parameter
- Settings are handled through `Application.Storage` or `Properties`

## Performance Guidelines
- Always consider battery life impact
- Use partial updates when possible (`onPartialUpdate()`)
- Implement sleep/wake state handling
- Minimize memory allocations in drawing loops
- Cache frequently used calculations

## Animation Guidelines
- Use `_animationPhase` for smooth transitions
- Base animations on time or frame counters
- Provide animation disable options for battery saving
- Use trigonometric functions for smooth motion

## Graphics Best Practices
- Clear screen before drawing (`dc.clear()`)
- Set colors before drawing operations
- Use appropriate fonts for different text sizes
- Center elements based on screen dimensions
- Handle different screen sizes gracefully

## Common APIs Used
- `System.getClockTime()` - Current time
- `ActivityMonitor.getInfo()` - Activity data
- `Weather.getCurrentConditions()` - Weather data
- `Graphics` namespace - Drawing operations
- `WatchUi.WatchFace` - Base watch face class

## Settings Implementation
- Use Menu2 for modern settings UI
- Store settings in `Application.Storage`
- Provide reasonable defaults
- Update watch face when settings change

When suggesting code improvements or new features, maintain the existing architecture and ensure compatibility with the target devices.
