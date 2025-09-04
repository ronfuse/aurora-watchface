using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Application.Storage;

class AuroraWatchFaceSettingsView extends WatchUi.Menu2 {

    function initialize() {
        Menu2.initialize({:title=>"Aurora Settings"});
        
        Menu2.addItem(new WatchUi.MenuItem(
            "Theme Mode",
            "Auto/Manual theme",
            "theme_mode",
            {}
        ));
        
        Menu2.addItem(new WatchUi.MenuItem(
            "Complications",
            "Show/Hide data",
            "complications",
            {}
        ));
        
        Menu2.addItem(new WatchUi.MenuItem(
            "Animation",
            "Enable/Disable",
            "animation",
            {}
        ));
        
        Menu2.addItem(new WatchUi.MenuItem(
            "Power Save",
            "Battery optimization",
            "power_save",
            {}
        ));
    }
}

class AuroraWatchFaceSettingsDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId() as String;
        
        if (id.equals("theme_mode")) {
            var menu = new WatchUi.Menu2({:title=>"Theme Mode"});
            menu.addItem(new WatchUi.MenuItem("Auto", "Time-based themes", "auto", {}));
            menu.addItem(new WatchUi.MenuItem("Dawn", "Coral and gold", "dawn", {}));
            menu.addItem(new WatchUi.MenuItem("Day", "Blue and green", "day", {}));
            menu.addItem(new WatchUi.MenuItem("Dusk", "Orange and purple", "dusk", {}));
            menu.addItem(new WatchUi.MenuItem("Night", "Purple and blue", "night", {}));
            
            WatchUi.pushView(menu, new ThemeModeDelegate(), WatchUi.SLIDE_LEFT);
            
        } else if (id.equals("complications")) {
            var menu = new WatchUi.Menu2({:title=>"Complications"});
            menu.addItem(new WatchUi.MenuItem("Heart Rate", getToggleText("show_hr"), "show_hr", {}));
            menu.addItem(new WatchUi.MenuItem("Steps", getToggleText("show_steps"), "show_steps", {}));
            menu.addItem(new WatchUi.MenuItem("Battery", getToggleText("show_battery"), "show_battery", {}));
            menu.addItem(new WatchUi.MenuItem("Weather", getToggleText("show_weather"), "show_weather", {}));
            
            WatchUi.pushView(menu, new ComplicationsDelegate(), WatchUi.SLIDE_LEFT);
            
        } else if (id.equals("animation")) {
            var current = Storage.getValue("animation_enabled");
            if (current == null) { current = true; }
            Storage.setValue("animation_enabled", !current);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            
        } else if (id.equals("power_save")) {
            var menu = new WatchUi.Menu2({:title=>"Power Save"});
            menu.addItem(new WatchUi.MenuItem("Off", "Full animations", "off", {}));
            menu.addItem(new WatchUi.MenuItem("Medium", "Reduced effects", "medium", {}));
            menu.addItem(new WatchUi.MenuItem("High", "Minimal animations", "high", {}));
            
            WatchUi.pushView(menu, new PowerSaveDelegate(), WatchUi.SLIDE_LEFT);
        }
    }
    
    private function getToggleText(key as String) as String {
        var value = Storage.getValue(key);
        if (value == null) { value = true; }
        return value ? "ON" : "OFF";
    }
}

class ThemeModeDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }
    
    function onSelect(item as MenuItem) as Void {
        var id = item.getId() as String;
        Storage.setValue("theme_mode", id);
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}

class ComplicationsDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }
    
    function onSelect(item as MenuItem) as Void {
        var id = item.getId() as String;
        var current = Storage.getValue(id);
        if (current == null) { current = true; }
        Storage.setValue(id, !current);
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}

class PowerSaveDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }
    
    function onSelect(item as MenuItem) as Void {
        var id = item.getId() as String;
        Storage.setValue("power_save_mode", id);
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}
