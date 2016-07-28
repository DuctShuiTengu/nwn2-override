______________________________________________________

Welcome to 'Adonnays Elven Weaponry'!
______________________________________________________

Category: Weapons Mod
Game: Neverwinter Nights 2
Version: 0.95
Status: Beta
Type: Override


______________________________________________________

Introduction:
______________________________________________________

As some of you might know I've done a few weapons for Oblivion because the stock weapons simply didn't live up to my expectations, especially concerning the elven weapons. So I've dug myself into my little room and started modelling. The outcome is far from perfect, whenever I look at the weapons I find lots of things that I'd change now that I've become a little more experienced. 
When I bought NWN2, one of the first things I noticed were the insanely large and bulky lego-style swords. No offense to Obsidian here, I suppose they are exactly like they wanted them to be. It just happens that I have a different taste. So I decided to convert my Oblivion mod to Neverwinter Nights 2 since I will be playing that for the next months to come ;). I'd like to create new stuff as well (for Oblivion and NWN2) but right now my time is very limited... unfortunately.
You probably won't be reading my rambling here anyway so I'll cut this here and come to the point.




______________________________________________________

What this mod does:
______________________________________________________

This mod adds a variety of weapons to NWN2. It does not replace any of the stock weapons (right now) so it's mainly a kind of resource pack for modders or those who want to give themselves a unique weapon (via the console). Right now all weapons come unpacked as .mdb files together with their textures. Those who know the Oblivion-version of this mod will recognize the weapons I suppose, but I'll write down their Oblvion-name next to them. 

To spawn the weapons via the console make sure you enable the Debug Mode before you do so (command: "DebugMode 1") and disable it again when you're done (command: "DebugMode 0"). The spawncode is used together with the giveitem command (i.e. "giveitem ad_longblade02"), make sure you have a character selected (rightclick).


______________________________________________________

What's new in this version:
______________________________________________________

0.95:
- Added a few polys to the blades so the special fx look a bit more dangerous ;)
- Tweaked a few meshes and textures (Bastard swords 05 and 06 now look slightly different than 01 and 02)
- The grip textures for bastard swords 03 and 04 (23 and 24 respectively for the long-, great- and shortswords) are now a light grey. Tints should be looking better now.

0.9:
- Added fully tintable bows (Details see Weaponlist)
- Added 1 new bastard sword 
- Added 1 new longsword


______________________________________________________

Weaponlist:
______________________________________________________

Elven style:

- 1x Knife with 6 skins (101 to 106)
	* <=> Elven Knife, spawncode: ad_knife01 to ad_knife06

- 1x Scimitar with 6 skins (101 to 106)
	* <=> Elven Sabre, spawncode: ad_sabre01 to ad_sabre06

- 1x Short Sword with 6 skins (101 to 106)
	* <=> Elven Short Sabre, spawncode: ad_shortsabre01 to ad_shortsabre06

- 1x Long Sword with 7 skins (101 to 107)
	* spawncode: ad_lsword01 to ad_lsword07

- 1x Katana with 6+3 skins (101 to 109)
	* <=> Elven Long Sabre, spawncode: ad_longsabre01 to ad_longsabre09

- 1x Falchion with 6 skins (101 to 106)
	* ad_falchion01 to ad_falchion06
	
- 1x Great Sword with 6 skins (101 to 106)
	* <=> Elven Longblade, spawncode: ad_longblade01 to ad_longblade06


Medieval style:

- 6x Short Sword
	* spawncode: ad_ssword21 to ad_ssword26

- 7x Long Sword
	* spawncode: ad_lsword21 to ad_lsword27

- 7x Bastard Sword
	* spawncode: ad_bsword01 to ad_bsword07

- 4x Greatsword
	* spawncode: ad_gsword21 to ad_gsword24

- 2x Plain Longbow
	* spawncode: ad_lbow01 & 21

- 2x Decorated Longbow
	* spawncode: ad_lbow02 & 22



______________________________________________________

Installation:
______________________________________________________

Extract the contents of this archive to your Neverwinter Nights 2 'Override'-Folder.
The folder should then contain all .mdb (mesh), .dds (texture) and .uti (blueprint) files.



______________________________________________________

Version history:
______________________________________________________

0.8:
- Added medieval style Short Swords due to numerous requests. Expect no fancy new weapons but conversions of the bastard/long/great swords.
- Removed the 'keen' attribute from the longswords, it was meant for the elven weapons only.

0.7:
- added falchions (1 mesh with 6 skins, ad_falchion01-06)
- added 2 more great swords (ad_gsword22 & 23)
- made the elven great swords (Longblades) shorter overall (shorter hilt and shorter blade) - it looked a bit weird
- reduced the polycount of the elven great swords
- added a glowing blade to the elven great swords and falchions (as a test)
- several minor tweaks to some meshes and textures

0.65:
- fixed quite some issues with the new tinting-maps in v0.6
- added 1 new medieval style greatsword (ad_gsword21)

0.6:
- Made all weapons tintable
- added a none-rune-blade for the longswords (piece 101)
- changed all textures to have mip maps

0.5:
- Finally added the knives (woot!). They only consist of one mesh/material though like the stock ones. It just wouldn't work the other way.
- Fixed the hilt of ad_bsword03, I think.

0.4:
- Added 3 more Katana skins (ad_longsabre07-09) resembling hithlain, ithildin and naith (for those familiar with the Oblivion version), with glomaps, yay!
- All weapons now have weapon trails (thanks to tazpn for pointing me into the right direction with the hook points)!
- Modified the bastard swords' blades to match better with each hilt and crossguard

0.3:
- Added 4 longswords, not really new since I 'just' converted the bastard swords
- Added 1 new greatsword, also a modified bastard sword

0.2:
- Added 2 new bastard sword meshes (ad_bsword03 and 04)
- Added a new elven style mesh as longsword (ad_lsword 01 to 07). While this does look more like a scimitar as well I decided to use it as a longsword to give those longsword-wielders something to play with as well. It comes with one additional skin (107), it's nothing special but I had it lying around here so I added it ;)
- All Blueprints now have simple stats (+1 to +5 and keen) for those who don't want to use their toolkit to customize them themselves

0.1: 
- First release, no hak version yet, only .mdb, .dds and some .uti files to spawn the weapons via console
- included in this version are 6 scimitars, 6 Short swords, 6 Katanas, 6 Greatswords and 2 Bastard Swords



______________________________________________________

Known Issues:
______________________________________________________

- some lighting glitches, probably due to fals bi-tangent calculations in Adinos' obj2mdb-tool
- thin faces (like the back of the some of the blades) cause small, bright dotted lines when zoomed out



______________________________________________________

Credits:
______________________________________________________

- Adinos, without his im-/export tool OBJ2MDB I couldn't get those weapons into the game.
- Badmagic for allowing me to use the textures he made for my Bastard Swords.