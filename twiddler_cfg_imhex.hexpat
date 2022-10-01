#pragma endian little

#include <std/string.pat>

struct Chord {
  u16 tb;
  u8 sbMod;
  u8 sbMain;
};

struct StringEntry {
  u16 len;
  u8 pairs[len-2];
};

fn getStringCount(u16 nChords, auto chords) {
  s16 n = -1;
  for (u16 i = 0, i < nChords, i = i + 1) {
//    std::print("");
//    std::print(std::string::to_string(0xFF));
//    std::print(std::string::to_string(chords[i].sbMod));
//    std::print(std::string::to_string(chords[i].sbMod == 0xFF));
//    std::print(std::string::to_string(chords[i].sbMain));
    if (chords[i].sbMod == 0xFF) {
//      std::print(std::string::to_string(chords[i].sbMain));
      if (s16(chords[i].sbMain) > n) {
        n = chords[i].sbMain;
      }
    }
  }
//  std::print("");  
//  std::print(std::string::to_string(n+1));
  return n+1;
};

struct TwiddlerCfg {
  u8 version;
  u8 optionsA; //TODO bitfield
  u16 nChords;
  u16 sleepTimeout;
  u16 leftMouse; //TODO bitfield
  u16 middleMouse; //TODO bitfield
  u16 rightMouse; //TODO bitfield
  u8 mouseAcceleration;
  u8 repeatDelay;
  u8 optionsB; //TODO bitfield
  u8 optionsC; //TODO bitfield
  Chord chords[nChords];
  u32 stringOffsets[getStringCount(nChords, chords)];
  StringEntry strings[getStringCount(nChords, chords)];
};

TwiddlerCfg cfg @ 0x0;
