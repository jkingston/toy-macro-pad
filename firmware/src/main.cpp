#include <Arduino.h>
#include <HID.h>
#include <keyboard.h>

const int ROWS = 4;
const int COLS = 3;

const int columnPins[COLS] = {
    8, 5, 6
};

const int rowPins[ROWS] {
    7, 0, 1, 2
};

const String keyCodes[ROWS][COLS] = {
    { "", "", "" },
    { "", "", "" },
    { "", "", "" },
    { ":y:", "", "" },
};

bool keyPressed[ROWS][COLS] = {
    { false, false, false},
    { false, false, false},
    { false, false, false},
    { false, false, false}
};

void setup() {
    Serial.begin(9600);
    
    for (auto pin : columnPins) {
        pinMode(pin, INPUT);
        digitalWrite(pin, HIGH);
    }

    for (auto pin : rowPins) {
        pinMode(pin, INPUT);
        digitalWrite(pin, LOW);
    }

    Keyboard.begin();
}

void loop() {
    for (int r = 0; r < ROWS; r++) {
        // set row to LOW
        pinMode (rowPins[r], OUTPUT);

        for (int c = 0; c < COLS; c++) {
            int val = digitalRead(columnPins[c]);
            bool lastVal = keyPressed[r][c];
            bool newVal = val == LOW;
            if (lastVal != newVal) {
                keyPressed[r][c] = (val == LOW);
                if (newVal) {
                    Keyboard.print(keyCodes[r][c]);
                    //Serial.println(keyCodes[r][c]);
                }
            }
        }

        // set row to High Z
        pinMode (rowPins[r], INPUT);
    }

    // for (int i = 0; i < ROWS; i++) {
    //     for (int j = 0; j < COLS; j++) {
    //         Serial.print (keyPressed[i][j]);
    //         Serial.print (' ');
    //     }
    //     Serial.print ('\n');
    // }
    // Serial.print ('\n');
    
    //delay (100);
}