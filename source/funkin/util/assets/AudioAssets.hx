/*
 * Apache License, Version 2.0
 *
 * Copyright (c) 2021 MasterEric
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * AudioAssets.hx
 * Contains static utility functions used for working with audio assets.
 */
package funkin.util.assets;

import funkin.behavior.Debug;
import openfl.Assets as OpenFlAssets;

class AudioAssets
{
	public static function cacheSound(soundPath:String)
	{
		FlxG.sound.cache(soundPath);
	}

	/**
	 * Plays the provided audio track.
	 */
	public static function playSound()
	{
	}

	/**
	 * Attempts to load and play the provided audio track. Overrides the current background music track.
	 * Only one music track can be loaded at a time.
	 */
	public static function playMusic(songPath:String, shouldCache:Bool = true, volume:Float = 1, looped:Bool = false)
	{
		if (shouldCache)
			cacheSound(songPath);

		if (LibraryAssets.soundExists(songPath))
		{
			FlxG.sound.playMusic(songPath, volume, looped);
		}
		else
		{
			Debug.logError('Could not play music ($songPath) because the file does not exist.');
		}
	}

	/**
	 * Returns whether music has played with `AudioAssets.playMusic()`
	 * @return Bool
	 */
	public static function isMusicLoaded():Bool
	{
		return FlxG.sound.music != null;
	}

	/**
	 * Pause the currently playing background music if it has started playing.
	 * Starting it again can be done by simply calling `AudioAssets.resumeMusic()`.
	 */
	public static function pauseMusic()
	{
		FlxG.sound.music.pause();
	}

	/**
	 * Resume the currently playing background music if it has been paused.
	 */
	public static function resumeMusic()
	{
		FlxG.sound.music.play();
	}

	/**
	 * Stop the currently playing background music if it has started playing.
	 * Starting it again requires calling `AudioAssets.playMusic()` again.
	 */
	public static function stopMusic()
	{
		FlxG.sound.music.stop();
	}
}
