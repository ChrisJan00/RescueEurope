#ifndef SOUNDCLIP_H
#define SOUNDCLIP_H

#include <QString>
#include <QObject>

class SoundClipPrivate;

class MixerInstance {
public:
    explicit MixerInstance();
    ~MixerInstance();
    bool isValid() const;
private:
    bool valid;
};

class SoundClip : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)
public:
    explicit SoundClip(QObject *parent = 0);
    ~SoundClip();

    QString source() const;
    void setSource(const QString &newSource);

    Q_INVOKABLE void play();
    Q_INVOKABLE void stop();

    bool playing() const;

signals:
    void sourceChanged();
    void playingChanged();

private:
    SoundClipPrivate *d;
};

#endif // SOUNDCLIP_H
