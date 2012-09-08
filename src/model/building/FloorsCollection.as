package model.building
{
	public dynamic class FloorsCollection extends Array
	{
		public function FloorsCollection(...parameters)
		{
			super(parameters);
		}
		public function addRoom(a:Array):Boolean{
			for each(var f:Object in this){
				if(f.floor == a[1]){
//					trace(f.floor,a[1]);
					f.rooms_collection.addRoom(a);
					return true;
				}
			}
			var floor:FloorModel =  new FloorModel();
			floor.floor = a[1];
			this.push(floor);
			floor.rooms_collection.addRoom(a);
			return false;
		}
	}
}