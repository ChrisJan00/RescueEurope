// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: dialogBG

    property int originalWidth: 350
    property int originalHeight: 100
    width: originalWidth
    height: originalHeight

    property bool isOpen: state != "hidden"

    gradient: Gradient {
        GradientStop {position: 0.0; color:"#0a0088"}
        GradientStop {position: 1.0; color:"#8980ff"}
    }
    border.width: 1
    border.color: "#120062"
    radius: 5

    visible: false
    state: "hidden"
    states: State {
        name: "hidden"
    }

    transitions: [
        Transition {
            from:""
            to:"hidden"
            SequentialAnimation {
                ParallelAnimation {
                    PropertyAnimation {
                        target: contents
                        property: "opacity"
                        easing.type: Easing.OutQuart
                        from: 1
                        to: 0

                        duration: 300
                    }
                    PropertyAnimation {
                        target: dialogBG
                        properties: "width"
                        to: 0
                        from: originalWidth
                        duration: 200
                    }
                    PropertyAnimation {
                        target: dialogBG
                        properties: "height"
                        to: 0
                        from: originalHeight
                        duration: 200
                    }
                }
                PropertyAction {
                    target: dialogBG
                    property: "visible"
                    value: false
                }
            }
        },
        Transition {
            from:"hidden"
            to:""
            SequentialAnimation {
                PropertyAction {
                    target: dialogBG
                    property: "visible"
                    value: true
                }
                ParallelAnimation {
                    PropertyAnimation {
                        target: dialogBG
                        easing.period: 0.5
                        properties: "width"
                        from: 0
                        to: originalWidth
                        duration: 300
                        easing.type: Easing.OutElastic
                    }
                    PropertyAnimation {
                        target: dialogBG
                        easing.period: 0.5
                        properties: "height"
                        from: 0
                        to: originalHeight
                        duration: 300
                        easing.amplitude: 1.01
                        easing.type: Easing.OutElastic
                    }
                    PropertyAnimation {
                        target: contents
                        property: "opacity"
                        easing.type: Easing.InQuad
                        from: 0
                        to: 1
                        duration: 200
                    }
                }
            }
        }
    ]

    function show() {
        state = ""
    }

    function hide() {
        state = "hidden"
    }
}
