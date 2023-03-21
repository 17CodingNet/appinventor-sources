// -*- mode: swift; swift-mode:basic-offset: 2; -*-
// Copyright © 2016-2017 Massachusetts Institute of Technology, All rights reserved.

import Foundation

/* Creating New Errors:
 * `case ERROR_NAME = code`
 * (code is now the error's rawValue)
 */

@objc public enum ErrorMessage: Int, Error {
  // LocationSensor Errors
  case ERROR_LOCATION_SENSOR_LATITUDE_NOT_FOUND = 101
  case ERROR_LOCATION_SENSOR_LONGITUDE_NOT_FOUND = 102
  case ERROR_LOCATION_SENSOR_PERMISSION_DENIED = 103
  case ERROR_LOCATION_SENSOR_UNEXPECTED_ERROR = 104
  
  // ActivityStarter Errors
  case ERROR_ACTIVITY_STARTER_NO_CORRESPONDING_ACTIVITY = 601
  case ERROR_ACTIVITY_STARTER_NO_ACTION_INFO = 602
  
  // Media Errors
  case ERROR_UNABLE_TO_LOAD_MEDIA = 701
  case ERROR_UNABLE_TO_PREPARE_MEDIA = 702
  
  // SoundRecorder Errors
  case ERROR_SOUND_RECORDER = 801
  case ERROR_SOUND_RECORDER_CANNOT_CREATE = 802
  case ERROR_SOUND_RECORDER_PERMISSION_DENIED = 806
  
  // ContactPicker and PhoneNumberPicker Errors
  // "Error message for when contact data cannot be used on the device."
  case ERROR_PHONE_UNSUPPORTED_CONTACT_PICKER = 1107
  
  // Web Errors
  case ERROR_WEB_UNSUPPORTED_ENCODING = 1102
  case ERROR_WEB_MALFORMED_URL = 1109
  case ERROR_WEB_REQUEST_HEADER_NOT_LIST = 1110
  case ERROR_WEB_REQUEST_HEADER_NOT_TWO_ELEMENTS = 1111

  // Camcorder Errors
  case ERROR_CAMCORDER_NO_CLIP_RETURNED = 1201
  case ERROR_CAMCORDER_CANNOT_SAVE_FILE = 1202

  // ImagePicker Errors
  case ERROR_CANNOT_COPY_MEDIA = 1602

  // WebViewer Errors
  case ERROR_WEB_VIEWER_UNKNOWN_ERROR = 2502
  case ERROR_WEB_VIEWER_UNSUPPORTED_METHOD = 101000
  case ERROR_WEB_VIEWER_MISSING_FILE = 101001

  // Repl Communication Errors
  case ERROR_REPL_SECURITY_ERROR = 1801

  // AccelerometerSensor Errors
  case ERROR_BAD_VALUE_FOR_ACCELEROMETER_SENSITIVITY = 1901
  
  // File Errors
  case ERROR_CANNOT_WRITE_TO_FILE = 2104

  // Yandex.Translate errors
  case ERROR_TRANSLATE_NO_KEY_FOUND = 2201
  case ERROR_TRANSLATE_SERVICE_NOT_AVAILABLE = 2202
  case ERROR_TRANSLATE_JSON_RESPONSE = 2203

  // TimePicker Errors
  case ERROR_ILLEGAL_HOUR = 2301
  case ERROR_ILLEGAL_MINUTE = 2302
  
  // DatePicker Errors
  case ERROR_ILLEGAL_DATE = 2401
  
  // iOS Specific Errors
  case ERROR_IOS_INSTALLING_URLS_NOT_SUPPORTED = 100001

  var code: Int32 {
    return Int32(self.rawValue)
  }
  
  public var _code: Int {
    return self.rawValue
  }
  
  var localizedDescription: String {
    return self.message
  }
  
  public var message: String {
    switch self {
    // LocationSensor Errors
    case .ERROR_LOCATION_SENSOR_LATITUDE_NOT_FOUND:
      return "Unable to find latitude from %s."
    case .ERROR_LOCATION_SENSOR_LONGITUDE_NOT_FOUND:
      return "Unable to find longitude from %s."
    case .ERROR_LOCATION_SENSOR_PERMISSION_DENIED:
      return "User denied location services permission."
    case .ERROR_LOCATION_SENSOR_UNEXPECTED_ERROR:
      return "An unexpected error occurred when using location services: %s."
      
    // ActivityStarter Errors
    case .ERROR_ACTIVITY_STARTER_NO_CORRESPONDING_ACTIVITY:
      return "No corresponding activity was found."
    case .ERROR_ACTIVITY_STARTER_NO_ACTION_INFO:
      return "No Action information in ActivityStarter was found."
      
    // Media Errors
    case .ERROR_UNABLE_TO_LOAD_MEDIA:
      return "Unable to load media."
    case .ERROR_UNABLE_TO_PREPARE_MEDIA:
      return "Unable to prepare %s."
      
    // SoundRecorder Errors
    case .ERROR_SOUND_RECORDER:
      return "An unexpected error occurred while recording sound."
    case .ERROR_SOUND_RECORDER_CANNOT_CREATE:
      return "Cannot start recording: %s"
    case .ERROR_SOUND_RECORDER_PERMISSION_DENIED:
      return "Permission to record audio was denied."
      
    // ContactPicker and PhoneNumberPicker Errors
    case .ERROR_PHONE_UNSUPPORTED_CONTACT_PICKER:
      return "The software used in this app cannot extract contacts from this type of phone."
      
    // Web Errors
    case .ERROR_WEB_UNSUPPORTED_ENCODING:
      return "The encoding %s is not supported."
    case .ERROR_WEB_MALFORMED_URL:
      return "The given URL was not valid."
    case .ERROR_WEB_REQUEST_HEADER_NOT_LIST:
      return "The specified request headers are not valid: element %s is not a list"
    case .ERROR_WEB_REQUEST_HEADER_NOT_TWO_ELEMENTS:
      return "The specified request headers are not valid: element %s does not contain two elements"

    // Camcorder Errors
    case .ERROR_CAMCORDER_NO_CLIP_RETURNED:
      return "Unable to find clip from camcorder"
    case .ERROR_CAMCORDER_CANNOT_SAVE_FILE:
      return "Cannot save media file"

    // WebViewer Errors
    case .ERROR_WEB_VIEWER_UNKNOWN_ERROR:
      return ""
    case .ERROR_WEB_VIEWER_UNSUPPORTED_METHOD:
      return "The specified method is not supported on iOS"
    case .ERROR_WEB_VIEWER_MISSING_FILE:
      return "Could not locate target file"

    // Repl Communication Errors
    case .ERROR_REPL_SECURITY_ERROR:
      return "Security Error Receiving Blocks from Browser: %@."

    // ImagePicker Errors
    case .ERROR_CANNOT_COPY_MEDIA:
      return "Unable to copy selected media: %s"

    // AccelerometerSensor Errors
    case .ERROR_BAD_VALUE_FOR_ACCELEROMETER_SENSITIVITY:
      return "The value -- %s -- provided for AccelerometerSensor's sensitivity was bad. The only legal values are 1, 2, or 3."
      
    // TimePicker Errors
    case .ERROR_ILLEGAL_HOUR:
      return "The hour must be set to a value between 0 and 23."
    case .ERROR_ILLEGAL_MINUTE:
      return "The minute must be set to a value between 0 and 59."
    
    // DatePicker Errors
    case .ERROR_ILLEGAL_DATE:
      return "The date you entered is invalid."
    
    // File Errors
    case .ERROR_CANNOT_WRITE_TO_FILE:
      return "Cannot write to file %s"

    //Yandex.Translate Errors
    case .ERROR_TRANSLATE_NO_KEY_FOUND:
      return "Missing API key for the Yandex.Translate service."
    case .ERROR_TRANSLATE_SERVICE_NOT_AVAILABLE:
      return "The translation service is not available; Please try again later."
    case .ERROR_TRANSLATE_JSON_RESPONSE:
      return "The response from the Yandex.Translate service cannot be parsed; Please try again later."
      
    // iOS Specific Errors
    case .ERROR_IOS_INSTALLING_URLS_NOT_SUPPORTED:
      return "Installing packages from URLs is not supported on iOS"
    }
  }
}
