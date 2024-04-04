color backgroundColor = #EEEEEE;

color mazeBackgroundColor = #EAEAEA;
color edgeColor = #000000;
color wallColor = #666666;
color gridColor = #FF0000;

color endBackground = #00FF00;
color startBackground = #0000FF;

boolean middleEnd = true;

float cellAmount = 16;
float borderPadding = 50;
float cellSize;
float poleSize = 5;
float wallSize = 3;

PGraphics maze;
PImage logo;

void setup(){
    size(1100, 800);
    frameRate(500);
    cellSize = (height - 2*borderPadding)/cellAmount;
    logo = loadImage("resources/logo.png");
    logo.resize(300, 0);
    textSize(20);

    setupMazeList();
    maze = createGraphics(ceil(height-2*borderPadding)+1, ceil(height-2*borderPadding)+1);
    drawMaze();
}

void draw(){
    background(backgroundColor);

    image(logo, borderPadding - 30 , borderPadding);
    fill(0);
    text("Framerate: " + round(frameRate), borderPadding + 20, 330);

    setupMazeList();
    drawMaze();

    drawField();
}

void drawMaze(){
    maze.beginDraw();
    maze.background(mazeBackgroundColor);
    for(int i = 0; i < mazeList.size(); i++){
        for(int j = 0; j < mazeList.size(); j++){
            mazeList.get(i).get(j).draw();
        }
    }
    maze.stroke(gridColor);
    maze.strokeWeight(poleSize);
    for(int i = 1; i < cellAmount; i++){
        for(int j = 1; j < cellAmount; j++){
            maze.point(i*cellSize, j*cellSize);
        }
    }
    maze.stroke(edgeColor);
    maze.noFill();
    maze.rect(0, 0, cellAmount*cellSize, cellAmount*cellSize);

    maze.endDraw();
}

void drawField(){
    image(maze, width - cellSize*cellAmount - borderPadding, borderPadding);
}