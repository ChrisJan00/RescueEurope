// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: dialogBG

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#5078a0" }
        GradientStop { position: 1.0; color: "#699ed3" }
    }

    border.width: 1
    border.color: "#304961"
    radius: 4
}
