import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Window {
    visible: true

    visibility: ApplicationWindow.Maximized
    minimumHeight: 600
    minimumWidth: 1200
    title: qsTr("Cusoford")

    property int mainMar: 30

    BaseWindow {
        id: parentItem
        anchors.fill: parent

        MenuBar {
            id: menuBar
            Menu{
                title: "Project"
                Action { text: "New" }
                Action { text: "Open..." }
                Action { text: "Save" }
                Action { text: "Save as..." }
                MenuSeparator{ }
                Action { text: "Quit" }
            }

            Menu {
                title: "Settings"
                Action { text: "Theme" }
                Action { text: "Language" }
                Action { text: "Validation settings..." }
            }

            Menu {
                title: "Help"
                Action { text: "About" }
                Action { text: "Manual" }
            }
        }

        Rectangle {
            id: rectMenuBar
            height: menuBar.height
            width: parent.width - menuBar.width
            anchors.left: menuBar.right
            color: "#404040"
        }

        Rectangle {
            id: rectForNewProject
            width: menuBar.width / 2
            anchors.top: menuBar.bottom
            anchors.left: menuBar.left
            anchors.bottom: parent.bottom
            color: "#404040"
        }

        ColumnLayout {
            anchors.fill: rectForNewProject
            spacing: 30
            id: colForRectNewProjects
            visible: false
            Rectangle {
                id: rectCreatingIcon
                Layout.alignment: Qt.AlignHCenter
                height: 100
                Layout.fillWidth: true
                Layout.margins: 10
                Image {
                    anchors.margins: 2
                    id: iconForCM
                    source: "qrc:/IconForCreatingModel.png"
                    anchors.fill: parent
                }
                border.width: 2

                Shape {
                    property Rectangle parentRect: rectCreatingIcon
                    id:greenTriangle
                    width: 20
                    height: 20
                    anchors.verticalCenter: parentRect.verticalCenter
                    anchors.left: parentRect.right
                    ShapePath {
                        fillColor: "green"
                        strokeColor: "black"
                        strokeWidth: 1
                        startX: 0
                        startY: 10
                        PathLine { x:10; y:0 }
                        PathLine { x:10; y:20 }
                        PathLine { x:0; y:10 }
                    }
                }
            }
            Rectangle {
                id: rectTestingIcon
                Layout.alignment: Qt.AlignHCenter
                height: 100
                Layout.fillWidth: true
                Layout.margins: 10
                border.width: 2
            }
            Rectangle {
                id: rectSavingIcon
                Layout.alignment: Qt.AlignHCenter
                height: 100
                Layout.fillWidth: true
                Layout.margins: 10
                border.width: 2
            }
        }

        Rectangle {
            id: backgroundRect
            color: "darkgray"
            border.width: 2
            anchors.top: rectMenuBar.bottom
            anchors.left: rectForNewProject.right
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            z: -1
        }

        Shape {
            id: progressBar
            height: 30
            width: 315
            x: parent.width - width
            y: parent.height - height
            ShapePath {
                fillColor: "lightgreen"
                strokeColor: "black"
                strokeWidth: 2
                startX: 15
                startY: 0
                PathLine { x: 315; y:0 }
                PathLine { x: 315; y:30 }
                PathLine { x: 0; y:30 }
                PathLine { x: 15; y:0 }
            }
        }
    }
}
