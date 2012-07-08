// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import SDLMixerWrapper 1.0

DialogBG {
    id: owningDialog
    property color textColor: "yellow"
    parent: map
    anchors.centerIn: parent
    z: 10
    originalWidth: 300
    originalHeight:  65

    property variant currentCountry:null
    property int amount

    function started() {
    }

    Column {
        id: contents
        anchors.centerIn: parent
        spacing: 5
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                   currentCountry.name + " already owes you "+amount+"M €"
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            id: cancelButton
            label: "Close"
            active: true
            onClicked: {
                owningDialog.hide();
            }
        }
    }

    function activate(country) {
        if (dialogOpen)
            return;
        currentCountry = country;
        amount = currentCountry.toReturn;
        if (amount <= 0)
            return;
        show();
    }
}
