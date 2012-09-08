package view.pages.building_floors
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	
	import model.ViewData;
	import model.building.RoomModel;
	import model.building.RoomsCollection;
	
	import view.Button;
	import view.View;
	import view.pages.BasePage;
	
	public class RoomDataPage extends BasePage
	{
		private var _menu:menu_new =  new menu_new();
		private var _template:QuotationTemplate =   new QuotationTemplate();
		private var _template_mask:Sprite =  new Sprite();
		private var _room_model:RoomModel;
		
		//		private var _exit:Button =  new Button(_menu.exit);
		private var _emial:Button =  new Button(_menu.email);
		private var _print:Button =  new Button(_menu.print_doc);
		private var _cal:Button =  new Button(_menu.calculat_image);
		private var _magnify:Button =  new Button(_menu.maganify);
		
		private var _enter_email:send_post =  new send_post();
		private var _send_email:Button =  new Button(_enter_email.send);
		private var _email:SendEmail =  new SendEmail();
		private var _calculator:Calculator;
		private var _discount:Number =  1;
		private var _email_content:String = "";
		public function RoomDataPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			
			addTemplate();
			addMenu();
			resize();
			_calculator =  new Calculator(_center_container,false);
			_calculator.applyCallback(applyDiscount);
		}
		private function addTemplate():void{
			_template.scaleX = _template.scaleY = 0.4;
			_center_container.addChild(_template);
			
			_template_mask.graphics.beginFill(0xff0000);
			_template_mask.graphics.drawRect(0,0,_template.width,ViewData.instance().stage_size.y-50);
			_template_mask.graphics.endFill();
			_template.buttonMode = true;
			_template.useHandCursor =  true;
			
			_center_container.addChild(_template_mask);
			_template.mask = _template_mask;
			
			_template.addEventListener(MouseEvent.MOUSE_DOWN, startDragTemplate);
			_template.addEventListener(MouseEvent.MOUSE_UP, stopDragTemplate);
			
			
		}
		private function startDragTemplate(e:MouseEvent):void{
			_template.startDrag(false,new Rectangle((-_template.width+_template_mask.width)/2,0,(_template.width-_template_mask.width),-_template.height+_template_mask.height));
			
		}
		private function stopDragTemplate(e:MouseEvent):void{
			_template.stopDrag();
			
		}
		private function addMenu():void{
			_right_container.addChild(_menu);
			//			_menu.addChild(_exit);
			_menu.addChild(_emial);
			_menu.addChild(_print);
			_menu.addChild(_cal);
			_menu.addChild(_magnify);
			_enter_email.addChild(_send_email);
			
			//			_exit.addEventListeners(exitDoc);
			_emial.addEventListeners(emailDoc);
			_print.addEventListeners(printDoc);
			_cal.addEventListeners(calculate);
			_magnify.addEventListeners(magnifyDoc);
			
			_send_email.addEventListeners(sendEmail);
		}
		private function magnifyDoc(e:MouseEvent):void{
			_template.x = 0;
			_template.y = 0;
			_template_mask.x = 0;
			_template_mask.y =0
			if(_template.scaleX !=1){
				_template.scaleX = _template.scaleY = 1;
				_template_mask.width = ViewData.instance().stage_size.x;
				_template_mask.x = _template.width/2 - _template_mask.width/2;
			}
			else{
				_template.scaleX = _template.scaleY = .4;
				_template_mask.width = _template.width;
				_template_mask.x = 0;
				
			}
			resize();
			
		}
		private function exitDoc(e:MouseEvent):void{
			this.hide();
			View.instance().pages.current_page = View.instance().pages.room_page;
			View.instance().pages.room_page.show();
			
		}
		private function emailDoc(e:MouseEvent):void{
			_enter_email.exit.addEventListener(MouseEvent.CLICK, removeEmail);
			_send_email.visible = true;
			_enter_email.x = _template.width/2-_enter_email.width/2;
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
			
			
			_email.sendMessage(_enter_email.email_input.text, _email_content);
			TweenLite.to(_enter_email,.5,{delay:2,alpha:0,onCoplete:removeEmail,onCompleteParams:[null]});
		}
		private function removeEmail(e:*):void{
			_enter_email.exit.removeEventListener(MouseEvent.CLICK, removeEmail);
			_center_container.removeChild(_enter_email);
			_enter_email.alpha = 1;
		}
		private function printDoc(e:MouseEvent):void{
			var print_data:PrintData =  new PrintData();
			print_data.printStuff(new Sprite());//_data as Sprite);
		}
		private function calculate(e:MouseEvent):void{
			
			_calculator.show();
			
		}
		public function applyDiscount(discount:Number):void{
			_discount =  discount;
			updateTemplate();
			
		}
		public function render(rooms:RoomsCollection,room_id:int):void{
			_room_model = rooms[1] as RoomModel;
			updateTemplate();
		}
		public function updateTemplate():void{
			var quotient:Number = 100 - int(_discount);
			if(quotient<0)
				quotient = 0;
			_template.room_number.text.text = _room_model.room;
			_template.room_type.text.text = _room_model.type;
			_template.room_style.text.text = _room_model.style;
			_template.room_area.text.text = _room_model.area;
			_template.room_baht_sqm.text.text = (int(_room_model.bath_per_square) * quotient).toString();
			
			_template.unit_price.text.text = (int(_room_model.unit_prise) * quotient).toString();
			_template.unit_discount.text.text = _discount.toString()+"%";//_room_model.unit_discount;
			_template.net_room_baht_sqm.text.text = (int(_room_model.bath_per_square) * quotient).toString();
			_template.net_unit_price.text.text = (int(_room_model.net_unit_price) * quotient).toString();
			
			//			_template.reserve.text.text = _room_model.
			//			_template.contract.text.text = _room_model.
			//				
			//			_template.payment_month.text.text = _room_model.
			//			_template.balloon_month.text.text = _room_model.
			//			_template.payment.text.text = _room_model.
			//			_template.balloon.text.text = _room_model.
			//				
			//			_template.transfer.text.text = _room_model.
			//				
			//			_template.interest_10.text.text = _room_model.
			//			_template.interest_15.text.text = _room_model.
			//			_template.interest_20.text.text = _room_model.
			//			_template.interest_25.text.text = _room_model.
			//				
			//			_template.free_1.text.text = _room_model.
			//			_template.free_2.text.text = _room_model.
			//			_template.free_3.text.text = _room_model.
			//			_template.free_4.text.text = _room_model.
			//			_template.free_5.text.text = _room_model.
			//			_template.free_6.text.text = _room_model.
			//			
			
			_email_content = 
				"discount: "+_discount.toString()+"/"+
				"room no: "+_room_model.room.toString()+"/"+
				"type: "+_room_model.type.toString()+"/"+
				"area: "+_room_model.area.toString()+"/"+
				"bath: "+_room_model.bath_per_square.toString()+"/"+
				"unit price: "+_room_model.unit_prise.toString();
		}
		override public function show(...args):void{
			super.show();
		}
		override public function resize():void{
			_center_container.x = (ViewData.instance().stage_size.x-50)/2- _center_container.width/2;
			_center_container.y = 50;
			_left_container.y = ViewData.instance().stage_size.y/2 - _left_container.height/2;
			_left_container.x = 0;
			_right_container.x = ViewData.instance().stage_size.x;
			_right_container.y = ViewData.instance().stage_size.y/2 - _right_container.height/2;
			
			_template_mask.height = ViewData.instance().stage_size.y-50;
			
		}
	}
}