package hb.tools
{
	/**
	 * ...
	 * @author hb
	 */
	public final class AlphabetTool 
	{		
		public function AlphabetTool() 
		{			
		}
		
		private static const _str:String = 'abcdefghijklmnopqrstuvwxyz';
		public static function get_str():String
		{
			return _str;
		}

		public static function get_index(v:String):int
		{
			return _str.indexOf(v);
		}
		
		public static function is_val(v:String):Boolean
		{
			return (get_index(v) > -1);
		}
		

	}

}