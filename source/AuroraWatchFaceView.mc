using Toybox.Graphics;
using Toybox.Lang;
using Toybox.Math;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi;
using Toybox.Weather;
using Toybox.Activity;
using Toybox.ActivityMonitor;

class AuroraWatchFaceView extends WatchUi.WatchFace {
    private var _font;
    private var _isAwake = true;
    private var _partialUpdatesAllowed = false;
    private var _animationPhase = 0;
    private var _lastUpdate = 0;
    private var _screenWidth = 240;
    private var _screenHeight = 240;
    private var _centerX = 120;
    private var _centerY = 120;

    // Color themes based on time of day
    private var _colorThemes = {
        "dawn" => {
            "primary" => 0xFF6B73,    // Soft coral
            "secondary" => 0xFFB347,  // Golden orange
            "accent" => 0xFF9A8C,     // Rose gold
            "background" => [0x2D1B69, 0x11998E] // Purple to teal gradient
        },
        "day" => {
            "primary" => 0x3498DB,    // Bright blue
            "secondary" => 0x2ECC71,  // Emerald green
            "accent" => 0xF39C12,     // Orange
            "background" => [0x74B9FF, 0x0984E3] // Light to dark blue
        },
        "dusk" => {
            "primary" => 0xE74C3C,    // Red
            "secondary" => 0xF39C12,  // Orange
            "accent" => 0x9B59B6,     // Purple
            "background" => [0xE17055, 0x6C5CE7] // Orange to purple
        },
        "night" => {
            "primary" => 0x8E44AD,    // Purple
            "secondary" => 0x3498DB,  // Blue
            "accent" => 0x1ABC9C,     // Turquoise
            "background" => [0x2C3E50, 0x4A69BD] // Dark blue gradient
        }
    };

    function initialize() {
        WatchFace.initialize();
        _font = WatchUi.loadResource(Rez.Fonts.id_font_large);
        var deviceSettings = System.getDeviceSettings();
        _screenWidth = deviceSettings.screenWidth;
        _screenHeight = deviceSettings.screenHeight;
        _centerX = _screenWidth / 2;
        _centerY = _screenHeight / 2;
        _partialUpdatesAllowed = (WatchUi.WatchFace has :onPartialUpdate);
    }

    function onLayout(dc as Dc) as Void {
    }

    function onShow() as Void {
        _isAwake = true;
    }

    function onHide() as Void {
        _isAwake = false;
    }

    function onExitSleep() as Void {
        _isAwake = true;
    }

    function onEnterSleep() as Void {
        _isAwake = false;
    }

    function onUpdate(dc as Dc) as Void {
        var now = System.getClockTime();
        var currentTime = Time.now().value();
        
        // Update animation phase for smooth transitions
        if (_isAwake && (currentTime - _lastUpdate) > 1) {
            _animationPhase = (_animationPhase + 1) % 60;
            _lastUpdate = currentTime;
        }

        // Clear the screen
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Draw animated gradient background
        drawAnimatedBackground(dc, now);

        // Draw main time display with glow effect
        drawTimeWithGlow(dc, now);

        // Draw date
        drawDate(dc);

        // Draw complications (heart rate, steps, battery)
        drawComplications(dc);

        // Draw weather if available
        drawWeather(dc);

        // Draw decorative elements
        drawDecorativeElements(dc);

        // Full update has been drawn
    }

    private function drawAnimatedBackground(dc as Dc, clockTime) as Void {
        var theme = getTimeTheme(clockTime.hour);
        var colors = _colorThemes[theme]["background"];
        
        // Create animated gradient effect
        var gradientOffset = (_animationPhase * 2) % 40;
        
        for (var i = 0; i < _screenHeight; i += 4) {
            var ratio = (i + gradientOffset) / _screenHeight.toFloat();
            var color = interpolateColor(colors[0], colors[1], ratio);
            dc.setColor(color, color);
            dc.fillRectangle(0, i, _screenWidth, 4);
        }

        // Add animated aurora-like waves
        drawAuroraWaves(dc, theme);
    }

    private function drawAuroraWaves(dc as Dc, theme) as Void {
        var colors = _colorThemes[theme];
        var time = _animationPhase * 6; // Degrees
        
        dc.setColor(colors["accent"], Graphics.COLOR_TRANSPARENT);
        
        // Draw multiple sine waves for aurora effect
        for (var wave = 0; wave < 3; wave++) {
            var amplitude = 15 + (wave * 5);
            var frequency = 0.02 + (wave * 0.01);
            var phase = time + (wave * 60);
            
            for (var x = 0; x < _screenWidth; x += 2) {
                var y = _centerY + (amplitude * Math.sin(Math.toRadians(x * frequency * 180 + phase)));
                if (y >= 0 && y < _screenHeight) {
                    dc.setColor(colors["accent"], Graphics.COLOR_TRANSPARENT);
                    dc.fillCircle(x, y, 1);
                }
            }
        }
    }

    private function drawTimeWithGlow(dc as Dc, clockTime) as Void {
        var theme = getTimeTheme(clockTime.hour);
        var colors = _colorThemes[theme];
        
        var timeString = Lang.format("$1$:$2$", [
            clockTime.hour.format("%02d"),
            clockTime.min.format("%02d")
        ]);

        // Create glow effect by drawing text multiple times with increasing opacity
        var glowLayers = [
            {color: colors["primary"], offset: 3, alpha: 30},
            {color: colors["primary"], offset: 2, alpha: 60},
            {color: colors["primary"], offset: 1, alpha: 90},
            {color: colors["secondary"], offset: 0, alpha: 255}
        ];

        var timeFont = Graphics.FONT_NUMBER_THAI_HOT;
        var timeDimensions = dc.getTextDimensions(timeString, timeFont);
        var timeX = _centerX - (timeDimensions[0] / 2);
        var timeY = _centerY - 40;

        for (var i = 0; i < glowLayers.size(); i++) {
            var layer = glowLayers[i];
            dc.setColor(layer["color"], Graphics.COLOR_TRANSPARENT);
            
            for (var dx = -layer["offset"]; dx <= layer["offset"]; dx++) {
                for (var dy = -layer["offset"]; dy <= layer["offset"]; dy++) {
                    if (dx != 0 || dy != 0 || layer["offset"] == 0) {
                        dc.drawText(timeX + dx, timeY + dy, timeFont, timeString, Graphics.TEXT_JUSTIFY_LEFT);
                    }
                }
            }
        }

        // Draw seconds as a subtle rotating element
        drawSecondsIndicator(dc, clockTime.sec, colors);
    }

    private function drawSecondsIndicator(dc as Dc, seconds, colors) as Void {
        var angle = (seconds * 6) - 90; // Convert to degrees, start at top
        var radius = 80;
        var endX = _centerX + (radius * Math.cos(Math.toRadians(angle)));
        var endY = _centerY + (radius * Math.sin(Math.toRadians(angle)));
        
        dc.setColor(colors["accent"], Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);
        
        // Draw a subtle arc for seconds
        for (var i = 0; i < seconds * 6; i += 6) {
            var x = _centerX + (radius * Math.cos(Math.toRadians(i - 90)));
            var y = _centerY + (radius * Math.sin(Math.toRadians(i - 90)));
            dc.fillCircle(x, y, 1);
        }
    }

    private function drawDate(dc as Dc) as Void {
        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format("$1$ $2$", [
            today.month,
            today.day.format("%d")
        ]);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        var dateFont = Graphics.FONT_SMALL;
        var dateDimensions = dc.getTextDimensions(dateString, dateFont);
        dc.drawText(_centerX, _centerY + 30, dateFont, dateString, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawComplications(dc as Dc) as Void {
        var info = ActivityMonitor.getInfo();
        var stats = System.getSystemStats();
        
        // Heart rate (top left)
        if (info.heartRate != null && info.heartRate != ActivityMonitor.INVALID_HR_SAMPLE) {
            drawComplication(dc, 60, 60, "♥", info.heartRate.toString(), Graphics.COLOR_RED);
        }
        
        // Steps (top right)
        var steps = info.steps != null ? info.steps.toString() : "--";
        drawComplication(dc, _screenWidth - 60, 60, "👟", formatNumber(info.steps), Graphics.COLOR_GREEN);
        
        // Battery (bottom center)
        var batteryLevel = stats.battery.format("%.0f") + "%";
        var batteryColor = stats.battery > 20 ? Graphics.COLOR_GREEN : Graphics.COLOR_RED;
        drawComplication(dc, _centerX, _screenHeight - 40, "🔋", batteryLevel, batteryColor);
    }

    private function drawComplication(dc as Dc, x, y, icon, value, color) as Void {
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        var font = Graphics.FONT_TINY;
        
        // Draw icon
        dc.drawText(x, y - 15, Graphics.FONT_SMALL, icon, Graphics.TEXT_JUSTIFY_CENTER);
        
        // Draw value
        dc.drawText(x, y, font, value, Graphics.TEXT_JUSTIFY_CENTER);
    }

    private function drawWeather(dc as Dc) as Void {
        var conditions = Weather.getCurrentConditions();
        if (conditions != null && conditions.temperature != null) {
            var temp = conditions.temperature.format("%d") + "°";
            var weatherIcon = getWeatherIcon(conditions.condition);
            
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            dc.drawText(60, _screenHeight - 60, Graphics.FONT_SMALL, weatherIcon, Graphics.TEXT_JUSTIFY_CENTER);
            dc.drawText(60, _screenHeight - 40, Graphics.FONT_TINY, temp, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    private function drawDecorativeElements(dc as Dc) as Void {
        var theme = getTimeTheme(System.getClockTime().hour);
        var colors = _colorThemes[theme];
        
        // Draw animated particles
        dc.setColor(colors["accent"], Graphics.COLOR_TRANSPARENT);
        
        for (var i = 0; i < 8; i++) {
            var angle = (i * 45) + _animationPhase * 2;
            var radius = 100 + (10 * Math.sin(Math.toRadians(_animationPhase * 3 + i * 30)));
            var x = _centerX + (radius * Math.cos(Math.toRadians(angle)));
            var y = _centerY + (radius * Math.sin(Math.toRadians(angle)));
            
            if (x >= 0 && x < _screenWidth && y >= 0 && y < _screenHeight) {
                dc.fillCircle(x, y, 2);
            }
        }
    }

    private function getTimeTheme(hour) as String {
        if (hour >= 5 && hour < 8) {
            return "dawn";
        } else if (hour >= 8 && hour < 17) {
            return "day";
        } else if (hour >= 17 && hour < 20) {
            return "dusk";
        } else {
            return "night";
        }
    }

    private function interpolateColor(color1, color2, ratio) as Number {
        var r1 = (color1 >> 16) & 0xFF;
        var g1 = (color1 >> 8) & 0xFF;
        var b1 = color1 & 0xFF;
        
        var r2 = (color2 >> 16) & 0xFF;
        var g2 = (color2 >> 8) & 0xFF;
        var b2 = color2 & 0xFF;
        
        var r = r1 + ((r2 - r1) * ratio);
        var g = g1 + ((g2 - g1) * ratio);
        var b = b1 + ((b2 - b1) * ratio);
        
        return (r.toNumber() << 16) | (g.toNumber() << 8) | b.toNumber();
    }

    private function getWeatherIcon(condition) as String {
        if (condition == null) {
            return "❓";
        }
        
        switch (condition) {
            case Weather.CONDITION_CLEAR:
                return "☀️";
            case Weather.CONDITION_PARTLY_CLOUDY:
                return "⛅";
            case Weather.CONDITION_MOSTLY_CLOUDY:
            case Weather.CONDITION_CLOUDY:
                return "☁️";
            case Weather.CONDITION_RAIN:
                return "🌧️";
            case Weather.CONDITION_SNOW:
                return "❄️";
            case Weather.CONDITION_WINDY:
                return "💨";
            default:
                return "🌤️";
        }
    }

    private function formatNumber(number) as String {
        if (number == null) {
            return "--";
        }
        
        if (number >= 1000) {
            return (number / 1000).format("%.1f") + "k";
        }
        
        return number.toString();
    }

    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
    }

    function onPartialUpdate(dc as Dc) as Void {
        // For power efficiency, only update seconds hand on partial updates
        if (_partialUpdatesAllowed && _isAwake) {
            var clockTime = System.getClockTime();
            drawSecondsIndicator(dc, clockTime.sec, _colorThemes["day"]);
        }
    }
}
