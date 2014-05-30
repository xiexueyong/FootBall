package com.putaolab.football.footballer;
import component.PTFlxBaseListItem;

/**
 * User: gaoyun
 * Date: 14-5-27
 * Time: 下午4:44
 * description：
 */
class FootBallerItem  extends PTFlxBaseListItem{
    public function new() {
        super();
    }

    public function init():Void{
        var sp = AssetsManager.getInstance().getSprite(0,0,datas);
        add(sp);
    }
}
