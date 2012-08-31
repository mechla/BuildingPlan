package view.pages.gallery
{
	import model.ViewData;
	
	import flash.display.DisplayObjectContainer;
	
	import view.menu.BaseMenu;
	
	public class GalleryMenu extends BaseMenu
	{
		public function GalleryMenu(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		override public function init():void{
			this.y = -60;
			_buttons = ViewData.instance().gallery_data;
			super.init();
			
		}
	
	}
}