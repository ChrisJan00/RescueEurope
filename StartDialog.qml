import QtQuick 1.1

DialogBG {
    id: startDialog

    originalWidth: 400
    originalHeight: 200
    anchors.centerIn: parent
    z: 10

    parent: map

    Column {
        id: contents
        anchors.centerIn: parent
        width: parent.width
        spacing: 10
        Text {
            font.pixelSize: 42
            color: textColor
            text: "T<img src='pics/euroflag.png'/>gether"
            x: 25
        }
        Text {
            font.pixelSize: 42
            color: textColor
            text: "until the end"
            x: 140
        }
        Text {
            color: textColor
            font.pixelSize: 14
            text: "a parody game by Christiaan Janssen"
            x: 165
        }
        Button {
            label: "Start"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: hide();
        }
    }
}
