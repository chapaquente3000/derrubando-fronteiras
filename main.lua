require "palette"
require "sprites"
player = {x = 100, y = 100, sprite = Sprites.heroi}
function loop(frame)
    
    for i = 1, #Palette do
        local color = Palette[i]
        ui.palset(i - 1, color)
    end

    ui.clip(0,0,480,270)
    ui.camera(0,0)
    ui.cls(Palette.hex(0x45283c))
    
    ui.print("Derrube as fronteirass!", 32, 32, Palette.hex(0xFFFFFF))

    tijolo_larg = 16
    tijolo_alt = 16
    i = 1
    x0 = 50
    y0 = 60
    ui.rectfill(x0, y0, x0+tijolo_larg, y0+tijolo_alt, 3)
    ui.spr(player.sprite, player.x, player.y)    

    if ui.btn(LEFT) then
      player.x = player.x - 1
    elseif ui.btn(RIGHT) then
      player.x = player.x + 1
    elseif ui.btn(UP) then
      player.y = player.y - 1
    elseif ui.btn(DOWN) then
      player.y = player.y + 1
    end

end 
