#ifndef VOICECALLAUDIORECORDER_H
#define VOICECALLAUDIORECORDER_H

#include <QAudioInput>
#include <QFile>
#include <QScopedPointer>

class VoiceCallAudioRecorder : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(VoiceCallAudioRecorder)

    Q_ENUMS(ErrorCondition)

    Q_PROPERTY(bool recording READ recording NOTIFY recordingChanged)

public:
    enum ErrorCondition {
        FileCreation,
        FileStorage,
        AudioRouting,
    };

    explicit VoiceCallAudioRecorder(QObject *parent);
    ~VoiceCallAudioRecorder();

    Q_INVOKABLE void startRecording(const QString &name, const QString &uid, bool incoming);
    Q_INVOKABLE void stopRecording();

    bool recording() const;

    Q_INVOKABLE QString decodeRecordingFileName(const QString &fileName);
    Q_INVOKABLE bool deleteRecording(const QString &fileName);

signals:
    void recordingChanged();
    void recordingError(ErrorCondition error);
    void callRecorded(const QString &fileName, const QString &label);

private slots:
    void inputStateChanged(QAudio::State state);

private:
    bool initiateRecording(const QString &fileName);
    void terminateRecording();

    QScopedPointer<QAudioInput> input;
    QScopedPointer<QFile> output;
    QString label;
    bool active;
};

#endif
