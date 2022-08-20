extends Button


var clickedTimes = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	self.incrementCounter()

func _process(delta):
	if(Input.is_action_just_released("ui_accept")):
		self.incrementCounter()
	
	
func incrementCounter():
	self.text = "Clicked " + str(self.clickedTimes) + " times"
	self.clickedTimes += 1
