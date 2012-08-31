package view.pages.main
{
	import flash.display.DisplayObjectContainer;
	
	import view.PhotoLoader;
	import view.ShowObject;
	import view.pages.BasePage;
	
	public class MainPage extends BasePage
	{
		private var _loader:preloader =  new preloader();
		public function MainPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			_loader.y =  0;
//			_loader.alpha = .5;
			_center_container.addChild(_loader);
			resize();
	
		}
		override public function show(...args):void{
			this.alpha = 1;
			_center_container.alpha = 1;
			addMe();

			
		}
	}
}