require "palette"
require "sprites"

function loop(frame)
    
    for i = 1, #Palette do
        local color = Palette[i]
        ui.palset(i - 1, color)
    end

    ui.clip(0,0,480,270)
    ui.camera(0,0)
    ui.cls(Palette.hex(0x45283c))
    
    ui.print("Derrube as fronteirass!", 32, 32, Palette.hex(0xFFFFFF))

    larg_tijolo = 10
    x0 = 15
    y0 = 15
    tijolo_larg = 100
    tijolo_alt = 100
    i = 1
    ui.rect(x0*i , x0*i + tijolo_larg, y0*i, y0*i+tijolo_alt, 8)
    x0 = 50
    y0 = 60
    x1 = 90
    y1 = 100
    ui.rectfill(x0, y0, x0+40, y0+50, 8)
    ui.spr(Sprites.heroi, 100, 100)    
end 
