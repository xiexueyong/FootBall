package com.putaolab.soccer.charater;
import haxe.Timer;
import Array;
import com.putaolab.soccer.wiget.Wiget;
import com.putaolab.soccer.wiget.SpecialEffect;
import com.putaolab.soccer.wiget.CryEffect;
import flixel.util.FlxColor;
import Reg;
import flixel.util.FlxRect;
import com.putaolab.soccer.wiget.LeftHand;
import com.putaolab.soccer.wiget.RightHand;
import com.putaolab.soccer.wiget.Head;
import com.putaolab.soccer.wiget.Body;
import flixel.FlxBasic;
import flixel.group.FlxTypedGroup;
import Reg;
import com.putaolab.soccer.wiget.Ball;
import flixel.FlxObject;
import flixel.FlxSprite;
class Player extends BoundsSprite {
    private var _backDecorateGroup:FlxTypedGroup<FlxBasic>;
    private var _frontDecorateGroup:FlxTypedGroup<FlxBasic>;



    public var controllable:Bool;
    public var rest:Bool = false;

    //吊球
    public var lob(get,set):Bool;
    private var _lob:Bool = false;
    //平推球
    public var push(get,set):Bool;
    public var happy:Bool = false;
    private var _push:Bool = false;
    private var _kickAngle:Float;
//    private var _wigets:Array<Wiget> = [];
    //body
    private var body:Body;
    private var rightHand:RightHand;
    private var leftHand:LeftHand;
    //effect
    private var _cryEffect:CryEffect;
    private var _kickEffect:SpecialEffect;
    private var _hitEffect:SpecialEffect;
    private var _smokeJumpEffect:SpecialEffect;


    private var hited:FlxSprite;
    private var _name:String;
    private var _country:String;
    public function new(X:Float = 0, Y:Float = 0,backDecorateGroup:FlxTypedGroup<FlxBasic>,frontDecorateGroup:FlxTypedGroup<FlxBasic>,name:String="carlos",country:String="brazil")
    {
        super(X, Y);
        _backDecorateGroup = backDecorateGroup;
        _frontDecorateGroup = frontDecorateGroup;
        _name = name;
        _country = country;

        acceleration.y = Reg.PLAYER_GRAVITY;
        drag.x = Reg.PLAYER_DRAG;
        maxVelocity.x = Reg.PLAYER_MAXVELOCITY;
        elasticity = Reg.PLAYER_ELASTICITY;
        mass = Reg.PLAYER_MASS;
        allowCollisions = FlxObject.ANY;
        initializeBody();
        initializeEffect();

        collisionMap = new FlxRect(20,0,60,120);
    }

    public function jump():Void{
        //35.2是一个莫名其妙的数字，有时处于静止状态时，velocity.y的值居然是35.2
        if((velocity.y == 0|| velocity.y == 35.2) && y > Reg.BOUNDS.height - height-30){
//        if((velocity.y == 0|| velocity.y == 35.2)){
            velocity.y = -Reg.PLAYER_JUMP_VELOCITY;
            showEffect(_smokeJumpEffect,this.x-47,this.y);
        }
    }
    private function initializeEffect():Void{
        _kickEffect = new SpecialEffect("kick","Player_Kick/00",60);
        _hitEffect = new SpecialEffect("hit","Player_Hit/00",60);
        _smokeJumpEffect = new SpecialEffect("jump","Smoke_Jump/00",60);

    }
    public function showEffect(effect:SpecialEffect,x:Float = 0,y:Float = 0):Void{
        _frontDecorateGroup.add(effect);
        effect.x = x;
        effect.y = y;
        effect.play();
    }
    private function initializeBody():Void{
        //head
        AssetsManager.getInstance().uploadTextureToSprite(this,_name);
        //body
        if(leftHand == null){
            leftHand = new LeftHand(0,0,_country);
            _backDecorateGroup.add(leftHand);
//            _wigets.push(leftHand);
        }
        if(rightHand == null){
            rightHand= new RightHand(0,0,_country);
            _backDecorateGroup.add(rightHand);
//            _wigets.push(rightHand);
        }
        if(body == null){
            body = new Body(0,0,_country);
            _backDecorateGroup.add(body);
//            _wigets.push(rightHand);
        }

//        AssetsManager.getInstance().uploadTextureToSprite(body,"body_france");
//        AssetsManager.getInstance().uploadTextureToSprite(hand,"hand_default");

        x = x;
        y = y;
    }
    public function runToLeft():Void{
        acceleration.x = -Reg.PLAYER_RUN_ACCELERATION;
        if(velocity.x > 0)
            velocity.x = 0;
    }
    public function runToRight():Void{
        acceleration.x = Reg.PLAYER_RUN_ACCELERATION;
        if(velocity.x < 0)
            velocity.x = 0;
    }
    public function stop():Void{
        acceleration.x = 0;
    }
    public function get_lob():Bool{
        return _lob;
    }
    public function set_lob(value:Bool):Bool{
        return _lob = value;
    }
    public function get_push():Bool{
        return _push;
    }
    public function set_push(value:Bool):Bool{
        return _push = value;
    }
    override private function set_x(NewX:Float):Float{
        var returnx:Float = super.set_x(NewX);

        if(body != null){
            body.x = this.x;
        }
        if(leftHand != null){
            leftHand.x = this.x;
        }
        if(rightHand != null){
            rightHand.x = this.x;
        }
//        for(item in _wigets){
//            item.x = this.x;
//        }
        if(_cryEffect != null){
            _cryEffect.x = this.x;
        }
        return returnx;
    }
    public function cry():Void{
        _frontDecorateGroup.add(_cryEffect);
    }
    public function stopCry():Void{
        if(_cryEffect != null){
            _frontDecorateGroup.remove(_cryEffect);
        }
    }
    override private function set_y(NewY:Float):Float{
        var returny:Float = super.set_y(NewY);
        if(body != null){
            body.y = this.y;
        }
        if(leftHand != null){
            leftHand.y = this.y;
        }
        if(rightHand != null){
            rightHand.y = this.y;
        }
//        for(item in _wigets){
//            trace(".............item....................................");
//            item.y = this.y;
//        }
        if(_cryEffect != null){
            _cryEffect.y = this.y;
        }

        return returny;
    }
    public function kick(ball:Ball,?angle:Float):Void{
        if(!rest){
            rest = true;
            Timer.delay(function(){rest = false;},AIPlayer.REST_MILLIONSECOND);
        }
//        ball.beKicked(false);
//        showEffect(_kickEffect,this.x,this.y);
    }
    public function forecastDirection(ball:Ball):Void{
    }


    override public function update():Void{
        super.update();
        if(happy){
            jump();
        }


    }


}
