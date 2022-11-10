# LocalPlayer++
An extension for the player. Useful when making a FE script.
# Documentation
Here's a short guide on how to use this. I'd recommend you to read the documentation.
## Netless Functions
To implement netless you need to set it up and then Enable or Disable it.
### Setup Netless
```lua
<void> game.Players.LocalPlayer:SetupNetless(<bool> DefaultValue)
```
### Enable Netless
```lua
<void> game.Players.LocalPlayer:EnableNetless()
```
### Disable Netless
```lua
<void> game.Players.LocalPlayer:DisableNetless()
```
### Reset Netless
Will destroy the netless loop.
```lua
<void> game.Players.LocalPlayer:ResetNetless()
```
## Reanimation functions
