# LocalPlayer++
An extension for the player. Useful when making a FE script.
# Documentation
Here's a short guide on how to use this. I'd recommend you to read the documentation (not provided now).
## Netless Functions
To implement netless you need to set it up and then Enable or Disable it.
#### Set up Netless
DefaultValue is used to define if you want to activate netless by default. (Recommended true).
```lua
<void> game.Players.LocalPlayer:SetupNetless(<bool> DefaultValue)
```
#### Enable Netless
```lua
<void> game.Players.LocalPlayer:EnableNetless()
```
#### Disable Netless
```lua
<void> game.Players.LocalPlayer:DisableNetless()
```
#### Reset Netless
Will destroy the netless loop.
```lua
<void> game.Players.LocalPlayer:ResetNetless()
```
## Reanimation functions
To have a comfortable reanimation system, please follow the instructions.
- Set up your reanimation function
- Reanimate!
#### Set up Reanimation
```lua
<void> game.Players.LocalPlayer:SetupReanimation(<function> rfunction)
```
#### Reanimate
Callback is the function that will be executed if the function fails. Given arguments on callback: errormessage
```lua
<void> game.Players.LocalPlayer:Reanimate(<function> callback)
```
**Example usage**
```lua
<void> game.Players.LocalPlayer:Reanimate(function(errormessage)
   print("There was an error, details:", errormessage)
end)
```
