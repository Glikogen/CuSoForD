import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Item {
    id: parentItem

    Item {
        id: back
        anchors.fill: backgroundRect
        anchors.bottom: progressBar.top
        anchors.bottomMargin: 30
        visible: true
        Rectangle {
            id: rectRecentProjects
            color: "#11AA44"
            width: parent.width / 1.75
            anchors.margins: mainMar
            anchors.top: back.top
            anchors.right: back.right
            anchors.bottom: back.bottom
            Text {
                id: text0
                text: qsTr("Recent projects")
                font.underline: true
                font.pixelSize: 28
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    message1.visible = true;
                    message1.text = "Недавние проекты это\n1)sfsfsf\n2)asdasdad"
                }
            }
        }

        MessageDialog {
            id: message1
            visible: false;
        }

        Rectangle {
            id: rectSeparator
            height: rectForNewProject.height
            width: 20
            anchors.top: back.top
            anchors.right: rectRecentProjects.left
            anchors.rightMargin: mainMar
            color: "#404040"
        }

        Item {
            height: 100
            width: 100
            id: markingOfLeftPart
            anchors.top: back.top
            anchors.left: back.left
            anchors.bottom: back.bottom
            anchors.right: rectSeparator.left
            ColumnLayout {
                id: coLayout
                spacing: mainMar
                anchors.fill: parent
                anchors.margins: mainMar

                Rectangle {
                    id: rectNewProject
                    color: "#90AA00"
                    Layout.fillHeight: true
                    Layout.fillWidth:  true
                    Text {
                        id: text1
                        text: qsTr("New project")
                        font.underline: true
                        font.pixelSize: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            back.children.visible = false
                            rectSeparator.visible = false
                            colForRectNewProjects.visible = true
                            creatingModelArea.visible = true
                            rectManual.visible = false
                        }
                    }
                }

                Rectangle {
                    id: rectManual
                    color: "#9C00FF"
                    Layout.fillHeight: true
                    Layout.fillWidth:  true
                    Text {
                        id: text2
                        text: qsTr("Manual")
                        font.underline: true
                        font.pixelSize: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            message1.visible = true;
                            message1.text = "Вы открыли руководство"
                        }
                    }
                }
            }
        }

        CreatingModelArea {
            id: creatingModelArea
            visible: false
        }

    }
}
