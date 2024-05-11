import Toybox.Lang;
import Toybox.WatchUi;
using Toybox.Timer;

class SOS_FlashlightDelegate extends WatchUi.BehaviorDelegate {

    public var light_on = false;
    var timer;
    var counter = 0;
    var divider = 4;
    

    function initialize() {
        BehaviorDelegate.initialize();
        timer = new Timer.Timer();
    }

    public function onTap(evt as ClickEvent) as Boolean {
        if (Attention has :setFlashlightMode) {
            if (light_on) {
                light_on = false;
                timer.stop();
                Attention.setFlashlightMode(Attention.FLASHLIGHT_MODE_OFF, {:color => Attention.FLASHLIGHT_COLOR_WHITE});
            } else {
                light_on = true;
                counter = 0;
                ditStart();
            }

        }
        return true;
    }

    //Helper Functions

    function ditStart() as Void {
        counter++;
        Attention.setFlashlightMode(Attention.FLASHLIGHT_MODE_ON, {:color => Attention.FLASHLIGHT_COLOR_WHITE});
        timer.start(method(:ditEnd), 1200/divider, false);
    }

    function ditEnd() as Void {
        Attention.setFlashlightMode(Attention.FLASHLIGHT_MODE_OFF, {:color => Attention.FLASHLIGHT_COLOR_WHITE});

        if (counter == 3) {
            timer.start(method(:dahStart), 1200/divider, false);
        } else if (counter == 9) {
            counter = 0;
            timer.start(method(:ditStart), 1200*7/divider, false);
        } else {
            timer.start(method(:ditStart), 1200/divider, false);
        }
    }


    function dahStart() as Void {
        counter++;
        Attention.setFlashlightMode(Attention.FLASHLIGHT_MODE_ON, {:color => Attention.FLASHLIGHT_COLOR_WHITE});
        timer.start(method(:dahEnd), 1200*3/divider, false);
    }

    function dahEnd() as Void {
        Attention.setFlashlightMode(Attention.FLASHLIGHT_MODE_OFF, {:color => Attention.FLASHLIGHT_COLOR_WHITE});

        if (counter == 6) {
            timer.start(method(:ditStart), 1200/divider, false);
        } else {
            timer.start(method(:dahStart), 1200/divider, false);
        }
    }


}