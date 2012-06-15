// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: root
    width: 800
    height: 600

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

    Map {
        id: map
    }

    Panel {
        id: panel
    }

    VictoryDialog {
        id: victoryDialog
    }
}
