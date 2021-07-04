import QtQuick 2.15

Row {
    property int digits: 1
    property int number: 0
    property var seq: []
    width: digits * height / 2
    onNumberChanged: {
        console.error(digits, number, seq)
        for (var i = digits - 1, x = number; i >= 0; i--) {
            seq[i] = x % 10
            console.error(x, seq[i], seq)
            x = Math.floor(x / 10)
        }
    }

    Repeater {
        model: digits
        LCDDigit {
            function getDigit(n, i) {
                return seq[i] || 0
            }
            num: getDigit(number, index)
            opacity: num || index == (digits - 1) ? 1 : 0
        }
    }
}
