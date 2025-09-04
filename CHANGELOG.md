# Changelog

All notable changes to the Aurora Watch Face project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Additional weather providers
- More animation effects
- Customizable complication positions
- Multiple language support

## [1.0.0] - 2025-09-04

### Added
- Initial release of Aurora Watch Face
- Dynamic time-based color themes (Dawn, Day, Dusk, Night)
- Animated aurora-like wave patterns
- Smooth gradient background animations
- Floating particle effects around watch face
- Glowing time display with multi-layer rendering
- Smart complications system
  - Heart rate monitoring with color coding
  - Step counter with smart formatting
  - Battery level with warning colors
  - Weather integration with animated icons
- Comprehensive settings menu
  - Theme mode selection (Auto/Manual)
  - Individual complication toggles
  - Animation control options
  - Power save modes (Off/Medium/High)
- Battery optimization features
  - Partial updates for seconds display
  - Sleep/wake state handling
  - Power-efficient rendering
- Professional icon set
  - 80x80 launcher icon with Aurora gradient
  - 16x16 complication icons (heart, steps, battery, weather)
  - SVG source files for all icons
- Multi-device support
  - Garmin Forerunner 965 (primary)
  - Garmin Forerunner 955/255
  - Garmin Fenix 7/7S/7X series
  - Garmin Venu 2/2S/2 Plus
  - Garmin Vivoactive 4/4S
- Development environment
  - VS Code configuration with tasks
  - Build and debug setup
  - Comprehensive documentation
  - MIT license

### Technical Details
- Written in Monkey C for Garmin Connect IQ
- Optimized graphics rendering with minimal memory allocation
- Smooth 60-phase animation system
- Real-time weather API integration
- Activity Monitor integration for health data
- Settings persistence with Application.Storage

---

## Version History Legend

- **Added**: New features
- **Changed**: Changes in existing functionality  
- **Deprecated**: Soon-to-be removed features
- **Removed**: Removed features
- **Fixed**: Bug fixes
- **Security**: Security improvements
