crash-report-assert
===================
<h2>Custom assertion</h2>
Writes out to the Crash Report when supported (only on Mac) but added a "hack" to show up on the CrashReport when on iOS

<h2>Features supported</h2>
<ul>
	<li>Assertion supports the use of CocoaLumberjack [<a href="https://github.com/robbiehanson/CocoaLumberjack">GitHub Repo</a>] for more detailed logging.
		<ul>
			<li>In order to use it you need to set the PREPROCESSOR macro USE_LUMBERJACK=1 and configure the loggers for CocoaLumberjack (demo app does this)</li>
		</ul>
	</li>
	<li>Assertion also supports a "hack" to make the assertion reach the CrashReport via a flag that will output the assert as an exception.
		<ul>
			<li>To do this specify the PREPROCESSOR macro kSHOULD_THROW_EXCEPTION=1 and this will make the assertion to build a "custom" exception with the following data:
				<ul>
					<li>Message: Assertion Failure - #expression</li>
					<li>Reason: #expression</li>
					<li>User Info:
						<ul>
							<li>File: File name where the assertion failed</li>
							<li>Line: Line number on the file where the assertion failed</li>
							<li>Function: The name of the function where the assertion failed</li>
							<li>Message: The custom message provided to the assertion (if any)</li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</li>
</ul>

<h2>Legal</h2>
Based on an article by Mike Ash - <a href="http://www.mikeash.com/pyblog/friday-qa-2013-05-03-proper-use-of-asserts.html?utm_source=iOS+Dev+Weekly&amp;utm_campaign=7dba454803-iOS_Dev_Weekly_Issue_93&amp;utm_medium=email&amp;utm_term=0_7bda94b7ca-7dba454803-267010305">Friday Q&A 2013-05-03: Proper Use of Asserts</a>

Icon was taken from <a href="http://www.iconfinder.com/icondetails/66831/128/error_note_icon">IconFinder.com</a><br />
And used under this <a href="http://www.iconfinder.com/iconsets/Hand_Drawn_Web_Icon_Set#readme">license</a>