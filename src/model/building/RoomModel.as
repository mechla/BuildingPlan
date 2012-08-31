package model.building
{
	public class RoomModel extends Object
	{
		private var _sould_out:Boolean;
		private var _floor:String;
		private var _room:String;
		private var _type:String;
		private var _style:String;
		private var _area:String;
		private var _bath_per_square:String;
		private var _unit_prise:String;
		private var _deposit:String;
		private var _contact:String; //A10
		private var _x7:String;
		private var _time7:String;
		private var _x1:String;
		private var _time1:String;
		private var _transfer:String;
		private var _discount:String;//A16
//		private var _:String;
		
		public function RoomModel()
		{
			super();
		}
		public function setData(a:Array):void{
			_sould_out = a[0]
			_floor = a[1];
			_room = a[2];
			_type = a[3];
			_style = a[4];
			_area = a[5];
			_bath_per_square = a[6];
			_unit_prise = a[7];
			_deposit = a[8];
			_contact = a[9];
			_x7 = a[10];
			_time7 = a[11];
			_x1 = a[12];
			_time1 = a[13];
			_transfer = a[14];
			_discount = a[15];
//			_ = a[16];
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
			return _room;
		}

		public function set room(value:String):void
		{
			_room = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get style():String
		{
			return _style;
		}

		public function set style(value:String):void
		{
			_style = value;
		}

		public function get area():String
		{
			return _area;
		}

		public function set area(value:String):void
		{
			_area = value;
		}

		public function get bath_per_square():String
		{
			return _bath_per_square;
		}

		public function set bath_per_square(value:String):void
		{
			_bath_per_square = value;
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

		public function get discount():String
		{
			return _discount;
		}

		public function set discount(value:String):void
		{
			_discount = value;
		}


	}
}