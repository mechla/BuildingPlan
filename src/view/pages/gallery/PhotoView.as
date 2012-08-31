package view.pages.gallery
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import model.ViewData;
	
	import view.Button;
	import view.PhotoLoader;
	import view.ShowObject;
	
	public class PhotoView extends ShowObject
	{
		private var _urls:Array = ["B_01.jpg","B_02.jpg","C_01.jpg","E_01.jpg","G_02.jpg"];
		private var _photos:Array =  new Array();
		private var _index:int = 0;
	    private var _bg:Sprite =  new Sprite();
		private var _photo:Sprite =  new Sprite();
		public function PhotoView(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			
			_bg.graphics.beginFill(0x00000),1;
			_bg.graphics.drawRect(-20,-20,940,550);
			_bg.graphics.endFill();
			addChild(_bg);
			_photo.scaleX = _photo.scaleY =  .6;
		
			
			for(var i:int = 0;i<_urls.length;i++){
				var photo:PhotoLoader =  new PhotoLoader();
				photo.setUrl("assets/room_interior_images/"+_urls[i]);
				photo.scaleX = photo.scaleY = .6;
				_photos.push(photo);
			}
			addChild(_photo);
			showPhoto(_index);
			
		}
		public function next():void{
			var _next_index:int = _index+1;
			if(_next_index>_photos.length-1)
				_next_index = 0;
			showPhoto(_next_index);
			_index =_next_index;
			
		}
		public function prev():void{
			var _next_index:int = _index-1;
			if(_next_index<0)
				_next_index = _photos.length-1;
			showPhoto(_next_index);
			_index = _next_index
			
		}
		private function showPhoto(index:int):void{
			if(_photo.numChildren >0)
				_photo.removeChild(_photos[_index]);
			_photos[index].loadPhoto();
			_photo.addChild(_photos[index]);
		}
	}
}