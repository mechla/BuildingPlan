package view
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	
	import flash.display.Sprite;
	
	public class PhotoLoader extends Sprite
	{
		private var _loader:LoaderMax =  new LoaderMax({name:"loader",onComplete:completeHandler});
		private var _callback:Function;
		public function PhotoLoader()
		{
			super();
		}
		
		public function setUrl(url:String):void{
			var pict_loader:ImageLoader =  new ImageLoader(url,{name:"picture"});
			_loader.append(pict_loader);
		} 
		public function loadPhoto(callback:Function = null):void{
			_callback =  callback;
			_loader.load();
		}
		private function completeHandler(e:LoaderEvent):void{
			var pict:Sprite = _loader.getContent("picture");
			addChild(pict);
			if(_callback)
				_callback();
		}
	}
}