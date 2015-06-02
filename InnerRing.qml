import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {

    property int speed: 0

    height: 335 //TODO: Groesse skalierbar machen
    width: height
    x: (parent.width / 2) - (width / 2)
    y: (parent.height / 2) - (height / 2)

    Image {
         id: innerRingRect
         height: parent.height
         width: parent.width
         source: "/pics/Tacho_Mitte.png"


         Text {
             id: speeddigit
             text: speed
             font.pixelSize: 86
             font.bold: true
             font.family: "Eurostile"
             y: 40
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }

         DropShadow {
                 anchors.fill: speeddigit
                 horizontalOffset: 0
                 verticalOffset: 8
                 radius: 4.0
                 samples: 16
                 color: "black"
                 source: speeddigit
             }

         Text {
             text: "mph"
             font.pixelSize: 16
             font.bold: true
             font.family: "Eurostile"
             y: 132
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }

         Image {
             source: "/pics/Lade-Balken.png"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height /2 + 7
         }

         Text {
             text: "209"
             font.pixelSize: 34
             font.bold: true
             font.family: "Eurostile"
             y: 220
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }

         Text {
             text: "Rated Range"
             font.pixelSize: 18
             font.bold: true
             font.family: "Eurostile"
             y: 260
             color: "#666666"
             anchors.horizontalCenter: parent.horizontalCenter
         }

    }
}
