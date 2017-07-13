const DELIMITER = "---"

class Level:
	var _tilemap
	func _init(tilemap):
		self._tilemap = tilemap

	static func load_from_file(filename):
		var fullpath = "res://levels/" + filename
		var file = File.new()
		if not file.file_exists(fullpath):
			print("You done fucked.")
			return

		file.open(fullpath, file.READ)
		var content = file.get_as_text()
		file.close()

		var parts = content.split("\n", true)
		print(parts)