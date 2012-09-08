package view.menu
{
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	import model.ViewData;
	
	import view.Button;
	import view.ShowObject;
	import view.View;
	
	public class MenuButton extends ShowObject
	{
		private var _button_mc:MenuText =  new MenuText();
		private var  _width:Number;
		private var _name:String;
		public function MenuButton(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init(text:String):void{
			_name = text;
			_button_mc.text.text = text;
			_button_mc.text_active.text = text;
			_button_mc.text_active.visible =  false;
			_width = _button_mc.text.textWidth;
			_button_mc.background.width = _width+10;
			var button:Button =  new Button(_button_mc);
			addChild(button);
			button.addEventListeners(goToMenu);
		}
		private function goToMenu(e:MouseEvent):void{
			View.instance().menu.setActiveMenu(_name);
			if(ViewData.instance().gallery_data.indexOf(_name)>-1){
				View.instance().pages.gallery_page.showGallery(_name);
			}
			else{
				View.instance().pages.showPage(_name);
			}
		}
		public function setActive():void{
			_button_mc.text.visible = false;
			_button_mc.text_active.visible =  true;
		}
		public function setInactive():void{
			_button_mc.text.visible = true;
			_button_mc.text_active.visible =  false;
		}
		public function getWidth():Number{
			return _width;
		}
	}
}