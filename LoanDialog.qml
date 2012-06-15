// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

DialogBG {
    id: loanDialog
    property color textColor: "yellow"
    parent: map
    anchors.centerIn: parent
    z: 10
    originalWidth: 300
    originalHeight: 100
    property variant currentCountry : null

    Column {
        id: contents
        anchors.centerIn: parent
        spacing: 5
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                currentCountry.name+" needs a loan of "+currentCountry.newLoan+"M €"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                "National Debt: "+currentCountry.debt+"M €"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                "Interests: "+((currentCountry.interests-1)*100).toFixed(2)+"%"
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30
            Button {
                id: loanButton
                label: "Lend"
                active: currentCountry && currentCountry.newLoan <= funds ? true : false
                onClicked: {
                    currentCountry.getLoan();
                    loanDialog.hide();
                }
            }
            Button {
                id: cancelButton
                label: "Ignore"
                active: true
                onClicked: loanDialog.hide();
            }
        }
    }
}
