import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12



ApplicationWindow
{

    width: 340
    height: 480

    visible: true
    title: qsTr("Калькулятор сроков годности")

    property int defMargin: 5
    property int font_size: 17
    property int rad_size: 8

    property color empty_field: "#ed2f39"

                //day mode
    property color bck_day: "white"
    property color border_day: "#00b300"
    property color btn_pressed_day: "#19ff19"

    property color tab_active_day: "#ebebeb"
    property color tab_unactive_day: "#9e9e9e"

                //night mode
    property color bck_night: "#161a1e"
    property color border_night: "#cd5700"
    property color btn_pressed_night: "#fefe22"

    property color tab_active_night: "#cc7a00"
    property color tab_unactive_night: "#3b3c36"

    color: control.checked ? bck_night : bck_day

    header: Item
    {
        id: hdr

        RowLayout
        {
            anchors.fill: parent

            Switch
            {
                id: control
                text: control.checked ? "day mode" : "night mode"
                Layout.alignment: Qt.AlignLeft

                indicator: Rectangle
                {
                    implicitWidth: 50
                    implicitHeight: 20
                    x: control.leftPadding
                    y: parent.height / 2 - height /2
                    radius: 13
                    color: control.checked ? border_day : border_night

                    Rectangle
                    {
                        x: control.checked ? parent.width - width : 0
                        y: parent.height / 2 - height /2
                        width: 26
                        height: 26
                        radius: 13
//                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                        color: control.checked ? border_night : border_day
                        border.color: control.checked ? border_day : border_night
                        border.width: 2
                    }
                }

                contentItem: Text {
                    text: control.text
                    color: control.checked ? bck_day : bck_night
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: control.indicator.width + control.spacing
                }
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
                implicitWidth: hdr.width
            }

            RoundButton
            {
                Layout.alignment: Qt.AlignRight
                id: rnd_btn
                Layout.margins: defMargin

                text: "?"


                contentItem: Text {
                    text: rnd_btn.text
                    font: rnd_btn.font
                    opacity: enabled ? 1.0 : 0.3
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    elide: Text.ElideRight
                    color: control.checked ? bck_day: bck_night

                }

                background: Rectangle
                {
                    implicitHeight: 30
                    implicitWidth: 30
                    radius: 20
                    color: control.checked ? bck_night: bck_day
//                    border.color: control.checked ? border_night : border_day

                    border.color: control.checked ? rnd_btn.down ? btn_pressed_night : border_night
                                                : rnd_btn.down ? btn_pressed_day : border_day
                    border.width: rnd_btn.down ? 2 : 1
                }


                onClicked:
                {
//                    tabBar.currentIndex = 2
                    swipeView.setCurrentIndex(2)
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

            background: Rectangle
            {
                id: rect1
                anchors.fill: parent
                color: control.checked ? bck_night: bck_day
            }
        }

        Page2 {
            id: pg2

            background: Rectangle
            {
                anchors.fill: parent
                color: control.checked ? bck_night: bck_day
            }
        }

        Page
        {
            id: helpPAge
            Label
            {
                anchors.centerIn: parent
                text: "About program and dev"
                color: control.checked ? bck_day: bck_night

            }

            background: Rectangle
            {
                anchors.fill: parent
                color: control.checked ? bck_night: bck_day
            }
        }
    }

    footer: TabBar
    {
        id: tabBar
        currentIndex: swipeView.currentIndex
        background: Rectangle
        {
            color: control.checked ? bck_night : bck_day
        }

        TabButton {
            id: btn1

            font.pixelSize: 17
            background: Rectangle{
                color: control.checked ?
                           btn1.activeFocus  ? "#cc7a00" : "#3b3c36"
                                        :   btn1.activeFocus  ? "#ebebeb" : "#9e9e9e"
                border.color: control.checked ? border_night : border_day
                radius: 2

            }

            contentItem: Text {
                text: qsTr("Дата и количество\n дней")
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                color: control.checked ? bck_day : bck_night
            }
        }
        TabButton {
            id: btn2

            font.pixelSize: 17
            background: Rectangle{
                color: control.checked ?
                           btn2.activeFocus  ? tab_active_night : tab_unactive_night
                                        :   btn2.activeFocus  ? tab_active_day : tab_unactive_day
                border.color: control.checked ? border_night : border_day
                radius: 2

            }

            contentItem: Text {
                text: qsTr("Две даты")
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                color: control.checked ? bck_day : bck_night
            }
        }
    }

}
