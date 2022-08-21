// COLOQUE ESTE CÓDIGO NO STEP EVENT

#region controles
var key_left  =  keyboard_check(vk_left) or keyboard_check(ord("A"))
var key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
var key_jump  =                     keyboard_check_pressed(vk_space)
var key_run   =                             keyboard_check(vk_shift)
#endregion

var key_difference = key_right - key_left

//calculando estados
onground = place_meeting(x,y+1,obj_wall);
wallTouch = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall)
#region aceleracao e velocidade
//correre e andar
if(key_run)
{
	accel = run_accel
	maxspd = run_maxspd
}
else
{
	accel = walk_accel 
	maxspd = walk_maxspd 
}

//alteração de direção
if ((key_right)) facing = 1 //define direcao com x positivo
if ((key_left)) facing = -1 //define direcao com x negativo
hspd = spd //multiplica direcao por velocidade
vspd = vspd + grv //soma vspd com a gravidade



//aceleração e desaceleração
if((key_difference) != 0)
{
	//spd = lerp(spd,maxspd, accel) //aumenta a velocidade com base na variavel accel
}
else  if ((key_difference) == 0){
	if(onground)spd = lerp(spd,0, atrito) //diminui a velocidade com base no atrito	
	else if(!onground)spd = lerp(spd,0, 0.01) //diminui a velocidade com base no atrito	
}

spd = clamp(spd,-maxspd,maxspd)
if(key_difference != 0)spd += key_difference*atrito
if(key_difference == 0)spd -= key_difference*atrito
if(wallTouch != 0 and sign(spd) == sign(wallTouch)) spd = 0
#endregion

#region colisao / movimento

//colisao horizontal
if(place_meeting(x+hspd,y,obj_wall))
{
	while(!place_meeting(x+sign(hspd),y,obj_wall))
	{
		//quando não colide
		x = x + sign(hspd);
	}
	hspd = 0;
}

x += hspd

//colisao vertical
if(place_meeting(x,y+vspd,obj_wall))
{
	while(!place_meeting(x,y+sign(vspd),obj_wall))
	{
		//quando não colide
		y = y + sign(vspd);
	}
	vspd = 0;
	doublejump = 2
	
}

vspd = clamp(vspd,-jmp_force,10)
y += vspd


#endregion

#region acrobacias

if(key_jump and doublejump > 0)
{
	vspd = 0
	vspd -= jmp_force
}

if(key_jump)
{
	doublejump--
}
if(doublejump <= 0) doublejump = 0

#endregion
