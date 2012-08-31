package view.pages
{
	import flash.display.DisplayObjectContainer;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.navigateToURL;
	
	import model.Model;
	import model.ViewData;
	
	import view.ShowObject;
	import view.pages.building_floors.BuildingPage;
	import view.pages.building_floors.FloorPage;
	import view.pages.building_floors.RoomPage;
	import view.pages.contact.ContactPage;
	import view.pages.gallery.GalleryPage;
	import view.pages.main.MainPage;
	
	public class PagesController extends ShowObject
	{
		private var _main_page:MainPage;
		private var _gallery_page:GalleryPage;
		
		private var _building_page:BuildingPage;
		private var _floors_page:FloorPage;
		private var _room_page:RoomPage;
		
		private var _contact_page:ContactPage;
		private var _current_page:String = ViewData.instance().menu_data[1];
		public function PagesController(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			_main_page =  new MainPage(this,true);
			_main_page.init();
			
			_contact_page =  new ContactPage(this);
			_contact_page.init();
			
			_gallery_page =  new GalleryPage(this);
			_gallery_page.init();
			
			_building_page =  new BuildingPage(this);
			_building_page.init();
			
			_floors_page =  new FloorPage(this);
			_floors_page.init();
			
			_room_page =  new RoomPage(this);
			_room_page.init();
			
			
			
	
		}
		public function showPage(name:String):void{
//			if(_current_page != name){
				_current_page == name;
				hidePages();
				//			private var _menu_data:Array =  ["Building Plan","Floors","Room Type","Gallery","Contact"];
				switch (name){
					case ViewData.instance().menu_data[0]:
						_building_page.show();
						break;
					case ViewData.instance().menu_data[1]: //Contact
						_floors_page.show();
						break;
					case ViewData.instance().menu_data[2]: //Contact
						_room_page.show();
						break;
					case ViewData.instance().menu_data[3]:
						_gallery_page.show();
						break;
					case ViewData.instance().menu_data[4]: //Contact
						_contact_page.show();
						break;
					default:
						break;
					
					//			["Home","Room Plan","Room Type","Gallery","Contact"];
//				}
			}
		}
		public function updateDataFromExel():void{
			_floors_page.renderFloorsBuutons();
			_building_page.renderFloorsBuutons();
		}
		public function hidePages():void{
			_gallery_page.hide();
			_building_page.hide();
			_contact_page.hide();
			_floors_page.hide();
			_room_page.hide();
		}
		public function resize():void{
			_gallery_page.resize();
			_building_page.resize();
			_floors_page.resize();
			_room_page.resize();
			_contact_page.resize();
		}
		
		public function get gallery_page():GalleryPage
		{
			return _gallery_page;
		}
		
		public function set gallery_page(value:GalleryPage):void
		{
			_gallery_page = value;
		}
		
		public function get main_page():MainPage
		{
			return _main_page;
		}
		
		public function set main_page(value:MainPage):void
		{
			_main_page = value;
		}

		public function get building_page():BuildingPage
		{
			return _building_page;
		}

		public function set building_page(value:BuildingPage):void
		{
			_building_page = value;
		}

		public function get floors_page():FloorPage
		{
			return _floors_page;
		}

		public function set floors_page(value:FloorPage):void
		{
			_floors_page = value;
		}

		public function get room_page():RoomPage
		{
			return _room_page;
		}

		public function set room_page(value:RoomPage):void
		{
			_room_page = value;
		}
		
		
	}
}