package map;

import com.putaolab.soccer.charater.AIPlayer;
import com.putaolab.soccer.charater.AIPlayerLeft;
import com.putaolab.football.ui.state.StateBG;
import com.putaolab.soccer.charater.PlayerRight;
import com.putaolab.soccer.charater.PlayerLeft;
import flixel.FlxState;
import com.putaolab.soccer.wiget.Ball;
import com.putaolab.soccer.charater.Player;
import flixel.FlxBasic;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectGroup;
import flixel.addons.editors.tiled.TiledTile;
import flixel.addons.editors.tiled.TiledTileSet;
import flixel.addons.tile.FlxTilemapExt;
import flixel.addons.tile.FlxTileSpecial;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxRandom;
import flixel.util.FlxRect;
import flixel.util.FlxSort;

/**
 * ...
 * @author MrCdK
 */
class Level extends TiledMap
{
	private inline static var PATH_TILESETS = "assets/tiled/";
	
	public var backgroundGroup:FlxTypedGroup<FlxTilemapExt>;
	public var foregroundGroup:FlxTypedGroup<FlxTilemapExt>;
    public var comonBackgroundGroup:FlxTypedGroup<FlxBasic>;
    public var comonForegroundGroup:FlxTypedGroup<FlxBasic>;
	public var collisionGroup:FlxTypedGroup<FlxObject>;
    public var backDecorateGroup:FlxTypedGroup<FlxBasic>;
	public var characterGroup:FlxTypedGroup<FlxBasic>;
    public var decorateGroup:FlxTypedGroup<FlxBasic>;
	
	private var bounds:FlxRect;
    private var parentState:PlayState;

    private var _terrain_deep:Float = Reg.TEERAIN_DEEP;

//	public function new(level:Dynamic, animFile:Dynamic)
    public function new(level:Dynamic,parentState:PlayState)
    {
		super(level);
		
		// background and foreground groups
		backgroundGroup = new FlxTypedGroup<FlxTilemapExt>();
        comonBackgroundGroup = new FlxTypedGroup<FlxBasic>();
		foregroundGroup = new FlxTypedGroup<FlxTilemapExt>();
		// events and collision groups
        backDecorateGroup = new FlxTypedGroup<FlxBasic>();
		characterGroup = new FlxTypedGroup<FlxBasic>();
		collisionGroup = new FlxTypedGroup<FlxObject>();
        decorateGroup = new FlxTypedGroup<FlxBasic>();
        comonForegroundGroup = new FlxTypedGroup<FlxBasic>();

// The bound of the map for the camera
		bounds = Reg.BOUNDS;
        this.parentState = parentState;
		
		var tileset:TiledTileSet;
		var tilemap:FlxTilemapExt;
		var layer:TiledLayer;
		
		// Prepare the tile animations
//		var animations = TileAnims.getAnimations(animFile);
		
		for (layer in layers) {
			if (layer.properties.contains("tileset")) {
				tileset = this.getTileSet(layer.properties.get("tileset"));
			} else {
				throw "Each layer needs a tileset property with the tileset name";
			}
			
			if (tileset == null) {
				throw "The tileset is null";
			}
			
			tilemap = new FlxTilemapExt();
			// need to set the width and height in tiles because we are loading the map with an array
			tilemap.widthInTiles = layer.width;
			tilemap.heightInTiles = layer.height;
			
			tilemap.loadMap(
				layer.tileArray,						
				PATH_TILESETS + tileset.imageSource,	
				tileset.tileWidth,						// each tileset can have a different tile width or height
				tileset.tileHeight,
				FlxTilemap.OFF,							// disable auto map
				tileset.firstGID						// IMPORTANT! set the starting tile id to the first tile id of the tileset
			);
			
//			var specialTiles:Array<FlxTileSpecial> = new Array<FlxTileSpecial>();
//			var tile:TiledTile;
//			var animData;
//			var specialTile:FlxTileSpecial;
//			// For each tile in the layer
//			for (i in 0...layer.tiles.length) {
//				tile = layer.tiles[i];
//				if (tile != null && isSpecialTile(tile, animations)) {
//					specialTile = new FlxTileSpecial(tile.tilesetID, tile.isFlipHorizontally, tile.isFlipVertically, tile.rotate);
//					// add animations if exists
//					if (animations.exists(tile.tilesetID)) {
//						// Right now, a special tile only can have one animation.
//						animData = animations.get(tile.tilesetID)[0];
//						// add some speed randomization to the animation
//						var randomize:Float = FlxRandom.floatRanged( -animData.randomizeSpeed, animData.randomizeSpeed);
//						var speed:Float = animData.speed + randomize;
//
//						specialTile.addAnimation(animData.frames, speed, animData.framesData);
//					}
//					specialTiles[i] = specialTile;
//				} else {
//					specialTiles[i] = null;
//				}
//			}
//			// set the special tiles (flipped, rotated and/or animated tiles)
//			tilemap.setSpecialTiles(specialTiles);
			// set the alpha of the layer
			tilemap.alpha = layer.opacity;
			
			
			if (layer.properties.contains("fg")) {
				foregroundGroup.add(tilemap);
			} else {
				backgroundGroup.add(tilemap);
			}
		}
		
		loadObjects();
        initializeBackground();
        initializeCollisionLayer();
	}
	
	public function loadObjects() {
		for (group in objectGroups) {
			for (obj in group.objects) {
				loadObject(obj, group);
			}
		}
	}
    public function initializeGoal():Void{
        var leftGoal:FlxSprite = new FlxSprite();
        AssetsManager.getInstance().uploadTextureToSprite(leftGoal,"branka3");
        leftGoal.x = 195 - leftGoal.width;
        leftGoal.y = Reg.BOUNDS.height - Reg.GOAL_HEIGHT;

        var rightGoal:FlxSprite = new FlxSprite();
        rightGoal.makeGraphic(100,100,FlxColor.RED);
        AssetsManager.getInstance().uploadTextureToSprite(rightGoal,"branka3");
        rightGoal.flipX = true;
        rightGoal.x = FlxG.width - 195;
        rightGoal.y = Reg.BOUNDS.height - Reg.GOAL_HEIGHT;
//
//trace("left_____________");
//        trace(leftGoal.x);
//        trace(leftGoal.y);
//        trace(leftGoal.width);
//        trace(leftGoal.height);
//        trace("right_____________");
//        trace(rightGoal.x);
//        trace(rightGoal.y);
//        trace(rightGoal.width);
//        trace(rightGoal.height);

        comonForegroundGroup.add(leftGoal);
        comonForegroundGroup.add(rightGoal);

        parentState.goalLeft = leftGoal;
        parentState.goalRight = rightGoal;
    }
    public function initializeBackground():Void{
        comonBackgroundGroup.add(new StateBG());
        //ground
        var x:Float = 0;
        var w:Float = 0;
        while(x < FlxG.width){
            var terrain:FlxSprite = new FlxSprite();
            AssetsManager.getInstance().uploadTextureToSprite(terrain,"terrain");
            terrain.y = Reg.BOUNDS.height;
            terrain.x = x;
            w = terrain.width;

            x += w;
            comonBackgroundGroup.add(terrain);
        }
        x = 0;
        w = 0;

        //grass
        while(x < FlxG.width){
            var grass:FlxSprite = new FlxSprite();
            AssetsManager.getInstance().uploadTextureToSprite(grass,"grass");
            grass.y = Reg.BOUNDS.height-20;
            grass.x = x;
            w = grass.width;
            x += w;
            comonBackgroundGroup.add(grass);
        }

        initializeGoal();
    }
    public function initializeCollisionLayer():Void{
        //BOTTOM
        var flloor:FlxObject = new FlxObject(0, Reg.BOUNDS.height,FlxG.width, 100);
        flloor.solid = flloor.immovable = true;
        collisionGroup.add(flloor);
        //goal post collision
        var goalPostWidth:Int = cast(Reg.GOAL_WIDTH,Int);
        var goalPostHeight:Int= 10;
        var leftPost:FlxObject = new FlxObject(117, Reg.BOUNDS.height-Reg.GOAL_HEIGHT,goalPostWidth, goalPostHeight);
        leftPost.solid = leftPost.immovable = true;
        collisionGroup.add(leftPost);
        var rightPost:FlxObject = new FlxObject(1087, Reg.BOUNDS.height-Reg.GOAL_HEIGHT,goalPostWidth,goalPostHeight);
        rightPost.solid = rightPost.immovable = true;
        collisionGroup.add(rightPost);


//        var leftPost:FlxSprite = new FlxSprite(117, Reg.BOUNDS.height-Reg.GOAL_HEIGHT);
//        leftPost.makeGraphic(goalPostWidth, goalPostHeight,FlxColor.RED);
//        leftPost.solid = leftPost.immovable = true;
//        collisionGroup.add(leftPost);
//        var rightPost:FlxSprite = new FlxSprite(1087, Reg.BOUNDS.height-Reg.GOAL_HEIGHT);
//        rightPost.makeGraphic(goalPostWidth, goalPostHeight,FlxColor.RED);
//        rightPost.solid = rightPost.immovable = true;
//        collisionGroup.add(rightPost);



    }
	
	private function loadObject(o:TiledObject, g:TiledObjectGroup) {
		var x:Int = o.x;
		var y:Int = o.y;
		
		switch(o.type.toLowerCase()) {
//			case "playerright":
//				var player:Player = new PlayerRight(x, y,backDecorateGroup);
//                player.y = Reg.BOUNDS.height - 286;
//				player.setBoundsMap(this.getBounds());
//				player.controllable = true;
//                parentState.playerRight = player;
//				characterGroup.add(player);
//            case "playerleft":
//                var player:AIPlayer = new AIPlayerLeft(x, y,backDecorateGroup);
//                player.y = Reg.BOUNDS.height-286;
//				player.setBoundsMap(this.getBounds());
//				player.controllable = false;
//                parentState.playerLeft = player;
//                characterGroup.add(player);
				
//			case "ball":
//                var ball:Ball = new Ball(x, y);
//                ball.x = (FlxG.width - ball.width)/2;
//                ball.y = Reg.BOUNDS.height - ball.height;
//                ball.velocity.y = 1500;
//                ball.setBoundsMap(this.getBounds());
//                parentState.ball = ball;
//                characterGroup.add(ball);
//
			case "collision":
				var coll:FlxObject = new FlxObject(x, y, o.width, o.height);
                coll.elasticity = 1;
				coll.immovable = true;
				collisionGroup.add(coll);
//                var s = new FlxSprite(x, y);
//                s.immovable = true;
//                s.makeGraphic(o.width, o.height,FlxColor.BLUE);
//                collisionGroup.add(s);

		}
	}
	
	public function update():Void {
		updateCollisions();
		updateEventsOrder();
	}
	
	public function updateEventsOrder():Void {
		//characterGroup.sort(FlxSort.byY);
	}
	
	public function updateCollisions():Void {
		FlxG.collide(characterGroup, collisionGroup);

    //左,球员后退时，如果球在地上，则不碰撞，方便player退到球的后方踢球。与右边的球员对应。
        if(parentState.playerLeft.x > parentState.ball.x && parentState.ball.y > Reg.BOUNDS.height - parentState.ball.height*1.5){

        }else{
            FlxG.collide(parentState.playerLeft, parentState.ball);
        }

    //右
        if(parentState.playerRight.x < parentState.ball.x && parentState.ball.y > Reg.BOUNDS.height - parentState.ball.height*1.5){

        }else{
            FlxG.collide(parentState.playerRight, parentState.ball);
        }

	}
	
	public function getBounds():FlxRect 
	{
		return bounds;
	}
	
	private inline function isSpecialTile(tile:TiledTile, animations:Dynamic):Bool {
		return (tile.isFlipHorizontally || tile.isFlipVertically || tile.rotate != FlxTileSpecial.ROTATE_0 || animations.exists(tile.tilesetID));
	}
}