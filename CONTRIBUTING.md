# Contributing to Aurora Watch Face

Thank you for your interest in contributing to the Aurora Watch Face project! We welcome contributions from the community.

## 🤝 How to Contribute

### Reporting Issues
- Use GitHub Issues to report bugs or request features
- Provide detailed information about your device model and firmware version
- Include screenshots if possible
- Describe steps to reproduce any bugs

### Code Contributions
1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
4. **Test thoroughly** on simulator and real device
5. **Submit a pull request**

## 🛠️ Development Setup

1. Follow the setup instructions in [DEVELOPMENT.md](DEVELOPMENT.md)
2. Install the recommended VS Code extensions
3. Test your changes in the Connect IQ simulator
4. Verify compatibility with multiple device types

## 📝 Code Style Guidelines

### Monkey C Best Practices
- Use descriptive variable names with Hungarian notation where appropriate
- Add comments for complex algorithms (especially animations)
- Follow Garmin's performance guidelines for watch faces
- Use `using` statements for imports
- Declare types explicitly: `function myFunction(param as String) as Number`

### Performance Considerations
- Always consider battery impact of changes
- Use partial updates when possible
- Minimize memory allocations in drawing loops
- Test animations at different frame rates
- Implement proper sleep/wake state handling

### Animation Guidelines
- Base animations on `_animationPhase` counter
- Provide options to disable animations for battery saving
- Use trigonometric functions for smooth motion
- Keep animation calculations efficient

## 🎨 Design Guidelines

### Color Schemes
- Maintain consistency with existing time-based themes
- Ensure good contrast for readability
- Test colors on different screen types (MIP, AMOLED)
- Consider color-blind accessibility

### UI Elements
- Keep complication icons simple and recognizable
- Maintain visual hierarchy (time should be most prominent)
- Ensure elements are sized appropriately for small screens
- Test layouts on different screen sizes

## 🧪 Testing Requirements

Before submitting a PR, please ensure:
- [ ] Code compiles without errors
- [ ] Tested on Connect IQ simulator
- [ ] Tested on actual Garmin device (if available)
- [ ] Battery usage is reasonable
- [ ] Animations are smooth
- [ ] Settings menu functions correctly
- [ ] All themes work properly

### Testing Devices
Priority testing order:
1. Forerunner 965 (primary target)
2. Fenix 7 series
3. Venu 2 series
4. Other supported devices

## 📋 Pull Request Checklist

- [ ] Branch is up to date with main
- [ ] Code follows style guidelines
- [ ] Comprehensive testing completed
- [ ] Documentation updated if needed
- [ ] Commit messages are descriptive
- [ ] No build artifacts committed

## 🔧 Types of Contributions Welcome

### Features
- New animation effects
- Additional customization options
- Weather provider integrations
- New complication types
- Accessibility improvements

### Bug Fixes
- Performance optimizations
- Memory leak fixes
- Compatibility issues
- Visual glitches

### Documentation
- Code comments
- User guides
- Setup improvements
- Translation support

## ❓ Questions?

- Check existing [Issues](https://github.com/ronfuse/aurora-watchface/issues)
- Review [DEVELOPMENT.md](DEVELOPMENT.md) for setup help
- Contact: ronled@gmail.com

## 🏆 Recognition

Contributors will be credited in the README.md file and release notes.

---

Thank you for helping make Aurora Watch Face even better! 🌌⌚✨
