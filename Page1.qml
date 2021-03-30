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
        spacing: defMargin

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
                rectPas.border.width = activeFocus ? 2 : 1
            }

            placeholderText: "Дата производства"
            validator: RegExpValidator { regExp: /[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}/}

            background: Rectangle
            {
                id: rectPas
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
            id: tf_shelf_time
            selectByMouse: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: font_size
            // font.bold: true
            color: control.checked ? bck_day: bck_night

            onActiveFocusChanged:
            {
                rectPas2.border.width = activeFocus ? 2 : 1
            }
            placeholderText: "Срок годности (дни)"
            validator: RegExpValidator { regExp: /[0-9]{4}/}

            background: Rectangle
            {
                id: rectPas2
                border.color: control.checked ? tf_shelf_time.text.length < 1 ? empty_field : border_night
                                    : tf_shelf_time.text.length < 1 ? empty_field : border_day
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
            font.pixelSize: font_size
            text:"Посчитать"
            Layout.fillWidth: true
            Layout.fillHeight: true
            activeFocusOnTab: true

            enabled: (tf_product_date.text.length == 10 && tf_shelf_time.text.length > 0) ? true : false

            onActiveFocusChanged:
            {
                rectReg.border.width = activeFocus ? 3 : 2
            }

            contentItem: Text
            {
                text: regBtn.text
                font: regBtn.font
                opacity: enabled ? 1.0 : 0.3
                color: control.checked ? bck_day : bck_night
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle
            {
                id: rectReg
                opacity: enabled ? 1 : 0.3
                border.color: control.checked ? regBtn.down ? btn_pressed_night : border_night
                                            : regBtn.down ? btn_pressed_day : border_day
                color: control.checked ? bck_night : bck_day
                border.width: 1
                radius: rad_size
            }

            onClicked:
            {
                Calc.getDataFromQML_P1(tf_product_date.text, tf_shelf_time.text)
                lbl_exp_date.text = Calc.calculate();
                lbl_days_left_head.text = Calc.isFresh() ? "Осталось дней:" : "Просрочено на:"
                lbl_days_left.text = Calc.days_to_expire() == 0 ? "Истекает сегодня" : Calc.days_to_expire()
            }
        }

        Item
        {
            Layout.margins: defMargin
        }

        Label
        {
            Layout.fillWidth: true
            text: "Дата истечение срока годности:"
            font.pixelSize: font_size
            color: control.checked ? bck_day : bck_night

            background: Rectangle
            {
                color:control.checked ? bck_night : bck_day
            }
        }

        Label
        {
            id: lbl_exp_date
            Layout.fillWidth: true
            Layout.fillHeight: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "xx.xx.xxxx"
            font.pixelSize: font_size
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
            Layout.margins: defMargin
        }

        Label
        {
            id: lbl_days_left_head
            Layout.fillWidth: true
            text: "Осталось дней:"
            font.pixelSize: font_size
            color: control.checked ? bck_day : bck_night
            background: Rectangle
            {
                color:control.checked ? bck_night : bck_day
            }
        }

        Label
        {
            id: lbl_days_left
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "x"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: font_size
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

        Item {
            Layout.fillHeight: true
        }

    }
}
