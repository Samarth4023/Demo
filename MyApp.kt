import tornadofx.*

class MyApp : App(MainView::class)

class MainView : View("Hello TornadoFX") {
    override val root = vbox {
        label("Welcome to TornadoFX!") {
            style {
                fontSize = 20.px
            }
        }
        button("Click Me") {
            action {
                find<SecondView>().openWindow()
            }
        }
    }
}

class SecondView : View("Second Window") {
    override val root = vbox {
        label("This is the second window!") {
            style {
                fontSize = 18.px
            }
        }
        button("Close") {
            action {
                close()
            }
        }
    }
}

fun main(args: Array<String>) {
    launch<MyApp>(args)
}
