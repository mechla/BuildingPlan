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
		
		protected var _black_bg:Sprite = new Sprite();
		protected var _content:Sprite = new Sprite();
		
		public function BasePage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
			createBg();
			addChild(_center_container);
			addChild(_left_container);
			addChild(_right_container);
			_content.alpha = 0;
			_center_container.addChild(_content);
		}
		protected function createBg():void{
			_black_bg.graphics.beginFill(ViewData.instance().bg_color,ViewData.instance().bg_alpha);
			_black_bg.graphics.drawRect(0,0,950,560);
			_black_bg.graphics.endFill();
			_center_container.addChild(_black_bg);
		}
		public function addToCenter(sprite:Sprite):void{
			_content.addChild(sprite);
			_content.x = _black_bg.width/2 - _content.width/2;
			_content.y = _black_bg.height/2 - _content.height/2;
		}
		protected function create_center_mask(width:Number,height:Number):void{
			_center_container_mask.graphics.beginFill(0x00000);
			_center_container_mask.graphics.drawRect(0,0,950,560);
			_center_container_mask.graphics.endFill();
			_center_container.addChild(_center_container_mask);
			_center_container.mask = _center_container_mask;
		}
		public function  resize():void{
//			trace(ViewData.instance().stage_size.x/2,_center_container.width/2);
			_center_container.x = ViewData.instance().stage_size.x/2- _center_container.width/2;
			_center_container.y = ViewData.instance().stage_size.y/2 - _center_container.height/2+30;
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
			TweenLite.to(_left_container,.5,{x:0,delay:.4});
			TweenLite.to(_right_container,.5,{x:ViewData.instance().stage_size.x,delay:.3});
			showBg();
			
			
		}
		public function showCenter():void{
			TweenLite.to(_content,.3,{alpha:1});
		}
		override public function hide(...params):void{
			TweenLite.to(_left_container,.45,{x:-_left_container.width});
			TweenLite.to(_right_container,.35,{x:ViewData.instance().stage_size.x+_right_container.width,delay:.2});
			TweenLite.to(_content,.25,{alpha:0,onComplete:hideBg});
		}
		protected function showBg():void{
			_black_bg.scaleX = 1;
			_black_bg.scaleY = 1;
			_black_bg.alpha = 0;
			TweenLite.to(_black_bg,.4,{alpha:1,onComplete:showCenter});
		}
		protected function hideBg():void{
			TweenLite.to(_black_bg,.25,{alpha:0,onComplete:removeMe});
			
		}
	}
}