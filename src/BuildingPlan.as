package
{
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
	public class BuildingPlan extends Sprite
	{
		private var _bg:PhotoLoader = new PhotoLoader();
		private var _bg_size:Point;
		public function BuildingPlan()
		{
			stage.align = StageAlign.TOP_LEFT;
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void{
			addBG();
			ViewData.instance().stage_size =  new Point( stage.stageWidth, stage.stageHeight);
			ViewData.instance().getExelData();
			View.instance().init();
			addChild(View.instance());
			stage.addEventListener(Event.RESIZE,onResize);
		}
		private function onResize(e:Event):void{
			resizeBg();
			ViewData.instance().stage_size =  new Point( stage.stageWidth, stage.stageHeight);
			if(ViewData.instance().stage_size.x > ViewData.instance().min_size.x && ViewData.instance().stage_size.y > ViewData.instance().min_size.y){
				View.instance().resize();
			}
		}
		private function addBG():void{
//			_bg.setUrl("assets/BG/Bangkok_Night-ccbysa-BenhLieuSong-l.jpg");
			_bg.setUrl("assets/BG/bangkok2.jpg");
			_bg.loadPhoto(setSIzePhoto);
			_bg.filters = [new BlurFilter()];
			addChild(_bg);
		}
		private function setSIzePhoto():void{
			_bg_size =  new Point(_bg.width,_bg.height);
			resizeBg();
			
		}
		private function resizeBg():void{
			
			
			var scale_bg:Number = Math.max(stage.stageWidth/_bg_size.x, stage.stageHeight/_bg_size.y);
			_bg.scaleX = _bg.scaleY = scale_bg;
			trace(scale_bg);
			
		}
		
		
	}
}