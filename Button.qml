import QtQuick 1.1

Rectangle {
    id: button

    property string label: "OK"
    property bool active: true

    property color dkBlue: "#0a0088"
    property color ltBlue: "#8980ff"
    property color brdBlue: "#120062"
    property color yll: "yellow"

    property color topGradient: ltBlue
    property color bottomGradient: dkBlue
    property color borderColor: brdBlue
    property color textColor: yll

    signal clicked

    width: Math.max(80, labelText.width + 8)
    height: 28
    border.color: borderColor
    border.width: 1
    radius: 5

    gradient: Gradient {
        GradientStop {position: 0.0; color:topGradient}
        GradientStop {position: 1.0; color:bottomGradient}
    }

    Text {
        id: labelText
        anchors.centerIn: parent
        color: textColor
        text: label
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: button
                topGradient: dkBlue
                bottomGradient: Qt.darker(brdBlue)
                borderColor: yll
                textColor: Qt.darker(yll)
            }
        },
        State {
            name: "hovered"
            PropertyChanges {
                target: button
                borderColor: yll
            }
        },
        State {
            name: "disabled"
            when: !active
            PropertyChanges {
                target: button
                topGradient: Qt.lighter("gray")
                bottomGradient: "gray"
                borderColor: Qt.darker("gray")
                textColor: "gray"
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        enabled: button.active
        hoverEnabled: true
        onEntered: button.state = "hovered"
        onExited: button.state = ""
        onPressed: button.state = "pressed"
        onReleased: { button.state = "hovered"; button.clicked(); }
    }
}
