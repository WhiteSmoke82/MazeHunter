class Cell{
    boolean n = false, e = false, s = false, w = false;
    int r, c;
    char type = 'n';

    Cell(int r, int c){
        this.r = r;
        this.c = c;
    }

    void draw(){
        maze.noStroke();
        color toFill = (type == 'n' ? mazeBackgroundColor : (type == 'e' ? endBackground : startBackground));
        maze.fill(toFill);
        maze.rect(c * cellSize, r * cellSize, cellSize, cellSize);
        maze.noFill();
        maze.strokeWeight(wallSize);
        maze.stroke(wallColor);
        if(n) maze.line(c * cellSize, r * cellSize, (c + 1) * cellSize, r * cellSize);
        if(e) maze.line((c + 1) * cellSize, r * cellSize, (c + 1) * cellSize, (r + 1) * cellSize);
        if(s) maze.line((c + 1) * cellSize, (r + 1) * cellSize, c * cellSize, (r + 1) * cellSize);
        if(w) maze.line(c * cellSize, (r + 1) * cellSize, c * cellSize, r * cellSize);
    }
}

ArrayList<ArrayList<Cell>> mazeList = new ArrayList<ArrayList<Cell>>();

void setupMazeList(){
    mazeList.clear();
    for(int i = 0; i < cellAmount; i++){
        ArrayList<Cell> temp = new ArrayList<Cell>();
        for(int j = 0; j < cellAmount; j++){
            temp.add(new Cell(j, i));
        }
        mazeList.add(temp);
    }

    createEnd();
    createStart();
}

void createEnd(){
    int endR, endC;
    if(middleEnd){
        endR = int(cellAmount/2);
        endC = int(cellAmount/2);
    }else{
        endR = int(random(1, cellAmount));
        endC = int(random(1, cellAmount));
    }
    mazeList.get(endR).get(endC).type = 'e';
    mazeList.get(endR-1).get(endC-1).type = 'e';
    mazeList.get(endR-1).get(endC).type = 'e';
    mazeList.get(endR).get(endC-1).type = 'e';
}

void createStart(){
    int startR = int(random(0, 2))*int(cellAmount-1);
    int startC = int(random(0, 2))*int(cellAmount-1);
    mazeList.get(startR).get(startC).type = 's';
}