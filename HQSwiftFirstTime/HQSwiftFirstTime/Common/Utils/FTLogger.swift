//
//  FTLogger.swift
//  HQSwiftFirstTime
//
//  Created by huangqun on 2018/12/5.
//  Copyright © 2018 hq. All rights reserved.
//
//  日志l打印类
//

import UIKit

public class FTLogger: NSObject {
    #if DEBUG
    static var logLevel = LogLevel.Info
    #else
    static var logLevel = LogLevel.Warning
    #endif
    
    static var dateFormatter: DateFormatter {
        struct Statics {
            static var dateFormatter: DateFormatter = {
                let defaultDateFormatter = DateFormatter()
                defaultDateFormatter.locale = NSLocale.current
                defaultDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                return defaultDateFormatter
            }()
        }
        return Statics.dateFormatter
    }
    
    public class func logHttp(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Http, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    
    public class func logError(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Error, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    
    public class func logWarning(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Warning, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    
    public class func logInfo(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Info, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
}

// MARK: - 日志输出
fileprivate extension FTLogger {
    fileprivate class func log(message: String,
                               logLevel: LogLevel,
                               functionName: StaticString,
                               fileName: StaticString,
                               lineNumber: Int) {
        if logLevel.rawValue <= FTLogger.logLevel.rawValue {
            let dateStr = dateFormatter.string(from: Date())
            let funcName = String(describing: functionName)
            let filename = (String(describing: fileName) as NSString).lastPathComponent
            let messages = message.components(separatedBy: "\n")
            messages.forEach {
                print("\(dateStr) [\(logLevel.name)] [\(filename)] [第\(lineNumber)行] \(funcName) >>> \($0)")
            }
        }
    }
}

// MARK: - 日志等级定义
public enum LogLevel: Int {
    case None = 0
    case Info = 1
    case Warning = 2
    case Error = 3
    case Http = 4
    
    var name: String {
        switch self {
        case .None:
            return "None"
        case .Info:
            return "Info"
        case .Warning:
            return "Warning"
        case .Error:
            return "Error"
        case .Http:
            return "HTTP"
        }
    }
}
