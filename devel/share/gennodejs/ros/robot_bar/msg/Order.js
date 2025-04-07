// Auto-generated. Do not edit!

// (in-package robot_bar.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Order {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id_ordine = null;
      this.prodotto = null;
      this.tavolo = null;
    }
    else {
      if (initObj.hasOwnProperty('id_ordine')) {
        this.id_ordine = initObj.id_ordine
      }
      else {
        this.id_ordine = '';
      }
      if (initObj.hasOwnProperty('prodotto')) {
        this.prodotto = initObj.prodotto
      }
      else {
        this.prodotto = '';
      }
      if (initObj.hasOwnProperty('tavolo')) {
        this.tavolo = initObj.tavolo
      }
      else {
        this.tavolo = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Order
    // Serialize message field [id_ordine]
    bufferOffset = _serializer.string(obj.id_ordine, buffer, bufferOffset);
    // Serialize message field [prodotto]
    bufferOffset = _serializer.string(obj.prodotto, buffer, bufferOffset);
    // Serialize message field [tavolo]
    bufferOffset = _serializer.int32(obj.tavolo, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Order
    let len;
    let data = new Order(null);
    // Deserialize message field [id_ordine]
    data.id_ordine = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [prodotto]
    data.prodotto = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [tavolo]
    data.tavolo = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.id_ordine);
    length += _getByteLength(object.prodotto);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_bar/Order';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '423d4314acfad0d1e32fd5c417d3147d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string id_ordine
    string prodotto
    int32 tavolo
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Order(null);
    if (msg.id_ordine !== undefined) {
      resolved.id_ordine = msg.id_ordine;
    }
    else {
      resolved.id_ordine = ''
    }

    if (msg.prodotto !== undefined) {
      resolved.prodotto = msg.prodotto;
    }
    else {
      resolved.prodotto = ''
    }

    if (msg.tavolo !== undefined) {
      resolved.tavolo = msg.tavolo;
    }
    else {
      resolved.tavolo = 0
    }

    return resolved;
    }
};

module.exports = Order;
