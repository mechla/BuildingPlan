package view
{
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import view.menu.BaseMenu;
	import view.menu.MainMenu;
	import view.pages.PagesController;
	
	public class View extends Sprite
	{
		private static var _instance:View =  new View();
		private var _menu:MainMenu
		private var _pages:PagesController;
		public function View()
		{
			super();
		}
		public static function instance():View
		{
			return _instance;
		}
		public function init():void{
			_menu =  new MainMenu(this);
			_menu.init()
			_pages =  new PagesController(this,true);
			_pages.init();
		}
		public function resize():void{
			_menu.resize();
			_pages.resize();
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
	}
}