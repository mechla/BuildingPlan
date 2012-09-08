package view.menu
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	
	import view.PhotoLoader;
	
	public class MainMenu extends BaseMenu
	{
		protected var _logo:PhotoLoader =  new PhotoLoader();
		public function MainMenu(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		override public function init():void{
			addBg();
			super.init();
			resize();
		}
	}
}