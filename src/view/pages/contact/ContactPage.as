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
		private var _map:map_view =  new map_view();
//		private var _contact_form:contact_form = new contact_form();
		public function ContactPage(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
//			_contact_form.x = 500;
//			_center_container.addChild(_contact_form);
			_center_container.addChild(_map);
			resize();
		}
		
	}
}