package
{	
	import flash.display.NativeWindow;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.net.FileFilter;
	import flash.net.URLRequest;
	import flash.net.URLStream;	
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.text.TextField;
	import hb.utils.ArrayUtil;
	import hb.utils.StringUtil;
	import hb.tools.FlaTracer;	
	import hbworks.uilogics.SliderLogicFrame;
	
	

	public final class Xinger extends Sprite
	{
		private static function p_get_posp(v:String):RegExp
		{
			const t_re1:RegExp = /^\/.+\//;
			
			var t_re:RegExp = null;
			
			var t_ms:Array = v.match(t_re1);
			if (t_ms != null)
			{
				var t_v1:String = t_ms[0];
				if ((t_v1 != null) && (t_v1.length > 2))
				{
					var t_v2:String = v.split(t_v1)[1];
					t_v1 = t_v1.substr(1, t_v1.length - 2);
					//FlaTracer.log('Flag 문자가 있습니까? ' + t_v2);
					t_re = new RegExp(t_v1, t_v2);
				}
		
			}
			
			return t_re;
		}
		
		
		
		
		
		private var _nw:NativeWindow = null;
		
		private var _tf1:TextField = null;
		private var _tf1v:String = '';
		
		private var _tf2:TextField = null;
		private var _tf3:TextField = null;
		private var _tf4:TextField = null;
		
		
		private var _us:URLStream = null;
		
		private var _f:File = null;
		private var _fs:FileStream = null;
		
		private var _urls:Array = null;
		private var _lcl:uint = 0;
		private var _lc:uint = 0;
		
		private var _res:Array = null;
		
		private var _slider1:SliderLogicFrame = null;
		
		
		public function Xinger()
		{
			_nw = this.stage.nativeWindow;
			_nw.title = 'Xinger~~~~~~~~~~~~~~~~~~~~~';
			_nw.x = Math.round(Capabilities.screenResolutionX - _nw.width) - 40;
			_nw.y = Math.round(Capabilities.screenResolutionY - _nw.height) - 40;
			
			_tf1 = this.tf_1;
			_tf1.text = '';
			_tf1.tabIndex = 1;
			
			_tf2 = this.tf_2;
			_tf2.text = '';
			_tf2.tabIndex = 2;
			
			_tf3 = this.tf_3;
			_tf3.text = '';
			_tf3.tabIndex = 3;
			
			_tf4 = this.tf_4;
			_tf4.text = '';
			_tf4.tabIndex = 4;
			
			
			_us = new URLStream();
			_us.addEventListener(SecurityErrorEvent.SECURITY_ERROR, p_f_securityError);
			_us.addEventListener(IOErrorEvent.IO_ERROR, p_us_no);
			_us.addEventListener(Event.COMPLETE, p_us_yes);
			
			_f = new File(File.applicationDirectory.resolvePath('Data').nativePath).resolvePath('Save.xml');
			_f.addEventListener(SecurityErrorEvent.SECURITY_ERROR, p_f_securityError);			
			
			_fs = new FileStream();
			_fs.addEventListener(IOErrorEvent.IO_ERROR, p_fs_ioError);
			_fs.addEventListener(Event.CLOSE, p_fs_close);
			_fs.addEventListener(Event.COMPLETE, p_fs_complete);
			
			
			var t_bt:SimpleButton = null;
			t_bt = this.cbt_1;// Clear
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_clear1_click);
			t_bt = this.cbt_2;// Clear
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_clear2_click);
			t_bt = this.cbt_3;// Clear
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_clear3_click);
			t_bt = this.cbt_4;// Clear
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_clear4_click);
			
			t_bt = this.bt_1;// Start Click
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_start_click);
			t_bt = this.bt_2;// Stop Click
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_stop_click);
			t_bt = this.bt_3;// Load Click
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_load_click);
			t_bt = this.bt_4;// Save Click
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK, p_save_click);
			
			t_bt = this.ebt_1;
			t_bt.tabEnabled = false;
			t_bt.addEventListener(MouseEvent.CLICK,
				function(event:MouseEvent):void
				{
					System.setClipboard(_tf1.text);
				}
			);
			
			//
			FlaTracer.start('__FlaTracer__');
			
			//
/*
/<\s*script\s*(.|\s)*?>(.|\s)*?<\s*\/\s*script\s*>/gm
/<script\b[^>]*>([\s\S]*?)<\/script>/gm
/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gm

*/
			//_tf2.appendText('https://www.instagram.com/carrie_and_friends/');
			//_tf3.appendText('/<\s*script\s+(.|\s)+?>(.|\s)+?<\s*\/\s*script\s*>/gm\n');
			
			p_load_click(null);
			
			
			
			
			
			_slider1 = new SliderLogicFrame(this.slider_1, null, SliderLogicFrame.TYPE_VERTICAL);
			_slider1.onCallBack = function(eObj:Object):void
			{
				
			};
		}
				
		// ::
		private function p_f_securityError(event:SecurityErrorEvent):void
		{
		}
		
		// ::
		private function p_f_select_load(event:Event):void
		{
			_f.removeEventListener(Event.SELECT, p_f_select_load);
			
			if (!_f.exists) return;
			
			_fs.open(_f, FileMode.READ);
			
			var t_dstr:String = _fs.readUTFBytes(_fs.bytesAvailable);
			
			try
			{
				_fs.close();
			} catch (e:Error) {}
			
			var t_dxml:XML = new XML(t_dstr);
			
			
			var t_v:String;
			
			var t_xluis:XMLList = t_dxml.child('uis');
			if (t_xluis.length() > 0)
			{
				var t_xuis:XML = t_xluis[0];
				//FlaTracer.log('t_xuis: ' + t_xuis);
				//FlaTracer.log('t_xuis: ' + (t_xuis is XML));
				var t_xlui:XMLList = t_xuis.child('ui');
				if (t_xlui.length() > 0)
				{
					t_v = '';
					for each (var t_xui:XML in t_xlui)
					{
						t_v += t_xui.toString() + '\n';
					}
					_tf2.text = t_v;
				}
			}
			
			var t_xlris:XMLList = t_dxml.child('ris');
			if (t_xlris.length() > 0)
			{
				var t_xris:XML = t_xlris[0];
				//FlaTracer.log('t_xris: ' + t_xris);
				//FlaTracer.log('t_xris: ' + (t_xris is XML));
				var t_xlri:XMLList = t_xris.child('ri');
				if (t_xlri.length() > 0)
				{
					t_v = '';
					for each (var t_xri:XML in t_xlri)
					{
						t_v += t_xri.toString() + '\n';
					}
					_tf3.text = t_v;
				}					
			}	
		}
		
		// ::
		private function p_f_select_save(event:Event):void
		{
			_f.removeEventListener(Event.SELECT, p_f_select_save);
			
			var t_v1:String = _tf2.text;
			var t_v2:String = _tf3.text;
			
			if ((!StringUtil.is_empty(t_v1)) &&
				(!StringUtil.is_empty(t_v2)))
			{
				var t_xs1:String = null;
				var t_xs2:String = null;
				
				var t_lss:Array = null;
				var t_ls:String;
				
				t_lss = t_v1.split('\r');				
				if ((t_lss != null) && (t_lss.length > 0))
				{
					t_xs1 =
					'	<uis>\n';
					for each (t_ls in t_lss)
					{
						if (!StringUtil.is_empty(t_ls))
						{
							t_xs1 += 
						'		<ui><![CDATA[' + t_ls + ']]></ui>' + '\n';
						}
					}
					t_xs1 +=
					'	</uis>\n';
				}
				
				t_lss = t_v2.split('\r');				
				if ((t_lss != null) && (t_lss.length > 0))
				{
					t_xs2 =
					'	<ris>\n';
					for each (t_ls in t_lss)
					{
						if (!StringUtil.is_empty(t_ls))
						{
							t_xs2 += 
						'		<ri><![CDATA[' + t_ls + ']]></ri>' + '\n';
						}
					}
					t_xs2 +=
					'	</ris>\n';					
				}
				
				var t_xsa:String = 
					'<root>\n';
					
				if (t_xs1 != null)
					t_xsa += t_xs1;
						
				if (t_xs2 != null)
					t_xsa += t_xs2;
					
				t_xsa += 
					'</root>\n';
					
				//FlaTracer.log(t_xsa);
				
				_fs.open(_f, FileMode.WRITE);
				_fs.writeUTFBytes(t_xsa);				
				try
				{
					_fs.close();
				} catch (e:Error) {}				
			}
			
			/*
			<root>
				<uis>
					<ui><![CDATA[https://www.g2a.com/?adid=KO_3days_HTML&id=77&gclid=CJmU3c2YxMwCFYJjvAods1QHcQ]]></ui>
					<ui><![CDATA[http://hobis.tistory.com/]]></ui>
				</uis>
				<ris>
					<ri><![CDATA[/<script\b[^>]*>([\s\S]*?)<\/script>/gm]]></ri>
				</ris>
			</root>*/
			
		}		
		
		// ::
		private function p_fs_ioError(event:IOErrorEvent):void
		{
			FlaTracer.log('p_fs_ioError');
		}
		
		// ::
		private function p_fs_close(event:Event):void
		{
		}
		
		// ::
		private function p_fs_complete(event:Event):void
		{
		}
		
		
		private function p_clear1_click(event:MouseEvent):void
		{
			_tf1v = '';
			_tf1.text = _tf1v;
		}
		private function p_clear2_click(event:MouseEvent):void
		{
			_tf2.text = '';
		}
		private function p_clear3_click(event:MouseEvent):void
		{
			_tf3.text = '';
		}
		private function p_clear4_click(event:MouseEvent):void
		{
			_tf4.text = '';
		}
		
		private function p_start_click(event:MouseEvent):void
		{
			p_us_start();
		}		
		private function p_stop_click(event:MouseEvent):void
		{
			p_us_stop();
		}
		private function p_load_click(event:MouseEvent):void
		{			
			if (_f.exists && !((event != null) && event.controlKey))
			{
				p_f_select_load(null);
			}
			else
			{
				_f.addEventListener(Event.SELECT, p_f_select_load);
				_f.browseForOpen('Save Xml', [new FileFilter('XML File', '*.xml')]);				
			}
		}
		private function p_save_click(event:MouseEvent):void
		{
			if (_f.exists && !((event != null) && event.controlKey))
			{
				p_f_select_save(null);
			}
			else
			{
				_f.addEventListener(Event.SELECT, p_f_select_save);
				_f.browseForSave('Save Xml');
			}
		}
		
		
		// ::
		private function p_msg(v:String):void
		{
			_tf4.appendText(v + '\n');
			_tf4.scrollV = _tf4.maxScrollV;
		}
		
		// ::
		private function p_us_no(event:IOErrorEvent):void
		{
			FlaTracer.log('p_us_no');
			
			_tf1v += 'Empty\n';			
			p_us_next(false);
		}
		
		// ::
		private function p_us_yes(event:Event):void
		{
			FlaTracer.log('p_us_yes');
			
			var t_rv:String = _us.readUTFBytes(_us.bytesAvailable);
			if (!StringUtil.is_empty(t_rv))
			{
				var t_is:String = '';
				//FlaTracer.log('p_us_yes~~~~1');
				
				for each (var t_re:RegExp in _res)
				{
					var t_mo:Object;
					var t_mv:String;
					if (t_re.global)
					{
						while ((t_mo = t_re.exec(t_rv)) != null)
						{
							t_mv = t_mo[0];
							if (!StringUtil.is_empty(t_mv))
							{
								t_is += t_mv + '\n';
							}
						}
						//FlaTracer.log('p_us_yes~~~~2');
					}
					else
					{
						if ((t_mo = t_re.exec(t_rv)) != null)
						{
							t_mv = t_mo[0];
							if (!StringUtil.is_empty(t_mv))
							{
								t_is += t_mv + '\n';
							}							
						}
						//FlaTracer.log('p_us_yes~~~~3');
					}
				}			
				
				//FlaTracer.log('p_us_yes~~~~4');
				_tf1v += t_is;
			}
			
			p_us_next(false);
		}
	
		// ::
		private function p_us_next(bFirst:Boolean):void
		{
			if (bFirst)
			{
				_lc = 0;
			}
				
			if (_lc < _lcl)
			{
				var t_url:String = _urls[_lc++];
				if (StringUtil.is_empty(t_url) ||
					(t_url.charAt(0) == ';'))
				{
					p_us_next(false);					
				}
				else
				{
					try
					{
						var t_ur:URLRequest = new URLRequest(t_url);
						_us.load(t_ur);
					}
					catch (e:Error)
					{
						FlaTracer.log(e.toString());
					}
				}				
			}
			else
			{
				_tf1.text = _tf1v;
				_tf1.scrollV = _tf1.maxScrollV;
				
				p_us_stop();
				
				//FlaTracer.log('마무리~');
				p_msg('Work Completed~');
			}
			
			//FlaTracer.log('_lc: ' + _lc);
			//FlaTracer.log('_lcl: ' + _lcl);
		}
		
		// ::
		private function p_us_stop():void
		{
			if (_urls == null) return;
			
			try
			{
				_us.close();
			}
			catch (e:Error) {}
			
			_urls = null;
			_res = null;
			
			p_msg('Work Stpped~');
		}
		
		// ::
		private function p_us_start():void
		{
			if (_urls == null)
			{				
				var t_v2:String = _tf2.text;
				var t_v3:String = _tf3.text;
				if (!StringUtil.is_empty(t_v2) &&
					!StringUtil.is_empty(t_v3))
				{
					_urls = t_v2.split('\r');
					_lcl = _urls.length;
					_lc = 0;
					
					var t_lss:Array = t_v3.split('\r');
					for each (var t_ls:String in t_lss)
					{
						var t_re:RegExp = p_get_posp(t_ls);
						if (t_re != null) {
							if (_res == null)
								_res = [];
							_res.push(t_re);							
						}
					}
					
					if ((_lcl > 0) && (_res != null))
					{
						p_clear1_click(null);
						p_us_next(true);
						
						p_msg('Work Started~');
					}
					else
					{
						_urls = null;
						
						p_msg('Work Failed~');
					}
				}
				else
				{
					p_msg('Work Failed~');
				}
			}
			else
			{
				p_msg('Work Proceeding~');
			}
		}
		
	}
	
}




