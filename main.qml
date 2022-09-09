import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.5

Window {
    id: window
    visible: true
    width: 1920
    height: 1080
    //    title: qsTr("Hello World")



    Rectangle{
        id:navgation
        width:140
        height:parent.height
        anchors.left: parent.left
        anchors.top: parent.top

        Rectangle{
            width: parent.width
            height: parent.height
            id:rect
            anchors.centerIn: parent
            color:"white"

            Image{
                id:logo
                width:75
                height:71
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 35
                anchors.topMargin: 30
                source: "qrc:/new/prefix1/ImageUI/logo.png"
            }
            /***
            Button{
               width:140
               height:78
               text : qsTr("用户")
               y:262            //icon使用彩色图标时，颜色会变成灰白并且图标会发生变化
               icon.source:"qrc:/left/ImageUI/leftNavgation/evaluate_select.png"
               display: AbstractButton.TextUnderIcon
            }
            ****/

            Column{
                spacing : 10
                anchors.left: parent.left
                anchors.top: logo.bottom
                anchors.topMargin: 100

                IconButton{
                    id :userBtn
                    img_src: "qrc:/left/ImageUI/leftNavgation/user_normal.png"
                    btn_txt: qsTr("用户")
                }
                IconButton{
                    id :evaluateBtn
                    img_src: "qrc:/left/ImageUI/leftNavgation/evaluate_normal.png"
                    btn_txt: qsTr("评估")

                }
                IconButton{
                    id :trainBtn
                    img_src: "qrc:/left/ImageUI/leftNavgation/training_normal.png"
                    btn_txt: qsTr("训练")

                }
                IconButton{
                    id :recordBtn
                    img_src: "qrc:/left/ImageUI/leftNavgation/record_normal.png"
                    btn_txt: qsTr("记录")

                }
                IconButton{
                    id :setdBtn
                    img_src: "qrc:/left/ImageUI/leftNavgation/set_normal.png"
                    btn_txt: qsTr("设置")

                }
            }

        }

        DropShadow{
            anchors.fill: rect
            horizontalOffset: 7
            radius: 8.0
            samples: 16
            color: "#80000000"
            source: rect
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
