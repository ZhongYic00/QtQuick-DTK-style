add_rules("mode.debug", "mode.release")
add_requires("dtkcore", "dtkgui", "dtkwidget","qt5widgets","Qt5QuickControls2",{ system = true})

rule("example-deps")
    add_deps("dpalette")

target("example-cpp")
    add_packages("dtkcore","dtkgui","dtkwidget","qt5widgets","Qt5QuickControls2")
    add_rules("example-deps")
    add_rules("qt.quickapp")
    add_files("cpp/**.cpp")
    add_files("*.qrc")
    add_files("dtk/include/*.cpp|h")
    add_includedirs("dtk/include")