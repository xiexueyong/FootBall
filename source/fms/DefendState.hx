package fms;

class DefendState extends BaseState{


    public function new()
    {


    }

    public function enter():Void{
        trace("进入进攻状态");
    }
    public function excute():Void{


    }
    public function exit():Void{
        trace("退出进攻状态");

    }


}
