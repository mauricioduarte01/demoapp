/*
 * Copyright (C) 2022  Mauricio Duarte
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * apptest is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import Example 1.0


MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'apptest.md'
    automaticOrientation: true

    PageHeader { visible: false }

    width: units.gu(45)
    height: units.gu(75)


    ListModel{
        id: listModel

        ListElement {
//            height: wrapper.card_size
//            width: wrapper.card_size
            imageSource: "../assets/cow.svg"
            color: "red"
        }
        ListElement {
//            height: wrapper.card_size
//            width: wrapper.card_size
            imageSource: "../assets/cow.svg"
            color: "red"
        }
        ListElement {
//            height: wrapper.card_size
//            width: wrapper.card_size
            imageSource: "../assets/dog.svg"
            color: "blue"
        }
        ListElement {
//            height: wrapper.card_size
//            width: wrapper.card_size
            imageSource: "../assets/dog.svg"
            color: "blue"
        }
        ListElement {
//            height: wrapper.card_size
//            width: wrapper.card_size
            imageSource: "../assets/sheep.svg"
            color: "green"
        }
        ListElement {
//            height: wrapper.card_size
//            width: wrapper.card_size
            imageSource: "../assets/sheep.svg"
            color: "green"
        }

    }

    Page {
        id: wrapper
        //define the number of rows and columns depending on the device xy orientation
        property int n_columns: height > width ? 2 : 5
        property int n_rows: height > width ? 5 : 2
        //formula to auto-resize the cards to keep aspect ratio
        property int card_size: Math.min (width / n_columns, height / n_rows) * 0.9
        //spacing between cards
        property int card_xspacing: (width - card_size * n_columns) / (n_columns + 1)
        property int card_yspacing: (height - card_size * n_rows) / (n_rows + 1)

        GridView{
            id: grid
            anchors.fill: parent

            anchors.leftMargin: wrapper.card_xspacing
            anchors.rightMargin: wrapper.card_xspacing
            anchors.topMargin: wrapper.card_yspacing
            anchors.bottomMargin: wrapper.card_yspacing

            cellHeight: wrapper.card_size
            cellWidth: wrapper.card_size

            model: listModel

            //old Grid property
//            columnSpacing: wrapper.card_xspacing
//            rowSpacing: wrapper.card_yspacing

            delegate: Card {
                //anchors.fill: parent
                anchors.leftMargin: wrapper.card_xspacing
                anchors.rightMargin: wrapper.card_xspacing
                anchors.topMargin: wrapper.card_yspacing
                anchors.bottomMargin: wrapper.card_yspacing
                color: model.color
                imageSource: model.imageSource
                height: grid.cellHeight
                width: grid.cellWidth
            }
//            onWidthChanged: {
//                grid.cellWidth =
//            }
        }
    }
}

