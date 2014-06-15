package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;

/**
 * ...
 * @author Samir Sabri
 */

class Main extends Sprite 
{
	var inited:Bool;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
		
		var arabic_reshaper:DecomposedWord = new DecomposedWord("", true);
		ArabicReshaper.init();

		var reshaped_text:String = arabic_reshaper.reshape('الحمد لله رب العالمين');
		
		
		
		trace (reshaped_text.split(""));
		
		var field:TextField = new TextField();
		field.embedFonts = true;
		
		var name_of_your_crazy_font:String = Assets.getFont("fonts/trado.ttf").fontName;
		
		
		
		
		
		field.defaultTextFormat = new TextFormat(name_of_your_crazy_font, 50, 0xff0000);
		//field.border = true;
		field.text = reshaped_text;
		field.defaultTextFormat = new TextFormat(name_of_your_crazy_font, 50, 0xff0000);
		field.width = 1000;
		//field.selectable = false;
		addChild(field);
		
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
		
		
		
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
