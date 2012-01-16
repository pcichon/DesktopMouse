/**
 * DekstopMouse // Adobe AIR3.*
 * 
 * Source: https://github.com/pcichon/DesktopMouse
 * 
 * @author		Pawel Cichon
 * @version		0.1
 */

package com.genesi.mouse
{
	import com.genesi.mouse.DesktopMouse;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.IDataInput;
	import flash.utils.Timer;
	
	public class DesktopMouseMonitor
	{
		private static var _mousePoint:Point;
		private static var _events:Array;		
		private static var _p:DesktopMouse
		private static var _t:Timer;
		
		public static function initialize():void
		{
			_mousePoint = new Point;
			_events = new Array();
			_p = new DesktopMouse();
			_t = new Timer(10);
			_t.addEventListener(TimerEvent.TIMER,updateMouse);
		}
		
		public static　function start():void
		{
			_t.start();
		}
		
		public static　function stop():void
		{
			_t.stop();
		}
		

		public static　function updateMouse(e:Event):void
		{
			var obj:Object = _p.getMouseXY();
			_mousePoint.x = obj.x;
			_mousePoint.y = obj.y;
			
			for each (var element:Function in _events)
			{
				element.apply(element);	
			}			
		}
		
		public static function addEvent(event:Function):void
		{
			_events.push(event);
		}
		
		public static function dispatchEvent(event:Function):void
		{
			if (_events.indexOf(event) != -1)
				_events.splice(_events.indexOf(event));
		}

		public static　function get mousePoint():Point { return _mousePoint; }
		
	}
}