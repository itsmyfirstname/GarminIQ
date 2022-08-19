import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

class USMCView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var view = View.findDrawableById("TimeLabel") as Text;
        view.setText(timeString);

        //Test value, up top
        var testString = "Hello";
        var viewTwo = View.findDrawableById("Test") as Text;
        viewTwo.setText(testString);

        // Heart Rate
        // TODO: Pull out of try statement, come up with better testing params/config
        try {
            var hr = Activity.getActivityInfo().currentHeartRate;

            var viewThree = View.findDrawableById("HeartRate") as Text;
            viewThree.setText(hr);

            // Call the parent onUpdate function to redraw the layout
            View.onUpdate(dc);
        }
        catch( ex ) {
            var viewThree = View.findDrawableById("HeartRate") as Text;
            viewThree.setText("62 BPM");

            // Call the parent onUpdate function to redraw the layout
            View.onUpdate(dc);
        }

        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
