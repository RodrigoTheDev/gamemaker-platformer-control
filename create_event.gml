//==== INSIRA ESSE CÓDIGO NO CREATE EVENT ====
hspd = 0 //variável horizontal
vspd = 0 //variável vertical
spd = 0 //variável de velocidade
accel = 0 //aceleração
maxspd = 0 //velocidade máxima
//velocidade andando
walk_accel = 0.05 //valor que incrementa a velocidade
walk_maxspd = 5 //velocidade máxima que pode ser atingida

//velocidade correndo
run_accel = 0.07
run_maxspd = 7

//física (gravidade e queda)
atrito = 0.3 //valor que decrementa a velocidade
facing = 1 //direção que a velocidade está
grv = 0.7 //gravidade
jmp_force = 12 //força do pulo que será acrescentado no vspd
wallTouch = 0

//estados
onground = false
doublejump = 2
