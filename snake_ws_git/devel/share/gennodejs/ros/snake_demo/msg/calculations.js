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

class calculations {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp = null;
      this.torque1 = null;
      this.torque2 = null;
      this.torque3 = null;
      this.torque4 = null;
      this.torque5 = null;
      this.angvel1 = null;
      this.angvel2 = null;
      this.angvel3 = null;
      this.angvel4 = null;
      this.angvel5 = null;
      this.enc_angle1 = null;
      this.enc_angle2 = null;
      this.enc_angle3 = null;
      this.enc_angle4 = null;
      this.enc_angle5 = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('torque1')) {
        this.torque1 = initObj.torque1
      }
      else {
        this.torque1 = 0.0;
      }
      if (initObj.hasOwnProperty('torque2')) {
        this.torque2 = initObj.torque2
      }
      else {
        this.torque2 = 0.0;
      }
      if (initObj.hasOwnProperty('torque3')) {
        this.torque3 = initObj.torque3
      }
      else {
        this.torque3 = 0.0;
      }
      if (initObj.hasOwnProperty('torque4')) {
        this.torque4 = initObj.torque4
      }
      else {
        this.torque4 = 0.0;
      }
      if (initObj.hasOwnProperty('torque5')) {
        this.torque5 = initObj.torque5
      }
      else {
        this.torque5 = 0.0;
      }
      if (initObj.hasOwnProperty('angvel1')) {
        this.angvel1 = initObj.angvel1
      }
      else {
        this.angvel1 = 0.0;
      }
      if (initObj.hasOwnProperty('angvel2')) {
        this.angvel2 = initObj.angvel2
      }
      else {
        this.angvel2 = 0.0;
      }
      if (initObj.hasOwnProperty('angvel3')) {
        this.angvel3 = initObj.angvel3
      }
      else {
        this.angvel3 = 0.0;
      }
      if (initObj.hasOwnProperty('angvel4')) {
        this.angvel4 = initObj.angvel4
      }
      else {
        this.angvel4 = 0.0;
      }
      if (initObj.hasOwnProperty('angvel5')) {
        this.angvel5 = initObj.angvel5
      }
      else {
        this.angvel5 = 0.0;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calculations
    // Serialize message field [timestamp]
    bufferOffset = _serializer.uint64(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [torque1]
    bufferOffset = _serializer.float32(obj.torque1, buffer, bufferOffset);
    // Serialize message field [torque2]
    bufferOffset = _serializer.float32(obj.torque2, buffer, bufferOffset);
    // Serialize message field [torque3]
    bufferOffset = _serializer.float32(obj.torque3, buffer, bufferOffset);
    // Serialize message field [torque4]
    bufferOffset = _serializer.float32(obj.torque4, buffer, bufferOffset);
    // Serialize message field [torque5]
    bufferOffset = _serializer.float32(obj.torque5, buffer, bufferOffset);
    // Serialize message field [angvel1]
    bufferOffset = _serializer.float32(obj.angvel1, buffer, bufferOffset);
    // Serialize message field [angvel2]
    bufferOffset = _serializer.float32(obj.angvel2, buffer, bufferOffset);
    // Serialize message field [angvel3]
    bufferOffset = _serializer.float32(obj.angvel3, buffer, bufferOffset);
    // Serialize message field [angvel4]
    bufferOffset = _serializer.float32(obj.angvel4, buffer, bufferOffset);
    // Serialize message field [angvel5]
    bufferOffset = _serializer.float32(obj.angvel5, buffer, bufferOffset);
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
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calculations
    let len;
    let data = new calculations(null);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [torque1]
    data.torque1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque2]
    data.torque2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque3]
    data.torque3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque4]
    data.torque4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque5]
    data.torque5 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angvel1]
    data.angvel1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angvel2]
    data.angvel2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angvel3]
    data.angvel3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angvel4]
    data.angvel4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angvel5]
    data.angvel5 = _deserializer.float32(buffer, bufferOffset);
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
    return data;
  }

  static getMessageSize(object) {
    return 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'snake_demo/calculations';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0391199eca786947ffc0b714f855b349';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint64 timestamp
    float32 torque1
    float32 torque2
    float32 torque3
    float32 torque4
    float32 torque5
    float32 angvel1
    float32 angvel2
    float32 angvel3
    float32 angvel4
    float32 angvel5
    float32 enc_angle1
    float32 enc_angle2
    float32 enc_angle3
    float32 enc_angle4
    float32 enc_angle5
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calculations(null);
    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    if (msg.torque1 !== undefined) {
      resolved.torque1 = msg.torque1;
    }
    else {
      resolved.torque1 = 0.0
    }

    if (msg.torque2 !== undefined) {
      resolved.torque2 = msg.torque2;
    }
    else {
      resolved.torque2 = 0.0
    }

    if (msg.torque3 !== undefined) {
      resolved.torque3 = msg.torque3;
    }
    else {
      resolved.torque3 = 0.0
    }

    if (msg.torque4 !== undefined) {
      resolved.torque4 = msg.torque4;
    }
    else {
      resolved.torque4 = 0.0
    }

    if (msg.torque5 !== undefined) {
      resolved.torque5 = msg.torque5;
    }
    else {
      resolved.torque5 = 0.0
    }

    if (msg.angvel1 !== undefined) {
      resolved.angvel1 = msg.angvel1;
    }
    else {
      resolved.angvel1 = 0.0
    }

    if (msg.angvel2 !== undefined) {
      resolved.angvel2 = msg.angvel2;
    }
    else {
      resolved.angvel2 = 0.0
    }

    if (msg.angvel3 !== undefined) {
      resolved.angvel3 = msg.angvel3;
    }
    else {
      resolved.angvel3 = 0.0
    }

    if (msg.angvel4 !== undefined) {
      resolved.angvel4 = msg.angvel4;
    }
    else {
      resolved.angvel4 = 0.0
    }

    if (msg.angvel5 !== undefined) {
      resolved.angvel5 = msg.angvel5;
    }
    else {
      resolved.angvel5 = 0.0
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

    return resolved;
    }
};

module.exports = calculations;
