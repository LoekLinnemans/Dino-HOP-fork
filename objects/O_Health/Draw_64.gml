//healthbar
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;


for (var i = 1; i <= _playerHealthMax; i++)
{
	var _imageIndex = (i > _playerHealth);
	draw_sprite(S_heart, _imageIndex, 8+ ((i-1) *64),20)
}









