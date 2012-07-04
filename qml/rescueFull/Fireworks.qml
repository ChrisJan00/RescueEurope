// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt.labs.particles 1.0
import SDLMixerWrapper 1.0

Item {
    id: fireworks
    parent: map
    anchors.fill: parent

    function activate()
    {
        emitterTimer.restart();
        soundTimer.restart();
    }

    function stop()
    {
        emitterTimer.stop();
        soundTimer.stop();
    }

    SoundClip {
        id: fw_final
        source: "snds/fw_final.ogg"
    }

    SoundClip {
        id: fw_long
        source: "snds/fw_final.ogg"
    }

    SoundClip {
        id: fw_minor
        source: "snds/fw_minor.ogg"
    }

    SoundClip {
        id: fw_retrac
        source: "snds/fw_retrac.ogg"
    }

    SoundClip {
        id: fw_seven
        source: "snds/fw_seven.ogg"
    }

    SoundClip {
        id: fw_tohard
        source: "snds/fw_tohard.ogg"
    }

    SoundClip {
        id: fw_two
        source: "snds/fw_two.ogg"
    }

    Particles {
        id: emitter
        property alias mx: gravity.xattractor
        y: 150
        x: 150
        width: 1
        height: 1
        source: "pics/fw_dot.png"
        lifeSpan: 2500
        count: 50
        emissionRate: 0
        angle: 270
        angleDeviation: 60
        velocity: 50
        velocityDeviation: 30
        lifeSpanDeviation: 2000
        ParticleMotionGravity {
            id: gravity
            yattractor: 1000
            xattractor: 0
            acceleration: 25
        }
    }

    Timer {
        id: soundTimer
        interval: 1200
        running: false
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            switch(Math.floor(Math.random()*7)) {
            case 0: fw_final.play(); break;
            case 1: fw_long.play(); break;
            case 2: fw_minor.play(); break;
            case 3: fw_retrac.play(); break;
            case 4: fw_seven.play(); break;
            case 5: fw_tohard.play(); break;
            case 6: fw_two.play(); break;
            }
        }
    }

    Timer {
        id: emitterTimer
        interval: 400
        running: false
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            emitter.x = Math.random() * fireworks.width;
            emitter.y = Math.random() * fireworks.height;
            emitter.mx = emitter.x
            emitter.burst(30);
        }
    }

}
