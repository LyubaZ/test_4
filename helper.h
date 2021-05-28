#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include<QVector>

class helper : public QObject
{
    Q_OBJECT
public:
    explicit helper(QObject *parent = nullptr);

signals:

public slots:
    QString winer(QVector<int> G);
    QVector<int>down(QVector<int> G);
    QVector<int>light(QVector<int> G);

};

#endif // HELPER_H
