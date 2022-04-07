extends Node 

func _process(delta):
	if Globalpos.npc2==false or Globalpos.star==false:
		$Estrelag.visible=false
	elif Globalpos.npc2 and Globalpos.star:
		$Estrelag.visible = true

	if Globalpos.npc5==false or Globalpos.star:
		$Estrela2g.visible=false
	elif Globalpos.npc5 and Globalpos.star==false:
		$Estrela2g.visible = true

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and Globalpos.npc2 and Globalpos.star:
			get_tree().paused = true
			var dialog = Dialogic.start('Dixieg1')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			Transition.fade_into("res://Scene/Gloria/QuizGloria/QuizGloria1.tscn")
		if event.is_action_pressed("ui_accept") and Globalpos.npc4 and Globalpos.star==false:
			get_tree().paused = true
			var dialog = Dialogic.start('Dixieg2')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			Transition.fade_into("res://Scene/Gloria/QuizGloria/QuizGloria3.tscn")
			
func unpause(timeline_timeline1):
	get_tree().paused = false
