import QtQuick 2.0

Repeater {
    model: 5
    delegate: Item {
        height: parent.radius - width * 2 + 44
        width: 44
        //height: parent.height - 100// - width * 2
        //y: parent.height
        rotation: 25 * (index + 211)
        transformOrigin: Item.Bottom
        anchors.horizontalCenter: parent.horizontalCenter

     Text {
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.top: parent.top
         text: "height:" + parent.height + ", width:" + parent.width + ", rotation:" + rotation//(index * 2 + 2) * 10
         rotation: -parent.rotation
         font.pixelSize: 20
         font.bold: true
         color: "#888888"
     }
    }
}



