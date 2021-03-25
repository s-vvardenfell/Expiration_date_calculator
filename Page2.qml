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
            color: "black"

            onActiveFocusChanged:
            {
                rect1.border.width = activeFocus ? 3 : 2
            }

            placeholderText: "Enter product date"
            validator: RegExpValidator { regExp: /[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}/}
            background: Rectangle
            {
                id: rect1
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
            id: tf_expired_date
            selectByMouse: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: font_size
            color: "black"

            onActiveFocusChanged:
            {
                rect2.border.width = activeFocus ? 3 : 2
            }

            placeholderText: "Enter expiration date"
            validator: RegExpValidator { regExp: /[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}/}
            background: Rectangle
            {
                id: rect2
                border.color: tf_product_date.text.length < 10 ? "red" : "#2b5278"
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
            text:"Calculate"
            font.pixelSize: font_size
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
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                border.color: regBtn.down ? "#1ec4c1" : "#2b5278"
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
            color: "black"
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
            Layout.fillHeight: true
        }

    }
}
