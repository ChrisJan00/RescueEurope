#ifndef SOUNDCLIP_H
#define SOUNDCLIP_H

#include <QString>
#include <QObject>

class SoundClipPrivate;
class MusicClipPrivate;

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
    bool playing() const;

    Q_INVOKABLE void play();
    Q_INVOKABLE void stop();

signals:
    void sourceChanged();
    void playingChanged();

private:
    SoundClipPrivate *d;
};

class MusicClip : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)
public:
    explicit MusicClip(QObject *parent = 0);
    ~MusicClip();

    QString source() const;
    void setSource(const QString &newSource);
    bool playing() const;

    // used internally
    void notifyFinish();

    Q_INVOKABLE void play();
    Q_INVOKABLE void stop();
    Q_INVOKABLE void enqueue();
    Q_INVOKABLE void loop(int n);
    Q_INVOKABLE void fadeOut(int ms);

signals:
    void sourceChanged();
    void playingChanged();

private:
    MusicClipPrivate *d;
};

#endif // SOUNDCLIP_H
