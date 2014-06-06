
package com.putaolab.soccer.wiget;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class CryEffect extends WigetGroup {
    public function new(X:Float = 0, Y:Float = 0){
        super(X,Y);
        var rightCry:FlxSprite = new FlxSprite();
       // AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"cry","Player_Cry/00");//哭泣
//        AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"bounce","Ball_Bounce/00");//球落地弹起的效果
        //AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"jump","Smoke_Jump/00");//球员跳起的特效,地面烟尘
//AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"hit","Player_Hit/00");//球击在身上特效
//        AssetsManager.getInstance().uploadAnimationToSprite(rightCry,"kick","Player_Kick/00");//踢球的特效

        rightCry.animation.play("cry");

        var leftCry:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadAnimationToSprite(leftCry,"cry","Player_Cry/00");
        leftCry.animation.play("cry");
        leftCry.flipX = true;

//        add(rightCry);
//        add(leftCry);
    }

}
