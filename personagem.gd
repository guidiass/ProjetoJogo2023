extends KinematicBody2D

var contador = 0 # Pontos
var cont_life = 3 # Vidas
var motion = Vector2() # Movimentação do personagem
var sequencias = 0
const UP = Vector2(0, -1) # Realizar o salto(Tecla seta cima)

# Configurar os elementos da física
export var speed = 300
export var gravity = 170
export var jump_force = -1100

# Pontos do player
func _ready():
	get_parent().get_node("pontos").text = "Pontos: " + str(contador)
	get_parent().get_node("vidas").text = "Vidas: " + str(cont_life)
	$musica.play()
	
func _physics_process(_delta):
	
	motion.y += 60
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
		
	# verificar o contato com o obstaculo
	if is_on_floor():
		
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_force
			$jump.play()
			
	motion = move_and_slide(motion, UP)
	
	# Função para pegar itens e sumir os itens
func _on_area_personagem_body_entered(body):
	
	if 'item_01' in body.name:
		$pega_estrela.play()
		contador += 1 #Adiciona +1 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_01").hide()
			get_parent().get_node("item_01/colisao_item_01").set_deferred('disabled', true)
			speed += 20
			
	if 'item_02' in body.name:
		$pega_estrela.play()
		contador += 1 #Adiciona +1 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_02").hide()
			get_parent().get_node("item_02/colisao_item_02").set_deferred('disabled', true)
			speed += 20
			
	if 'item_03' in body.name:
		$pega_estrela.play()
		contador += 1 #Adiciona +1 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_03").hide()
			get_parent().get_node("item_03/colisao_item_03").set_deferred('disabled', true)
			speed += 20
			
	if 'item_04' in body.name:
		$pega_estrela.play()
		contador += 1 #Adiciona +1 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_04").hide()
			get_parent().get_node("item_04/colisao_item_04").set_deferred('disabled', true)
			speed += 20
			
	if 'item_05' in body.name:
		$pega_estrela.play()
		contador += 1 #Adiciona +1 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_05").hide()
			get_parent().get_node("item_05/colisao_item_05").set_deferred('disabled', true)		
			speed += 20
			
	if 'item_06' in body.name:
		$pega_estrela.play()
		contador += 1 #Adiciona +1 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_06").hide()
			get_parent().get_node("item_06/colisao_item_06").set_deferred('disabled', true)
			speed += 20
			
	if 'item_07' in body.name:
		$pega_estrela.play()
		contador += 1 #Adiciona +1 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_07").hide()
			get_parent().get_node("item_07/colisao_item_07").set_deferred('disabled', true)
			speed += 20
				
	# ITENS ESPECIAIS
	if 'item_especial_01' in body.name:
		$pega_diamante.play()
		contador += 2 #Adiciona +2 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_especial_01").hide()
			get_parent().get_node("item_especial_01/colisao_especial_01").set_deferred('disabled', true)
			speed += 30
			
	if 'item_especial_02' in body.name:
		$pega_diamante.play()
		contador += 2 #Adiciona +2 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_especial_02").hide()
			get_parent().get_node("item_especial_02/colisao_especial_02").set_deferred('disabled', true)
			speed += 30
			
	if 'item_especial_03' in body.name:
		$pega_diamante.play()
		contador += 2 #Adiciona +2 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_especial_03").hide()
			get_parent().get_node("item_especial_03/colisao_especial_03").set_deferred('disabled', true)
			speed += 30
			
	if 'item_especial_04' in body.name:
		$pega_diamante.play()
		contador += 2 #Adiciona +2 ponto
		get_parent().get_node("pontos").text = 'Pontos: ' + str(contador)
		if contador >= 1:
			get_parent().get_node("item_especial_04").hide()
			get_parent().get_node("item_especial_04/colisao_especial_04").set_deferred('disabled', true)
			speed += 10
		
#para testes
#func pega_estrelas():
#	$pega_estrela.play()
#	print("pegou estrela")
	
#func pega_diamantes():
#	$pega_diamante.play()
#	print("pegou diamante")


# COLISÃO DE DANO
func _on_area_dano_personagem_body_entered(body):
	if 'parede_dano_01' in body.name:
		$dano.play()
		speed -= 50
		cont_life -= 1
		get_parent().get_node("vidas").text = "Vidas: " + str(cont_life)
		if cont_life <= 0:
			$faleceu.play()
			get_parent().get_node("personagem").hide()
			#get_tree().paused = true
			# Obs: Equipe removi o pause devido a não execução do som de morte.
			
			
	if 'parede_dano_02' in body.name:
		$dano.play()
		speed -= 50
		cont_life -= 1
		get_parent().get_node("vidas").text = "Vidas: " + str(cont_life)
		if cont_life <= 0:
			$faleceu.play()
			get_parent().get_node("personagem").hide()
			#get_tree().paused = true
			# Obs: Equipe removi o pause devido a não execução do som de morte.
			
	if 'parede_baixo' in body.name:
		$dano.play()
		speed -= 50
		cont_life -= 1
		get_parent().get_node("vidas").text = "Vidas: " + str(cont_life)
		if cont_life <= 0:
			$faleceu.play()
			get_parent().get_node("personagem").hide()
			#get_tree().paused = true
			# Obs: Equipe removi o pause devido a não execução do som de morte.
			
	if 'parede_cima' in body.name:
		$dano.play()
		speed -= 50
		cont_life -= 1
		get_parent().get_node("vidas").text = "Vidas: " + str(cont_life)
		if cont_life <= 0:
			$faleceu.play()
			get_parent().get_node("personagem").hide()
			#get_tree().paused = true
			# Obs: Equipe removi o pause devido a não execução do som de morte.
			
	#Restauração dos itens
	if contador >= 15:
		#Item 01
		get_parent().get_node("item_01").show()
		get_parent().get_node("item_01/colisao_item_01").set_deferred('disabled', false)
		
		#Item 02
		get_parent().get_node("item_02").show()
		get_parent().get_node("item_02/colisao_item_02").set_deferred('disabled', false)
		
		#Item 03
		get_parent().get_node("item_03").show()
		get_parent().get_node("item_03/colisao_item_03").set_deferred('disabled', false)
		
		#Item 04
		get_parent().get_node("item_04").show()
		get_parent().get_node("item_04/colisao_item_04").set_deferred('disabled', false)
		
		#Item 05
		get_parent().get_node("item_05").show()
		get_parent().get_node("item_05/colisao_item_05").set_deferred('disabled', false)

		#Item 06
		get_parent().get_node("item_06").show()
		get_parent().get_node("item_06/colisao_item_06").set_deferred('disabled', false)
		
		#Item 07
		get_parent().get_node("item_07").show()
		get_parent().get_node("item_07/colisao_item_07").set_deferred('disabled', false)
		
		#Restauração Itens Especiais
		
		#Item Especial 01
		get_parent().get_node("item_especial_01").show()
		get_parent().get_node("item_especial_01/colisao_especial_01").set_deferred('disabled', false)
		
		#Item Especial 02
		get_parent().get_node("item_especial_02").show()
		get_parent().get_node("item_especial_02/colisao_especial_02").set_deferred('disabled', false)
		
		#Item Especial 03
		get_parent().get_node("item_especial_03").show()
		get_parent().get_node("item_especial_03/colisao_especial_03").set_deferred('disabled', false)
		
		#Item Especial 04
		get_parent().get_node("item_especial_04").show()
		get_parent().get_node("item_especial_04/colisao_especial_04").set_deferred('disabled', false)
		
		#Adicionando sequencia de vitórias
		sequencias += 1
		get_parent().get_node("sequencia").text = "Sequência(s): " + str(sequencias)
		
		#Restauração da speed original / Restauração das vidas / Restauração do Contador
		speed = 300
		contador = 0
		cont_life = 3
		get_parent().get_node("vidas").text = "Vidas: " + str(cont_life)
	
	if cont_life <= 0:
		get_parent().get_node("gameover").text = "GAME OVER"
