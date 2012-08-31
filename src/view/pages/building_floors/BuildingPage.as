package view.pages.building_floors
{
	import com.google.maps.View;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import model.Model;
	import model.ViewData;
	import model.building.FloorModel;
	import model.building.FloorsCollection;
	
	import view.Button;
	import view.ShowObject;
	import view.View;
	import view.pages.BasePage;
	
	public class BuildingPage extends BaseBuildingFloorPage
	{
//		private var _building:main_building =  new main_building();
		private var _building:building_main_view =  new building_main_view();
		public function BuildingPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		
		}
		override public function init():void{
			for(var i:int = 0; i<_building.numChildren;i++){
				if(_building.getChildAt(i).name != "bg"){				
					_building.getChildAt(i).addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
					_building.getChildAt(i).addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
					_building.getChildAt(i).addEventListener(MouseEvent.CLICK,showFloor);
					_building.getChildAt(i).alpha = 0;
					(_building.getChildAt(i) as MovieClip).buttonMode =  true;
					(_building.getChildAt(i) as MovieClip).useHandCursor =  true;
				}
			}
			_center_container.addChild(_building);
			resize();
			super.init();
		}
		override protected function showFloor(e:MouseEvent):void{
			view.View.instance().menu.setActiveMenu(ViewData.instance().menu_data[1]);
			var index:int = int(e.target.name.replace("floor_",""));
			try{
				this.hide();
				view.View.instance().pages.floors_page.renderRooms((Model.instance().floors[index] as FloorModel).rooms_collection);
				view.View.instance().pages.floors_page.show();
			}catch(e:Error){}
		}
		private function onMouseOver(e:MouseEvent):void{
			trace(e.target.name);
			e.target.alpha = .3;
			var name:String = e.target.name.replace("floor_","");
			try{
				this.getChildByName(name).alpha = .3;
				
			}catch(e:Error){}
			
		}
		private function onMouseOut(e:MouseEvent):void{
			e.target.alpha = 0;
			var name:String = e.target.name.replace("floor_","");
			try{
				this.getChildByName(name).alpha = 1;
				
			}catch(e:Error){}
			
		}
	
		override protected function floorButtonOut(e:MouseEvent):void{
			TweenMax.to(e.target,0,{colorMatrixFilter:{brightness:1}});
			try{
			_building.getChildByName("floor_"+e.target.name).alpha  = 0;
			}catch(e:Error){}
			
		}
		override protected function floorButtonOver(e:MouseEvent):void{
			trace(e.target.name);
			TweenMax.to(e.target,0,{colorMatrixFilter:{brightness:1.5}});
			try{
			_building.getChildByName("floor_"+e.target.name).alpha = .3;
			}catch(e:Error){}
			
		}
	
	
	}
}