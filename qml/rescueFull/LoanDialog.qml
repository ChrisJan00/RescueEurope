// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import MultimediaExports 1.0

DialogBG {
    id: loanDialog
    property color textColor: "yellow"
    parent: map
    anchors.centerIn: parent
    z: 10
    originalWidth: 300
    originalHeight: 100
    property variant currentCountry : null

    property string countryName;
    property int countryLoan;
    property int countryDebt;
    property real countryInterests;

    function started() {
        if (!currentCountry)
            return;

        countryName = currentCountry.name;
        countryLoan = currentCountry.newLoan;
        countryDebt = currentCountry.debt;
        countryInterests = currentCountry.interests;
        loanButton.active = (countryLoan <= funds);
        if (loanButton.active)
            coinsSound.play();
        else
            singleCoinSound.play();
    }

    SoundClip {
        id: coinsSound
        source: "snds/coins.ogg"
    }

    SoundClip {
        id: singleCoinSound
        source: "snds/onecoin.ogg"
    }

    Column {
        id: contents
        anchors.centerIn: parent
        spacing: 5
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: countryName + " needs a loan of " + countryLoan + "M €"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: "National Debt: " + countryDebt + "M €"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: !currentCountry?"":
                "Interests: "+((countryInterests-1)*100).toFixed(2)+"%"
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30
            Button {
                id: loanButton
                label: "Lend"
                active: true
                onClicked: {
                    currentCountry.getLoan(countryInterests, countryDebt, countryLoan);
                    loanDialog.hide();
                    returnDialog.activate();
                }
            }
            Button {
                id: cancelButton
                label: "Ignore"
                active: true
                onClicked:  {
                    loanDialog.hide();
                    returnDialog.activate();
                }
            }
        }
    }
}
