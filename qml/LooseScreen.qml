import QtQuick 1.1
import SDLMixerWrapper 1.0

DialogBG {
    id: looseScreen

    originalWidth: looseText.width + 24
    originalHeight: 100
    anchors.centerIn: parent
    z: 10
    property bool active: false

    parent: map

    SoundClip {
        id: singleCoinSound
        source: "snds/onecoin.ogg"
    }

    Column {
        id: contents
        width: parent.width
        y: 6
        spacing: 8
        Text {
            id: looseText
            font.pixelSize: 24
            x: 12
            color: textColor
            text: "Not enough cash to invest.  You loose."
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: {
                var mins = Math.floor(root.elapsedTime / 60000);
                var secs = (root.elapsedTime - mins * 60000) / 1000;
                return "Final earnings: " + root.funds + " M €, Total Time: "+ mins + " min " + secs +" secs";
            }
        }
        Button {
            label: "Start New Game"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:  {
                hide();
                restartAll();
            }
        }
    }

    function activate()
    {
        root.elapsedTime = new Date().getTime() - root.startTime;
        root.finishGame();
        singleCoinSound.play();
        show();
    }
}
