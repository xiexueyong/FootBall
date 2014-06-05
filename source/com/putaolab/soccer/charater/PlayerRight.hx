package com.putaolab.soccer.charater;
import flixel.FlxBasic;
import flixel.group.FlxTypedGroup;
import com.putaolab.soccer.wiget.Ball;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class PlayerRight extends Player{
    public function new(X:Float = 0, Y:Float = 0,parent:FlxTypedGroup<FlxBasic>,name:String="carlos",country:String="brazil")
    {
        super(X, Y,parent,name,country);
        facing = FlxObject.LEFT;
        //调整碰撞检测区域
        width = 60;
//        height = 60;
        offset.x = 30;
    }


    override public function kick(ball:Ball,?angle:Float):Void{
    if(ball.y > y){
        var tx:Float = this.x - ball.x;
        if(tx > 0 && tx < Reg.BALL_EFFECTIVEDISTANCE){
            ball.beKicked("left",_kickAngle);
        }
    }


    }
//    override private function initializeBody():Void{
//
//    }

    override public function forecastDirection(ball:Ball):Void{
//        if(ball.y <= y){
//            return;
//        }
        var tx:Float = this.x - ball.x - ball.width;
        if(ball.y > y && tx > 0 && tx < Reg.BALL_EFFECTIVEDISTANCE){
            var angle:Float = (1-Math.abs(tx/Reg.BALL_EFFECTIVEDISTANCE))*Reg.BALL_MAKANGLE;
            if(lob)
                angle += Reg.BALL_ADDEDANGLE;
            else if(push)
                angle = 0;
            ball.showLeftDirectionTip(angle);
            _kickAngle = Math.abs(angle);
        }else{
            _kickAngle = 0;
            ball.removeLeftDirectionTip();
        }
    }

   /* override public function update():Void{
        super.update();
    }*/


}
