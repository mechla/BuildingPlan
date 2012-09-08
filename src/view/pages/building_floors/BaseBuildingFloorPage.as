package view.pages.building_floors
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import model.Model;
	import model.ViewData;
	import model.building.FloorModel;
	import model.building.RoomModel;
	import model.building.RoomsCollection;
	
	import view.pages.BasePage;
	
	public class BaseBuildingFloorPage extends BasePage
	{
		protected var _rooms_buttons:Sprite =  new Sprite();
		private var _rooms_bg:room_list_bg =  new room_list_bg();
		
		protected var _rooms:RoomsCollection
		protected var _room_id:int;
		
		public function BaseBuildingFloorPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			create_center_mask(_center_container.width,_center_container.height);
		}
		//FLORS
		public function renderFloorsBuutons():void{
			var floors_text:floors_list =  new floors_list();
			_left_container.addChild(floors_text)
			for(var i:int = 1; i<Model.instance().floors.length;i++){
				var floor:floor_button =  new floor_button();
				floor.numbre_of_floor.text = (Model.instance().floors[i] as FloorModel).floor;
				floor.gotoAndStop(1);
				floor.y = 50 + (i-1)*50;
				floor.x = 35;
				floor.alpha = 0;
				_left_container.addChild(floor);
				floor.name = i.toString();
				floor.mouseChildren = false;
				floor.addEventListener(MouseEvent.CLICK,showFloor);
				floor.addEventListener(MouseEvent.MOUSE_OVER,floorButtonOver);
				floor.addEventListener(MouseEvent.MOUSE_OUT,floorButtonOut);
				TweenLite.to(floor,.5,{alpha:1,delay:.3*i});
			}
			resize();
		}
		protected function floorButtonOut(e:MouseEvent):void{
			e.target.alpha = 1;
		}
		protected function floorButtonOver(e:MouseEvent):void{
			e.target.aplha = .3;
		}
		protected function showFloor(e:MouseEvent):void{
			e.target.gotoAndStop(1);
		}
		//ROOMS
		protected function addRooms():void{
			_right_container.addChild(_rooms_bg);
			_right_container.addChild(_rooms_buttons);
		}
		public function renderRooms(rooms:RoomsCollection):void{
			_rooms = rooms;
			
			while(_rooms_buttons.numChildren>0)
				_rooms_buttons.removeChildAt(0);
			var index_y:int = 0;
			var index_x:int = 0;
			for(var i:int = 1; i<rooms.length;i++){
				var room:floor_button =  new floor_button();
				room.numbre_of_floor.text = (rooms[i] as RoomModel).type;
				room.y = 45+index_y*30;
				room.x = -90 +(35*index_x);
				room.scaleX = room.scaleY = .6;
				room.gotoAndStop(1);
				room.alpha = 0;
				_rooms_buttons.addChild(room);
				room.name = i.toString();
				room.mouseChildren =  false;
				room.addEventListener(MouseEvent.CLICK,showRoom);
				room.addEventListener(MouseEvent.MOUSE_OVER,buttonRoomOver);
				room.addEventListener(MouseEvent.MOUSE_OUT,buttonRoomOut);
				index_y++;
				if(index_y ==12){
					index_y = 0;
					index_x ++;
				}
				TweenLite.to(room,.2,{alpha:1,delay:.05*i});
			}
			resize();
		}
		protected function buttonRoomOver(e:MouseEvent):void{
			
		}
		protected function buttonRoomOut(e:MouseEvent):void{
			
		}
		protected function showRoom(e:MouseEvent):void{
			e.target.gotoAndStop(2);
		}
		override public function show(...args):void{
			TweenLite.delayedCall(1.3,super.show);
		}
		override protected function showBg():void{
			_black_bg.y = 0;
			_black_bg.x = 0;
			if(Math.random()>.5){
				_black_bg.scaleX = 1;
				_black_bg.scaleY = 0;
				if(Math.random()>.5){
					_black_bg.y = 560;
				}
			}
			else{
				_black_bg.scaleX = 0;
				_black_bg.scaleY = 1;
				if(Math.random()>.5){
					_black_bg.x = 950;
				}
			}
			TweenLite.to(_black_bg,.4,{scaleY:1,scaleX:1,x:0,y:0,onComplete:super.showCenter});
		}
		override protected function hideBg():void{
			var posx:int = 0;
			var posy:int = 0;
			if(Math.random()>.5){
				if(Math.random()>.5)
					posy = 560;
				TweenLite.to(_black_bg,.45,{scaleY:0,x:posx,y:posy,onComplete:removeMe});
			}
			else{
				if(Math.random()>.5)
					posx = 950;
				TweenLite.to(_black_bg,.45,{scaleX:0,x:posx,y:posy,onComplete:removeMe});
			}
		}
		
	}
}