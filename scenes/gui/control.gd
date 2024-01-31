extends Control

var player_score = 0
var enemy_score = 0

@onready var left_score: Label = $LeftScore
@onready var right_score: Label = $RightScore


func _ready():
	left_score.text = str(enemy_score)
	right_score.text = str(player_score)
	var ball = get_tree().get_first_node_in_group("ball") as Node2D
	ball.connect("score_updated", update_score)


func _process(delta):
	left_score.text = str(enemy_score)
	right_score.text = str(player_score)


func update_score(score):
	player_score = score["RightBorder"]
	enemy_score = score["LeftBorder"]
