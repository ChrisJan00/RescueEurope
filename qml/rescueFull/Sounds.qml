// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import SDLMixerWrapper 1.0

Rectangle {
    width: 400
    height: 400
    SoundClip {
        id: playSound
        source: "snds/91924__benboncan__till-with-bell.wav"
//        source: "snds/start_theme.ogg"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: playSound.play();
    }
}
