package view.pages.building_floors
{
	import com.google.maps.View;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	import model.Model;
	import model.building.FloorModel;
	import model.building.RoomsCollection;
	
	import view.View;
	
	public class RoomPage extends BaseBuildingFloorPage
	{
		private var _room_vew:room_view_new =  new  room_view_new();
		private var _current_room:int  = 0;
		public function RoomPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		override public function init():void{
			_room_vew.room_data_button.addEventListener(MouseEvent.CLICK,showRoomData);
			_center_container.addChild(_room_vew);
			renderCenter();
			addRooms();
			resize();
			_rooms = (Model.instance().floors[1] as FloorModel).rooms_collection;
			renderRooms((Model.instance().floors[1] as FloorModel).rooms_collection);
			_room_id = 1;
			super.init();
			
		}
		private function showRoomData(e:MouseEvent):void{
			this.hide();
//			View.instance().pages.data_page.render_room()
			view.View.instance().pages.current_page = view.View.instance().pages.data_page;
			view.View.instance().pages.data_page.render(_rooms,_room_id);
			view.View.instance().pages.data_page.show();
		}
		private function renderCenter():void{
			_room_vew.room1_hit.alpha =0;
			_room_vew.room2_hit.alpha =0;
			_room_vew.room2_hit.addEventListener(MouseEvent.CLICK,roomCliked);
			_room_vew.room1_hit.addEventListener(MouseEvent.CLICK,roomCliked);
			
		}
		private function roomCliked(e:MouseEvent):void{
			_room_vew.room1.visible = e.target.name == "room1_hit";
			_room_vew.room2.visible = !(e.target.name == "room1_hit");
		}
		public function setRooms(rooms:RoomsCollection):void{
			_rooms =  rooms;
			
		}
		override protected function buttonRoomOver(e:MouseEvent):void{
			e.target.alpha = .7;
			
		}
		override protected function buttonRoomOut(e:MouseEvent):void{
			e.target.alpha = 1;
			
			
		}
		override protected function showRoom(e:MouseEvent):void{
			_current_room = int(e.target.name);
			TweenLite.to(_center_container_mask,.5,{scaleY:0, onComplete:swapRoom});
			
		}
		private function swapRoom():void{
			_center_container_mask.y = 0;
			_center_container_mask.scaleY = 0;
			TweenLite.to(_center_container_mask,1,{scaleY:1,delay:.5});
		}
		public function setRoomId(id:int):void{
			_current_room = id;
		}
	}
	
}
