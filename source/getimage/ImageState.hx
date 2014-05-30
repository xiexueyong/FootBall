package getimage;

import flixel.addons.ui.FlxUIState;
import haxe.xml.Fast;
import openfl.Assets;
import flixel.FlxState;
import flixel.text.FlxTextField;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * User: gaoyun
 * Date: 14-5-26
 * Time: 下午1:51
 * description：
 */

class ImageState extends FlxState{

    override public function create():Void
    {
        super.create();
        analyticXML();
    }


    public function analyticXML():Void
    {
        var X:Float = 0;
        var Y:Float = 0;

        var data:Fast = new haxe.xml.Fast(Xml.parse(Assets.getText("assets/getimageName/atlas.xml")).firstElement());
        for (texture in data.nodes.SubTexture)
        {
//            trace(texture.att.name +" x: " +texture.att.x +" y: "+texture.att.y);
//            var sp = AssetsManager.getInstance().getSprite(Std.parseFloat(texture.att.x),Std.parseFloat(texture.att.y),texture.att.name);
            var sp = AssetsManager.getInstance().getSprite(0,0,texture.att.name);
            add(sp);
            sp.x = X;
            sp.y = Y;
//            var text = new FlxText(Std.parseFloat(texture.att.x),Std.parseFloat(texture.att.y),100,texture.att.name,20);
            var text = new FlxText(X,Y,50,texture.att.name,12);
            text.color =FlxColor.GREEN;
            add(text);

            X += sp.width;
            if(X>1024)
            {
                Y += 150;
                X = 0;
            }

        }
    }
    /**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
    override public function destroy():Void
    {
        super.destroy();
    }

    /**
	 * Function that is called once every frame.
	 */
    override public function update():Void
    {
        super.update();
    }
}
