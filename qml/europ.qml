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


    // Loosing condition
    property bool stopped: false
    property int loanCount: 0
    property int minLoan: 0

    function addLoanCount() {
        loanCount++;
    }
    function substractLoanCount()
    {
        loanCount--;
        if (loanCount == 0) {
            checkLoans();
        }
    }
    signal computeMinLoan();
    function checkLoans()
    {
        if (stopped || loanCount>0) return;
        minLoan = funds + 1;
        computeMinLoan();
        if (minLoan > funds)
            loseScreen.activate();
    }


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

    LoseScreen {
        id: loseScreen
    }

    VictoryScreen {
        id: victoryScreen
    }

    StartDialog {
        id: startDialog
    }
}
