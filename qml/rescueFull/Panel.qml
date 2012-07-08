import QtQuick 1.1
import SDLMixerWrapper 1.0

DialogBG {
    id: panel
    x: parent.width - width
    height: parent.height
    width: 295
    y: -1
    visible: true

    property int funds : 1000
    property variant currentCountry: null
    property variant totalCountries: 1
    property variant liveCountries: 1
    property variant eurozoneCountries: 1
    property variant initialCountries: 1

    onLiveCountriesChanged: if (liveCountries/initialCountries < 0.33)
                                protaPicture.state = "superrich";
                            else if (liveCountries/initialCountries < 0.66)
                                protaPicture.state = "rich";
                            else
                                protaPicture.state = "normal"

    Connections {
        target: root
        onRestartAll: {
            initialCountries = totalCountries;
            liveCountries = totalCountries;
            funds = 1000;
            fundsDisplay.oldFunds = funds;
            fundsDisplay.displayFunds = funds;
            currentCountry = null;
            startDialog.show();
        }
        onBeginGame: {
            initialCountries = root.mode == "full" ? totalCountries : eurozoneCountries;
            liveCountries = initialCountries;
            mainTheme.enqueue();
        }
        onFinishGame: {
            mainTheme.fadeOut(1000);
        }
    }

    MusicClip {
        id: mainTheme
        source: "snds/main_theme.ogg"
        fadeInTime: 200
        loops: -1
    }

    Image {
        id: protaPicture
        anchors.horizontalCenter: parent.horizontalCenter
        source: "pics/rich_guy1.png"
        y: 30
        states: [
            State { name: "normal" },
            State {
                name: "rich"
                PropertyChanges {
                    target: protaPicture
                    source: "pics/rich_guy2.png"
                }
            },
            State {
                name: "superrich"
                PropertyChanges {
                    target: protaPicture
                    source: "pics/rich_guy3.png"
                }
            }
        ]
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 280
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":currentCountry.name;
            color: root.textColor
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":("Groups: EU"+(currentCountry.isEuroZone?", Eurozone":""));
            height: 30
            color: root.textColor
        }
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: !currentCountry?"":"National Debt: "+currentCountry.debt+"M €";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Investment opportunity: "+currentCountry.newLoan+"M €";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Interest rate: "+((currentCountry.interests-1)*100).toFixed(2)+"%";
                height: 30
                color: root.textColor
            }
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":"Budget: "//+currentCountry.budget+"M €";
            color: root.textColor
        }
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: !currentCountry?"":"Health: "+currentCountry.health.toFixed(2)+"% GDP";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Education: "+currentCountry.edu.toFixed(2)+"% GDP";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Science: "+currentCountry.science.toFixed(2)+"% GDP";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Unemp. benefits: "+currentCountry.unempl.toFixed(2)+"% GDP";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Pensions: "+currentCountry.pension.toFixed(2)+"% GDP";
                color: root.textColor
            }
            Text {
                text: " "
            }
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":"Statistics:";
            color: root.textColor
        }
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: !currentCountry?"":"Unemployment Rate: "+((20-currentCountry.unempl)*2).toFixed(2)+"%";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Poverty: "+((20-currentCountry.pension)*1.9).toFixed(2)+"%";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Emigration rate: "+((20-currentCountry.science)*1.8).toFixed(2)+"%";
                color: root.textColor
            }
            Text {
                text: !currentCountry?"":"Suicide rate: "+(20-currentCountry.health).toFixed(2)+"%";
                color: root.textColor
            }
            Text {
                text: " "
            }
        }
    }

    Text {
        id: fundsDisplay
        property int oldFunds: funds
        property int newFunds: funds
        property int displayFunds: funds
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Your funds: " + displayFunds + "M €"
        y: protaPicture.height + 40
        color: root.textColor

        Behavior on displayFunds {
                NumberAnimation { duration: 1000 }
        }

        onNewFundsChanged: {
            displayFunds = newFunds;
            gainText.launch(newFunds - oldFunds);
            if (newFunds > oldFunds)
                increaseAnimation.start();
            else if (newFunds < oldFunds)
                decreaseAnimation.start();
            oldFunds = newFunds;
        }

        SequentialAnimation {
            id: increaseAnimation
            PropertyAction {  target: fundsDisplay; property: "color"; value: Qt.lighter("green"); }
            PauseAnimation { duration: 1000 }
            PropertyAction {  target: fundsDisplay; property: "color"; value: root.textColor; }
        }

        SequentialAnimation {
            id: decreaseAnimation
            PropertyAction {  target: fundsDisplay; property: "color"; value: "red"; }
            PauseAnimation { duration: 1000 }
            PropertyAction {  target: fundsDisplay; property: "color"; value: root.textColor; }
        }

        Text {
            id: gainText
            x: fundsDisplay.width/2 - width/2
            y: startY;
            z: 3
            opacity: 0
            color: root.textColor
            style: Text.Outline
            property int startY: fundsDisplay.height/2 - height/2;
            property color positiveColor: "green"
            property color negativeColor: "red"
            property int direction: 1
            function launch( amount )
            {
                if (amount == 0)
                    return;

                if (amount > 0) {
                    styleColor = positiveColor;
                    text = "+" + amount + " M €";
                    direction = 1;
                } else {
                    styleColor = negativeColor;
                    text = amount + " M €";
                    direction = -1;
                }
                gainAnimation.restart();
            }

            ParallelAnimation {
                id: gainAnimation

                PropertyAnimation {
                    target: gainText
                    property: "y"
                    from: gainText.startY - 16 * gainText.direction
                    to: gainText.startY - 40 * gainText.direction;
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
    }

    Item {
        y: parent.height/2 + 50
        x: 30
        Text {
            rotation: 45
            color:"red"
            visible: currentCountry!==undefined && currentCountry.rescued
            font.pointSize:32
            text:"RESCUED!"
            font.weight: Font.Bold
            style: Text.Outline
            styleColor: Qt.lighter(color)
        }
    }
}
