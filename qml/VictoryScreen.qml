import QtQuick 1.1
import SDLMixerWrapper 1.0

Item {
    id: victoryScreen

    z: 10

    parent: map
    anchors.fill: parent

    property bool ending: liveCountries == 0
    onEndingChanged: if (ending) show();

    visible: false

    Connections {
        target: root
        onRestartAll: {
            hide();
            victoryDialog.opacity = 0;
            victoryDialog.active = true;
            victoryDialog.state = ""
            victoryDialog.visible = true;
            floatingText.style = Text.Outline
        }
    }

    function show() {
        root.finishGame();
        root.elapsedTime = new Date().getTime() - root.startTime;
        visible = true;
        endTheme.enqueue();
        victoryAnimation.start();
    }

    function hide() {
        fireworks.stop();
        endTheme.stop();
        visible = false;
    }

    MusicClip {
        id: endTheme
        source: "snds/final_theme.ogg"
        onPlayingChanged: if (!playing)
                              showDialogAnimation.start();
    }

    SequentialAnimation {
        id: victoryAnimation
        PropertyAction {
            target: floatingText
            property: "y"
            value: -40
        }
        PropertyAction {
            target: floatingText
            property: "visible"
            value: true
        }

        PauseAnimation { duration: 4000 }

        ScriptAction {
            script: fireworks.activate();
        }

        NumberAnimation {
            target: floatingText
            property: "y"
            duration: 20000
            from: -40
            to: victoryScreen.height/2 - 50 + 6
        }
    }

    SequentialAnimation {
        id: showDialogAnimation
        PropertyAnimation {
            target: victoryDialog
            property: "opacity"
            from: 0
            to: 1
            duration: 1000
        }
        PropertyAction {
            target: floatingText
            property: "visible"
            value: false
        }
    }

    Fireworks {
        id: fireworks
        z:9
    }

    Text {
        id: floatingText
        font.pixelSize: 24
//        parent: map
        z: 11
        x: victoryDialog.x + 13
        y: victoryDialog.y + 12
        color: textColor
        text: "YOU WIN! YOU RESCUED ALL EUROPE!"
        //opacity: contents.opacity
        visible: false
        style: Text.Outline
        styleColor: "blue"
    }

    VictoryDialog {
        id: victoryDialog
        state: ""
        visible: true
        opacity: 0
    }
}
