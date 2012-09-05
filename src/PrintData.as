package
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.printing.PrintJob;
	
	public class PrintData
	{
//		private var _print:PrintJob =  new PrintJob();
		private var printJobObject:PrintJob = new PrintJob();
		public function PrintData()
		{
		}
		public function printStuff(displayObject:Sprite):void{
			
			var originalDocX:Number = displayObject.x;
			var originalDocY:Number = displayObject.y;
			var printingRect:Rectangle = new Rectangle(0, 0, 0, 0);
			var printStartResult:Boolean = printJobObject.start();
			if(printStartResult){
				//	printingRect.width = 875;
				//	printingRect.height = 475;
				displayObject.width = printJobObject.pageWidth;
				//	isplayObject.height = printJobObject.pageHeight;
				displayObject.scaleY = displayObject.scaleX;
				printJobObject.addPage(displayObject,new Rectangle(0, 0, printJobObject.pageWidth / displayObject.scaleX, printJobObject.pageHeight / displayObject.scaleY));
				printJobObject.send();
				printJobObject = null;
			}
		}
	}
}
