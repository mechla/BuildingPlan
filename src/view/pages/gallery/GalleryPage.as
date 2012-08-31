package view.pages.gallery
{
	import flash.display.DisplayObjectContainer;
	
	import model.ViewData;
	
	import view.Button;
	import view.ShowObject;
	import view.pages.BasePage;
	
	public class GalleryPage extends BasePage
	{
		private var _gallery_menu:GalleryMenu;
//		private var _bg:gradient_dark_bg = new gradient_dark_bg();
		private var _photo_view:PhotoView;
		
		private var _next_button:Button;
		private var _prev_button:Button;
		
		public function GalleryPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			//			_bg.y = 130;
			//			_bg.width =  ViewData.instance().stage_size.x;
			//			_bg.alpha = .9;
			////			addChild(_bg);
			
			_photo_view =  new PhotoView(_center_container,true);
			
			_photo_view.init();
			
			_gallery_menu =  new GalleryMenu(_center_container,true);
			_gallery_menu.init();
			_gallery_menu.scaleX = _gallery_menu.scaleY = .8;
			
			_next_button = new Button( new next_buttn());
			_next_button.addEventListeners(next);
			
			_right_container.addChild(_next_button);
			
			_prev_button =  new Button(new prev_button());
			_prev_button.addEventListeners(prev);
			_left_container.addChild(_prev_button); 
			
			resize();
			
			
		}
		private function next(e:*):void{
			_photo_view.next();
			
		}
		private function prev(e:*):void{
			_photo_view.prev();
			
		}
		public function showGallery(name:String):void{
			
		}
	}
}