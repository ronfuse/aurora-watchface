using Toybox.Application as App;
using Toybox.Lang;
using Toybox.WatchUi;

(:glance)
class AuroraWatchFaceApp extends App.AppBase {
    private var _view as AuroraWatchFaceView?;

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state as Dictionary?) as Void {
    }

    function onStop(state as Dictionary?) as Void {
    }

    function getInitialView() as [Views] or [Views, InputDelegates] {
        if (WatchUi has :WatchFace) {
            _view = new AuroraWatchFaceView();
            return [_view];
        } else {
            return [new AuroraWatchFaceView()];
        }
    }

    function getSettingsView() as [Views] or [Views, InputDelegates] {
        return [new AuroraWatchFaceSettingsView(), new AuroraWatchFaceSettingsDelegate()];
    }

    function onSettingsChanged() as Void {
        if (_view != null) {
            _view.onSettingsChanged();
        }
        WatchUi.requestUpdate();
    }
}
