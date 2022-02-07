import QtQuick 2.15
import singleton.dpalette 1.0

Canvas {
    implicitWidth: 30
    height: 2 * width

    contextType: "2d"
    property int num: Number(numInput.text)
    onNumChanged: requestPaint()
    Component.onCompleted: DPalette.onStyleChanged.connect(requestPaint)

    onPaint: {
        const Point = function (x, y) {
            this.x = x
            this.y = y
        }
        const segWidth = width * 0.25
        const segCapSize = segWidth / 2
        const halfWidth = segWidth / 2
        const padding = width * 0.1

        let Pos = []
        Pos[0] = new Point(0 * width + halfWidth, 0 * width + halfWidth)
        Pos[1] = new Point(1 * width - halfWidth, 0 * width + halfWidth)
        Pos[2] = new Point(0 * width + halfWidth, 1 * width)
        Pos[3] = new Point(1 * width - halfWidth, 1 * width)
        Pos[4] = new Point(0 * width + halfWidth, 2 * width - halfWidth)
        Pos[5] = new Point(1 * width - halfWidth, 2 * width - halfWidth)

        function drawHSeg(st, ed) {
            let stCap = st
            let stUp = new Point(st.x + segCapSize, st.y - segWidth / 2)
            let stDn = new Point(st.x + segCapSize, st.y + segWidth / 2)
            let edCap = ed
            let edUp = new Point(ed.x - segCapSize, ed.y - segWidth / 2)
            let edDn = new Point(ed.x - segCapSize, ed.y + segWidth / 2)
            function lineTo(p) {
                context.lineTo(padding + p.x * 0.9, 2 * padding + p.y * 0.9)
            }

            context.fillStyle = DPalette.text
            context.beginPath()
            context.moveTo(padding + stCap.x * 0.9, 2 * padding + stCap.y * 0.9)
            lineTo(stUp)
            lineTo(edUp)
            lineTo(edCap)
            lineTo(edDn)
            lineTo(stDn)
            context.closePath()
            context.fill()
            context.stroke()
        }
        function drawVSeg(st, ed) {
            let stCap = st
            let stUp = new Point(st.x + segWidth / 2, st.y + segCapSize)
            let stDn = new Point(st.x - segWidth / 2, st.y + segCapSize)
            let edCap = ed
            let edUp = new Point(ed.x + segWidth / 2, ed.y - segCapSize)
            let edDn = new Point(ed.x - segWidth / 2, ed.y - segCapSize)
            function lineTo(p) {
                context.lineTo(padding + p.x * 0.9, 2 * padding + p.y * 0.9)
            }

            context.fillStyle = DPalette.text
            context.beginPath()
            context.moveTo(padding + stCap.x * 0.9, 2 * padding + stCap.y * 0.9)
            lineTo(stUp)
            lineTo(edUp)
            lineTo(edCap)
            lineTo(edDn)
            lineTo(stDn)
            context.closePath()
            context.fill()
            context.stroke()
        }
        context.reset()
        context.globalCompositeOperation = "destination-atop"
        context.strokeStyle = "transparent"
        context.fillStyle = DPalette.text
        context.lineWidth = Math.max(1, width * 0.02)
        function drawSegs(segs) {
            if (segs[0])
                drawHSeg(Pos[0], Pos[1])
            if (segs[1])
                drawHSeg(Pos[2], Pos[3])
            if (segs[2])
                drawHSeg(Pos[4], Pos[5])
            if (segs[3])
                drawVSeg(Pos[0], Pos[2])
            if (segs[4])
                drawVSeg(Pos[1], Pos[3])
            if (segs[5])
                drawVSeg(Pos[2], Pos[4])
            if (segs[6])
                drawVSeg(Pos[3], Pos[5])
        }
        function drawDigit(digit) {
            switch (digit) {
            case 0:
                drawSegs([1, 0, 1, 1, 1, 1, 1])
                break
            case 1:
                drawSegs([0, 0, 0, 0, 1, 0, 1])
                break
            case 2:
                drawSegs([1, 1, 1, 0, 1, 1, 0])
                break
            case 3:
                drawSegs([1, 1, 1, 0, 1, 0, 1])
                break
            case 4:
                drawSegs([0, 1, 0, 1, 1, 0, 1])
                break
            case 5:
                drawSegs([1, 1, 1, 1, 0, 0, 1])
                break
            case 6:
                drawSegs([1, 1, 1, 1, 0, 1, 1])
                break
            case 7:
                drawSegs([1, 0, 0, 0, 1, 0, 1])
                break
            case 8:
                drawSegs([1, 1, 1, 1, 1, 1, 1])
                break
            case 9:
                drawSegs([1, 1, 1, 1, 1, 0, 1])
                break
            default:
                drawSegs([1, 1, 1, 1, 0, 1, 0])
                break
            }
        }
        drawDigit(num)
    }
}
