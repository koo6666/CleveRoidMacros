# CleveRoid Macros
This was originally an effort to bring the dynamic tooltip and cast sequence functionality of [CleverMacro](https://github.com/DanielAdolfsson/CleverMacro) into [Roid-Macros](https://github.com/MarcelineVQ/Roid-Macros).  It has since expanded after some additional changes I wanted along with feedback from others.  The majority of credit goes to the original authors.  Still a work in progress.

Both [SuperWoW](https://github.com/balakethelock/SuperWoW) and [Nampower](https://github.com/pepopo978/nampower) are recommended and in some cases requred.

---

## Known Issues
* Medium: Because this addon is constantly checking conditions for all macros on your actionbars, if you improperly create a macro, in some certain cases it can cause strange UI issues including not displaying any icons, other macros not working or lua errors.  Fix the macro or remove it from your actionbar and it should go back to normal automatically.  Depending on the cause, you may need to reload your UI (/rl).  If you find one of these and can reproduce the issue, let me know.
* Minor: There may be an odd interaction with [SuperWoW](https://github.com/balakethelock/SuperWoW) and/or [Nampower](https://github.com/pepopo978/nampower) and randomly seeing "Unknown Unit" on the screen -- still trying to work out the root cause.  
* Minor: Macros will light up on the action bars the same as non-macro buttons do however if you have conditionals or more than one spell you must put the plain spell anywhere on your actionbars.  This is also true for reactive abilities for basically the same reasons.
* I have not tested all possible combinations of conditionals or ways to break things.  Find me on Discord or open an issue if you find any bugs or have feedback.

---

# What's Different

## Commands and Conditionals
### ***Important! Spells, Items, conditionals, etc are case sensitive.  Barring a bug, if there is an issue, it's almost always because something is typed incorrectly.***  

* Renamed `attacking`/`noattacking` contitionals to `targeting`/`notargeting` for better clarity of what they do.
* All conditionals that should have an implied target of @target now do
* Conditionals can be separated by comma or space
* Conditional arguments with spaces that would need to be replaced with underscores (`_`) can instead be enclosed in quotes.
* Updated syntax for conditionals with stack/time checking  
  * You can use `>, <, =, ~=, >=, <=` as valid operators.  Include a `#` sign to designate you're checking the stack's, not time
    * Operators should be placed after the colon, either by itself (if applicable) or after the argument
      `[power:>20]`, `[debuff:"Sunder Armor<#5"]`, `[buff:Thorns<30]`
  * Omitting an operator or amount will just check that the buff/debuff exists  
  * When stack checking, omitting an operator assumes equals (=)  
  `[debuff:"Sunder Armor#3]` is the same as `[debuff:"Sunder Armor=#3]`  
  * Omitting the argument entirely will assume you want to use the action in the condition check  
  `[nobuff] Power Word: Fortitude` is the same as `[nobuff:"Power Word: Fortitude"] Power Word: Fortitude`
* Updated most conditionals (that make sense) to allow for multiple arguments.  Use a / to separate them.
* Added `plain` [mod] and [nomod] to conditionals
* Added `alive` conditional
* Added `member` conditional
* Added `form` conditional (an alias of stance)
* Added Priest Shadow Form to `stance`/`form` conditionals.  Use `[stance:1]` or `[form:1]`
* Added Rogue Stealth to `stance`/`form` conditionals.  Use `[stance:1]` or `[form:1]`
* Added `combo` conditional
* Added `known` conditional
* Added `resting` conditional
* Changed `cooldown` conditional to ignore the GCD (will show usable if the cooldown is exactly 1.5 seconds) -- It felt better but not 100% on keeping this, send feedback.
* Added `cdgcd` conditional that works the same as `cooldown` that will trigger for any length of cooldown
* Added `inrange` conditional ([Nampower](https://github.com/pepopo978/nampower) required)
* Added changes to make usable/mana/range updating show properly in pfUI.
* Added Bongos action bars compatibility support
* Added /runmacro command. Same as /cast {macroname} but always ignores icon/tooltip
* Added /retarget command: Clears your target if it doesn't exist, has 0 hp or if you can't attack it and then targets the nearest enemy
* Added ? flag to prevent an action from affecting the icon/tooltips.  It must be the first character. 
* Updated ! flag as a way to easily make spammable abilities.  For non-auto repeating abilities, it's really just a shortcut for `nomybuff`
* Added ~ flag to either cast or cancel the buff/aura if possible
* Tested with vanilla, ShaguTweaks, pfUI and Bongos

    ```lua
    #showtooltip
    /use ?Some Item
    /cast [reactive] Overpower; Heroic Strike
    ```


## Dynamic Icons and Tooltips
* The icon and tooltip for a macro will automatically update to the first true condition's action.  Left to right, top to bottom.
* Consumables and certain other item types will now show a count on the action bar.
* Spells with reagent costs will now show a count.
* Full `#showtooltip` support with dynamic icons and tooltips
  * A macro must start with `#showtooltip` or `#showtooltip spell/item/itemid`. The icons and tooltips will update on your bars as the conditions are met.

    ```lua
    #showtooltip
    /cast [mod:alt] Frostbolt; [mod:ctrl] Fire Blast; [mod:shift] {MyMacro}; Blink
    ```
    ```lua
    #showtooltip
    /cast [stance:1/3, nocooldown:"Mocking Blow", notargeting:player] Mocking Blow
    /cast [stance:2/3, nocooldown:Taunt, notargeting:player] Taunt
    /cast Shield Slam
    ```
    
    One line or separate lines are valid, sometimes one is better than the other

    ```
    #showtooltip
    /cast [zone:Ahn'Qiraj] Yellow Qiraji Battle Tank;[nozone:Orgrimmar/Undercity/"Thunder Bluff" nomybuff:"Water Walking"] Red Goblin Shredder;Plainsrunning
    ```
    Is the same as
    ```
    #showtooltip
    /cast [zone:Ahn'Qiraj] Yellow Qiraji Battle Tank
    /cast [nozone:Orgrimmar/Undercity/"Thunder Bluff" nomybuff:"Water Walking"] Red Goblin Shredder
    /cast Plainsrunning
    ```

  
* Updated `/castsequence` support.  See [below](#cast-sequence)
* Added support for updating to the icon/tooltip of the {macro} named in a another macro
  * Macro 1 calls Macro 2 and will update the icon when out of combat with Arcane Missiles from Macro2's `#showtooltip`  
    
    ***Note: This will only use the icon/tooltip of either the referenced `#showtooltip <spell/item/itemid>` or the icon you set for the macro.***  
      
      Macro 1:
    ```lua
    #showtooltip
    /cast [nocombat] {Macro2}; Fireball
    ```  
    Macro 2
    ```lua
    #showtooltip Arcane Missiles
    /cast [mod] Conjure Food
    /use 2288
    ```
* Added support for itemid lookup instead of the item's name.  Using this will show the icon/tooltip even if you don't have the item cached or in your inventory so you don't see ? icons.  e.g. No Mage food/water on login

    ```lua
    #showtooltip
    /use [nomod] 5350
    /cast [mod] Conjure Water
    ```

---

# Usage
## Slash Commands
| Command               | Purpose |
|-----------------------|---------|
| /retarget             | Clears your target if it doesn't exist, has 0 hp or if you can't attack it and then targets the nearest enemy. |
| /startattack          | Starts auto-attacking. |
| /stopattack           | Stops auto-attacking. |
| /stopcasting          | Stops casting. |
| /petattack            | Starts your pet's auto-attack. |
| /castsequence         | Performs a cast sequence.  See below for more infomation. |
| /equip                | Equips an item by name or itemid. |
| /equipoh              | Equips an item by name or itemid into your offhand slot. |
| /unshift              | Cancels your current shapeshift form. |
| /cancelaura, /unbuff  | Cancels a valid buff/aura. |
| /runmacro             | Runs a macro.  Use /runmacro {macroname}


## Cast Sequence
  ```lua
  #showtooltip
  /castsequence reset=3 Fireball, Frostbolt, Arcane Explosion, Fire Blast
  ```
* Dynamic icons and tooltips on each sequence with range/mana/usable checks
* Supports reset=#/mod/target/combat
* Supports conditionals for the entire sequence, not individual actions within the sequence.  
  ```lua
  #showtooltip
  /castsequence [group:party/raid] reset=3/target Sweaty Spell 1, Sweaty Spell 2, Sweaty Spell 3
  /castsequence reset=target/combat Casual Spell 1, Casual Spell 2, Casual Spell 3
  ```

* [SuperWoW](https://github.com/balakethelock/SuperWoW) dll mod is required
* [Nampower](https://github.com/pepopo978/nampower) dll mod required for range checking



## Conditionals
* Multiple conditionals can be used, separated with a space or comma.  
* Spells and items with spaces in the name need to use underscores (`_`) instead of spaces or be enclosed in quotations.  
  ```
  #showtooltip
  /use [@mouseover alive help hp:<70 nodebuff:"Recently Bandaged"] Runecloth Bandage
  /use [@target alive help hp:<70 nodebuff:"Recently Bandaged"] Runecloth Bandage
  /use [@player] Runecloth Bandage
  ```
* If a conditional is marked as Multi you can provide multiple values in the same condition.  
  `[targeting:party1/party2/party3/party4]` -- targeting one of your party members  
  `[zone:Stormwind/Ironforge]` -- in Stormwind or Ironforge  
* If a conditional is marked as Noable you can prefix the condition with "no" to test the opposite condition.  
   `[notargeting:player]` -- not targeting the player  
   `[nozone:Stormwind/Ironforge]` -- not in Stormwind or Ironforge  
* You can specifiy a target unit for the macro by adding in a valid @unitid  
   `/cast [@party1 combat] Intervene`  -- casts Intervene on party member 1 if you (player) are in combat  
* @focus / focus can be used as an @unitid / conditional unitid however Vanilla does not support focus targets, a compatible addon is required to make this function.
* If the conditional allows for a numerical comparison, the format is `condition:>X` or `condition:>#X` depending if you are comparing time or "stacks".  For things that do not have time (combo, known, hp, power, etc) the `#` is technically ignored so either syntax works.
* [SuperWoW](https://github.com/balakethelock/SuperWoW) dll mod is required for some conditionals
* [Nampower](https://github.com/pepopo978/nampower) dll mod required for some conditionals

### Special Characters
| Character    | Syntax        | Description |
|     :-:      |---------------|-------------|
| !            | !Attack<br/>!Cat Form<br/>!Spell Name | Prefix on spell name.<br/>Will only use the spell if it's not already active.<br/>Can also be used with other spells as shorthand for `nomybuff`   |
| ?            | ?[equipped:Swords]</br>?Presence of Mind | Prevents the icon and tooltip from showing.<br/>Must be the first character. |
| ~            | ~Slow Fall    | Prefix on spell name.<br/>Will cast or cancel the buff/aura if possible. |

### Key Modifiers
| Conditional    | Syntax        | Multi | Noable | Tests For |
|----------------|---------------|  :-:  | :-:    |-----------|
| mod            | [mod]<br/>[mod:ctrl/alt/shift] | * | * | If one or more modifier keys are pressed. |


### Player Only
| Conditional    | Syntax        | Multi | Noable | Tests For |
|----------------|---------------|  :-:  | :-:    |-----------|
| cdgcd          | [cdgcd:"Spell or Item Name"]<br/>[cdgcd:"Spell or Item Name">X]<br/>[cdgcd:"Spell or Item Name"<X] | * | * | If the Spell or Item is on cooldown and optionally if the amount of time left is >= or <= than X seconds.  **GCD NOT IGNORED** |
| checkchanneled | [checkchanneled:Spell/Attack/Shoot] |  |  | If the player is channeling the given spell, is auto attacking, auto shooting or wanding. |
| channeled      | [channeled] |  |  | If the player is currently channeling a spell. |
| combat         | [combat] |  | * | If the player is in combat. |
| combo          | [combo:>#3]<br/>[combo:#2]</br>[combo:<#5] |   |  * |  If the player has the specified number of combo points. |
| cooldown       | [cooldown:"Spell Or Item Name"]<br/>[cooldown:"Spell or Item Name">X]<br/>[cooldown:"Spell or Item Name"<X] | * | * | If the Spell or Item is on cooldown and optionally if the amount of time left is >= or <= than X seconds. **GCD (if exatly 1.5 sec) IGNORED** |
| equipped       | [equipped:"Item Name"]<br/>[equipped:Shields]<br/>[equipped:Daggers2] | * | * | If the player has an item or item type equipped.  See below for a list of valid Weapon Types. |
| form           | [form:0/1/2/3/4/5] | * |  | Alias of stance |
| group          | [group]<br/>[group:party/raid] | * | * | If the player is in a group. |
| known          | [known:"Spell"]</br>[known:"Talent>#2"] | * | * | If the player knows a spell or talent.  Can optionally check the rank. |
| mybuff         | [mybuff:"Buff Name"]<br/>[mybuff:"Buff Name">#X]<br/>[mybuff:"Buff Name"<#X] | * |  | If the player has a buff of the given name and optionally if it has >= or <= X number of stacks. |
| mydebuff       | [mydebuff:"Debuff Name"]<br/>[mydebuff:"Debuff Name">#X]<br/>[mydebuff:"Debuff Name">=#X] | * |  | If the player has a debuff of the given name and optionally if it has >= or <= than X number of stacks. |
| myhp           | [myhp:<=X]<br/>[myhp:~=Y] |  |  | If the player health is >= or <= than Y percent. |
| mypower        | [mypower:=X]<br/>[mypower:>=Y] |  |  | If the player has power (mana/rage/energy) >= or <= than Y percent. |
| myrawpower     | [myrawpower:>X]<br/>[myrawpower:<=X] |  |  | If the player has power (mana/rage/energy) >= or <= than Y. |
| reactive       | [reactive:"Spell Name"] | * |  | If the player has a reactive ability (Revenge, Overpower, Riposte, etc.) available to use.<br/><br/>**NOTE: Currently requires the reactive ability to be somewhere on your actionbars in addition to any macros you're using it in.** |
| stance         | [stance:0/1/2/3/4/5] | * |  | If the player is in stance #.<br/>Supports Shadow Form as stance 1.|
| stealth        | [stealth] |  | * | If the player is in Stealth. |
| zone           | [zone:"Zone Name"/"Other Zone Name"] | * | * | If the player is in one or more zones of the given name. |


### Unit Based
### The default @unitid is usually @target if you don't specify one
| Conditional    | Syntax        | Multi | Noable | Tests For |
|----------------|---------------|  :-:  | :-:    |-----------|
| alive          | [alive]       |       |        | If the @unitid is NOT dead or a ghost. |
| buff           | [buff:"Buff Name"]<br/>[buff:"Buff Name">#X]<br/>[buff:"Buff Name"<#X] |  | * | If the @unitid has a buff of the given name and optionally if it has >= or <= than X number of stacks. |
| casting        | [casting]<br/>[casting:"Spell Name"] | * |  * |  If the @unitid is casting any or one or more specific spells. |
| dead           | [dead]        |       |        | If the @unitid is dead or a ghost. |
| debuff         | [debuff:"Debuff Name"]<br/>[debuff:"Debuff Name">#X]<br/>[debuff:"Debuff Name"<#X] |  | * | If the @unitid has a debuff of the given name and optionally if it has >= or <= than X number of stacks. |
| harm           | [harm]        |       |        | If the @unitid is an enemy. |
| help           | [help]        |       |        | If the @unitid is friendly. |
| inrange        | [inrange]<br/>[inrange:"Spell Name"] | * | * | If the specified @unitid is in range of the spell. |
| member         | [member]      |       |    *   | If the @unitid is in your party OR raid. |
| party          | [party]       |       |    *   | If the @unitid is in your party. |
| raid           | [raid]        |       |    *   | If the @unitid is in your raid.  |
| power          | [power>X]<br/>[power<Y] |  |  | If the @unitid has power (mana/rage/energy) >= or <= than Y percent. |
| rawpower       | [rawpower>X]<br/>[rawpower<X] |  |  | If the @unitid has power (mana/rage/energy) >= or <= than Y. |
| hp             | [hp>X]<br/>[hp<Y] |  |  | If the @unitid health is >= or <= than Y percent. |
| type           | [type:"Creature Type"] | * | * | If the @unitid is the specified creature type.  See below for a list of valid Creature Types. |
| targeting      | [targeting:unitid] | * | * | If the @unitid is targeting the specified unitid.<br/>See this [article](https://wowpedia.fandom.com/wiki/UnitId) for a list of unitids.<br/>Not all units are valid in vanilla. |
| isplayer       | [isplayer:unitid] | * |  | If the unitid is a player.<br/>See this [article](https://wowpedia.fandom.com/wiki/UnitId) for a list of unitids.<br/>Not all units are valid in vanilla. |
| isnpc          | [isnpc:unitid] | * |  | If the unitid is an npc.<br/>See this [article](https://wowpedia.fandom.com/wiki/UnitId) for a list of unitids.<br/>Not all units are valid in vanilla. |


### Weapon Types
| Name | Slot |
|------|------|
| Axes, Axes2 | Main Hand, Off Hand |
| Bows | Ranged |
| Daggers, Daggers2 | Main Hand, Off Hand |
| Crossbows | Ranged |
| Fists, Fists2  | Main Hand, Off Hand |
| Guns | Ranged |
| Maces, Maces2 | Main Hand, Off Hand |
| Polearms | Main Hand |
| Shields | Off Hand |
| Staves | Main Hand |
| Swords, Swords2 | Main Hand, Off Hand |
| Thrown | Ranged |
| Wands | Ranged |


### Creature Types
| Name |
|------|
| Boss |
| Worldboss |
| Beast |
| Dragonkin |
| Demon |
| Elemental |
| Giant |
| Undead |
| Humanoid |
| Critter |
| Mechanical |
| Not specified |
| Totem |
| Non-combat Pet |
| Gas Cloud |

### Reactive Spells (twow)
| Name          |
|---------------|
| Revenge       |
| Overpower     |
| Riposte       |
| Mongoose Bite |
| Counterattack |
| Arcane Surge  |


# Compatibility
Compatibility should be the same as the original CleverMacro and Roid-Macros however I have not fully tested that.  


### UnitFrames
* agUnitFrames
* Blizzard's UnitFrames
* CT_RaidAssist
* CT_UnitFrames
* DiscordUnitFrames
* FocusFrame
* Grid
* LunaUnitFrames
* NotGrid
* PerfectRaid
* pfUI
* sRaidFrames
* UnitFramesImproved_Vanilla
* XPerl


### Action Bars
* Blizzard's Action Bars
* Bongos
* Discord Action Bars
* pfUI


### Supported Addons
* ClassicFocus / FocusFrame
* SuperMacro
* ShaguTweaks



----
License
----

MIT
