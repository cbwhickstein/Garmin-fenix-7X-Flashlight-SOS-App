import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class SOS_FlashlightApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new SOS_FlashlightView(), new SOS_FlashlightDelegate() ];
    }

}

function getApp() as SOS_FlashlightApp {
    return Application.getApp() as SOS_FlashlightApp;
}