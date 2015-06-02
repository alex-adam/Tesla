import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: container
    width: parent.width
    height: parent.height
    color: "black"

    Rectangle {
        id: appWindow
        width: parent.width
        height: parent.height + 20
        color: "black"
        y: parent.height + 20
        Image {
            id: appWindowImage
            anchors.verticalCenter: parent.verticalCenter
            x: (parent.width - 250) / 2 - width /2
            fillMode: Image.PreserveAspectFit
            scale: 1.2
        }
    }


    Image {
        id: hoverIcon
        x: 190//
        y: 194
        height: 120
        width: height
       source: "/pics/Tile.png"
    }


    property int pathMargin: 470

        PathView {
         id: menu
         width: 640
         height: -80

         model: LElementsModel {}
         delegate: Rectangle {height: 150; width: height; color:"transparent"
                    Image {source: isource; fillMode: Image.PreserveAspectFit; anchors.horizontalCenter: parent.horizontalCenter;}
                    Text {id:desc; text: name;
                        anchors.horizontalCenter: parent.horizontalCenter; y: 88;
                        font.pixelSize: 18; font.family: "Eurostile"; font.bold: true; color: "black";
                    }
         }


         path: Path {
          startX: 250
          startY: 600//pathMargin

            PathLine { x: 250; y: menu.height - pathMargin }
         }

         focus: false
         Keys.onDownPressed: decrementCurrentIndex()
         Keys.onUpPressed: incrementCurrentIndex()

         Keys.onReturnPressed: if(menu.opacity == 1) {selectApp(menu.currentIndex)} else {hideApp()}
    }


        function selectApp(ind) {
            switch(ind) {
                case 1: appWindowImage.source ="/pics/Efficiency.png"; appWindowImage.scale = 1.2;
                    showApp()
                    break;

                case 2: appWindowImage.source = "/pics/Music.png"; appWindowImage.scale = 1.4;
                    showApp()
                    break;

                case 0: appWindowImage.source = "/pics/Range.png"; appWindowImage.scale = 1.2;
                    showApp()
                    break;

                case 6: appWindowImage.source = "/pics/Numbers.png"; appWindowImage.scale = 1.2;
                   showApp()
                    break;

                default:
                    break;
            }


        }

        function showApp() {
            animateOpacity.start()
            animateHover.start()
            appWindow.opacity = 1
            animateWindow.start()
        }


        function hideApp() {
            deanimateOpacity.start()
            deanimateHover.start()
            deanimateWindow.start()
        }

        NumberAnimation {
               id: animateOpacity; target: menu; properties: "opacity"; from: 1.00; to: 0.0; duration: 50
          }
        NumberAnimation {
               id: deanimateOpacity; target: menu; properties: "opacity"; from: 0.0; to: 1.0; duration: 500
          }
        NumberAnimation {
               id: animateHover; target: hoverIcon; properties: "opacity"; from: 1.00; to: 0.0; duration: 50
          }
        NumberAnimation {
               id: deanimateHover; target: hoverIcon; properties: "opacity"; from: 0.0; to: 1.0; duration: 500
          }
        NumberAnimation {
               id: animateWindow; target: appWindow; properties: "y"; from: parent.height; to: 0.0; duration: 1000; easing.type: Easing.OutExpo
          }
        NumberAnimation {
               id: deanimateWindow; target: appWindow; properties: "opacity"; from: 1.00; to: 0.0; duration: 500
          }
}

