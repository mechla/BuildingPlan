package view.menu
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import model.ViewData;
	
	import view.ShowObject;
	
	public class DownMenu extends ShowObject
	{
		private var _bg:Sprite =  new Sprite();
		private var _menu:down_menu =  new down_menu();
		public function DownMenu(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			createBg();
			resize();
		}
		private function createBg():void{
			_bg.graphics.beginFill(ViewData.instance().bg_color,ViewData.instance().bg_alpha);
			_bg.graphics.drawRect(0,0,15,15);
			_bg.graphics.endFill();
			addChild(_bg);
			addChild(_menu);
		}
		public function resize():void{
			_bg.width =  ViewData.instance().stage_size.x;
			_bg.y = ViewData.instance().stage_size.y - _bg.height;
			_menu.y = ViewData.instance().stage_size.y;
			_menu.x = ViewData.instance().stage_size.x;
		}
	}
}