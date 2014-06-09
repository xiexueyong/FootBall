package com.putaolab.soccer.wiget;
import component.PTFlxTrail;
import flixel.addons.effects.FlxTrail;
import flixel.util.FlxTimer;
import flixel.util.FlxRect;
import com.putaolab.soccer.charater.BoundsSprite;
import com.putaolab.soccer.wiget.RightFlyDirection;
import com.putaolab.soccer.wiget.FlyDirection;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
class Ball extends BoundsSprite {
    private var _LeftDirectionTip:FlxSprite;
    private var _RightDirectionTip:FlxSprite;
    private var _lefting:Bool;
    private var _righting:Bool;
    private var _trail:PTFlxTrail;
//    private
    public function new(X:Float = 0, Y:Float = 0, ?SimpleGraphic:Dynamic)
    {
        super(X, Y);
        acceleration.y = Reg.BALL_GRAVITY;
        drag.x = Reg.BALL_DRAG;
        elasticity = Reg.BALL_ELASTICITY;
        allowCollisions = FlxObject.ANY;
        solid = true;
//        AssetsManager.getInstance().uploadTextureToSprite(this,"ball_big");
        AssetsManager.getInstance().uploadTextureToSprite(this,"ball");
        collisionMap = new FlxRect(0,0,width,height);
        _trail = new PTFlxTrail(this,"assets/images/tracks.png",10,2,0.8,0.05,0.8,0.05);
        _trail.scalesEnabled = false;
//        _trail = new FlxTrail(this,"assets/images/tracks.png",10,2,0.8,0.05);
        PlayState.level.comonBackgroundGroup.add(_trail);

    }

    public function beKicked(direction:String,angle:Float = 0):Void{
        if(direction == "left"){
            this.velocity.x = -Math.cos(angle/180*Math.PI)*Reg.BALL_KICKEDVELOCITY;
        }else if(direction == "right"){
//        trace("right....................");
            this.velocity.x = Math.cos(angle/180*Math.PI)*Reg.BALL_KICKEDVELOCITY;
        }
        this.velocity.y = -Math.sin(angle/180*Math.PI)*Reg.BALL_KICKEDVELOCITY;
        acceleration.y = Reg.BALL_GRAVITY;
    }
//    public function beKicked
    private function spining():Void{
//        if(velocity.x > 0){
//            angularVelocity = Reg.BALL_ANGULARVELOCITY;
//        }else if(velocity.x < 0){
//            angularVelocity = -Reg.BALL_ANGULARVELOCITY;
//        }else{
//            angularVelocity = 0;
//        }
        angularVelocity = velocity.x/Reg.BALL_KICKEDVELOCITY*360*5;
    }

    override private function set_x(NewX:Float):Float{
        if(_LeftDirectionTip != null){
            _LeftDirectionTip.x = this.x;
        }
        if(_RightDirectionTip != null){
            _RightDirectionTip.x = this.x;
        }

        return super.set_x(NewX);
    }
    override private function set_y(NewY:Float):Float{
        if(_LeftDirectionTip != null){
            _LeftDirectionTip.y = this.y;
        }
        if(_RightDirectionTip != null){
            _RightDirectionTip.y = this.y;
        }

        return super.set_y(NewY);
    }

    public function showLeftDirectionTip(angle:Float):Void{
        if(_LeftDirectionTip== null){
            _LeftDirectionTip = new LeftFlyDirection();
        }
        PlayState.level.decorateGroup.add(_LeftDirectionTip);
        _LeftDirectionTip.angle = -(90-angle);
        x = x;
        y = y;
    }
    public function showRightDirectionTip(angle:Float):Void{
        if(_RightDirectionTip== null){
            _RightDirectionTip = new RightFlyDirection();
        }
        PlayState.level.decorateGroup.add(_RightDirectionTip);
        _RightDirectionTip.angle = 90-angle;
        x = x;
        y = y;
    }
    public function removeLeftDirectionTip():Void{
        if(_LeftDirectionTip != null){
            PlayState.level.decorateGroup.remove(_LeftDirectionTip);
            _LeftDirectionTip.angle = 0;
        }

    }
    public function removeRigthDirectionTip():Void{
        if(_RightDirectionTip != null){
            PlayState.level.decorateGroup.remove(_RightDirectionTip);
            _RightDirectionTip.angle = 0;
        }
    }

    override public function update():Void{
        spining();
        super.update();


    }

}
