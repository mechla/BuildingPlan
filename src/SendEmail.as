package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;

	public class SendEmail
	{
		public function SendEmail()
		{
		}
		public function sendMessage(email:String,text:String):void
		{
			var variables:URLVariables=new URLVariables();
			variables.name="Building presentation";
			variables.email=email;
			variables.message=text;
			
			var request:URLRequest=new URLRequest();
			request.url='http://mechla.sry.pl/BP/email_send.php';
			request.method=URLRequestMethod.POST;
			request.data=variables;
			
			var loader:URLLoader=new URLLoader();
			loader.dataFormat=URLLoaderDataFormat.VARIABLES;
			loader.addEventListener(Event.COMPLETE,messageSent);
			try 
			{
				loader.load(request);
			} 
			catch (error:Error) 
			{
				trace('Unable to load requested document.');
			}
		}
		
		private function messageSent(evt:Event):void
		{
			var loader:URLLoader=URLLoader(evt.target);
			var vars:URLVariables=new URLVariables(loader.data);
			if(vars.answer=="ok")
				trace("The message has been sent");
			else
				trace("Something wrong!");
		}
	}
}
