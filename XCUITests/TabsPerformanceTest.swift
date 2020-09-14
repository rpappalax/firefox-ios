import XCTest

class TabsPerformanceTest: BaseTestCase {
let fixtures = ["testPerfTabs10": "testTabsPerformance-brower.db"]

    let testWithTabs:[String:String] = ["testPerfTabs5": "tabsState5.archive","testPerfTabs5Setup": "tabsState5.archive"]

        override func setUp() {
            // Test name looks like: "[Class testFunc]", parse out function name
            let parts = name.replacingOccurrences(of: "]", with: "").split(separator: " ")
            let functionName = String(parts[1])
            let archiveName = testWithTabs[functionName]
            
            launchArguments = [LaunchArguments.PerformanceTest, LaunchArguments.SkipIntro, LaunchArguments.SkipWhatsNew, LaunchArguments.SkipETPCoverSheet]
            
            if testWithTabs.keys.contains(functionName) {
                print("if!!")
                print(archiveName!)
                launchArguments.append(LaunchArguments.LoadTabsStateArchive + archiveName!)
            }
            super.setUp()
        }

        override func tearDown() {
            super.tearDown()
        }


    func testPerfTabs5() {
        // load application and wait
        // observe if test DBs are successfully loaded
          do {
              sleep(100)
          }
    }
    
    func testPerfTabs10() {
        // load application and wait
        // observe if test DBs are successfully loaded
          do {
              sleep(100)
          }
    }

    func testPerfTabs5Setup() {
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
