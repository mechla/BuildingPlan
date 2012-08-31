package
{
	import flash.display.Sprite;
	import flash.printing.PrintJob;

	public class PrintData
	{
		private var _print:PrintJob =  new PrintJob();
		public function PrintData()
		{
		}
		public function printStuff(data:Sprite):void{
			_print.start();
			_print.addPage(data);
			_print.send();
			
		}
	}
}