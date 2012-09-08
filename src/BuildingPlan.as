package
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Sine;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	
	import model.ViewData;
	
	import view.PhotoLoader;
	import view.View;

//	[SWF(width='1100', height='800',frameRate='25')]
	
	[SWF(backgroundColor="#000000",frameRate='60')]
	public class BuildingPlan extends Sprite
	{

		public function BuildingPlan()
		{
			stage.align = StageAlign.TOP_LEFT;
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void{
			ViewData.instance().stage_size =  new Point( stage.stageWidth, stage.stageHeight);
			ViewData.instance().getExelData();
			View.instance().init();
			addChild(View.instance());
			stage.addEventListener(Event.RESIZE,onResize);
		}
		private function onResize(e:Event):void{
			ViewData.instance().stage_size =  new Point( stage.stageWidth, stage.stageHeight);
			if(ViewData.instance().stage_size.x > ViewData.instance().min_size.x || ViewData.instance().stage_size.y > ViewData.instance().min_size.y){
				View.instance().resize();
			}
		}

		
		
	}
}