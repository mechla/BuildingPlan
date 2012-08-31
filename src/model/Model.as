package model
{
	import model.building.FloorsCollection;

	public class Model
	{
		private static var _instance:Model =  new Model();
		private  var _floors:FloorsCollection =  new FloorsCollection();
		
		public function Model()
		{
		}
		public static function instance():Model{
			return _instance;
		}

		public function get floors():FloorsCollection
		{
			return _floors;
		}

		public function set floors(value:FloorsCollection):void
		{
			_floors = value;
		}

	}
}