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

    property variant currentCountry : null;

    Column {
        id: contents
        anchors.centerIn: parent
        spacing: 5
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                currentCountry.name + " is on the verge of <font color='red'>bankruptcy</red>"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                "You will earn "+ (currentCountry.capacity + currentCountry.budget)
                                   +"M € with the bailout rescue plan"
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30
            Button {
                id: loanButton
                label: "Rescue"
                active: true
                onClicked: {
                    currentCountry.rescue();
                    rescueDialog.hide();
                }
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
