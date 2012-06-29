import QtQuick 1.1

Image {
    id: country

    property string sourceNormal
    property string sourceHover
    property string sourcePressed

    // public
    property string name: ""
    property bool isEuroZone: true
    property int debt: 100
    property int capacity: 1000
    property int newLoan: 100
    property real loanDecay: 1.1
    property real interests: 1.1
    property real interestDecay: 1.1
    property int returnDelay: 4000
    property int decayDelay : 3000

    // internal
    property int budget: capacity
    property bool rescued: false
    property int toReturn: 0
    property real health: Math.random() * 20
    property real edu: Math.random() * 8
    property real science: Math.random() * 4
    property real unempl: Math.random() * 20
    property real pension: Math.random() * 20
    property bool canCut: true
    property int gain: Math.max(capacity + budget, capacity * 0.1)

    source: sourceNormal
    states: [
        State {
            name: "hovered"
            PropertyChanges {
                target: country
                source: sourceHover
            }
        },
        State {
            name: "pressed"
            PropertyChanges {
                target: country
                source: sourcePressed
            }
        },
        State {
            name: "depressed"
            when: rescued
            PropertyChanges {
                target: country
                source: sourcePressed
            }
        }
    ]

    AnimatedImage {
        parent: map
        id: burnImage
        source: "pics/fireLoop.gif"
        x: country.x + country.width/2 - width/2
        y: country.y + country.height/2 - height/2 - 30
        z: 3+y/600
        visible: rescued
    }

    Timer {
        id: returnToNormalTimer
        interval: 500
        repeat: false
        running: false
        onTriggered: country.state = ""
    }

    MouseArea {
        anchors.fill: parent
        anchors.leftMargin: parent.width > 30? parent.width/4:0
        anchors.rightMargin: parent.width > 30? parent.width/4:0
        anchors.topMargin: parent.height > 30? parent.height/4:0
        anchors.bottomMargin: parent.height > 30? parent.height/4:0
        hoverEnabled: true
        enabled: !root.dialogOpen
        onEntered: {
            if (!rescued)
                country.state = "hovered"
            root.currentCountry = country;
            country.z = 1
        }
        onExited: {
            if (!rescued)
                country.state = ""
            country.z = 0
        }
        onPressed: {
            if (!rescued) {
                country.state = "pressed";
                if (budget > 0 && loanDialog.state=="hidden") {
                    loanDialog.currentCountry = country;
                    loanDialog.show();
                    if (!returnToNormalTimer.running)
                        returnToNormalTimer.start()
                } else if (budget <= 0 && rescueDialog.state=="hidden") {
                    rescueDialog.currentCountry = country;
                    rescueDialog.show();
                    if (!returnToNormalTimer.running)
                        returnToNormalTimer.start()
                }
            }
        }
        onReleased:
            if (!rescued) {
                if (containsMouse)
                    country.state = "hovered";
                else
                    country.state = "";
            }
    }

    // Budget Display
    Rectangle {
        parent: map
        x: country.x + country.width/2 - width/2
        y: country.y + country.height/2 - height/2
        width: Math.max(1, Math.min(country.width,
                        country.width * budget / capacity))
        Behavior on width { PropertyAnimation { duration: 500 } }
        color: budget/capacity < 0.33? "red" :
               budget/capacity < 0.66? "orange" : "green"
        height: 4
        visible: !rescued
        border.width: 1
        border.color: "black"
        z: 2
    }

    function getLoan(activeInterests, activeDebt, activeLoan)
    {
        newLoan = activeLoan;
        debt = activeDebt;
        interests = activeInterests;
        if (newLoan <= funds) {
            debt += newLoan * interests;
            toReturn += newLoan * interests;
            funds -= newLoan;
            decay();
            if (!returnTimer.running)
                returnTimer.restart();
        }

    }

    Timer {
        id: returnTimer
        running: false
        repeat: false
        interval: returnDelay
        onTriggered: {
            if (rescued)
                return;
            returnDialog.returnList.append({
                "currentCountry" : country,
                "returned" : toReturn,
                "healthCuts" : Math.random() * health,
                "eduCuts" : Math.random() * edu,
                "scienceCuts" : Math.random() * science,
                "unemplCuts" : Math.random() * unempl,
                "pensionCuts" : Math.random() * pension
            })
            returnDialog.activate();
        }
    }

    Timer {
        id: decayTimer
        running: true
        repeat: true
        interval: decayDelay
        onTriggered: {
            decay();
        }
    }

    function acceptCut(cuts)
    {
        budget *= (100 + cuts.healthCuts + cuts.eduCuts +
                cuts.scienceCuts + cuts.unemplCuts +
                cuts.pensionCuts)/100.0;
        health -= cuts.healthCuts;
        edu -= cuts.eduCuts;
        science -= cuts.scienceCuts;
        unempl -= cuts.unemplCuts;
        pension -= cuts.pensionCuts;
        budget -= cuts.returned;
        funds += cuts.returned;
        debt -= cuts.returned;
        toReturn = 0;
    }

    function doCut()
    {
        returnDialog.healthCuts = Math.random() * health;
        returnDialog.eduCuts = Math.random() * edu;
        returnDialog.scienceCuts = Math.random() * science;
        returnDialog.unemplCuts = Math.random() * unempl;
        returnDialog.pensionCuts = Math.random() * pension;
        budget *= (100 + returnDialog.healthCuts + returnDialog.eduCuts +
                returnDialog.scienceCuts + returnDialog.unemplCuts +
                returnDialog.pensionCuts)/100.0;
        health -= returnDialog.healthCuts;
        edu -= returnDialog.eduCuts;
        science -= returnDialog.scienceCuts;
        unempl -= returnDialog.unemplCuts;
        pension -= returnDialog.pensionCuts;
    }

    function rescue()
    {
        rescued = true;
        funds += gain;
        liveCountries--;
    }
    function goBankrupt()
    {
        rescueDialog.currentCountry = country;
        rescueDialog.show();
    }

    function decay()
    {
        return;
        if (rescued)
            return;
        interests *= interestDecay;
        newLoan *= loanDecay;
//        budget /= interests;
    }
}
