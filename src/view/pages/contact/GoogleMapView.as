package view.pages.contact
{
	import com.google.maps.LatLng;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.MapOptions;
	import com.google.maps.MapType;
	import com.google.maps.controls.MapTypeControl;
	import com.google.maps.controls.PositionControl;
	import com.google.maps.controls.ZoomControl;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.geom.Point;
	
	import view.ShowObject;
	
	public class GoogleMapView extends ShowObject
	{
		protected var _map:Map =  new Map();
		
		protected var _mapReady:Boolean =  false;
		
		public function GoogleMapView(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
			addMap();
		}
		private function addMap():void{
			
			_map.key = "ABQIAAAA9-codFcZRGJwTxYubWZNlBR_5q6EyGQUlQ5yO-hdV1g6FDaMhBR2IJQV33s58wLbuMZx7m7RCTHMVQ";
			_map.url = "http://mechla.sry.pl/BP/BuildingPlan.html";
				_map.sensor = "true";
			_map.setSize(new Point(400, 400));
			_map.addEventListener(MapEvent.MAP_READY, onMapReady);
			this.addChild(_map);
		}
		private function onMapReady(event:Event):void {
			var myMapOptions:MapOptions = new MapOptions();
			myMapOptions.zoom = 14;
			myMapOptions.center = new LatLng(52.4059332,16.9246722);
			myMapOptions.mapType = MapType.NORMAL_MAP_TYPE;
			_map.setInitOptions(myMapOptions);
			_map.addControl(new ZoomControl());
			_map.addControl(new PositionControl());
			_map.addControl(new MapTypeControl());
			_map.setZoom(16);
			_map.setCenter(new LatLng(52.40828351070693, 16.9329571723938));
			
			_mapReady =  true;
		}

		
		
		
	}
}