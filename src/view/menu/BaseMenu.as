package view.menu
{
	
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import model.ViewData;
	
	import view.PhotoLoader;
	import view.ShowObject;
	
	public class BaseMenu extends ShowObject
	{
		protected var _position_x:int = 50;
		protected var _buttons:Array  = ViewData.instance().menu_data;
		protected var _menu_buttons:Array =  new Array();
		
		protected var _bg:Sprite =  new Sprite();
	
		public function BaseMenu(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			for(var i:int = 0; i<_buttons.length;i++){
				var menu_button:MenuButton =  new MenuButton(this,true);
				menu_button.init(_buttons[i]);
				menu_button.name = _buttons[i];
				
				menu_button.x = _position_x;
				_position_x = _position_x + menu_button.getWidth()+30;
				addChild(menu_button);
				_menu_buttons.push(menu_button);
				
			}
			resize();
		}
		public function addBg():void{
			_bg.graphics.beginFill(0x000000,.8);
			_bg.graphics.drawRect(0,0,10,30);
			_bg.graphics.endFill();
			addChild(_bg);
		}
	    public function setActiveMenu(name:String):void{
			for(var i:int = 0; i<_menu_buttons.length;i++){
				if(_menu_buttons[i].y != 0)
					TweenLite.to(_menu_buttons[i], .5, { y:0, ease:Back.easeIn});
			}
			TweenLite.to(this.getChildByName(name), .5, { y:15, ease:Back.easeOut});
			
		}
		public function resize():void{
////			if(ViewData.instance().stage_size.x/2-this.width/2 < 10) 
//				this.x = 10;
//			else
//				this.x =  ViewData.instance().stage_size.x/2-this.width/2;
			_bg.width =  ViewData.instance().stage_size.x;
			this.y = 20;
		}
	}
}