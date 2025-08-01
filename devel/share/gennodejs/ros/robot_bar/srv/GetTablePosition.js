// Auto-generated. Do not edit!

// (in-package robot_bar.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetTablePositionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tavolo = null;
    }
    else {
      if (initObj.hasOwnProperty('tavolo')) {
        this.tavolo = initObj.tavolo
      }
      else {
        this.tavolo = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetTablePositionRequest
    // Serialize message field [tavolo]
    bufferOffset = _serializer.int32(obj.tavolo, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetTablePositionRequest
    let len;
    let data = new GetTablePositionRequest(null);
    // Deserialize message field [tavolo]
    data.tavolo = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_bar/GetTablePositionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aa9e7e00d204e572d2cc7531d55f3c3d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 tavolo  # Input: numero del tavolo
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetTablePositionRequest(null);
    if (msg.tavolo !== undefined) {
      resolved.tavolo = msg.tavolo;
    }
    else {
      resolved.tavolo = 0
    }

    return resolved;
    }
};

class GetTablePositionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetTablePositionResponse
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetTablePositionResponse
    let len;
    let data = new GetTablePositionResponse(null);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_bar/GetTablePositionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ff8d7d66dd3e4b731ef14a45d38888b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 x     # Output: coordinata X
    float32 y     # Output: coordinata Y
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetTablePositionResponse(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetTablePositionRequest,
  Response: GetTablePositionResponse,
  md5sum() { return 'a5958a44ce6db6760f5e6109da65f88b'; },
  datatype() { return 'robot_bar/GetTablePosition'; }
};
