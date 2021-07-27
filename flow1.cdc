// After encountering some difficulty, looked up  few persons code, tried to study it and produced this. I'm not good!
pub struct Canvas{
    pub let width: UInt8
    pub let height: UInt8
    pub let pixels: String
    init(width: UInt8, height: UInt8, pixels: String){
        self.width = width
        self.height = height
        self.pixels = pixels
    }
}

    pub fun printView(canvas: Canvas){
    let borderLine = "+-----+"
    let sideLine = "|"
    let countHeight = Int(canvas.height)
    let countWidth = Int(canvas.width)
    var count = 0

    log(borderLine)//top frame
    while count <= countHeight-1{
    log(sideLine.concat(canvas.pixels.slice(from: (count * countHeight), upTo: (count * countHeight + countWidth)).concat(sideLine)))
    count = count + 1
  } 
  log(borderLine) //footer
    }

    pub resource Printer {
  pub fun print(canvas: Canvas): @Picture? {
    printView(canvas: canvas)// print canvas with frame

    let mPicture <- create Picture(canvas: canvas)
    return <- mPicture 
  }
}

pub fun serializeStringArray(_ lines: [String]): String{
    var buffer = ""
    for line in lines{
        buffer = buffer.concat(line)
    }
    return buffer
}

pub resource Picture{
    pub let canvas: Canvas

    init(canvas: Canvas){
        self.canvas = canvas
    }
}

pub fun main(){
    let pixelsX = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
    ]
    let canvasX = Canvas(
        width: 5,
        height: 5,
        pixels: serializeStringArray(pixelsX)
    )
    let letterX <- create Picture(canvas: canvasX)
    log(letterX.canvas.pixels)

    let printX <- create Printer()
    let printO <- printX.print(canvas: canvasX)
    destroy letterX
    destroy printX
    destroy printO
}