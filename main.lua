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
    
    ui.print("Derrube as fronteiras!", 32, 32, Palette.hex(0xFFFFFF))

    larg_tijolo = 10
    -- ui.rect(10, 10, 100, 50, 7)
    x0 = 15
    y0 = 15
    tijolo_larg = 100
    tijolo_alt = 100
    i = 1
    ui.rect(x0*i , x0*i + tijolo_larg, y0*i, y0*i+tijolo_alt, 7)
    
    ui.spr(Sprites.heroi, 100, 100)    
end 
