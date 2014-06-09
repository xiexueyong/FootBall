
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class SpecialEffect extends Wiget{
    private var name:String;
    private var prefix:String;
    private var frameRate:Int;
    public function new(name:String, prefix:String, frameRate:Int = 30){
        super();
        this.name = name;
        this.prefix = prefix;
        this.frameRate = frameRate;

        AssetsManager.getInstance().uploadAnimationToSprite(this,name,prefix,frameRate,false);//哭泣
//        AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"bounce","Ball_Bounce/00");//球落地弹起的效果
        //AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"jump","Smoke_Jump/00");//球员跳起的特效,地面烟尘
//AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"hit","Player_Hit/00");//球击在身上特效
//        AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"kick","Player_Kick/00");//踢球的特效

        this.animation.play(name);

    }
    public function play(?name:String):Void{
        if(name == null)name = this.name;
        this.animation.play(name);
    }

}
