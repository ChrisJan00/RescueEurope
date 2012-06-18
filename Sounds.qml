// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtMultimediaKit 1.1

Item {
    SoundEffect {
        id: playSound
        source: "snds/91924__benboncan__till-with-bell.wav"
    }

    MouseArea {
        parent: root
        anchors.fill: parent
        onClicked: playSound.play();
    }
}
