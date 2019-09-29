extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
enum {IDLE, WALK, JUMP, FALL, DEATH}
var state:int = IDLE

func _ready():
	set_physics_process(true)
	set_process(true)

func _physics_process(delta):
	_setState()
	velocity = move_and_slide(velocity)

func _setState():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		state = WALK
		velocity.x += 1
		$AnimationPlayer.play("Walk")
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('jump'):
		velocity.y -= 1
		$AnimationPlayer.play("Jump")
	velocity = velocity.normalized() * speed

func _process(delta):
	if Input.is_action_pressed('jump'):
		$AnimationPlayer.play("Jump")