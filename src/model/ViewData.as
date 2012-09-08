package model
{
	import flash.geom.Point;
	
	public class ViewData
	{
		private static var _instance:ViewData = new ViewData();
		private var _menu_data:Array =  ["Building","Floors View","Rooms Types","Gallery","Contact"];
		private var _gallery_data:Array = ["Photo Progress","Showroom","Facilities","Animation"];
		private var _stage_size:Point;
		private var _min_size:Point =  new Point(1100,680);
		private var _menu_height:int = 100;
		
		private var _exel_loader:EXELoader;
		
		private var _bg_alpha:Number = .75;
		private var _bg_color:int = 0x000000;
		
		private var _tween_time:Number = 1;
		private var _delay_time:Number = 1;
		
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
				value.x = _min_size.x;
			if(value.y < _min_size.y)
				value.y = _min_size.y;
					
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

		public function get bg_alpha():Number
		{
			return _bg_alpha;
		}

		public function set bg_alpha(value:Number):void
		{
			_bg_alpha = value;
		}

		public function get bg_color():int
		{
			return _bg_color;
		}

		public function set bg_color(value:int):void
		{
			_bg_color = value;
		}

		public function get tween_time():Number
		{
			return _tween_time;
		}

		public function set tween_time(value:Number):void
		{
			_tween_time = value;
		}

		public function get delay_time():Number
		{
			return _delay_time;
		}

		public function set delay_time(value:Number):void
		{
			_delay_time = value;
		}
		
		
	}
}