package view.pages.building_floors
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	import view.ShowObject;
	
	public class Calculator extends ShowObject
	{
		private var _calculator:calculator =  new calculator();
		private var _callback:Function;
		private var _discount:String = "";
		public function Calculator(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
			init();
		}
		public function init():void{
			this.alpha = .75;
			addChild(_calculator);
			for(var i:int = 0 ; i< _calculator.numChildren;i++){
				if(_calculator.getChildAt(i).name != "bg" && _calculator.getChildAt(i).name != "input_text"){
					_calculator.getChildAt(i).addEventListener(MouseEvent.CLICK, buttonCliked);
				}
			}
		}
		private function buttonCliked(e:MouseEvent):void{
			
			trace(e.target.name);
			switch (e.target.name) {
				case "dot":{
					_discount.replace(".","");
					_discount = _discount+".";
				}
				case "calculate":{
					_callback(_discount);
				}
				case "exit":{
					this.hide();
					break;
				}
				case "delate":{
					_discount = "";
					_calculator.input_text.text = _discount;
					break;
				}
				case "percent":{
					_callback(_discount);
					
					break;
				}
				default:{
					_discount = _discount+e.target.name.replace("no","");
					_calculator.input_text.text = _discount;
				}
			}
		}
		public function applyCallback(callback:Function):void{
			_callback = callback;
			
		}
		override public function show(...args):void{
			if(this.parent !=null)
				this.hide()
			else{
				_calculator.input_text.text = "";
				_discount = "";
				super.show();
			}
		}
	}
}