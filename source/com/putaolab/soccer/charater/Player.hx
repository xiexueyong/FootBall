package com.putaolab.soccer.charater;
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
    private var _parent:FlxTypedGroup<FlxBasic>;

    public var controllable:Bool;
    //吊球
    public var lob(get,set):Bool;
    public var _lob:Bool = false;
    private var _kickAngle:Float;
    //body
    private var body:Body;
    private var rightHand:RightHand;
    private var leftHand:LeftHand;
    //effect
    private var cry:FlxSprite;
    private var jumpEffect:FlxSprite;
    private var hited:FlxSprite;


    public function new(X:Float = 0, Y:Float = 0,parent:FlxTypedGroup<FlxBasic>)
    {
        super(X, Y);
        _parent = parent;

        acceleration.y = Reg.PLAYER_GRAVITY;
        drag.x = Reg.PLAYER_DRAG;
        maxVelocity.x = Reg.PLAYER_MAXVELOCITY;
        elasticity = Reg.PLAYER_ELASTICITY;
        mass = Reg.PLAYER_MASS;
        allowCollisions = FlxObject.ANY;
        initializeBody();

        collisionMap = new FlxRect(0,0,width,height);
    }

    public function jump():Void{
        if(velocity.y != 0)
            return;

        velocity.y = -Reg.PLAYER_JUMP_VELOCITY;

    }
    private function initializeBody():Void{
        //head
        AssetsManager.getInstance().uploadTextureToSprite(this,"head_blanco");
        //body

        if(leftHand == null){
            leftHand = new LeftHand();
            _parent.add(leftHand);
        }
        if(rightHand == null){
            rightHand= new RightHand();
            _parent.add(rightHand);
        }
        if(body == null){
            body = new Body();
            _parent.add(body);
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
        return returnx;
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


        return returny;
    }
    public function kick(ball:Ball):Void{
//        ball.beKicked(false);
    }
    public function forecastDirection(ball:Ball):Void{
    }


    override public function update():Void{
        super.update();
    }


}