package tools
{	
	public final class CTool
	{
		public function CTool() {
		}
		
		public static function get_ext(v:String):String
		{
			var t_rv:String = null;
			
			var t_reg:RegExp = /\.[^.]*$/i;
			var t_fi:int = v.search(t_reg);
			if (t_fi > -1)
			{
				t_rv = v.substr(t_fi + 1);
			}
			
			return t_rv;
		}
	}	
}
