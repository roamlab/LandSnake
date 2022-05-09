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
      this.enc_angle1 = null;
      this.enc_angle2 = null;
      this.enc_angle3 = null;
      this.enc_angle4 = null;
      this.enc_angle5 = null;
      this.dxl_angle1 = null;
      this.dxl_angle2 = null;
      this.dxl_angle3 = null;
      this.dxl_angle4 = null;
      this.dxl_angle5 = null;
      this.cmd_angle1 = null;
      this.cmd_angle2 = null;
      this.cmd_angle3 = null;
      this.cmd_angle4 = null;
      this.cmd_angle5 = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('enc_angle1')) {
        this.enc_angle1 = initObj.enc_angle1
      }
      else {
        this.enc_angle1 = 0.0;
      }
      if (initObj.hasOwnProperty('enc_angle2')) {
        this.enc_angle2 = initObj.enc_angle2
      }
      else {
        this.enc_angle2 = 0.0;
      }
      if (initObj.hasOwnProperty('enc_angle3')) {
        this.enc_angle3 = initObj.enc_angle3
      }
      else {
        this.enc_angle3 = 0.0;
      }
      if (initObj.hasOwnProperty('enc_angle4')) {
        this.enc_angle4 = initObj.enc_angle4
      }
      else {
        this.enc_angle4 = 0.0;
      }
      if (initObj.hasOwnProperty('enc_angle5')) {
        this.enc_angle5 = initObj.enc_angle5
      }
      else {
        this.enc_angle5 = 0.0;
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
      if (initObj.hasOwnProperty('cmd_angle1')) {
        this.cmd_angle1 = initObj.cmd_angle1
      }
      else {
        this.cmd_angle1 = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_angle2')) {
        this.cmd_angle2 = initObj.cmd_angle2
      }
      else {
        this.cmd_angle2 = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_angle3')) {
        this.cmd_angle3 = initObj.cmd_angle3
      }
      else {
        this.cmd_angle3 = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_angle4')) {
        this.cmd_angle4 = initObj.cmd_angle4
      }
      else {
        this.cmd_angle4 = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_angle5')) {
        this.cmd_angle5 = initObj.cmd_angle5
      }
      else {
        this.cmd_angle5 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type feedback_angles
    // Serialize message field [timestamp]
    bufferOffset = _serializer.uint64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [enc_angle1]
    bufferOffset = _serializer.float32(obj.enc_angle1, buffer, bufferOffset);
    // Serialize message field [enc_angle2]
    bufferOffset = _serializer.float32(obj.enc_angle2, buffer, bufferOffset);
    // Serialize message field [enc_angle3]
    bufferOffset = _serializer.float32(obj.enc_angle3, buffer, bufferOffset);
    // Serialize message field [enc_angle4]
    bufferOffset = _serializer.float32(obj.enc_angle4, buffer, bufferOffset);
    // Serialize message field [enc_angle5]
    bufferOffset = _serializer.float32(obj.enc_angle5, buffer, bufferOffset);
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
    // Serialize message field [cmd_angle1]
    bufferOffset = _serializer.float32(obj.cmd_angle1, buffer, bufferOffset);
    // Serialize message field [cmd_angle2]
    bufferOffset = _serializer.float32(obj.cmd_angle2, buffer, bufferOffset);
    // Serialize message field [cmd_angle3]
    bufferOffset = _serializer.float32(obj.cmd_angle3, buffer, bufferOffset);
    // Serialize message field [cmd_angle4]
    bufferOffset = _serializer.float32(obj.cmd_angle4, buffer, bufferOffset);
    // Serialize message field [cmd_angle5]
    bufferOffset = _serializer.float32(obj.cmd_angle5, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type feedback_angles
    let len;
    let data = new feedback_angles(null);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [enc_angle1]
    data.enc_angle1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [enc_angle2]
    data.enc_angle2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [enc_angle3]
    data.enc_angle3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [enc_angle4]
    data.enc_angle4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [enc_angle5]
    data.enc_angle5 = _deserializer.float32(buffer, bufferOffset);
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
    // Deserialize message field [cmd_angle1]
    data.cmd_angle1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_angle2]
    data.cmd_angle2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_angle3]
    data.cmd_angle3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_angle4]
    data.cmd_angle4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_angle5]
    data.cmd_angle5 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'snake_demo/feedback_angles';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de147108c73c5ee162b8e21c32f2c9e6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint64 timestamp
    float32 enc_angle1
    float32 enc_angle2
    float32 enc_angle3
    float32 enc_angle4
    float32 enc_angle5
    float32 dxl_angle1
    float32 dxl_angle2
    float32 dxl_angle3
    float32 dxl_angle4
    float32 dxl_angle5
    float32 cmd_angle1
    float32 cmd_angle2
    float32 cmd_angle3
    float32 cmd_angle4
    float32 cmd_angle5
    
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

    if (msg.enc_angle1 !== undefined) {
      resolved.enc_angle1 = msg.enc_angle1;
    }
    else {
      resolved.enc_angle1 = 0.0
    }

    if (msg.enc_angle2 !== undefined) {
      resolved.enc_angle2 = msg.enc_angle2;
    }
    else {
      resolved.enc_angle2 = 0.0
    }

    if (msg.enc_angle3 !== undefined) {
      resolved.enc_angle3 = msg.enc_angle3;
    }
    else {
      resolved.enc_angle3 = 0.0
    }

    if (msg.enc_angle4 !== undefined) {
      resolved.enc_angle4 = msg.enc_angle4;
    }
    else {
      resolved.enc_angle4 = 0.0
    }

    if (msg.enc_angle5 !== undefined) {
      resolved.enc_angle5 = msg.enc_angle5;
    }
    else {
      resolved.enc_angle5 = 0.0
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

    if (msg.cmd_angle1 !== undefined) {
      resolved.cmd_angle1 = msg.cmd_angle1;
    }
    else {
      resolved.cmd_angle1 = 0.0
    }

    if (msg.cmd_angle2 !== undefined) {
      resolved.cmd_angle2 = msg.cmd_angle2;
    }
    else {
      resolved.cmd_angle2 = 0.0
    }

    if (msg.cmd_angle3 !== undefined) {
      resolved.cmd_angle3 = msg.cmd_angle3;
    }
    else {
      resolved.cmd_angle3 = 0.0
    }

    if (msg.cmd_angle4 !== undefined) {
      resolved.cmd_angle4 = msg.cmd_angle4;
    }
    else {
      resolved.cmd_angle4 = 0.0
    }

    if (msg.cmd_angle5 !== undefined) {
      resolved.cmd_angle5 = msg.cmd_angle5;
    }
    else {
      resolved.cmd_angle5 = 0.0
    }

    return resolved;
    }
};

module.exports = feedback_angles;
