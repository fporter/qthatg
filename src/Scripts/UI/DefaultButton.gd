extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# for game pad
	connect("focus_entered", self, "on_focus_entered")
	connect("focus_exited", self, "on_focus_exited")
	
	# for mouse
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")
	
	# todo: might want to make transition better


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_focus_entered():
	$FocusAnimation.play("FocusHover")

func on_focus_exited():
	$FocusAnimation.play_backwards("FocusHover")

func on_mouse_entered():
	self.grab_focus()
	
func on_mouse_exited():
	self.release_focus()
