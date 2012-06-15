import QtQuick 1.1

DialogBG {
    id: victoryDialog

    originalWidth: 400
    originalHeight: 200
    anchors.centerIn: parent
    z: 10

    parent: map

    property bool ending: liveCountries == 0
    onEndingChanged: if (ending) show();
    Text {
        id: contents
        font.pixelSize: 44
        anchors.centerIn: parent
        color: textColor
        text: "YOU WIN!\nYOU RESCUED\nALL EUROPE!"
    }
}
