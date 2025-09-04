# Aurora Watch Face Icon Creation Guide

## 🎨 Converting SVG to PNG (80x80)

I've created `aurora_icon.svg` with the Aurora watch face design. Here are several ways to convert it to PNG:

### **Method 1: Online Converters (Easiest)**
1. Go to any of these free online converters:
   - https://convertio.co/svg-png/
   - https://www.freeconvert.com/svg-to-png
   - https://cloudconvert.com/svg-to-png

2. Upload `aurora_icon.svg`
3. Set dimensions to **80x80 pixels**
4. Download as `launcher_icon.png`

### **Method 2: Using Inkscape (Professional)**
1. Download Inkscape (free): https://inkscape.org/
2. Open `aurora_icon.svg` 
3. File → Export PNG Image
4. Set width/height to 80px
5. Export as `launcher_icon.png`

### **Method 3: Using GIMP (Free)**
1. Download GIMP: https://www.gimp.org/
2. File → Open → Select `aurora_icon.svg`
3. Set import size to 80x80
4. File → Export As → `launcher_icon.png`

### **Method 4: Using Chrome/Edge Browser**
1. Open `aurora_icon.svg` in browser
2. Right-click → Inspect Element
3. Take a screenshot or use browser tools
4. Resize to 80x80 in any image editor

### **Method 5: PowerShell with ImageMagick** (if installed)
```powershell
magick convert aurora_icon.svg -resize 80x80 launcher_icon.png
```

## 🎯 **Icon Design Features**
- **Aurora gradient**: From coral to purple representing time-based themes
- **Wave patterns**: Representing the animated aurora effects
- **Clock elements**: Simple clock hands showing it's a watch face
- **Particles**: Small dots representing floating animation elements
- **Glow effects**: Adding the luminous feel of the aurora

## 📝 **Once You Have the PNG:**
1. Replace `launcher_icon.png.placeholder` with `launcher_icon.png`
2. Update the manifest.xml if needed
3. Commit and push to GitHub

The icon captures the essence of your Aurora watch face with its dynamic gradients and time-based theme colors!
