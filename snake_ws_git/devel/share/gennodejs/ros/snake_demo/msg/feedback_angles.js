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
      this.xvel1 = null;
      this.yvel1 = null;
      this.xvel2 = null;
      this.yvel2 = null;
      this.xvel3 = null;
      this.yvel3 = null;
      this.xvel4 = null;
      this.yvel4 = null;
      this.xvel5 = null;
      this.yvel5 = null;
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
      if (initObj.hasOwnProperty('xvel1')) {
        this.xvel1 = initObj.xvel1
      }
      else {
        this.xvel1 = 0;
      }
      if (initObj.hasOwnProperty('yvel1')) {
        this.yvel1 = initObj.yvel1
      }
      else {
        this.yvel1 = 0;
      }
      if (initObj.hasOwnProperty('xvel2')) {
        this.xvel2 = initObj.xvel2
      }
      else {
        this.xvel2 = 0;
      }
      if (initObj.hasOwnProperty('yvel2')) {
        this.yvel2 = initObj.yvel2
      }
      else {
        this.yvel2 = 0;
      }
      if (initObj.hasOwnProperty('xvel3')) {
        this.xvel3 = initObj.xvel3
      }
      else {
        this.xvel3 = 0;
      }
      if (initObj.hasOwnProperty('yvel3')) {
        this.yvel3 = initObj.yvel3
      }
      else {
        this.yvel3 = 0;
      }
      if (initObj.hasOwnProperty('xvel4')) {
        this.xvel4 = initObj.xvel4
      }
      else {
        this.xvel4 = 0;
      }
      if (initObj.hasOwnProperty('yvel4')) {
        this.yvel4 = initObj.yvel4
      }
      else {
        this.yvel4 = 0;
      }
      if (initObj.hasOwnProperty('xvel5')) {
        this.xvel5 = initObj.xvel5
      }
      else {
        this.xvel5 = 0;
      }
      if (initObj.hasOwnProperty('yvel5')) {
        this.yvel5 = initObj.yvel5
      }
      else {
        this.yvel5 = 0;
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
    // Serialize message field [xvel1]
    bufferOffset = _serializer.int16(obj.xvel1, buffer, bufferOffset);
    // Serialize message field [yvel1]
    bufferOffset = _serializer.int16(obj.yvel1, buffer, bufferOffset);
    // Serialize message field [xvel2]
    bufferOffset = _serializer.int16(obj.xvel2, buffer, bufferOffset);
    // Serialize message field [yvel2]
    bufferOffset = _serializer.int16(obj.yvel2, buffer, bufferOffset);
    // Serialize message field [xvel3]
    bufferOffset = _serializer.int16(obj.xvel3, buffer, bufferOffset);
    // Serialize message field [yvel3]
    bufferOffset = _serializer.int16(obj.yvel3, buffer, bufferOffset);
    // Serialize message field [xvel4]
    bufferOffset = _serializer.int16(obj.xvel4, buffer, bufferOffset);
    // Serialize message field [yvel4]
    bufferOffset = _serializer.int16(obj.yvel4, buffer, bufferOffset);
    // Serialize message field [xvel5]
    bufferOffset = _serializer.int16(obj.xvel5, buffer, bufferOffset);
    // Serialize message field [yvel5]
    bufferOffset = _serializer.int16(obj.yvel5, buffer, bufferOffset);
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
    // Deserialize message field [xvel1]
    data.xvel1 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [yvel1]
    data.yvel1 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [xvel2]
    data.xvel2 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [yvel2]
    data.yvel2 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [xvel3]
    data.xvel3 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [yvel3]
    data.yvel3 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [xvel4]
    data.xvel4 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [yvel4]
    data.yvel4 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [xvel5]
    data.xvel5 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [yvel5]
    data.yvel5 = _deserializer.int16(buffer, bufferOffset);
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
    return 'efca087178a4608ce59813f65425d68e';
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
    int16 xvel1
    int16 yvel1
    int16 xvel2
    int16 yvel2
    int16 xvel3
    int16 yvel3
    int16 xvel4
    int16 yvel4
    int16 xvel5
    int16 yvel5
    
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

    if (msg.xvel1 !== undefined) {
      resolved.xvel1 = msg.xvel1;
    }
    else {
      resolved.xvel1 = 0
    }

    if (msg.yvel1 !== undefined) {
      resolved.yvel1 = msg.yvel1;
    }
    else {
      resolved.yvel1 = 0
    }

    if (msg.xvel2 !== undefined) {
      resolved.xvel2 = msg.xvel2;
    }
    else {
      resolved.xvel2 = 0
    }

    if (msg.yvel2 !== undefined) {
      resolved.yvel2 = msg.yvel2;
    }
    else {
      resolved.yvel2 = 0
    }

    if (msg.xvel3 !== undefined) {
      resolved.xvel3 = msg.xvel3;
    }
    else {
      resolved.xvel3 = 0
    }

    if (msg.yvel3 !== undefined) {
      resolved.yvel3 = msg.yvel3;
    }
    else {
      resolved.yvel3 = 0
    }

    if (msg.xvel4 !== undefined) {
      resolved.xvel4 = msg.xvel4;
    }
    else {
      resolved.xvel4 = 0
    }

    if (msg.yvel4 !== undefined) {
      resolved.yvel4 = msg.yvel4;
    }
    else {
      resolved.yvel4 = 0
    }

    if (msg.xvel5 !== undefined) {
      resolved.xvel5 = msg.xvel5;
    }
    else {
      resolved.xvel5 = 0
    }

    if (msg.yvel5 !== undefined) {
      resolved.yvel5 = msg.yvel5;
    }
    else {
      resolved.yvel5 = 0
    }

    return resolved;
    }
};

module.exports = feedback_angles;
