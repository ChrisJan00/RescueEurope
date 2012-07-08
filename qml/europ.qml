// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
//import Qt.labs.particles 1.0

Rectangle {
    id: root
    width: 800
    height: 600

    signal restartAll
    signal beginGame
    signal finishGame

    property variant startTime;
    property variant elapsedTime;

    property color textColor: "yellow"

    ////////////////// PLAYER PROPERTIES
    property alias funds : panel.funds
    property alias currentCountry: panel.currentCountry
    property alias totalCountries: panel.totalCountries
    property alias eurozoneCountries: panel.eurozoneCountries
    property alias liveCountries: panel.liveCountries
    property string mode: "full"

    property bool dialogOpen: loanDialog.isOpen ||
                              rescueDialog.isOpen ||
                              returnDialog.isOpen ||
                              owingDialog.isOpen ||
                              startDialog.isOpen

    Component.onCompleted: {
        totalCountries = 27;
        eurozoneCountries = 17;
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

    OwingDialog {
        id: owingDialog
    }

    RescueDialog {
        id : rescueDialog
    }

    ReturnDialog {
        id: returnDialog
    }

    VictoryScreen {
        id: victoryScreen
    }

    StartDialog {
        id: startDialog
    }
}
