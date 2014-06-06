package com.putaolab.football.ui.state;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxBasic;
import flixel.addons.ui.FlxUIGroup;
import flixel.group.FlxSpriteGroup;

/**
 * User: gaoyun
 * Date: 14-5-30
 * Time: 上午11:04
 * description：
 */

class StateBG extends FlxSpriteGroup{

    private var _tribunaY:Int= 180;
    private var _grassY:Int= 405;
    private var _terrainY:Float;
    private var _titleY:Int= 80;
    private var _logo:Bool = false;
    private var _cloudarr:Array<FlxSprite>;

    public function new(logo:Bool=false) {
        _logo = logo;
        super();
        init();
    }
    public function init():Void
    {
        var bgsky = AssetsManager.getInstance().getSprite(0,0,"bg_sky");
        bgsky.origin.x = 0;
        bgsky.origin.y = 0;
        bgsky.scale.x = FlxG.width/bgsky.width;
        bgsky.scale.y = FlxG.height/2/bgsky.height;

        bgsky.y = -15;
        add(bgsky);
        settribuna();
        setTerrain();
        setgrass();

        if(_logo){
            var title = AssetsManager.getInstance().getSprite(0,0,"title");
            title.x = (FlxG.width-title.width)*0.5;
            title.y = _titleY;
            add(title);
        }
    }

    /*设置看台*/
    private function settribuna():Void
    {
        var x:Float = 0;
        var w:Float = 0;
        var bgs:FlxSprite = AssetsManager.getInstance().getSprite(0,0,"bg_tribuna_mid_empty");
        while(x<FlxG.width){
            var bg:FlxSprite = new FlxSprite(0,0,bgs.getFlxFrameBitmapData());
            bg.origin.y = bg.height;
            bg.y = Reg.BOUNDS.height - bg.height;
            bg.x = x;
            w = bg.width;
            x+= w;
            add(bg);

            var peoplex:Float = bg.x;
            var peoplew:Float = 0;
            var j:Int=1;
//            while(peoplex<(bg.x+bg.width))
//            {
//                var tribunapeople = AssetsManager.getInstance().getSprite(0,0,"bg_tribuna_people"+j);
//                tribunapeople.origin.y = tribunapeople.height;
//                tribunapeople.y = bg.y;
//                tribunapeople.x = peoplex;
//                peoplew = tribunapeople.width;
//                peoplex+=peoplew;
//                add(tribunapeople);
//                j++;
//                if(j>16){
//                    j=0;
//                }
//            }
        }
    }

    /*设置土地*/
    private function setTerrain():Void
    {
        var x:Float = 0;
        var w:Float = 0;
        while(x<FlxG.width){
            var terrain = AssetsManager.getInstance().getSprite(0,0,"terrain");
            terrain.x = x;
            terrain.y =Reg.BOUNDS.height;
            w = terrain.width;
            x+= w;
            add(terrain);
        }
    }

    /*设置草地*/
    private function setgrass():Void
    {
        var x:Float = 0;
        var w:Float = 0;
        while(x<FlxG.width){
            var grass = AssetsManager.getInstance().getSprite(0,0,"grass");
            grass.x = x;
            grass.y =Reg.BOUNDS.height-20;
            w= grass.width;
            x+= w;
            add(grass);
        }
    }

    /*创建漂浮的云*/
    private function cloudFly(add:Int=0):Void
    {
            var random = 1+Math.random()*4;
            var cloud = AssetsManager.getInstance().getSprite(0,0,"bg_mrak"+Math.floor(random));
            if(add==1){
                cloud.x = FlxG.width+50;
            }else{
                cloud.x = Math.random()*FlxG.width;
            }
            cloud.y = Math.random()*FlxG.height*0.2;
            cloud.ID = Math.round(random);
            this.add(cloud);
            _cloudarr.push(cloud);
            if(Math.round(random) == 1){
                cloud.velocity.x =Reg.cloudspeed1;
            }
            if(Math.round(random) == 2){
                cloud.velocity.x =Reg.cloudspeed2;
            }
            if(Math.round(random) == 3){
                cloud.velocity.x =Reg.cloudspeed3;
        }
        if(Math.round(random) == 4){
            cloud.velocity.x =Reg.cloudspeed4;
        }
        if(Math.round(random) == 5){
            cloud.velocity.x =Reg.cloudspeed5;
        }
    }


    /*移动云彩和创建云彩*/
    private function moveAndCreateCloud():Void{
        if(_cloudarr == null){
            _cloudarr = new Array<FlxSprite>();
        }
        var len = _cloudarr.length;
        for(i in 0...len){
            if(_cloudarr[i].x< -_cloudarr[i].width){
                _cloudarr.splice(i,1);
                cloudFly(1);
            }
        }
        if(len < 5){
            cloudFly(0);
        }
    }

    override public function update():Void
    {
        super.update();
        moveAndCreateCloud();
    }
}
