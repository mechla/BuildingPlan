package model.building
{
	public class FloorModel extends Object
	{
		private var _floor:String = "0";
		private var _rooms_collection:RoomsCollection =  new RoomsCollection();;
		public function FloorModel()
		{
			super();
		}

		public function get floor():String
		{
			return _floor;
		}

		public function set floor(value:String):void
		{
			_floor = value;
		}

		public function get rooms_collection():RoomsCollection
		{
			return _rooms_collection;
		}

		public function set rooms_collection(value:RoomsCollection):void
		{
			_rooms_collection = value;
		}


	}
}