import QtQuick 2.12

Rectangle{
    id :iconButton
    property alias img_src : icon.source
    property alias btn_txt : button.text

    property color clr_enter: "#dcdcdc"
    property color clr_exit: "#ffffff"
    property color clr_click:"#ada9b2"
    property color clr_release:"#ffffff"

    signal clickedLeft()
    signal clickedRight()
    signal release()

    width : 130
    height : 130
    radius : 10

    Image{
        id : icon
        width : 80
        height : 80
        source : "qrc:/left/ImageUI/leftNavgation/set_select.png"
        fillMode: Image.PreserveAspectFit
        clip: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
    }

    Text{
        id:button
        text:qsTr("button")
        anchors.top: icon.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: icon.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        font.bold: true
        font.pointSize: 14
    }

    MouseArea{
        id : mouseArea
        anchors.fill: parent
        hoverEnabled: true
        //接收鼠标左键和右键
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked:{
            if(mouse.button == Qt.LeftButton)
            {
                parent.clickedLeft()
            }
            else if(mouse.button == Qt.RightButton)
            {
                parent.clickedRight()
            }
        }

        onPressed: {
            color = clr_click
        }

        onReleased: {
            color = clr_release
        }

        onEntered: {

            color = clr_enter
        }

        onExited: {
            color = clr_exit
        }
    }

}
