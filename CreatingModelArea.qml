import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Item {
    id: creatingModelArea
    anchors.fill: back
    Rectangle {
        anchors.fill: parent
        color: "darkgray"
        border.width: 2
        Rectangle {
            id: itemPanel
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height / 5
            border.width: 1
            color: "gray"

            RequestAnswerPanel {
                id: requestAnswerPanel
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: backToChoicePanel.right
                anchors.leftMargin: 100
                color: parent.color
                visible: false
            }

            ConstantStreamPanel {
                id: constantStreamPanel
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: backToChoicePanel.right
                anchors.leftMargin: 100
                color: parent.color
                visible: false
            }

            Button {
                id: backToChoicePanel
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                width: 150
                text: "Вернуться"
                visible: false
                onClicked: {
                    requestAnswerPanel.visible = false
                    constantStreamPanel.visible = false
                    panelChoice.visible = true
                    visible = false
                }
            }

            Rectangle {
                id: panelChoice
                anchors.fill: parent
                color: "darkgray"
                visible: true
                ColumnLayout {
                    anchors.centerIn: parent.Center
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 250
                    Label {
                        text: "Выберите режим приема данных:"
                    }
                    RadioButton {
                        id: rb_constStream
                        checked : false
                        text: "Постанный поток"
                    }
                    RadioButton {
                        id: rd_requestAnswer
                        checked: true
                        text: "Запрос - Ответ"
                    }
                    Button {
                        id: btnAcceptingPanelChoice
                        text: "Подвердить"
                        onClicked: {
                            if (rb_constStream.checked == true) constantStreamPanel.visible = true
                            else requestAnswerPanel.visible = true

                            panelChoice.visible = false
                            backToChoicePanel.visible = true
                        }
                    }
                }
            }
        }

        Rectangle {
            id: settingsPanel
            anchors.left: parent.left
            anchors.top: itemPanel.bottom
            anchors.bottom: parent.bottom
            width: parent.width / 7
            Layout.minimumWidth: 150
            Layout.maximumWidth: 400
            color: "gray"
            border.width: 1
            MouseArea{
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                width: 30
                property int oldMouseX
                property int newWidth
                hoverEnabled: true

                onPressed:  {
                    oldMouseX = mouseX
                }

                onPositionChanged: {
                    if (pressed) {
                        newWidth = parent.width + (mouseX - oldMouseX)
                        if (mouseX - oldMouseX < 0) parent.width = newWidth > 150 ? newWidth : 150
                        if (mouseX - oldMouseX > 0) parent.width = newWidth < draggingsArea.width / 3 ? newWidth : draggingsArea.width / 3
                    }
                }
            }
        }

        Rectangle {
            id:draggingsArea
            color: "Silver"
            border.width: 2
            border.color: "black"
            anchors.top: itemPanel.bottom
            anchors.left: settingsPanel.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }
}
