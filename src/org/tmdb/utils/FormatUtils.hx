package org.tmdb.utils;

class FormatUtils {

	public static function formatDate(dt:String):String {
		//2012-02-14
		var dt = dt.split("-");
		var d = new Date(Std.parseInt(dt[0]), Std.parseInt(dt[1]), Std.parseInt(dt[2]), 0, 0, 0);
		var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
		return d.getDate() + " " + months[d.getMonth() - 1] + " " + d.getFullYear();
	}
}