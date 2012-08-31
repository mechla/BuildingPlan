package model.building
{
	public dynamic class RoomsCollection extends Array
	{
		public function RoomsCollection(...parameters)
		{
			super(parameters);
		}
		public function addRoom(a:Array):void{
			var room:RoomModel =  new RoomModel();
			room.setData(a);
			this.push(room);
				
		}
	}
}