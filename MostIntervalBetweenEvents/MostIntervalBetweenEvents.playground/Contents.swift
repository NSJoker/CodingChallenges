import UIKit

/*
 Have the function ArrayChallenge (strArz) read the
 strArr parameter being passed which will represent a full day
 and will be filled with events that span from time X to time Y in
 the day. The format of each event will be hh:mmAM/PM-
 hh:mmAM/PM. For example, strArr may be I'10:00AM-
 12:30PM",'02:00PM-02:45PM*,09:10AM-09:50AM']. Your
 program will have to output the longest amount of free time
 available between the start of your first event and the end of
 your last event in the format: hh:mm. The start event should be
 the earliest event in the day and the latest event should be the
 latest event in the day. The output for the previous input would
 therefore be 01:30 (with the earliest event in the day starting at
 09:10AM and the latest event ending at 02:45PM). The input
 will contain at least 3 events and the events may be out of
 order.
 */

let arr = ["10:00AM-12:30PM", "02:00PM-02:45PM", "09:10AM-09:50AM"]

func arrayChallenge(input: [String]) -> String {
    
    var convertedArray = [(start: TimeInterval, end: TimeInterval)]()
    
    for str in input {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mma"
        
        let components = str.components(separatedBy: "-")
        guard let start = dateFormatter.date(from: components[0])?.timeIntervalSince1970,
              let end = dateFormatter.date(from: components[1])?.timeIntervalSince1970 else {
            continue
        }
        convertedArray.append((start: start, end: end))
    }
    
    let sortedArray = convertedArray.sorted(by: {
        $0.start < $1.start
    })
    
//    for item in sortedArray {
//        print(item)
//    }
    
    var maxInterval:TimeInterval = 0
    for i in 0..<input.count-1 {
        let diff = sortedArray[i+1].start - sortedArray[i].end
//        print(sortedArray[i+1].start, "-", sortedArray[i].end, " = ", diff)
        if diff > maxInterval {
//            print("updating diff")
            maxInterval = diff
        }
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    let date = Date(timeIntervalSince1970: maxInterval)
    let maxIntervalStr = dateFormatter.string(from: date)
    return maxIntervalStr
}

print(arrayChallenge(input: arr))

let timeInterval: TimeInterval = 5400
let date = Date(timeIntervalSince1970: timeInterval)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "HH:mm"
dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
print(date)
print(dateFormatter.string(from: date))
