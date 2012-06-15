import QtQuick 1.1

Image {
    id: country

    property string sourceNormal
    property string sourceHover
    property string sourcePressed

    property string name: ""
    property bool isEuroZone: true
    property int debt: 100
    property int capacity: 1000
    property real delay: 2
    property real autoDebt: 1.05
    property bool rescued: false
    property int toReturn: 0
    property int newLoan: 100
    property real interests: 1.1

    property real health: Math.random() * 20
    property real edu: Math.random() * 8
    property real science: Math.random() * 4
    property real unempl: Math.random() * 20
    property real pension: Math.random() * 20
    property bool canCut: true

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
        y: country.y + country.height/2 - height/2
        z: 3
        visible: rescued
    }

    MouseArea {
        anchors.fill: parent
        anchors.leftMargin: parent.width > 30? parent.width/4:0
        anchors.rightMargin: parent.width > 30? parent.width/4:0
        anchors.topMargin: parent.height > 30? parent.height/4:0
        anchors.bottomMargin: parent.height > 30? parent.height/4:0
        hoverEnabled: true
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
            if (!rescued)
                country.state = "pressed";
            if (loanDialog.state=="hidden") {
                loanDialog.currentCountry = country;
                loanDialog.show();
            }
//            rescueDialog.show();
//            if (debt <= capacity && !rescued) {
//                       pressAnimation.restart();
//                       country.clickedForLoan();
//                   } else if(!rescued) {
//                       rescued = true;
//                       root.unit *= 2;
//                       root.liveCountries--;
//                   }
        }
        onReleased:
            if (!rescued) {
                if (containsMouse)
                    country.state = "hovered";
                else
                    country.state = "";
            }
    }

//    Timer {
//        id: autoDebtTimer
//        interval: 1000
//        running: true
//        repeat: true
//        onTriggered:
//            // repay
//            if (debt <= capacity) {
//                // inflation
//                debt = Math.round(debt*autoDebt)
//                // debts to player
//                if (toReturn > 0) {
//                    debt += toReturn;
//                    root.funds += toReturn;
//                    toReturn = 0;
//                }
//            }
//    }

//    Timer {
//        id: cutTimer
//        interval: 2533
//        running: true
//        repeat: true
//        onTriggered:
//            // cut
//            if (debt/capacity > 0.33 && canCut) {
//                health *= Math.random();
//                edu *= Math.random();
//                science *= Math.random();
//                unempl *= Math.random();
//                pension *= Math.random();
//                if (health+edu+science+unempl+pension < 1)
//                    canCut = false;
//                debt = Math.floor(debt * 0.5);
//            }
//    }

    // Debt Display
    Rectangle {
        parent: map
        x: country.x + country.width/2 - width/2
        y: country.y + country.height/2 - height/2
        width: Math.min(country.width,
                        country.width * debt / capacity)
        Behavior on width { PropertyAnimation { duration: 500 } }
        color: debt/capacity < 0.33? "green" :
               debt/capacity < 0.66? "orange" : "red"
        height: 4
        visible: !rescued
        border.width: 1
        border.color: "black"
        z: 2
    }

//    function clickedForLoan()
//    {
//        if (debt <= capacity) {
//            var tmp = Math.min(Math.min(debt, root.funds), root.unit);
//            debt -= tmp;
//            root.funds -= tmp;
//            toReturn += Math.round(root.unit*1.5);
//        }
//    }

    function getLoan()
    {
        if (newLoan <= funds) {
            debt += newLoan * interests;
            toReturn += newLoan * interests;
            funds -= newLoan;
            if (!returnTimer.running)
                returnTimer.restart();
        }

    }

    Timer {
        id: returnTimer
        running: false
        repeat: false
        interval: 1000
        onTriggered: {
            returnDialog.currentCountry = country;
            returnDialog.returned = toReturn;
            funds += toReturn;
            debt -= toReturn;
            toReturn = 0;
            returnDialog.show();
            }
        }

    function returnLoan()
    {}

    function rescue()
    {}
}
