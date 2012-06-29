// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
//import Qt.labs.particles 1.0

Rectangle {
    id: root
    width: 800
    height: 600

    signal restartAll

    property color textColor: "yellow"

    ////////////////// PLAYER PROPERTIES
    property alias funds : panel.funds
    property alias currentCountry: panel.currentCountry
    property alias totalCountries: panel.totalCountries
    property alias liveCountries: panel.liveCountries

    property bool dialogOpen: loanDialog.isOpen ||
                              rescueDialog.isOpen ||
                              returnDialog.isOpen ||
                              startDialog.isOpen //||
//                              victoryDialog.isOpen

    Component.onCompleted: {
        totalCountries = 27;
        restartAll();
    }
    ////////////////////



    Panel {
        id: panel
    }

    Map {
        id: map
    }

    LoanDialog {
        id: loanDialog
    }

    RescueDialog {
        id : rescueDialog
    }

    ReturnDialog {
        id: returnDialog
    }

    VictoryDialog {
        id: victoryDialog
    }

    StartDialog {
        id: startDialog
    }
}
