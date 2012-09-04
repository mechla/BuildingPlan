package view.pages.building_floors
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	import model.building.RoomModel;
	import model.building.RoomsCollection;
	
	import view.Button;
	import view.View;
	import view.pages.BasePage;
	
	public class RoomDataPage extends BasePage
	{
		private var _menu:menu_new =  new menu_new();
		private var _data:room_type_data  = new room_type_data();
		private var _room_model:RoomModel;
		
		private var _exit:Button =  new Button(_menu.exit);
		private var _emial:Button =  new Button(_menu.email);
		private var _print:Button =  new Button(_menu.print_doc);
		private var _cal:Button =  new Button(_menu.calculat_image);
		
		private var _enter_email:send_post =  new send_post();
		private var _send_email:Button =  new Button(_enter_email.send);
		private var _email:SendEmail =  new SendEmail();
		private var _calculator:calculator =  new calculator();
		public function RoomDataPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			_right_container.addChild(_menu);
			_center_container.addChild(_data);
			addMenuEvents();
			resize();
		}
		private function addMenuEvents():void{
			_menu.addChild(_exit);
			_menu.addChild(_emial);
			_menu.addChild(_print);
			_menu.addChild(_cal);
			_enter_email.addChild(_send_email);
			
			_exit.addEventListeners(exitDoc);
			_emial.addEventListeners(emailDoc);
			_print.addEventListeners(printDoc);
			_cal.addEventListeners(calculate);
			
			_send_email.addEventListeners(sendEmail);
		}
		private function exitDoc(e:MouseEvent):void{
			this.hide();
			View.instance().pages.current_page = View.instance().pages.room_page;
			View.instance().pages.room_page.show();
			
		}
		private function emailDoc(e:MouseEvent):void{
			_enter_email.exit.addEventListener(MouseEvent.CLICK, removeEmail);
			_send_email.visible = true;
			_enter_email.x = _data.width/2-_enter_email.width/2;
			_enter_email.y = 100;
			_center_container.addChild(_enter_email);
			_enter_email.email_input.addEventListener(MouseEvent.CLICK,removeText);
		}
		
		private function removeText(e:MouseEvent):void{
			
			_enter_email.email_input.removeEventListener(MouseEvent.CLICK,removeText);
			_enter_email.email_input.text = "";
			
		}
		
		
		private function sendEmail(e:MouseEvent):void{
			_send_email.visible =  false;
			_enter_email.email_input.text = "email has been sent";
//			_enter_email.email_input.text
			var htmlText:String;
				
			_email.sendMessage(_enter_email.email_input.text, htmlText);
			TweenLite.to(_enter_email,1,{delay:2,alpha:0,onCoplete:removeEmail});
		}
		private function removeEmail():void{
			_enter_email.exit.removeEventListener(MouseEvent.CLICK, removeEmail);
			_center_container.removeChild(_enter_email);
			_enter_email.alpha = 1;
		}
		private function printDoc(e:MouseEvent):void{
			var print_data:PrintData =  new PrintData();
			print_data.printStuff(new Sprite());//_data as Sprite);
		}
		private function calculate(e:MouseEvent):void{
			_center_container.addChild(_calculator);
			_calculator.exit.addEventListener(MouseEvent.CLICK,exitCal);
			
		}
		private function exitCal(e:MouseEvent):void{
			_center_container.removeChild(_calculator);
		}
		public function render(rooms:RoomsCollection,room_id:int):void{
			_room_model = rooms[1] as RoomModel;
			
			_data.room_no.text = _room_model.room;
			_data.type.text = _room_model.type;
			_data.style.text = _room_model.style;
			_data.area_lp.text = _room_model.area;
			
		}
		override public function show(...args):void{
			super.show();
		}
	}
}