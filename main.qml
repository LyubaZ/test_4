import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Window {

    property int xPos : -100
    property int yPos : -100

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onPositionChanged: {
            xPos=mouse.x
            yPos=mouse.y
            //console.log(xPos,yPos)
        }

    }
    /* Основные настройки окна */

    id: win
    minimumWidth: 700
    maximumWidth: 700

    minimumHeight:  cl.height+50
    maximumHeight:  cl.height+50

    color: "#FFFFFF"//Qt.rgba(169/255,  212/255,  224/255);// фон

    visible: true

    title: qsTr("My Game") // название

    ColumnLayout{
        id:cl
        anchors.centerIn: parent
        spacing: 2
        Gameplay{

            id:cl_game
        }

        Rectangle{
        color: "#BFB130";
        width: 630;
        height: 40;
        }
        Toolbar{
            height: 100
            id:cl_tool

            onQuitApp:{
                Qt.quit()
            }
            onClearGame: {
                cl_game.cleanGame()
            }

        }
    }
    Rectangle{
        height: 50
        width: 50
        radius: 100
        color:Qt.rgba(1, (cl_game.config+1)%2 , 0); //"black"
        x : xPos-45
        y : yPos-30

    }

    }
