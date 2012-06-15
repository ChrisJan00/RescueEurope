// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: root
    width: 800
    height: 600

    property color textColor: "yellow"

    ////////////////// PLAYER PROPERTIES
    property alias funds : panel.funds
    property alias unit: panel.unit
    property alias currentCountry: panel.currentCountry
    property alias totalCountries: panel.totalCountries
    property alias liveCountries: panel.liveCountries

    Component.onCompleted: {
        totalCountries = 27;
        liveCountries = 27;
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
}
