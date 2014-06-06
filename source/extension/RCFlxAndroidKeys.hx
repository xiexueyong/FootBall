/*
* remote controller
* */
package extension;

#if android
import flixel.input.android.FlxAndroidKeys;
import flixel.input.keyboard.FlxKey;


class RCFlxAndroidKeys extends FlxAndroidKeys {

	public function new() {
        super();
        _keyLookup.set("OK", 23);
        _keyList.set(23, new FlxKey("OK"));

        //TCL OK
        _keyLookup.set("ENTER", 13);
        _keyList.set(13, new FlxKey("ENTER"));
	}
}
#end
