require "palette"
require "sprites"
player = {x = 100, y = 100, dir_x = 0, dir_y = 0, sprite = Sprites.heroi}
--inimigos = []
bala = {x = 100, y = 100, vx = 0, vy = 0, raio = 10} -- , sprite = Sprites.bala}
balas = {}
RAIO_BALA = 5
function atirar(atirador)
    balas[#balas+1] = {x = atirador.x, y = atirador.y, vx = atirador.dir_x, vy = atirador.dir_y, 
                       raio = 5, cor = 4}
end

function loop(frame)    
    for i = 1, #Palette do
        local color = Palette[i]
        ui.palset(i - 1, color)
    end

    ui.clip(0,0,480,270)
    ui.camera(0,0)
    ui.cls(Palette.hex(0x45283c))
    
    ui.print("Balas [" .. #balas .. "]" , 12, 12, Palette.hex(0xFFFFFF))

    tijolo_larg = 16
    tijolo_alt = 16
    i = 1
    x0 = 50
    y0 = 60
    ui.rectfill(x0, y0, x0+tijolo_larg, y0+tijolo_alt, 3)
    ui.spr(player.sprite, player.x, player.y)    

    player.dir_x = 0
    player.dir_y = 0
    if ui.btn(LEFT) then
      player.dir_x = -1 
    elseif ui.btn(RIGHT) then
      player.dir_x = 1 
    end
    if ui.btn(UP) then
      player.dir_y = -1 
    elseif ui.btn(DOWN) then
      player.dir_y = 1         
    end

    player.x = player.x + player.dir_x
    player.y = player.y + player.dir_y

    if ui.btnp(BTN_X) then
       atirar(player)
    end

    -- desenhar()
    --if player.x > X_MAX
    --elseif

    for i=1, #balas do
        balas[i].x = balas[i].x + balas[i].vx
        balas[i].y = balas[i].y + balas[i].vy
        msg = "i=[" .. i .. "] x=[" .. balas[i].x .. "] " .. "y [" .. balas[i].y .. "]" ..
                    " cor=" .. balas[i].cor .. "]" .. "raio = [" .. balas[i].raio .. "]"
        ui.print(msg, 12, 52, Palette.hex(0xFFFFFF))        
        ui.circfill(balas[i].x, balas[i].y, balas[i].raio, balas[i].cor)
    end
end 
