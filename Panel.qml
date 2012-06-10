import QtQuick 1.1

Image {
    id: panel
    source:"pics/panel.png"
    x: parent.width - width

    property int funds : 1000
    property int unit: 100
    property variant currentCountry: null
    property variant totalCountries: 1
    property variant liveCountries: 1

    onLiveCountriesChanged: if (liveCountries/totalCountries < 0.33)
                                protaPicture.state = "superrich";
                            else if (liveCountries/totalCountries < 0.66)
                                protaPicture.state = "rich";

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

    Image {
        id: rescueButton
        property bool enableIt: currentCountry!==undefined &&
                                !currentCountry.rescued && currentCountry.debt > currentCountry.capacity
        onEnableItChanged: if (enableIt && state=="")
                               state = "enabled"
                           else if (!enableIt)
                               state = "";

        y: 250
        anchors.horizontalCenter: parent.horizontalCenter
        source: "pics/butonDisabled.png"
        states: [
            State {
                name: "pressed"
                PropertyChanges {
                    target: rescueButton
                    source: "pics/butonPressed.png"
                }
            },
            State {
                name: "enabled"
                PropertyChanges {
                    target: rescueButton
                    source: "pics/butonNormal.png"
                }
            }
        ]
        MouseArea {
            anchors.fill: parent
            onPressed: if (parent.state=="enabled") {
                           parent.state = "pressed"
                       }
            onReleased: if (parent.state=="pressed") {
                            parent.state = "enabled"
                            if (currentCountry) {
                                currentCountry.rescued = true;
                                unit *= 2;
                                liveCountries--;
                            }
                        }
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Your funds: "+root.funds+"M €"
        y: 10
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 280
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":currentCountry.name;
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":("Groups: EU"+(currentCountry.isEuroZone?", Eurozone":""));
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":"National Debt: "+currentCountry.debt+"M €";
            height: 30
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":"Budget:";
        }
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: !currentCountry?"":"Health: "+currentCountry.health.toFixed(2)+"% GDP";
            }
            Text {
                text: !currentCountry?"":"Education: "+currentCountry.edu.toFixed(2)+"% GDP";
            }
            Text {
                text: !currentCountry?"":"Science: "+currentCountry.science.toFixed(2)+"% GDP";
            }
            Text {
                text: !currentCountry?"":"Unemp. benefits: "+currentCountry.unempl.toFixed(2)+"% GDP";
            }
            Text {
                text: !currentCountry?"":"Pensions: "+currentCountry.pension.toFixed(2)+"% GDP";
            }
            Text {
                text: " "
            }
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: !currentCountry?"":"Statistics:";
        }
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: !currentCountry?"":"Unemployment Rate: "+((20-currentCountry.unempl)*2).toFixed(2)+"%";
            }
            Text {
                text: !currentCountry?"":"Poverty: "+((20-currentCountry.pension)*1.9).toFixed(2)+"%";
            }
            Text {
                text: !currentCountry?"":"Emigration rate: "+((20-currentCountry.science)*1.8).toFixed(2)+"%";
            }
            Text {
                text: !currentCountry?"":"Suicide rate: "+(20-currentCountry.health).toFixed(2)+"%";
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
        }
    }
}
