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
            victoryDialog.opacity = 0;
            victoryDialog.active = false;
            victoryDialog.state = ""
            victoryDialog.visible = true;
            floatingText.style = Text.Outline
        }
    }

    function show() {
        visible = true;
        started();
        victoryAnimation.start();
    }

    function hide() {}

    function started() {
        endTheme.enqueue();
    }

    function closed() {
        endTheme.stop();
    }

    MusicClip {
        id: endTheme
        source: "snds/final_theme.ogg"
    }

    SequentialAnimation {
        id: victoryAnimation
        PropertyAction {
            target: floatingText
            property: "visible"
            value: true
        }
        NumberAnimation {
            target: floatingText
            property: "y"
            duration: 15000
            from: -20
            to: victoryScreen.height/2 - 50 + 12
        }
        PropertyAnimation {
            target: victoryDialog
            property: "opacity"
            from: 0
            to: 1
            duration: 15000
        }
        PropertyAction {
            target: victoryDialog
            property: "active"
            value: true
        }
        PropertyAction {
            target: floatingText
            property: "visible"
            value: false
        }
    }

    Text {
        id: floatingText
        font.pixelSize: 24
//        parent: map
        z: 11
        x: victoryDialog.x + 11
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
