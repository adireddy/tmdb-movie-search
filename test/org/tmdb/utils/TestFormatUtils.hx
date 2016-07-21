package org.tmdb.utils;

import haxe.unit.TestCase;

class TestFormatUtils extends TestCase {

	public function testDateFormat() {
		var formattedStr = FormatUtils.formatDate("2016-02-21");
		assertEquals("21 Feb 2016", formattedStr);
	}
}