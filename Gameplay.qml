import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
GridLayout{
    id: game
    width: 800
    height: 800
    property int config: 0
    columns:7
    rows: 7
    columnSpacing: 0
    rowSpacing: 0
   // signal cleanGame()


    function cleanGame(){
        for (var i = 0; i<42; i++){
            bricks.itemAt(i).color_= 0;
                bricks.itemAt(i).use= false;
                bricks.itemAt(i).zevardo= 0;
        }
    }
    function down(){
        dialog.win = false;
        var list = []
        //сбор информации
        for (var j = 0; j<42; j++)
           list.push( bricks.itemAt(j).color_)

        var down = helper.down(list)

        for (var i = 0; i<42; i++){
            bricks.itemAt(i).color_= down[i];
            if(down[i]===0){
                bricks.itemAt(i).use= false;
            }
            else{
                bricks.itemAt(i).use= true;
            }
        }
        var winchek = helper.winer(down) //winchek - информация о победе

        if (winchek){

            var G = helper.light(down)
            for (var f = 0; f<42; f++){
                if(G[f] === 3){
                    bricks.itemAt(f).zevardo=1;
                }
            }

            dialog.texts=winchek
            game.config=0
            dialog.win = true
            //cleanGame()

        }

}

    Repeater{

        id:bricks
        model:42
        Brick {

                onUpdated: cl_game.down()
        }
    }
    Dialog {
        property bool win: false
        property string texts: "-1"
        height: 300
        width:500
        id: dialog
        Label {
                text:dialog.texts
            }
        title:"Игра оконченна"
        modal: true
        standardButtons: Dialog.Ok
        anchors.centerIn: parent
        visible: win
    }

}
