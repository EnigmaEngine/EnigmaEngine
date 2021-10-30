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
 * StrumlineArrow.hx
 * A sprite which is used for the strumline.
 * Graphics loading is handled by EnigmaNote, but this keeps track of its own angle
 * so it can be adjusted and rotated by modcharts. 
 */
package funkin.ui.component.play;

import flixel.animation.FlxBaseAnimation;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

using hx.strings.Strings;

class StrumlineArrow extends FlxSprite
{
	/**
	 * Flag which is set to true if a Lua Modchart has modified this arrow's position.
	 */
	public var luaModifiedPos:Bool = false;

	/**
	 * The sprite angle as handled by a Lua Modchart.
	 */
	public var modAngle:Float = 0; // The angle set by modcharts

	/**
	 * The sprite angle as handled by this strumline arrow.
	 */
	public var localAngle:Float = 0; // The angle to be edited inside here

	public function new(xx:Float, yy:Float)
	{
		x = xx;
		y = yy;
		super(x, y);
		updateHitbox();
	}

	override function update(elapsed:Float)
	{
		if (!luaModifiedPos)
			angle = localAngle + modAngle;
		else
			angle = modAngle;
		super.update(elapsed);

		// TODO: What the HELL?
		if (FlxG.keys.justPressed.THREE)
		{
			localAngle += 10;
		}
	}

	public function playAnim(AnimName:String, ?force:Bool = false):Void
	{
		animation.play(AnimName, force);

		if (!AnimName.startsWith('dirCon'))
		{
			localAngle = 0;
		}
		updateHitbox();
		offset.set(frameWidth / 2, frameHeight / 2);

		offset.x -= 54;
		offset.y -= 56;

		angle = localAngle + modAngle;
	}
}
