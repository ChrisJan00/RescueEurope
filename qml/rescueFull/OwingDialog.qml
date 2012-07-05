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
    originalHeight:  200

    property variant currentCountry:null

    function started() {
//        cashSound.play();
    }

//    SoundClip {
//        id: cashSound
//        source:"snds/cashregister.ogg"
//    }

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
        currentCountry = cuts.currentCountry;
        // If the country is bankrupt, ignore and go to next
        if (currentCountry.budget <= 0) {
            if (!currentCountry.rescued) {
                rescueDialog.currentCountry = currentCountry;
                rescueDialog.show();
                return;
            }
            return;
        }

        show();
    }
}
