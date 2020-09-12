import XCTest

//let firstURL = "mozilla.org"
//let secondURL = "mozilla.org/en-US/book"
//let fullFirstURL = "https://www.mozilla.org/en-US/"

class TabsPerformanceTest: BaseTestCase {
let fixtures = ["testPerfTabs10": "testTabsPerformance-brower.db"]

        let testWithDB = ["testPerfDbLoader","testPerfTabs10Setup"]
//        let testTabsDB = "testTabsPerformance-browser.db"
        let testTabsDB = "testHistoryDatabase4000-browser.db"

        let testTabsStateArchive = "tabsState5.archive"

        override func setUp() {
            // Test name looks like: "[Class testFunc]", parse out the function name
            let parts = name.replacingOccurrences(of: "]", with: "").split(separator: " ")
            let key = String(parts[1])
            if testWithDB.contains(key) {
                launchArguments = [LaunchArguments.PerformanceTest, LaunchArguments.SkipIntro, LaunchArguments.SkipWhatsNew, LaunchArguments.SkipETPCoverSheet,  LaunchArguments.LoadDatabasePrefix + testTabsDB, LaunchArguments.LoadTabsStateArchive + testTabsStateArchive]
            }
            super.setUp()
        }

        override func tearDown() {
            super.tearDown()
        }


    func testPerfDbLoader() {
        // load application and wait
        // observe if test DBs are successfully loaded
          do {
              sleep(100)
          }
    }


    func testPerfTabs10Setup() {
        let fileName = "/Users/rpappalax/git/firefox-ios-NEW-ISSUE/test-fixtures/topdomains_10.txt"
        var contents = ""
        var urls = [String]()
        
        do {
            contents = try String(contentsOfFile: fileName)
            urls = contents.components(separatedBy: "\n")
//            print(contents)
        } catch {
            print("COULDNT LOAD")
        }


        //navigator.performAction(Action.TogglePrivateMode)
        navigator.goto(NewTabScreen)
//        let urls = ["yahoo.com", "google.com", "cnn.com"]
//
  
        for url in urls {
            print(url)
            navigator.openNewURL(urlString: url)
            waitUntilPageLoad()
        }


        waitForTabsButton()
        navigator.goto(TabTray)
    }



}
