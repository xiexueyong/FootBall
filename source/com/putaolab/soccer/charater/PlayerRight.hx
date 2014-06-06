package com.putaolab.soccer.charater;
import flixel.util.FlxPoint;
import com.putaolab.soccer.wiget.CryEffect;
import com.putaolab.soccer.wiget.CryEffect;
import flixel.FlxBasic;
import flixel.group.FlxTypedGroup;
import com.putaolab.soccer.wiget.Ball;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class PlayerRight extends Player{
    public function new(X:Float = 0, Y:Float = 0,backDecorateGroup:FlxTypedGroup<FlxBasic>,frontDecorateGroup:FlxTypedGroup<FlxBasic>,name:String="carlos",country:String="brazil")
    {
        super(X, Y,backDecorateGroup,frontDecorateGroup,name,country);
        facing = FlxObject.LEFT;
        //调整碰撞检测区域
        width = 60;
//        height = 60;
        offset.x = 30;
    }


    override public function kick(ball:Ball,?angle:Float):Void{
        super.kick(ball,angle);
        if(ball.y > y){
            var tx:Float = this.x - ball.x;
            if(tx > 0 && tx < Reg.BALL_EFFECTIVEDISTANCE){
                ball.beKicked("left",_kickAngle);
            }
        }

        showEffect(_kickEffect,this.x - 60,this.y+55);
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
    override private function initializeEffect():Void{
    super.initializeEffect();

    _kickEffect.offsetOnParent = new FlxPoint(0,0);
    _hitEffect.offsetOnParent = new FlxPoint(0,0);
    _smokeJumpEffect.offsetOnParent = new FlxPoint(0,0);

}
    override public function cry():Void{
        if(_cryEffect == null){
            _cryEffect = new CryEffect();
            _cryEffect.offsetOnParent = new FlxPoint(-53,-23);
        }
        super.cry();

    }

   /* override public function update():Void{
        super.update();
    }*/


}
