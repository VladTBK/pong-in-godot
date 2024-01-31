### Godot Pong Clone
This project is a simple implementation of the classic Pong game using the Godot engine. The primary objectives were to understand how Godot handles rendering, scene building, input handling, and AI programming.

###Game Overview
The game features a single player represented as a sprite2D with an Area2D border, capable of vertical movement using the keys W/S and UP_ARROW/DOWN_ARROW. The opponent (Player 2), controlled by AI, aims to prevent the ball from passing its side of the screen.
The ball exhibits continuous motion on the screen, dynamically responding to collisions with players and boundaries. Upon colliding, the ball changes its x velocity using ingame physics.
If the ball leaves the screen past the opponent's side ( so it collides with a boundarie ), the player scores a point and vice-versa for the enemy. The game continues indefinitely, with the score being displaied on the player UI.
