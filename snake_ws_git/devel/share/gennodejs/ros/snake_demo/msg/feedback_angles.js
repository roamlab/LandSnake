// Auto-generated. Do not edit!

// (in-package snake_demo.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class feedback_angles {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp = null;
      this.sea_angle1 = null;
      this.sea_angle2 = null;
      this.sea_angle3 = null;
      this.sea_angle4 = null;
      this.sea_angle5 = null;
      this.dxl_angle1 = null;
      this.dxl_angle2 = null;
      this.dxl_angle3 = null;
      this.dxl_angle4 = null;
      this.dxl_angle5 = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('sea_angle1')) {
        this.sea_angle1 = initObj.sea_angle1
      }
      else {
        this.sea_angle1 = 0.0;
      }
      if (initObj.hasOwnProperty('sea_angle2')) {
        this.sea_angle2 = initObj.sea_angle2
      }
      else {
        this.sea_angle2 = 0.0;
      }
      if (initObj.hasOwnProperty('sea_angle3')) {
        this.sea_angle3 = initObj.sea_angle3
      }
      else {
        this.sea_angle3 = 0.0;
      }
      if (initObj.hasOwnProperty('sea_angle4')) {
        this.sea_angle4 = initObj.sea_angle4
      }
      else {
        this.sea_angle4 = 0.0;
      }
      if (initObj.hasOwnProperty('sea_angle5')) {
        this.sea_angle5 = initObj.sea_angle5
      }
      else {
        this.sea_angle5 = 0.0;
      }
      if (initObj.hasOwnProperty('dxl_angle1')) {
        this.dxl_angle1 = initObj.dxl_angle1
      }
      else {
        this.dxl_angle1 = 0.0;
      }
      if (initObj.hasOwnProperty('dxl_angle2')) {
        this.dxl_angle2 = initObj.dxl_angle2
      }
      else {
        this.dxl_angle2 = 0.0;
      }
      if (initObj.hasOwnProperty('dxl_angle3')) {
        this.dxl_angle3 = initObj.dxl_angle3
      }
      else {
        this.dxl_angle3 = 0.0;
      }
      if (initObj.hasOwnProperty('dxl_angle4')) {
        this.dxl_angle4 = initObj.dxl_angle4
      }
      else {
        this.dxl_angle4 = 0.0;
      }
      if (initObj.hasOwnProperty('dxl_angle5')) {
        this.dxl_angle5 = initObj.dxl_angle5
      }
      else {
        this.dxl_angle5 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type feedback_angles
    // Serialize message field [timestamp]
    bufferOffset = _serializer.uint64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [sea_angle1]
    bufferOffset = _serializer.float32(obj.sea_angle1, buffer, bufferOffset);
    // Serialize message field [sea_angle2]
    bufferOffset = _serializer.float32(obj.sea_angle2, buffer, bufferOffset);
    // Serialize message field [sea_angle3]
    bufferOffset = _serializer.float32(obj.sea_angle3, buffer, bufferOffset);
    // Serialize message field [sea_angle4]
    bufferOffset = _serializer.float32(obj.sea_angle4, buffer, bufferOffset);
    // Serialize message field [sea_angle5]
    bufferOffset = _serializer.float32(obj.sea_angle5, buffer, bufferOffset);
    // Serialize message field [dxl_angle1]
    bufferOffset = _serializer.float32(obj.dxl_angle1, buffer, bufferOffset);
    // Serialize message field [dxl_angle2]
    bufferOffset = _serializer.float32(obj.dxl_angle2, buffer, bufferOffset);
    // Serialize message field [dxl_angle3]
    bufferOffset = _serializer.float32(obj.dxl_angle3, buffer, bufferOffset);
    // Serialize message field [dxl_angle4]
    bufferOffset = _serializer.float32(obj.dxl_angle4, buffer, bufferOffset);
    // Serialize message field [dxl_angle5]
    bufferOffset = _serializer.float32(obj.dxl_angle5, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type feedback_angles
    let len;
    let data = new feedback_angles(null);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [sea_angle1]
    data.sea_angle1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sea_angle2]
    data.sea_angle2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sea_angle3]
    data.sea_angle3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sea_angle4]
    data.sea_angle4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sea_angle5]
    data.sea_angle5 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dxl_angle1]
    data.dxl_angle1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dxl_angle2]
    data.dxl_angle2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dxl_angle3]
    data.dxl_angle3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dxl_angle4]
    data.dxl_angle4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dxl_angle5]
    data.dxl_angle5 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'snake_demo/feedback_angles';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2e66b029179d9b1560650234dca943c0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint64 timestamp
    float32 sea_angle1
    float32 sea_angle2
    float32 sea_angle3
    float32 sea_angle4
    float32 sea_angle5
    float32 dxl_angle1
    float32 dxl_angle2
    float32 dxl_angle3
    float32 dxl_angle4
    float32 dxl_angle5
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new feedback_angles(null);
    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    if (msg.sea_angle1 !== undefined) {
      resolved.sea_angle1 = msg.sea_angle1;
    }
    else {
      resolved.sea_angle1 = 0.0
    }

    if (msg.sea_angle2 !== undefined) {
      resolved.sea_angle2 = msg.sea_angle2;
    }
    else {
      resolved.sea_angle2 = 0.0
    }

    if (msg.sea_angle3 !== undefined) {
      resolved.sea_angle3 = msg.sea_angle3;
    }
    else {
      resolved.sea_angle3 = 0.0
    }

    if (msg.sea_angle4 !== undefined) {
      resolved.sea_angle4 = msg.sea_angle4;
    }
    else {
      resolved.sea_angle4 = 0.0
    }

    if (msg.sea_angle5 !== undefined) {
      resolved.sea_angle5 = msg.sea_angle5;
    }
    else {
      resolved.sea_angle5 = 0.0
    }

    if (msg.dxl_angle1 !== undefined) {
      resolved.dxl_angle1 = msg.dxl_angle1;
    }
    else {
      resolved.dxl_angle1 = 0.0
    }

    if (msg.dxl_angle2 !== undefined) {
      resolved.dxl_angle2 = msg.dxl_angle2;
    }
    else {
      resolved.dxl_angle2 = 0.0
    }

    if (msg.dxl_angle3 !== undefined) {
      resolved.dxl_angle3 = msg.dxl_angle3;
    }
    else {
      resolved.dxl_angle3 = 0.0
    }

    if (msg.dxl_angle4 !== undefined) {
      resolved.dxl_angle4 = msg.dxl_angle4;
    }
    else {
      resolved.dxl_angle4 = 0.0
    }

    if (msg.dxl_angle5 !== undefined) {
      resolved.dxl_angle5 = msg.dxl_angle5;
    }
    else {
      resolved.dxl_angle5 = 0.0
    }

    return resolved;
    }
};

module.exports = feedback_angles;
