package ;
/**
 * User: gaoyun
 * Date: 14-5-26
 * Time: 上午11:44
 * description：
 */

import flixel.util.loaders.TexturePackerData;
import component.PTTexturePackerData;
import flixel.FlxSprite;
import flixel.util.loaders.SparrowData;

class AssetsManager{
    /**/
    private static var _assetsmanger:AssetsManager;
    /**/
    private var _sparrowsata:PTTexturePackerData;

    public function new() {
    }

    public static function getInstance():AssetsManager
    {
        if(_assetsmanger==null)
        {
            _assetsmanger = new AssetsManager();

        }
        return _assetsmanger;
    }

    public function setSparrowData(xmlstr:String,pngstr:String):Void
    {
        _sparrowsata = new PTTexturePackerData(xmlstr,pngstr);
    }

    /*根据资源名字得到指定的资源*/
    public function getSprite(X:Float=0,Y:Float=0,name:String):FlxSprite
    {
        var sp = new FlxSprite(0, 0);
        sp.x = X;
        sp.y = Y;
        sp.loadGraphicFromTexture(_sparrowsata,false,name);
        return sp;
    }

    /**/
    public function getAnimation(X:Float,Y:Float,Ani_Key:String,Ani_Name:String,FrameRate:Int = 30):FlxSprite
    {
        var sp = new FlxSprite(X, Y);
        sp.loadGraphicFromTexture(_sparrowsata);
        sp.animation.addByPrefix(Ani_Key,Ani_Name,FrameRate);
        return sp;
    }
    /**/
     public function uploadAnimationToSprite(sprite:FlxSprite,Ani_Key:String,Ani_Name:String,FrameRate:Int = 30):Void
     {
         sprite.loadGraphicFromTexture(_sparrowsata);
         sprite.animation.addByPrefix(Ani_Key,Ani_Name,FrameRate);
     }
    /**/
    public function uploadTextureToSprite(sprite:FlxSprite,name:String):Void
    {
        sprite.loadGraphicFromTexture(_sparrowsata,false,name);
    }

    /**/
    public function getSparrows():TexturePackerData
    {
        return _sparrowsata;
    }


}
