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
    property int stability: 100
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
    property bool isPlayable : !rescued && state != "disabled"

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
        },
        State {
            name: "disabled"
            when: root.mode == "half" && !country.isEuroZone;
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
        onBeginGame: decayTimer.restart();
        onFinishGame: decayTimer.stop();
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
            if (isPlayable)
                country.state = "hovered"
            if (country.state != "disabled")
                root.currentCountry = country;
            country.z = 1
        }
        onExited: {
            if (isPlayable)
                country.state = ""
            country.z = 0
        }
        onPressed: {
            if (isPlayable) {
                country.state = "pressed";
                if (budget > 0 && toReturn > 0) {
                    owingDialog.activate(country);
                } else if (budget > 0 && loanDialog.state=="hidden") {
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
            if (isPlayable) {
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
        visible: isPlayable
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
            if (!isPlayable)
                return;
            returnDialog.returnList.append(generateCut())
            returnDialog.activate();
        }
    }

    Timer {
        id: decayTimer
        running: false
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
        newLoan = capacity * (5 + 8 * Math.random()) / 100
        loanDecay = 100* newLoan / capacity / (Math.random()+1)
        interests = 1+capacity/10000
        interestDecay = interests / 100
        returnDelay = 3000 * (1 + Math.random()*2)
        decayDelay = 4000 * (1 + Math.random()*4)

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

    function generateCut(exp)
    {
        var exponent = exp? exp : 3;
        return {
            "currentCountry" : country,
            "returned" : toReturn,
            "healthCuts" : Math.pow(Math.random(),exponent) * health,
            "eduCuts" : Math.pow(Math.random(),exponent) * edu,
            "scienceCuts" : Math.pow(Math.random(),exponent) * science,
            "unemplCuts" : Math.pow(Math.random(),exponent) * unempl,
            "pensionCuts" : Math.pow(Math.random(),exponent) * pension
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
        toReturn = 0;
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

        // account for rounding errors
        if (health < 0) health = 0;
        if (edu < 0) edu = 0;
        if (science < 0) science = 0;
        if (unempl < 0) unempl = 0;
        if (pension < 0) pension = 0;

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
        if (!isPlayable)
            return;
        interests += interestDecay * (Math.random() - 0.5) * 2;
        newLoan += loanDecay * Math.random();

        debt += newLoan * Math.random();

        acceptCut(generateCut(6));

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
