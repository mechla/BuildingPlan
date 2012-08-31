package view.menu
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	
	import view.PhotoLoader;
	
	public class MainMenu extends BaseMenu
	{
		protected var _logo:PhotoLoader =  new PhotoLoader();
//		protected var _bg:menu_black_strip =  new menu_black_strip();
		protected var _bg:menu_bg = new menu_bg();
		public function MainMenu(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		override public function init():void{
//			_bg.filters = [new GlowFilter(0x000000,.8,10,10,5)];
			addChild(_bg);
			super.init();
			addLogo();
//			_bg.width =  this.width;
		}
		private function addLogo():void{
			_logo.setUrl("assets/logo2.jpg");
			_logo.loadPhoto();
			_logo.x = _position_x+10;
			_logo.y = -50;
			_logo.scaleX = _logo.scaleY = .4;
//			addChild(_logo);
			resize();
		}
		
		
	}
}