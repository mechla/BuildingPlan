package view.pages.contact
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	import view.Button;
	import view.ShowObject;
	import view.pages.BasePage;
	
	public class ContactPage extends BasePage
	{
		private var _map:GoogleMapView;
		private var _contact_form:contact_form = new contact_form();
		private var _send_button:view.Button =  new Button(_contact_form.send);
		private var _email:SendEmail =  new SendEmail();
		public function ContactPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			_map =  new GoogleMapView(_center_container,true);
//			_map.y = 150;
//			_contact_form.y = 150;
			_contact_form.x = 500;
			_contact_form.addChild(_send_button);
			_send_button.addEventListeners(sendEmail);
			_contact_form.email_input.addEventListener(MouseEvent.CLICK,removeText);
			_center_container.addChild(_contact_form);
			resize();
		}
		private function removeText(e:MouseEvent):void{
			_contact_form.email_input.removeEventListener(MouseEvent.CLICK,removeText);
			_contact_form.email_input.text = "";
			
		}
		private function sendEmail(e:MouseEvent):void{
			_send_button.visible = false;
			_contact_form.email_input.text = "email has been sent";
			_contact_form.email_input.text
			_email.sendMessage(_contact_form.email_input.text);
			TweenLite.delayedCall(5,renewButton);
		}
		private function renewButton():void{
			_contact_form.email_input.text = "enter your email here";
			_send_button.visible = true;
			_contact_form.email_input.addEventListener(MouseEvent.CLICK,removeText);
		}
		
	}
}