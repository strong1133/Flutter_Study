const path = require("path");

module.exports = {
	entry: "./web/main.dart.js",
	output: {
		filename: "main.js",
		path: path.resolve(__dirname, "./web"),
	},
};
