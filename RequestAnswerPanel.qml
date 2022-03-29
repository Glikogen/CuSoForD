import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Rectangle {
    RowLayout {
        anchors.fill: parent
        Layout.leftMargin: 200
        Layout.rightMargin: 20
        Rectangle {
            id: rectForConnectionSettingsIcon
            Layout.fillHeight: true
            width: 150
            Layout.margins: 10
            //Layout.leftMargin: 30
            Image {
                id: connectionSettingsIcon
                source: "qrc:/iconForConnectSett.png"
                anchors.fill: parent
            }
        }

        Rectangle {
            id: rectForDeviceChoiceIcon
            Layout.fillHeight: true
            width: 150
            Layout.margins: 10
            //Layout.leftMargin: 30
            Image {
                id: dataReceiveBlockIcon
                source: "qrc:/DeviceChoiceBlock.png"
                anchors.fill: parent
            }
        }

        Rectangle {
            id: rectForDataReceiveBlockIcon
            Layout.fillHeight: true
            width: 150
            Layout.margins: 10
            //Layout.leftMargin: 30
            Image {
                //id: dataReceiveBlockIcon
                source: "qrc:/DataReciveBlock.png"
                anchors.fill: parent
            }
        }

        Rectangle {
            id: rectForPositionElementsIcon
            Layout.fillHeight: true
            width: 150
            Layout.margins: 10
            //Layout.leftMargin: 30
            Image {
                //id: dataReceiveBlockIcon
                source: "qrc:/PositionElementsBlock.png"
                anchors.fill: parent
            }
        }
    }
}
