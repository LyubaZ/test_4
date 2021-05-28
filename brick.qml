import QtQuick 2.0

/* Рисование кирпича */
Rectangle{

    signal updated(int color_)

    width: 90
    height: 90
    color : "#1D7074"//Qt.rgba(120/255, 170/255, 224/255);

    property int zevardo: 0
    property int color_: 0

    property bool use: false

    /*
    *       Функция проверки события "Нажатие"
    *
    *       При нажатии сохраняет в color_ цвет нажавшего игрока и помещает в use false
    */
    function up(){

        /*Проверяем можно ли нажать*/
        if(!use){
            /* Запрещаем нажимать повторно и увеличиваем счетчик ходов */
            use = true ;
            game.config+=1;

            /*Присвоение цвета*/
            if(config%2==0){
                color_ = 2;
            }
            else{
                color_ = 1;
            }
        }
    }

    /*Рисование круга внутри кирпича*/
    Rectangle{
        x:5;
        y:5;
        radius: 100;
        width: 80;
        height: 80;
        color : Qt.rgba(!(use)*2/4 + use*(1)+zevardo ,!(use)*3/4 + use*(color_%2)+zevardo,!(use)+zevardo);

        MouseArea{
            anchors.fill: parent
            onClicked: {
                up()
                updated(parent.color_);
            }
        }
    }
}
