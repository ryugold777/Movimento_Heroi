extends KinematicBody2D

# Declaração das vairáveis
var rapidez = 80
var velocidade = Vector2()

onready var Heroi = $Robin_Erikson # O nome do nó do herói

func pegar_teclas():
	# Detecta se as teclas das setas do teclado foram pressionadas
	velocidade = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		Heroi.play("Lado_Direito")
		velocidade.x += 1
	if Input.is_action_pressed('ui_left'):
		Heroi.play("Lado_Esquerdo")
		velocidade.x -= 1
	if Input.is_action_pressed('ui_left') && Input.is_action_pressed("ui_down"):
		Heroi.play("")
		velocidade.x = 0
		velocidade.y = 0
	if Input.is_action_pressed('ui_down'):
		Heroi.play("De_Frente")
		velocidade.y += 1
	if Input.is_action_pressed('ui_right') && Input.is_action_pressed("ui_down"):
		Heroi.play("")
		velocidade.x = 0
		velocidade.y = 0
	if Input.is_action_pressed('ui_up'):
		Heroi.play("De_Costa")
		velocidade.y -= 1
	if Input.is_action_pressed('ui_right') && Input.is_action_pressed("ui_up"):
		Heroi.play("")
		velocidade.x = 0
		velocidade.y = 0
	if Input.is_action_pressed('ui_left') && Input.is_action_pressed("ui_up"):
		Heroi.play("")
		velocidade.x = 0
		velocidade.y = 0
	if velocidade.length() > 0:
		velocidade = velocidade.normalized() * rapidez
		Heroi.play()
	else:
		Heroi.stop()

func _physics_process(delta):
	pegar_teclas()
	move_and_collide(velocidade * delta)
