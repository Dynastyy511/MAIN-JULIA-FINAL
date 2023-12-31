extends Area2D

@export var speed = 400

@onready var bg_music = $"../BG Music"
@onready var enemy_hit = $"../Enemy Hit"



func _ready():
	pass # Replace with function body.



func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * delta
	
	position += velocity * speed
	
func _on_body_entered(body):
	hide()
	bg_music.stop()
	enemy_hit.play()
