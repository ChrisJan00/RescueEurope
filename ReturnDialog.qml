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
    property variant currentCountry:null
    property int returned: 0
    property real healthCuts: 0
    property real eduCuts: 0
    property real scienceCuts: 0
    property real unemplCuts: 0
    property real pensionCuts: 0

    Column {
        id: contents
        anchors.centerIn: parent
        spacing: 5
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                   currentCountry.name + " returned you "+returned+"M €"
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
                text: "Health system: <font color='red'>"+healthCuts.toFixed(2)+"%</font>"
            }
            Text {
                color: textColor
                text: "Education: <font color='red'>"+eduCuts.toFixed(2)+"%</font>"
            }
            Text {
                color: textColor
                text: "Science/Research: <font color='red'>"+scienceCuts.toFixed(2)+"%</font>"
            }
            Text {
                color: textColor
                text: "Unempl. Benefits: <font color='red'>"+unemplCuts.toFixed(2)+"%</font>"
            }
            Text {
                color: textColor
                text: "Pension System: <font color='red'>"+pensionCuts.toFixed(2)+"%</font>"
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            id: cancelButton
            label: "Close"
            active: true
            onClicked: {
                returnDialog.hide();
                if (currentCountry && currentCountry.budget <= 0) {
                    rescueDialog.currentCountry = currentCountry;
                    rescueDialog.show();
                }
            }
        }
    }
}
