import QtQuick 1.1
import SDLMixerWrapper 1.0

DialogBG {
    id: victoryDialog

    originalWidth: 440
    originalHeight: 100
    anchors.centerIn: parent
    z: 10
    property bool active: false

    parent: map

    property bool ending: liveCountries == 0
    onEndingChanged: if (ending) show();

    opacity: 0.7

//    function started() {
//        endTheme.play();
//    }

//    function closed() {
//        endTheme.stop();
//    }

//    SoundClip {
//        id: endTheme
//        source: "snds/final_theme.ogg"
//    }

//    Text {
//        id: floatingText
//        font.pixelSize: 24
//        parent: map
//        z: 11
//        x: victoryDialog.x + 10
//        y: victoryDialog.y + 12
//        color: textColor
//        text: "YOU WIN! YOU RESCUED ALL EUROPE!"
//        opacity: contents.opacity
//        visible: victoryDialog.visible
//    }

    Column {
        id: contents
        anchors.centerIn: parent
        width: parent.width
        spacing: 8
        Text {
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
            text: "YOU WIN! YOU RESCUED ALL EUROPE!"
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
            active: victoryDialog.active
            onClicked:  {
                hide();
                restartAll();
            }
        }
    }
}
