import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtMultimedia 6.4

Window {
    property string icon_lb: "file:///C:/Users/safiul alam/Downloads/leftB.png";
    property string icon_lo: "file:///C:/Users/safiul alam/Downloads/leftO.png";
    property string icon_rb: "file:///C:/Users/safiul alam/Downloads/rightB.png";
    property string icon_ro: "file:///C:/Users/safiul alam/Downloads/rightO";


    width: 640
    height: 480
    visible: true
    title: qsTr("Radio")

    MediaPlayer {
        id: player
        source: "file:///C:/Users/safiul alam/Downloads/Message Tone.mp3"


    }
    Button{

        id: btn2;
        width: 80;
        height: 80;
        onClicked:
        {
            player.play()
        }
    }

    Column{
        spacing: 20
        anchors.fill: parent
        padding: 20

        Rectangle {
            width: parent.width
            height: parent.height * 0.2
            color: "#2196F3"
            Text {
                id: title_text
                text: "Radio "
                font.pointSize: 28
                font.bold: true
                color: "white"
                anchors.centerIn: parent
            }
        }

        Row {
            spacing: 20

            Button{
                id: btn_1
                width: 80;
                height: 80;
                background: Image
                {
                    source: btn_1.pressed? icon_lo : icon_lb;
                }
                onClicked:
                {
                    myapp.func_btn_dec()
                }
            }

            Column {
                spacing: 20

                Rectangle {
                    width: 150
                    height: 30
                    Text {
                        id: txt_box
                        text: "95.7"
                        font.pointSize: 24
                        anchors.centerIn: parent
                    }

                    border.color: "black"
                    border.width: 2
                }

                Slider{
                    id: slider_1
                    width: 250
                    from: 1
                    to: 150
                    value: txt_box.text
                    onMoved:{
                          //txt_box.text = slider_1.value;
                        if(slider_1.value>txt_box.text){
                            myapp.func_btn_inc();
                        } else {
                            myapp.func_btn_dec();
                        }
                    }
                }

            }

            Button{

                id: btn_2
                width: 80;
                height: 80;
                background: Image
                {
                    source: btn_2.pressed? icon_ro : icon_rb;
                }
                onClicked:
                {
                    myapp.func_btn_inc()
                    player.play()
                }
            }
        }

        Column{
            spacing: 20


            RadioButton{
                checked: true
                text: qsTr("CH1")
                font.pointSize: 20
                onClicked:
                {
                    myapp.func_btn_ch1()
                }
            }

            RadioButton{
                checked: false
                text: qsTr("CH2")
                font.pointSize: 20
                onClicked: {
                    myapp.func_btn_ch2()
                }
            }

            RadioButton{
                checked: false
                text: qsTr("CH3")
                font.pointSize: 20
                onClicked: {
                    myapp.func_btn_ch3()
                }
            }

            RadioButton{
                checked: false
                text: qsTr("Off")
                font.pointSize: 20
                onClicked:
                {
                    myapp.func_btn_off()
                }
            }

            Connections
            {
                target:myapp
                ignoreUnknownSignals: true

                function onSendMess(text_box_str)
                {
                    txt_box.text = text_box_str;

                }
            }
        }

    }


}
