import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

RowLayout{

    signal newGame()
    signal clearGame()
    signal quitApp()


    /* Книпка новой игры */
    Button{
        id: but_new
            text: "New game"
            onClicked: {
                clearGame()
            }
    }

    /* Текстовое поле для хода игрока */
    TextField
    {

         Layout.fillWidth: true
         readOnly: true

    }

    /* Книпка выход */
    Button
    {
             id: but_exit
            text: "Exit"
            onClicked: quitApp()
    }

    /* Горячая клавиша новой игры */
    Shortcut
    {
        sequences: ["N"]
        context: Qt.ApplicationShortcut
        onActivated:{
            clearGame()
        }
    }

    /* Горячая клавиша выхода */
    Shortcut
    {
        sequences: [ "StandardKey.Close","Q"]
        context: Qt.ApplicationShortcut
        onActivated: quitApp()
    }

}

