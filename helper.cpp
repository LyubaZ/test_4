#include "helper.h"
#include <QDebug>
#include <QSet>
#include <QMap>
#include <QVector>
#include <QList>
#include <QRandomGenerator>
#include <QDialog>
#include <QMessageBox>
#include <QApplication>

helper::helper(QObject *parent) : QObject(parent)
{

}

/*
*       Функция проверки события "Победа"
*       входные: G - вектор значений в ячейках(0-пусто,1-фишка первого,2-фишка второго)
*
*       выходные:
*           0 - пока победителя нет
*           1 - победил игрок ходивший первым
*           2 - победил игрок ходивший вторым
*
*/
QString helper::winer(QVector<int> G)
{
    /*
    *       Проверка заполненности поля
    */
        int f = 0;
        QString win = 0;
        for(int i = 0;i<42-3;i++){
            if(G[i]==0){
               f = 1;
            }
        }
     if(!f){
         win = "Ничья!";
     }
     //Проверка победы по горизонтали
    for(int i = 0;i<42-3;i++){
        if( G[i] && G[i]==G[i+1] && G[i+1]==G[i+2] && G[i+2]==G[i+3] ){
            if(G[i]==1){
                win = "Первый игрок победил!";
                return win;
            }
            else{
                win = "Второй игрок победил!";
                return win;
            }
        }
    }
    //Проверка победы по вертикали
    for(int i = 0;i<42-21;i++){
        if( G[i] && G[i]==G[i+7] && G[i+7]==G[i+14] && G[i+14]==G[i+21] ){
            if(G[i]==1){
                win = "Первый игрок победил!";
                return win;
            }
            else{
                win = "Второй игрок победил!";
                return win;
            }
        }
    }

    /*
    *       Проверка горизонтали "\"
    */
    for(int i = 0;i<21;i++){
        if (i%7>3) continue;
        if( G[i] && G[i]==G[i+7+1] && G[i+14+2]==G[i+7+1] && G[i+7+1]==G[i+21+3]){
            if(G[i]==1){
                win = "Первый игрок победил!";
                return win;
            }
            else{
                win = "Второй игрок победил!";
                return win;
            }
        }
    }
/*
*       Проверка горизонтали "/"
*/
    for(int i = 0;i<21;i++){
        if (i%7<3) continue;
        if( G[i] && G[i]==G[i+7-1] && G[i+14-2]==G[i+7-1] && G[i+7-1]==G[i+21-3]){
            if(G[i]==1){
                win = "Первый игрок победил!";
                return win;
            }
            else{
                win = "Второй игрок победил!";
                return win;
            }
        }
    }
    return win;

};

/*
*       Функция проверки события "Фишка поставленна"
*       входные: G - вектор значений в ячейках(0-пусто,1-фишка первого,2-фишка второго)
*
*       выходные:
*           новый вектор с уже упавшими фишками
*
*/
QVector<int>helper::down(QVector<int> G)
{
    for(int i = 7; i<42;i++){
       if(G[i]==0){
           G[i]=G[i-7];
           G[i-7]=0;
       }
    }
     return G;
};
QVector<int>helper::light(QVector<int> G)
{
    //qDebug()<<"1";
//Проверка победы по горизонтали
for(int i = 0;i<42-3;i++){
    if( G[i] && G[i]==G[i+1] && G[i+1]==G[i+2] && G[i+2]==G[i+3] ){
        G[i]=3;G[i+1]=3;G[i+3]=3;G[i+2]=3;
            return G;

    }
}
//Проверка победы по вертикали
for(int i = 0;i<42-21;i++){
    if( G[i] && G[i]==G[i+7] && G[i+7]==G[i+14] && G[i+14]==G[i+21] ){
        G[i]=3;G[i+7]=3;G[i+14]=3;G[i+21]=3;
            return G;
    }
}

/*
*       Проверка по диагонали "\"
*/
for(int i = 0;i<21;i++){
    if (i%7>3) continue;
    if( G[i] && G[i]==G[i+7+1] && G[i+14+2]==G[i+7+1] && G[i+7+1]==G[i+21+3]){
            G[i]=3;G[i+7+1]=3;G[i+14+2]=3;G[i+21+3]=3;
            return G;
    }
}
/*
*       Проверка по диагонали "/"
*/
for(int i = 0;i<21;i++){
    if (i%7<3) continue;
    if( G[i] && G[i]==G[i+7-1] && G[i+14-2]==G[i+7-1] && G[i+7-1]==G[i+21-3]){
        G[i]=3;G[i+7-1]=3;G[i+14-2]=3;G[i+21-3]=3;
            return G;
    }
}
return G;

};


