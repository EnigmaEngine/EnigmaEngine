/*
 * GNU General Public License, Version 3.0
 *
 * Copyright (c) 2021 MasterEric
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * FunneUtil.hx
 * Contains static utility functions used for doing funny weird stuff.
 */
package funkin.util;

import flixel.FlxG;

class FunneUtil
{
	/**
	 * Crashes the game, like Bob does at the end of ONSLAUGHT.
	 * Only works on SYS platforms like Windows/Mac/Linux/Android/iOS
	 */
	public static function crashTheGame()
	{
		#if sys
		Sys.exit(0);
		#end
	}

	/**
	 * Opens the given URL in the user's browser.
	 * @param targetURL The URL to open.
	 */
	public static function openURL(targetURL:String)
	{
		// Different behavior for certain platforms.
		#if linux
		Sys.command('/usr/bin/xdg-open', [targetURL, "&"]);
		#else
		FlxG.openURL(targetURL);
		#end
	}
}
