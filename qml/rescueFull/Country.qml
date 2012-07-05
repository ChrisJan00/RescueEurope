import QtQuick 1.1

Image {
    id: country

    property string sourceNormal
    property string sourceHover
    property string sourcePressed
    property string sourceHighlight

    // public
    property string name: ""
    property bool isEuroZone: true
    property int debt: 100
    property int capacity: 1000
    property int newLoan: 100
    property real loanDecay: 10
    property real interests: 1.1
    property real interestDecay: 0.1
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
    property int gain: Math.max(capacity + budget, capacity * 0.9)
    property int extraGain: 0
    property bool showGains: false

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

    Connections {
        target: root
        onRestartAll: restartCountry();
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

    // Status Display
    Image {
        source: sourceHighlight
        opacity: Math.max(0, Math.min(1, 1-budget/capacity))*0.7;
        visible: !rescued
        z: 2
    }

    Text {
        parent: map
        id: gainText
        x: country.x + country.width/2 - width/2
        property int startY: country.y + country.height/2 - height/2;
        y: startY;
        z: 5
        opacity: 0
        color: root.textColor
        style: Text.Outline

        property color positiveColor: "green"
        property color negativeColor: "red"
        function launch( amount )
        {
            if (amount == 0)
                return;

            if (amount > 0) {
                styleColor = positiveColor;
                text = "+" + amount + " M €";
            } else {
                styleColor = negativeColor;
                text = amount + " M €";
            }
            gainAnimation.restart();
        }

        ParallelAnimation {
            id: gainAnimation

            PropertyAnimation {
                target: gainText
                property: "y"
                from: gainText.startY
                to: gainText.startY - 80
                duration: 2000
            }
            PropertyAnimation {
                target: gainText
                property: "opacity"
                easing.type: Easing.InQuart
                from: 1
                to: 0
                duration: 2000
            }
        }
    }

    function incrementBudget(amount)
    {
        budget += Math.floor(amount);
        if (showGains)
            gainText.launch( Math.floor(amount) );
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
            returnDialog.returnList.append(generateCut())
            toReturn = 0;
            returnDialog.activate();
        }
    }

    Timer {
        id: decayTimer
        running: true
        repeat: true
        interval: decayDelay
        triggeredOnStart: true
        onTriggered: {
            decay();
            showGains = true;
        }
    }

    function initInternal()
    {
        budget = capacity
        rescued = false
        toReturn = 0
        health = Math.random() * 20
        edu = Math.random() * 8
        science = Math.random() * 4
        unempl = Math.random() * 20
        pension = Math.random() * 20
        canCut = true
        extraGain = 0
        showGains = false;
    }

    function generateCut()
    {
        return {
            "currentCountry" : country,
            "returned" : toReturn,
            "healthCuts" : Math.random() * health,
            "eduCuts" : Math.random() * edu,
            "scienceCuts" : Math.random() * science,
            "unemplCuts" : Math.random() * unempl,
            "pensionCuts" : Math.random() * pension
        }
    }

    function acceptLoan(cuts)
    {
        funds += cuts.returned;
        debt -= cuts.returned;
        if (debt < 0) {
            extraGain += -debt;
            debt = 0;
        }
        incrementBudget( -cuts.returned );
    }

    function acceptCut(cuts)
    {
        extraGain += budget *
                (cuts.healthCuts + cuts.eduCuts +
                cuts.scienceCuts + cuts.unemplCuts +
                cuts.pensionCuts)/100.0;
        health -= cuts.healthCuts;
        edu -= cuts.eduCuts;
        science -= cuts.scienceCuts;
        unempl -= cuts.unemplCuts;
        pension -= cuts.pensionCuts;

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
        if (rescued)
            return;
        interests += interestDecay * (Math.random() - 0.5) * 2;
        newLoan += loanDecay * Math.random();

        debt += newLoan * Math.random();

        acceptCut(generateCut());

        var debtCut = Math.min(budget/2, debt/2)
        if (Math.floor(debtCut) > 1) {
            debt -= debtCut;
            extraGain -= debtCut;
        }

        incrementBudget(extraGain);
        extraGain = 0;
        //budget -= newLoan/interests;
        // incrementBudget( -newLoan/interests);
    }
}
