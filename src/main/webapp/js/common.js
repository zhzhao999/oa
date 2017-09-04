var common = {};
common.debug = true;

common.log = function(msg){
	if (window.console && window.console.log && common.debug) {
		window.console.log(msg);
	}
}