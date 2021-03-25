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
            color: "black"

            onActiveFocusChanged:
            {
                rectPas.border.width = activeFocus ? 3 : 2
            }

            placeholderText: "Enter product date"
            validator: RegExpValidator { regExp: /[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}/}
            background: Rectangle
            {
                id: rectPas
                border.color: tf_product_date.text.length < 10 ? "red" : "#2b5278"
                radius: rad_size
                border.width: 2
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
            color: "black"

            onActiveFocusChanged:
            {
                rectPas2.border.width = activeFocus ? 3 : 2
            }
            placeholderText: "Enter shelf date"
            validator: RegExpValidator { regExp: /[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}/}

            background: Rectangle
            {
                id: rectPas2
                border.color: tf_shelf_time.text.length < 10 ? "red" : "#2b5278"
                radius: rad_size
                border.width: 2
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
            text:"Calculate"
            Layout.fillWidth: true
            Layout.fillHeight: true
            activeFocusOnTab: true

            onActiveFocusChanged:
            {
                rectReg.border.width = activeFocus ? 2 : 1
            }

            contentItem: Text
            {
                text: regBtn.text
                font: regBtn.font
                opacity: enabled ? 1.0 : 0.3
                color: regBtn.down ? "#1ec4c1" : "#2b5278"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle
            {
                id: rectReg
                opacity: enabled ? 1 : 0.3
                border.color: regBtn.down ? "#1ec4c1" : "#2b5278"
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
            color: "black"
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
            color: "black"

            background: Rectangle
            {
                height: parent.height
                width: parent.width
                border.color: "black"
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
            color: "black"
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
            color: "black"

            background: Rectangle
            {
                height: parent.height
                width: parent.width
                border.color: "black"
                border.width: 1
                radius: rad_size
            }
        }

        Item {
            Layout.fillHeight: true
        }

    }
}
