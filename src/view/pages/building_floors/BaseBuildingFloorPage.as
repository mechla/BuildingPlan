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
//			_rooms  = ;
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
				_left_container.addChild(floor);
				floor.name = i.toString();
				floor.mouseChildren = false;
				floor.addEventListener(MouseEvent.CLICK,showFloor);
				floor.addEventListener(MouseEvent.MOUSE_OVER,floorButtonOver);
				floor.addEventListener(MouseEvent.MOUSE_OUT,floorButtonOut);
			}
			resize();
			
		}
		protected function floorButtonOut(e:MouseEvent):void{
//			e.target.alpha = 1;
			
			
		}
		protected function floorButtonOver(e:MouseEvent):void{
//			e.target.aplha = .3;
			
			
		}
		protected function showFloor(e:MouseEvent):void{
			e.target.gotoAndStop(1);
//			if(!_tween){
//				_tween = true
//				TweenLite.to(_changing_content,.5,{alpha:0, onComplete:changeFloorData,onCompleteParams:[int(e.target.name)]});
//			}
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
				room.y = 75+index_y*30;
				room.x = -110 +(35*index_x);
				room.scaleX = room.scaleY = .6;
				room.gotoAndStop(1);
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
		override protected function showCenter():void{
			_center_container_mask.y = 0;
			_center_container_mask.scaleY = 0;
			TweenLite.to(_center_container_mask,1,{scaleY:1,delay:1});
		}
		override protected function hideCenter():void{
			TweenLite.to(_center_container_mask,.5,{scaleY:0});
			
		}
		
		//SHOW HIDE RESIZE
	
	}
}