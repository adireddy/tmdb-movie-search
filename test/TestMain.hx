import org.tmdb.utils.TestFormatUtils;
import haxe.unit.TestRunner;

class TestMain {

	public function new() {
		var runner = new TestRunner();
		runner.add(new TestFormatUtils());

		var success = runner.run();
		Sys.exit(success ? 0 : 1);
	}

	public static function main() {
		new TestMain();
	}
}