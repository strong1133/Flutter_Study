var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
const cors = require("cors");

var app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "jade");

app.use(cors());
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "web")));

app.get("/", function (req, res, next) {
	console.log("/");
	res.sendFile(path.join(__dirname, "/web", "index.html"));
});

// catch 404 and forward to error handler
app.use(function (req, res, next) {
	next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get("env") === "development" ? err : {};

	// render the error page
	res.status(err.status || 500);
	res.render("error");
});
console.log('Name : ', process.env.NAME);
// 4800 고정
// app.listen(4800, () =>
// 	console.log(`app listening on http://localhost:${4800}`)
// );

if(process.env.NAME === 'beta') {
	app.listen(7700, () =>
	console.log(`app listening on http://localhost:${7700}`)
);
} else {
	app.listen(7700, () =>
	console.log(`app listening on http://localhost:${7700}`)
);
}
module.exports = app;
