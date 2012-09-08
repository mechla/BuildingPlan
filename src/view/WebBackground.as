package view
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Sine;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import model.ViewData;
	
	
	public class WebBackground extends ShowObject
	{
		//		private var _bg_container:Sprite = new Sprite();
		private var _bg:PhotoLoader = new PhotoLoader();
		private var _bg_size:Point;
		private var _bg_mask:Sprite =  new Sprite();
		private var _index:int =0;
		private var _bg_button:Button =  new Button(new background_button());
		public function WebBackground(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			_bg.setUrl("assets/BG/"+_index.toString()+".jpg");
			_bg.loadPhoto(setSizePhoto);
			//			_bg.filters = [new BlurFilter()];
//			createMask();
			addChild(_bg);
			addChild(_bg_button);
			
		}
		public function changeBg(...args):void{
			_bg_button.removeEventListeners(changeBg);
			_index++;
			if(_index>9)_index=0;
			_bg.setUrl("assets/BG/"+_index.toString()+".jpg");
			_bg.loadPhoto(setSizePhoto);
		}
		public function changePhoto(index:int):void{
			_bg_button.removeEventListeners(changeBg);
			_index=index;
			if(_index>9)_index=0;
			_bg.setUrl("assets/BG/"+_index.toString()+".jpg");
			_bg.loadPhoto(setSizePhoto);
			
		}
		private function createMask():void{
			_bg_mask.graphics.beginFill(0x00);
			_bg_mask.graphics.drawRect(0,0,ViewData.instance().stage_size.x,ViewData.instance().stage_size.y);
			_bg_mask.graphics.endFill();
			_bg.addChild(_bg_mask);
			_bg.mask = _bg_mask;
		}
		private function setSizePhoto():void{
//			_bg.bitmap.applyFilter(_bg.bitmap,new Rectangle(0,0,800,100),_bg.bitmap.rect.topLeft,new BlurFilter(10,10));
//			bmd.applyFilter(bmd,new Rectangle(0,0,bmd.width/2,bmd.height),bmd.rect.topLeft,new BlurFilter(10,10));
			_bg.alpha = 0;
			_bg.scaleX= _bg.scaleY =  1;
			_bg_size =  new Point(_bg.width,_bg.height);
			trace(_bg_size.x, _bg_size.y);
			resize();
			_bg.alpha = 1;
			_bg_button.addEventListeners(changeBg);
			
		}
		private function tweenBg():void{
			_bg.x = 0;
			TweenLite.to(_bg,30,{x:-_bg.width+ViewData.instance().stage_size.x, delay:.2,ease:Sine.easeInOut, onComplete:tweenBgBack});
		}
		private function tweenBgBack():void{
			TweenLite.to(_bg,30,{x:0, delay:.2,ease:Sine.easeInOut,  onComplete:tweenBg});
		}
		public function resize():void{
			_bg_button.x = ViewData.instance().stage_size.x;
			
			var scale_bg:Number = Math.max(stage.stageWidth/_bg_size.x, stage.stageHeight/_bg_size.y);
			_bg.scaleX = _bg.scaleY = scale_bg;
			trace(scale_bg);
			
			
		}
	}
}