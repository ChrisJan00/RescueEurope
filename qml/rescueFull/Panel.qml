import QtQuick 1.1

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

    onLiveCountriesChanged: if (liveCountries/totalCountries < 0.33)
                                protaPicture.state = "superrich";
                            else if (liveCountries/totalCountries < 0.66)
                                protaPicture.state = "rich";

    Connections {
        target: root
        onRestartAll: {
            liveCountries = 27;
            funds = 1000;
            startDialog.show();
        }
    }

    Image {
        id: protaPicture
        anchors.horizontalCenter: parent.horizontalCenter
        source: "pics/rich_guy1.png"
        y: 30
        states: [
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

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Your funds: "+root.funds+"M €"
        y: 10
        color: root.textColor
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
            color: root.textColor
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":"National Debt: "+currentCountry.debt+"M €";
            height: 30
            color: root.textColor
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

    Item {
        anchors.verticalCenter:parent.verticalCenter
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
