import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

PanelWindow {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    anchors {
        top: true
        left: true
        bottom: true
    }

    color: "transparent"
    implicitWidth: 44

    RectangularShadow {
        anchors.fill: parent
        anchors.rightMargin: 4
        anchors.topMargin: -8
        anchors.bottomMargin: -8
        blur: 4
    }

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: 4
        anchors.leftMargin: -1
        anchors.topMargin: -1
        anchors.bottomMargin: -1
        color: Theme.colors.mantle
        border.color: Theme.colors.base

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 36
            text: ""
            font.family: "monospace"
            font.pixelSize: 24
            color: Theme.colors.accent
        }

        ColumnLayout {
            implicitWidth: parent.width
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40

            Text {
                Layout.fillWidth: true
                text: `${clock.hours.toString().padStart(2, "0")}\n${clock.minutes.toString().padStart(2, "0")}`
                horizontalAlignment: Text.AlignHCenter
                color: Theme.colors.text
                font.family: "monospace"
                font.weight: 700
                font.pixelSize: 14
                lineHeight: 0.9
            }

            ColumnLayout {
                spacing: 0
                Text {
                    Layout.fillWidth: true
                    text: clock.date.getDate().toString().padStart(2, "0")
                    horizontalAlignment: Text.AlignHCenter
                    color: Theme.colors.subtext0
                    font.family: "monospace"
                    font.weight: 700
                    font.pixelSize: 14
                    lineHeight: 0.9
                }
                Text {
                    Layout.fillWidth: true
                    text: {
                        const months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
                        return months[clock.date.getMonth()];
                    }
                    horizontalAlignment: Text.AlignHCenter
                    color: Theme.colors.subtext0
                    font.family: "monospace"
                    font.weight: 700
                    font.pixelSize: 10
                    lineHeight: 0.9
                }
            }
        }
    }
}
