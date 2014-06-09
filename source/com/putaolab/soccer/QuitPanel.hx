package com.putaolab.soccer;

import flixel.FlxState;
import Reg;
import flixel.util.FlxRandom;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;

class QuitPanel extends FlxSprite {



    public function new(X:Float = 0, Y:Float = 0,completeFunction:FlxTween->Void) {
        super(X, Y);
        loadGraphic("assets/images/quit.png");
        x = (FlxG.width - width)/2;
        y = (FlxG.height - height)/2;
        FlxTween.tween(this, { alpha: 0.3 }, 2.5, {complete:completeFunction});
    }


    override public function update() {
        super.update();
    }


}
