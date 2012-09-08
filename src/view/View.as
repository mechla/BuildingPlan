package view
{
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import view.menu.BaseMenu;
	import view.menu.DownMenu;
	import view.menu.MainMenu;
	import view.pages.PagesController;
	
	public class View extends Sprite
	{
		private static var _instance:View =  new View();
		private var _menu:MainMenu
		private var _down_menu:DownMenu;
		private var _pages:PagesController;
		private var _bg:WebBackground;
		public function View()
		{
			super();
		}
		public static function instance():View
		{
			return _instance;
		}
		public function init():void{
			_bg =  new WebBackground(this,true);
			_bg.init();
			_menu =  new MainMenu(this);
			_menu.init();
			_down_menu =  new DownMenu(this,true);
			_down_menu.init();
			_pages =  new PagesController(this,true);
			_pages.init();
		}
		public function resize():void{
			_bg.resize();
			_menu.resize();
			_pages.resize();
			_down_menu.resize();
		}
		public function get menu():MainMenu
		{
			return _menu;
		}
		public function set menu(value:MainMenu):void
		{
			_menu = value;
		}
		public function get pages():PagesController
		{
			return _pages;
		}
		public function set pages(value:PagesController):void
		{
			_pages = value;
		}

		public function get bg():WebBackground
		{
			return _bg;
		}

		public function set bg(value:WebBackground):void
		{
			_bg = value;
		}

	}
}