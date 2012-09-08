package view.pages.gallery
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import model.ViewData;
	
	import view.Button;
	import view.PhotoLoader;
	import view.ShowObject;
	
	public class PhotoView extends Sprite
	{
		private var _urls:Array = ["B_01.jpg","B_02.jpg","C_01.jpg","E_01.jpg","G_02.jpg"];
		private var _photos:Array =  new Array();
		private var _index:int = 0;
	    private var _photo_mask:Sprite =  new Sprite();
		private var _photo:Sprite =  new Sprite();
		public function PhotoView()
		{
			super();
		}
		public function init():void{
			
			_photo_mask.graphics.beginFill(0xff0000);
			_photo_mask.graphics.drawRect(0,0,910,520);
			_photo_mask.graphics.endFill();
			addChild(_photo);
			addChild(_photo_mask);
			_photo.mask = _photo_mask
			_photo.scaleX = _photo.scaleY =  .6;
		
			
			for(var i:int = 0;i<_urls.length;i++){
				var photo:PhotoLoader =  new PhotoLoader();
				photo.setUrl("assets/room_interior_images/"+_urls[i]);
				photo.scaleX = photo.scaleY = .6;
				_photos.push(photo);
			}
		
			showPhoto(_index);
			
		}
		public function next():void{
			var _next_index:int = _index+1;
			if(_next_index>_photos.length-1)
				_next_index = 0;
			showPhoto(_next_index);
			
		}
		public function prev():void{
			var _next_index:int = _index-1;
			if(_next_index<0)
				_next_index = _photos.length-1;
			showPhoto(_next_index);
			
		}
		public function showPhoto(index:int):void{
			if(_photo.numChildren >0)
				_photo.removeChild(_photos[_index]);
			_photos[index].loadPhoto();
			_photo.addChild(_photos[index]);
			_index = index;
		}
	}
}