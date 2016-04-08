package utils
{
	import hb.core.IDisposer;
	
	/**
	 * ...
	 * @author Hobis
	 */
	public final class ComUtil 
	{
		// ::
		public function ComUtil() 
		{			
		}
		
		// ::
		public static function arr_get_isEmpty(arr:Array):Boolean
		{
			if (arr == null) return true;
			if (arr.length == 0) return true;
			else return false;
		}
		
		// ::
		public static function dispose(d:IDisposer):void
		{
			if (d != null)
			{
				d.dispose();
			}
		}		
	}

}