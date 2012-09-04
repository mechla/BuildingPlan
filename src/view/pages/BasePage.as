package view.pages
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import model.ViewData;
	
	import view.ShowObject;
	
	public class BasePage extends ShowObject
	{
		protected var _left_container:Sprite =  new Sprite();
		protected var _center_container:Sprite =  new Sprite();
		protected var _right_container:Sprite =  new Sprite();
		
		protected var _center_container_mask:Sprite =  new Sprite();
		
		public function BasePage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
			addChild(_center_container);
			addChild(_left_container);
			addChild(_right_container);
		}
		protected function create_center_mask(width:Number,height:Number):void{
			_center_container_mask.graphics.beginFill(0x00000);
			_center_container_mask.graphics.drawRect(0,0,width,height);
			_center_container_mask.graphics.endFill();
			_center_container.addChild(_center_container_mask);
			_center_container.mask = _center_container_mask;
		}
		public function  resize():void{
			trace(ViewData.instance().stage_size.x/2,_center_container.width/2);
			_center_container.x = ViewData.instance().stage_size.x/2- _center_container.width/2;
			_center_container.y = ViewData.instance().stage_size.y/2 - _center_container.height/2+50;
			_left_container.y = ViewData.instance().stage_size.y/2 - _left_container.height/2;
			_left_container.x = 0;
			_right_container.x = ViewData.instance().stage_size.x;
			_right_container.y = ViewData.instance().stage_size.y/2 - _right_container.height/2;
		}
		override public function show(...args):void{
			this.alpha = 1;
			_left_container.x = -_left_container.width;
			_right_container.x = ViewData.instance().stage_size.x+_right_container.width;
			
			addMe();
			TweenLite.to(_left_container,1,{x:0,delay:.6});
			
			TweenLite.to(_right_container,1,{x:ViewData.instance().stage_size.x,delay:.3});
			showCenter();
			
		}
		override public function hide(...params):void{
			TweenLite.to(_left_container,.5,{x:-_left_container.width,onComplete:removeMe});
			TweenLite.to(_right_container,.5,{x:ViewData.instance().stage_size.x+_right_container.width,delay:.3});
			hideCenter();
		}
		protected function showCenter():void{
			_center_container.alpha = 0;
			TweenLite.to(_center_container,1,{alpha:1,delay:1});
		}
		protected function hideCenter():void{
			TweenLite.to(_center_container,.5,{alpha:0});
			
		}
	}
}