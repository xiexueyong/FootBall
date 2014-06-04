package com.putaolab.football.ui.state;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxSubState;

class MatchResultPopState extends FlxSubState
{
    private var _leftCountry:String;
    private var _rightCountry:String;
    private var _scores:Array<Int>;

    public function new(leftCountry:String,rightCountry:String,scores:Array<Int>){
        super();
        _leftCountry = leftCountry;
        _rightCountry = rightCountry;
        _scores = scores;
    }
	public override function create():Void
	{		
		super.create();
        var s:FlxSprite = new FlxSprite();
        s.makeGraphic(500,500,FlxColor.RED);
        s.x = (FlxG.width - s.width)/2;
        s.y = (FlxG.height - s.height)/2;
        add(s);
	}

}