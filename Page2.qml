import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

Page
{
    ColumnLayout
    {
        id: loGeneral
        anchors.fill: parent
        anchors.margins: defMargin*6
        spacing: defMargin*2

        TextField
        {
            id: tf_product_date
            selectByMouse: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: font_size
            color: control.checked ? bck_day: bck_night

            onActiveFocusChanged:
            {
                rect1.border.width = activeFocus ? 2 : 1
            }

            placeholderText: "Дата производства"
            validator: RegExpValidator { regExp: /[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}/}

            background: Rectangle
            {
                id: rect1
                border.color: control.checked ? tf_product_date.text.length < 10 ? empty_field : border_night
                                    : tf_product_date.text.length < 10 ? empty_field : border_day
                color:control.checked ? bck_night : bck_day
                radius: rad_size
                border.width: 1
            }
        }

        Item
        {
            Layout.margins: defMargin
        }

        TextField
        {
            id: tf_expired_date
            selectByMouse: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: font_size
            color: control.checked ? "white" : "black"

            onActiveFocusChanged:
            {
                rect2.border.width = activeFocus ? 2 : 1
            }

            placeholderText: "Годен до"
            validator: RegExpValidator { regExp: /[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}/}
            background: Rectangle
            {
                id: rect2
                border.color: control.checked ? tf_expired_date.text.length < 10 ? empty_field : border_night
                                    : tf_expired_date.text.length < 10 ? empty_field : border_day
                color:control.checked ? bck_night : bck_day
                radius: rad_size
                border.width: 1
            }
        }

        Item
        {
            Layout.margins: defMargin
        }

        Button
        {
            id: regBtn
            text:"Посчитать"
            font.pixelSize: font_size
            Layout.fillWidth: true
            Layout.fillHeight: true
            activeFocusOnTab: true

            enabled: (tf_product_date.text.length == 10 && tf_expired_date.text.length == 10) ? true : false


            onActiveFocusChanged:
            {
                rectReg.border.width = activeFocus ? 3 : 2
            }

            contentItem: Text
            {
                text: regBtn.text
                font: regBtn.font
                opacity: enabled ? 1.0 : 0.3
//                color: regBtn.down ? "#1ec4c1" : "#00b300"
                color: control.checked ? bck_day : bck_night
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle
            {
                id: rectReg
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                border.color: control.checked ? regBtn.down ? btn_pressed_night : border_night
                                            : regBtn.down ? btn_pressed_day : border_day
                color: control.checked ? bck_night : bck_day
                border.width: 1
                radius: rad_size
            }

            onClicked:
            {
                lbl_days_left.text = Calc.getDataFromQML_P2(tf_product_date.text, tf_expired_date.text)
            }
        }

        Item
        {
            Layout.margins: defMargin
        }

        Label
        {
            id: lbl_days_left_head
            Layout.fillWidth: true
            text: "Осталось дней:"
            font.pixelSize: font_size
            color: control.checked ? bck_day : bck_night
        }

        Label
        {
            id: lbl_days_left
            Layout.fillWidth: true
            Layout.fillHeight: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "x"
            font.pixelSize: font_size
            // font.bold: true
            color: control.checked ? bck_day : bck_night
            background: Rectangle
            {
                height: parent.height
                width: parent.width
                border.color: control.checked ? border_night : border_day
                color:control.checked ? bck_night : bck_day
                border.width: 1
                radius: rad_size
            }
        }

        Item
        {
            Layout.fillHeight: true
        }

    }
}
