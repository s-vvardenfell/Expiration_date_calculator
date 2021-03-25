import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12



ApplicationWindow
{

    width: 340
    height: 480

    visible: true
    title: qsTr("Expiration date calculator")
    property int defMargin: 5
    property int font_size: 14
    property int rad_size: 8

                //day mode
//    property color brd_col_day_def: "red"
//    property color brd_col_filled: "blue"
    property color bckg_day: "yellow"

                //night mode
//    property color bck_def: "white"
    property color bckg_night: "grey"



    header: Item
    {
        id: hdr

        RowLayout
        {
            anchors.fill: parent

            Switch
            {
                id: control
                text: control.checked ? "night mode" : "day mode"
            }

            //сделать красиво
//            Switch
//            {
//                Layout.alignment: Qt.AlignLeft
//                id: control
//                text: "night mode"

//                indicator: Rectangle {
//                         implicitWidth: 48
//                         implicitHeight: 15
//                         x: control.leftPadding
//                         y: parent.height / 2 - height / 2
//                         radius: 13
//                         color: control.checked ? "orange" : "green"

//                         Rectangle {
//                             x: control.checked ? parent.width - width : 0
//                             width: 26
//                             height: 26
//                             radius: 13
//                             color: control.checked ? "white" : "white"
//                             border.color: control.checked ? "lightgrey" : "lightgrey"
//                             border.width: 1
//                         }
//                     }

//                     contentItem: Text {
//                         text: control.text
//                         font: control.font
//                         opacity: enabled ? 1.0 : 0.3
//                         color: control.checked ? "white" : "black"
//                         verticalAlignment: Text.AlignVCenter
//                         leftPadding: control.indicator.width + control.spacing
//                     }


//            }

            Item {
                Layout.fillWidth: true
            }

            RoundButton
            {
                Layout.alignment: Qt.AlignRight
                id: rnd_btn
                Layout.margins: defMargin
                height: 20
                width: 20
                text: "?"

                onClicked:
                {
                    tabBar.currentIndex = 2
                }

            }
        }
    }

    SwipeView
    {
        id: swipeView
        anchors.topMargin: defMargin*4
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
            id: pg1

//            background: Rectangle
//            {
//                id: rect1
//                anchors.fill: parent
//                color: control.checked ? "black": "white"
//            }
        }

        Page2 {
            id: pg2

//            background: Rectangle
//            {
//                anchors.fill: parent
//                color: control.checked ? "black": "white"
//            }
        }

        Page
        {
            id: helpPAge
            Label
            {
                anchors.centerIn: parent
                text: "About program and dev"

            }
        }
    }

    footer: TabBar
    {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Дата и количество\n дней")
            font.pixelSize: 17
        }
        TabButton {
            text: qsTr("Две даты")
            font.pixelSize: 17
        }
    }

}
