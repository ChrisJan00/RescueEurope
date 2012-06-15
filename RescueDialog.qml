// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

DialogBG {
    id: rescueDialog
    property color textColor: "yellow"
    parent: map
    anchors.centerIn: parent
    z: 10
    originalWidth: 350
    originalHeight: 100

    Column {
        id: contents
        anchors.centerIn: parent
        spacing: 5
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: "Spain is on the verge of <font color='red'>bankruptcy</red>"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: "You will earn "+100+"M € with the bailout rescue plan"
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30
            Button {
                id: loanButton
                label: "Rescue"
                active: true
            }
            Button {
                id: cancelButton
                label: "Ignore"
                active: true
                onClicked: rescueDialog.hide();
            }
        }
    }
}
