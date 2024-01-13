import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result = [(title: String, playTime: Int, idx: Int)]()
    let m = replaceSharp(m)

    for (idx, musicinfo) in musicinfos.enumerated() {
        let info = musicinfo.components(separatedBy: ",")
        let playTime = getPlayTime(info[0], info[1])
        let title = info[2]
        let playTimeMelody = getPlayTimeMelody(playTime, replaceSharp(info[3]))
        
        if (playTimeMelody.contains(m)) {
            let candidate = (title: title, playTime: playTime, idx: idx)
            result.append(candidate)
        }
    }
    
    if (result.isEmpty) { return "(None)" }
    
    return result.sorted { 
        if ($0.playTime == $1.playTime) {
            return $0.idx < $1.idx
        } else {
            return $0.playTime > $1.playTime
        }
    }[0].title
}

func replaceSharp(_ melody: String) -> String {
    return melody.replacingOccurrences(of: "C#", with: "c").replacingOccurrences(of: "D#", with: "d").replacingOccurrences(of: "F#", with: "f").replacingOccurrences(of: "G#", with: "g").replacingOccurrences(of: "A#", with: "a")
}

func getPlayTime(_ start: String, _ end: String) -> Int {
    let start = start.components(separatedBy: ":")
    let startTime = Int(start[0])! * 60 + Int(start[1])!
    let end = end.components(separatedBy: ":")
    let endTime = Int(end[0])! * 60 + Int(end[1])!
    
    return endTime - startTime
}

func getPlayTimeMelody(_ playTime: Int, _ musicTimeMelody: String) -> String {
    guard playTime != musicTimeMelody.count else {
        return musicTimeMelody
    }

    var playTimeMelody = ""
    let musicTime = musicTimeMelody.count
    let musicTimeMelodyCount = playTime / musicTime
    let partialMusicTimeMelodyLength = playTime % musicTime
    
        
    if (musicTimeMelodyCount > 0) {
        for _ in 1...musicTimeMelodyCount {
            playTimeMelody += musicTimeMelody
        }
    }
    
    if (partialMusicTimeMelodyLength > 0) {
        let partialMusicTimeMelodyEndIndex = String.Index(encodedOffset: partialMusicTimeMelodyLength)
        let partialMusicTimeMelody = String(musicTimeMelody[musicTimeMelody.startIndex..<partialMusicTimeMelodyEndIndex])
        
        playTimeMelody += partialMusicTimeMelody
    }
    
    return playTimeMelody
}