package model.building
{
	public class RoomModel extends Object
	{
		private var _sould_out:Boolean;//a 0
		private var _floor:String;//b  1
		private var _room_number:String;//c 2
		private var _room_type:String;//d 3
		private var _room_style:String;//e 4
		private var _room_area:String;//f 5
		private var _room_baht_sqm:String;//g 6
		private var _unit_prise:String;//h 7
		private var _deposit:String;//i 8
		private var _contact:String; //j 9
		private var _x7:String;//k 10
		private var _time7:String;//l11
		private var _x1:String;//m12
		private var _time1:String;//n13
		private var _transfer:String;//o14
		private var _unit_discount:String;//p15
		private var _net_room_baht_sqm:String;//q16
		private var _net_unit_price:String;//r
		
		public function RoomModel()
		{
			super();
		}
		public function setData(a:Array):void{
			_sould_out = a[0]
			_floor = a[1];
			_room_number = a[2];
			_room_type = a[3];
			_room_style = a[4];
			_room_area = a[5];
			_room_baht_sqm = a[6];
			_unit_prise = a[7];
			_deposit = a[8];
			_contact = a[9];
			_x7 = a[10];
			_time7 = a[11];
			_x1 = a[12];
			_time1 = a[13];
			_transfer = a[14];
			_unit_discount = a[15];
			_net_room_baht_sqm = a[16];
			_net_unit_price = a[17];
		}

		public function get sould_out():Boolean
		{
			return _sould_out;
		}

		public function set sould_out(value:Boolean):void
		{
			_sould_out = value;
		}

		public function get floor():String
		{
			return _floor;
		}

		public function set floor(value:String):void
		{
			_floor = value;
		}

		public function get room():String
		{
			return _room_type;
		}

		public function set room(value:String):void
		{
			_room_type = value;
		}

		public function get type():String
		{
			return _room_number;
		}

		public function set type(value:String):void
		{
			_room_number = value;
		}

		public function get style():String
		{
			return _room_style;
		}

		public function set style(value:String):void
		{
			_room_style = value;
		}

		public function get area():String
		{
			return _room_area;
		}

		public function set area(value:String):void
		{
			_room_area = value;
		}

		public function get bath_per_square():String
		{
			return _room_baht_sqm;
		}

		public function set bath_per_square(value:String):void
		{
			_room_baht_sqm = value;
		}

		public function get unit_prise():String
		{
			return _unit_prise;
		}

		public function set unit_prise(value:String):void
		{
			_unit_prise = value;
		}

		public function get deposit():String
		{
			return _deposit;
		}

		public function set deposit(value:String):void
		{
			_deposit = value;
		}

		public function get contact():String
		{
			return _contact;
		}

		public function set contact(value:String):void
		{
			_contact = value;
		}

		public function get x7():String
		{
			return _x7;
		}

		public function set x7(value:String):void
		{
			_x7 = value;
		}

		public function get time7():String
		{
			return _time7;
		}

		public function set time7(value:String):void
		{
			_time7 = value;
		}

		public function get x1():String
		{
			return _x1;
		}

		public function set x1(value:String):void
		{
			_x1 = value;
		}

		public function get time1():String
		{
			return _time1;
		}

		public function set time1(value:String):void
		{
			_time1 = value;
		}

		public function get transfer():String
		{
			return _transfer;
		}

		public function set transfer(value:String):void
		{
			_transfer = value;
		}

		public function get unit_discount():String
		{
			return _unit_discount;
		}

		public function set unit_discount(value:String):void
		{
			_unit_discount = value;
		}

		public function get net_unit_price():String
		{
			return _net_unit_price;
		}

		public function set net_unit_price(value:String):void
		{
			_net_unit_price = value;
		}




	}
}