// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

DialogBG {
    id: returnDialog
    property color textColor: "yellow"
    parent: map
    anchors.centerIn: parent
    z: 10
    originalWidth: 300
    originalHeight: 200

    Column {
        id: contents
        anchors.centerIn: parent
        spacing: 5
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: "Spain returned you "+100+"M €"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: "Cuts:"
        }
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 2
            Text {
                color: textColor
                text: "Health system: <font color='red'>"+0.2+"%</font>"
            }
            Text {
                color: textColor
                text: "Education: <font color='red'>"+0.2+"%</font>"
            }
            Text {
                color: textColor
                text: "Science/Research: <font color='red'>"+0.2+"%</font>"
            }
            Text {
                color: textColor
                text: "Unempl. Benefits: <font color='red'>"+0.2+"%</font>"
            }
            Text {
                color: textColor
                text: "Pension System: <font color='red'>"+0.2+"%</font>"
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            id: cancelButton
            label: "Close"
            active: true
            onClicked: returnDialog.hide();
        }
    }
}
