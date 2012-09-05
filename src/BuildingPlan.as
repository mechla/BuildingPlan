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
	
	[SWF(backgroundColor="#000000")]
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
			if(ViewData.instance().stage_size.x > ViewData.instance().min_size.x || ViewData.instance().stage_size.y > ViewData.instance().min_size.y){
				View.instance().resize();
			}
		}
		private function addBG():void{
//			_bg.setUrl("assets/BG/Bangkok_Night-ccbysa-BenhLieuSong-l.jpg");
			_bg.setUrl("assets/BG/5.jpg");
			_bg.loadPhoto(setSizePhoto);
			_bg.filters = [new BlurFilter()];
			addChild(_bg);
		}
		private function setSizePhoto():void{
			_bg_size =  new Point(_bg.width,_bg.height);
			resizeBg();
			
		}
		private function tweenBg():void{
			_bg.x = 0;
			TweenLite.to(_bg,30,{x:-_bg.width+ViewData.instance().stage_size.x, delay:.2,ease:Sine.easeInOut, onComplete:tweenBgBack});
		}
		private function tweenBgBack():void{
			TweenLite.to(_bg,30,{x:0, delay:.2,ease:Sine.easeInOut,  onComplete:tweenBg});
		}
		private function resizeBg():void{
			
			
			var scale_bg:Number = Math.max(stage.stageWidth/_bg_size.x, stage.stageHeight/_bg_size.y);
//			var scale_bg:Number = stage.stageHeight/_bg_size.y;
			_bg.scaleX = _bg.scaleY = scale_bg;
//			tweenBg();
			trace(scale_bg);
			
			
		}
		
		
	}
}