#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>


int main(int argc, char *argv[]) {

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/images/Invader.png"));
    QQmlApplicationEngine engine;
    engine.load("qml/main.qml");
    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);
    window->show();
    return app.exec();
}