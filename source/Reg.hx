package;

import flixel.FlxG;
import flixel.util.FlxRect;
import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];

    //球的重力加速度
    public static var BALL_GRAVITY:Int = 1600;
    //球的阻力
    public static var BALL_DRAG:Int = 50;
    //球的弹性
    public static var BALL_ELASTICITY:Float = 0.6;//0.6
    //球的飞行总速度
    public static var BALL_KICKEDVELOCITY:Int = 1250;
    //球自旋速度
    public static var BALL_ANGULARVELOCITY:Int = 360;
    //正常情况下，球的最大飞行角度，角度与距离球的距离有关
    public static var BALL_MAKANGLE:Int = 35;
    //按住后退键，球的飞行角度增加量
    public static var BALL_ADDEDANGLE:Int = 30;
    //踢球的有效范围
    public static var BALL_EFFECTIVEDISTANCE:Int = 100;

//球员的重力加速度
    public static var PLAYER_GRAVITY:Int = 2200;//2000
//球员的阻力
    public static var PLAYER_DRAG:Int = 1500;
//球员的质量
    public static var PLAYER_MASS:Int = 3;
//球员的弹性
    public static var  PLAYER_ELASTICITY:Float =0;//0.6
    //球员跑动的最大速度
    public static var  PLAYER_MAXVELOCITY:Float = 300;
    //球员跑动加速度
    public static var  PLAYER_RUN_ACCELERATION:Float = 1000;
    public static var  PLAYER_JUMP_VELOCITY:Float = 520;

    //地面的深度
    public static var  TEERAIN_DEEP:Float = 120;
    public static var  GOAL_HEIGHT:Float = 204;
    public static var  GOAL_WIDTH:Float = 76;
    public static var BOUNDS:FlxRect = null;



    //不同云彩漂浮的速度
    public static var cloudspeed1=-21;
    public static var cloudspeed2=-24;
    public static var cloudspeed3=-20;
    public static var cloudspeed4=-30;
    public static var cloudspeed5=-30;
    //排位赛进行到那一阶段
    public static var sixtween:Int = 16;
    public static var eight:Int = 8;
    public static var four:Int = 4;
    public static var two:Int = 2;
}