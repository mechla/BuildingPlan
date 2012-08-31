package model
{
	
	import com.childoftv.xlsxreader.Worksheet;
	import com.childoftv.xlsxreader.XLSXLoader;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import view.View;
	
	public class EXELoader extends Sprite
	{
		protected var _excel_loader:XLSXLoader;
		
		private var _columns_names:Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"];
		
		public function EXELoader()
		{
			_excel_loader =  new XLSXLoader();
			_excel_loader.addEventListener(Event.COMPLETE,loadingComplete);
			_excel_loader.load("assets/xml/building_data.xlsx");
		}
		
		private function loadingComplete(e:Event):void
		{
			var data:Worksheet = _excel_loader.worksheet("data");
			for(var i:int = 4;i<=125;i++){
				var room_data:Array =  new Array();
				for(var j:int = 0; j<_columns_names.length;j++){
					room_data.push(data.getCellValue(_columns_names[j]+i.toString()))
				}
				Model.instance().floors.addRoom(room_data);
			}
			View.instance().pages.updateDataFromExel();
			View.instance().pages.main_page.hide();
			View.instance().pages.building_page.show();
			View.instance().menu.show();
		}
	}
}

//4-125
//A- souldout
//B- floor
// C - room
// D - type
// Earea
//F bath
//G unit prize
//H deposit
//I contrackt
//J i7
//K
//L