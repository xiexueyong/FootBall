package com.putaolab.football.footballer;
import flixel.FlxSprite;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;


/**
 * User: gaoyun
 * Date: 14-6-9
 * Time: 下午6:04
 * description：球员
 */


class FootBallerPlayer extends FlxSprite{
    private var _name:String;
    private var _country:String;
    private var _playerGroup:FlxSpriteGroup;
    //body
    private var body:PlayerBody;
    private var rightHand:PlayerRightHand;
    private var leftHand:PlayerHand;

    public function new(name:String,country:String,playergroup:FlxSpriteGroup) {
        _name = name;
        _country = country;
        _playerGroup = playergroup;
        super();
        initializeBody();
    }

    public function initializeBody():Void
    {
        var head:FlxSprite = AssetsManager.getInstance().getSprite(0,0,_name);
        _playerGroup.add(head);
        body = new PlayerBody(0,0,_country);
        _playerGroup.add(body);
        leftHand = new PlayerHand(0,0,_country);
        _playerGroup.add(leftHand);
        rightHand = new PlayerRightHand(0,0,_country);
        _playerGroup.add(rightHand);

    }
}
