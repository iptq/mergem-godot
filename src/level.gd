const DELIMITER = "---"

class Level:
	var size
	var tilemap
	func _init(size, tilemap):
		self.size = size
		self.tilemap = tilemap
	func get_tile_at(x, y):
		return self.tilemap[x * self.size.y + y]
	func initialize(node):
		for x in range(self.size.x):
			for y in range(self.size.y):
				var tile = -1
				var c = self.get_tile_at(x, y)
				if c == "#":
					tile = 0
				node.set_cell(y, x, tile)

func load_from_file(filename):
	var fullpath = "res://levels/" + filename
	var file = File.new()
	if not file.file_exists(fullpath):
		print("You done fucked.")
		return

	file.open(fullpath, file.READ)
	var content = file.get_as_text()
	file.close()

	var parts = content.split("\n", true)
	
	var lc = 0
	var level_size = Vector2(0, 0)
	var level_array = Array()
	for line in parts:
		if line == "---":
			break
		lc += 1
		level_size.x = max(level_size.x, lc)
		level_size.y = max(level_size.y, line.length())
		level_array.append(line)
	
	var tiles = Array()
	for line in level_array:
		for c in line:
			tiles.append(c)
	
	var level = Level.new(level_size, tiles)
	return level