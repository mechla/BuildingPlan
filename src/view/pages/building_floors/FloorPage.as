package view.pages.building_floors
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import model.Model;
	import model.ViewData;
	import model.building.FloorModel;
	import model.building.RoomModel;
	import model.building.RoomsCollection;
	
	import view.Button;
	import view.PhotoLoader;
	import view.ShowObject;
	import view.View;
	import view.pages.BasePage;
	
	public class FloorPage extends BaseBuildingFloorPage
	{
		private var _floor_view:floor_view_new =  new floor_view_new();
		private var _tween:Boolean = false;
		
		public function FloorPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		override public function init():void{
			
			_center_container.addChild(_floor_view);
			renderRoomsView();
			addRooms();
			
			resize();
			super.init();
		}
		public function renderRoomsView():void{
			for(var i:int = 0;i<_floor_view.numChildren;i++){
				if(_floor_view.getChildAt(i).name != "bg"){
					_floor_view.getChildAt(i).addEventListener(MouseEvent.CLICK,roomHitTestClicked);
					_floor_view.getChildAt(i).addEventListener(MouseEvent.MOUSE_OVER,roomHitTestOver);
					_floor_view.getChildAt(i).addEventListener(MouseEvent.MOUSE_OUT,roomHitTestOut);
					_floor_view.getChildAt(i).alpha = 0;
					(_floor_view.getChildAt(i) as MovieClip).buttonMode =  true;
					(_floor_view.getChildAt(i) as MovieClip).useHandCursor =  true;
					
				}
			}
		}
		private function roomHitTestClicked(e:MouseEvent):void{
			var name :String= e.target.name.replace("m","");
			try{
				
			}
			catch(e:Error){}
		}
		private function roomHitTestOut(e:MouseEvent):void{
			e.target.alpha = 0;
			var name :String= e.target.name.replace("m","");
			try{
				_rooms_buttons.getChildByName(name).alpha = 1;
				
			}
			catch(e:Error){}
		}
		private function roomHitTestOver(e:MouseEvent):void{
			e.target.alpha = .3;
			var name :String= e.target.name.replace("m","");
			try{
				_rooms_buttons.getChildByName(name).alpha = .7;
				
			}
			catch(e:Error){}
		}
		override protected function buttonRoomOver(e:MouseEvent):void{
			e.target.alpha = .7;
			var name :String= e.target.name;
			try{
				_floor_view.getChildByName("m"+name).alpha = .2;
			}
			catch(e:Error){} 
			
		}
		override protected function buttonRoomOut(e:MouseEvent):void{
			e.target.alpha = 1;
			var name:String = e.target.name;
			try{
				_floor_view.getChildByName("m"+name).alpha = 0;
			}
			catch(e:Error){} 
			
		}
		override protected function showRoom(e:MouseEvent):void{
			view.View.instance().menu.setActiveMenu(ViewData.instance().menu_data[2]);
			this.hide();
			View.instance().pages.room_page.renderRoom(int(e.target.name));
			View.instance().pages.room_page.show();
			
		}
		
		override protected function floorButtonOut(e:MouseEvent):void{
			TweenMax.to(e.target,0,{colorMatrixFilter:{brightness:1}});
			
			
		}
		override protected function floorButtonOver(e:MouseEvent):void{
			TweenMax.to(e.target,0,{colorMatrixFilter:{brightness:1.5}});
			
			
		}
		override protected function showFloor(e:MouseEvent):void{
			if(!_tween){
				_tween = true
				
				_center_container_mask.scaleX = 1;
				TweenLite.to(_center_container_mask,.5,{scaleX:0,x:800,onComplete:changeFloorData,onCompleteParams:[int(e.target.name)]});
			}
		}
		private function changeFloorData(id:int):void{
			_center_container_mask.x = 0;
			renderRooms((Model.instance().floors[id] as FloorModel).rooms_collection);
			TweenLite.to(_center_container_mask,.5,{scaleX:1, onComplete:tweenFinish});
		}
		private function tweenFinish():void{
			_tween = false;
		}
	}
}