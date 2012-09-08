package view
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	public class PhotoLoader extends Sprite
	{
		private var _loader:LoaderMax =  new LoaderMax({name:"loader",onComplete:completeHandler});
		private var _callback:Function;
		private var _bitmap:Sprite
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
			while(this.numChildren>0)
				this.removeChildAt(0)
			_bitmap = _loader.getContent("picture");
			addChild(_bitmap);
			if(_callback)
				_callback();
		}

		public function get bitmap():Sprite
		{
			return _bitmap;
		}

	}
}