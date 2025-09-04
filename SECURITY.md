# Security Policy

## Supported Versions

We provide security updates for the following versions of Aurora Watch Face:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in Aurora Watch Face, please report it responsibly:

### 🚨 For Security Issues

**DO NOT** create a public GitHub issue for security vulnerabilities.

Instead, please:

1. **Email**: ronled@gmail.com
2. **Subject**: "Aurora Watch Face Security Vulnerability"
3. **Include**:
   - Description of the vulnerability
   - Steps to reproduce (if applicable)
   - Potential impact
   - Suggested fix (if you have one)

### 📧 What to Expect

- **Acknowledgment**: Within 48 hours
- **Initial Assessment**: Within 1 week
- **Resolution Timeline**: Varies based on severity
- **Credit**: Security researchers will be credited (if desired)

### ⚡ Response Timeline

- **Critical**: Immediate response, fix within 24-48 hours
- **High**: Response within 48 hours, fix within 1 week
- **Medium**: Response within 1 week, fix within 2 weeks
- **Low**: Response within 2 weeks, fix in next release

## 🛡️ Security Considerations for Watch Faces

While watch faces have limited security attack surface, we consider:

### Data Privacy
- No personal data is transmitted to external servers
- Weather data uses Garmin's secure APIs only
- No user tracking or analytics

### Device Security
- Minimal memory usage to prevent device instability
- Proper error handling to prevent crashes
- No network requests outside Garmin's ecosystem

### Code Integrity
- All releases are signed with developer key
- Source code is publicly available for audit
- Dependencies are minimal and well-vetted

## 🔐 Best Practices for Users

### Installation
- Only install from official Garmin Connect IQ store
- Verify developer signature matches "ronfuse"
- Keep your Garmin device firmware updated

### Permissions
Aurora Watch Face requires these permissions:
- **Weather**: For current conditions display
- **UserProfile**: For activity data (heart rate, steps)
- **Positioning**: For weather location services
- **Communications**: For weather data updates

All permissions are used only for their intended purpose.

## 🛠️ For Developers

### Secure Development
- Code reviews for all changes
- Testing on multiple device types
- Memory safety considerations
- Input validation for settings

### Third-Party Dependencies
- Minimal external dependencies
- Regular security updates
- Only trusted Garmin APIs used

---

## Contact

For non-security related issues, please use [GitHub Issues](https://github.com/ronfuse/aurora-watchface/issues).

For security concerns: ronled@gmail.com
