package model
{
	import flash.geom.Point;
	
	public class ViewData
	{
		private static var _instance:ViewData = new ViewData();
		private var _menu_data:Array =  ["BUILDING","FLOORS PLAN","ROOMS TYPES","GALLERY","CONTACT"];
		private var _gallery_data:Array = ["Photo Progress","Showroom","Facilities","Animation"];
		private var _stage_size:Point;
		private var _min_size:Point =  new Point(1100,700);
		private var _menu_height:int = 100;
		
		private var _exel_loader:EXELoader;
		
		public function ViewData()
		{
		}
		public function getExelData():void{
			_exel_loader =  new EXELoader();
		}
		public static function instance():ViewData
		{
			return _instance;
		}
		
		public function get menu_data():Array
		{
			return _menu_data;
		}
		
		public function set menu_data(value:Array):void
		{
			_menu_data = value;
		}
		
		public function get stage_size():Point
		{
			return _stage_size;
		}
		
		public function set stage_size(value:Point):void
		{
			if(value.x < _min_size.x)
				value.x = _min_size.x
			_stage_size = value;
		}
		
		public function get gallery_data():Array
		{
			return _gallery_data;
		}
		
		public function set gallery_data(value:Array):void
		{
			_gallery_data = value;
		}
		
		public function get min_size():Point
		{
			return _min_size;
		}
		
		public function set min_size(value:Point):void
		{
			_min_size = value;
		}
		
		public function get menu_height():int
		{
			return _menu_height;
		}
		
		
	}
}