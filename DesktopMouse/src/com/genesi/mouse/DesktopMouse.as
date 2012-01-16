/**
 * DesktopMouse // Adobe AIR3.*
 * 
 * Source: https://github.com/pcichon/DesktopMouse
 * 
 * @author		Pawel Cichon
 * @version		0.1
 */

package com.genesi.mouse
{
	import flash.display.BitmapData;
	import flash.external.ExtensionContext;
	import flash.utils.ByteArray;
	
	public class DesktopMouse
	{
		private var context:ExtensionContext;
		
		public function DesktopMouse()
		{
			context = ExtensionContext.createExtensionContext('com.genesi.mouse.DesktopMouse', '');
		}
						
		public function getMouseXY():Object
		{
			var obj:Object = new Object();			
			context.call('getMouseXY',obj)
			return obj;			
		}
					
	}
}