# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from snake_demo/feedback_angles.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class feedback_angles(genpy.Message):
  _md5sum = "efca087178a4608ce59813f65425d68e"
  _type = "snake_demo/feedback_angles"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint64 timestamp
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
"""
  __slots__ = ['timestamp','enc_angle1','enc_angle2','enc_angle3','enc_angle4','enc_angle5','xvel1','yvel1','xvel2','yvel2','xvel3','yvel3','xvel4','yvel4','xvel5','yvel5']
  _slot_types = ['uint64','float32','float32','float32','float32','float32','int16','int16','int16','int16','int16','int16','int16','int16','int16','int16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       timestamp,enc_angle1,enc_angle2,enc_angle3,enc_angle4,enc_angle5,xvel1,yvel1,xvel2,yvel2,xvel3,yvel3,xvel4,yvel4,xvel5,yvel5

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(feedback_angles, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.timestamp is None:
        self.timestamp = 0
      if self.enc_angle1 is None:
        self.enc_angle1 = 0.
      if self.enc_angle2 is None:
        self.enc_angle2 = 0.
      if self.enc_angle3 is None:
        self.enc_angle3 = 0.
      if self.enc_angle4 is None:
        self.enc_angle4 = 0.
      if self.enc_angle5 is None:
        self.enc_angle5 = 0.
      if self.xvel1 is None:
        self.xvel1 = 0
      if self.yvel1 is None:
        self.yvel1 = 0
      if self.xvel2 is None:
        self.xvel2 = 0
      if self.yvel2 is None:
        self.yvel2 = 0
      if self.xvel3 is None:
        self.xvel3 = 0
      if self.yvel3 is None:
        self.yvel3 = 0
      if self.xvel4 is None:
        self.xvel4 = 0
      if self.yvel4 is None:
        self.yvel4 = 0
      if self.xvel5 is None:
        self.xvel5 = 0
      if self.yvel5 is None:
        self.yvel5 = 0
    else:
      self.timestamp = 0
      self.enc_angle1 = 0.
      self.enc_angle2 = 0.
      self.enc_angle3 = 0.
      self.enc_angle4 = 0.
      self.enc_angle5 = 0.
      self.xvel1 = 0
      self.yvel1 = 0
      self.xvel2 = 0
      self.yvel2 = 0
      self.xvel3 = 0
      self.yvel3 = 0
      self.xvel4 = 0
      self.yvel4 = 0
      self.xvel5 = 0
      self.yvel5 = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_Q5f10h().pack(_x.timestamp, _x.enc_angle1, _x.enc_angle2, _x.enc_angle3, _x.enc_angle4, _x.enc_angle5, _x.xvel1, _x.yvel1, _x.xvel2, _x.yvel2, _x.xvel3, _x.yvel3, _x.xvel4, _x.yvel4, _x.xvel5, _x.yvel5))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 48
      (_x.timestamp, _x.enc_angle1, _x.enc_angle2, _x.enc_angle3, _x.enc_angle4, _x.enc_angle5, _x.xvel1, _x.yvel1, _x.xvel2, _x.yvel2, _x.xvel3, _x.yvel3, _x.xvel4, _x.yvel4, _x.xvel5, _x.yvel5,) = _get_struct_Q5f10h().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_Q5f10h().pack(_x.timestamp, _x.enc_angle1, _x.enc_angle2, _x.enc_angle3, _x.enc_angle4, _x.enc_angle5, _x.xvel1, _x.yvel1, _x.xvel2, _x.yvel2, _x.xvel3, _x.yvel3, _x.xvel4, _x.yvel4, _x.xvel5, _x.yvel5))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 48
      (_x.timestamp, _x.enc_angle1, _x.enc_angle2, _x.enc_angle3, _x.enc_angle4, _x.enc_angle5, _x.xvel1, _x.yvel1, _x.xvel2, _x.yvel2, _x.xvel3, _x.yvel3, _x.xvel4, _x.yvel4, _x.xvel5, _x.yvel5,) = _get_struct_Q5f10h().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_Q5f10h = None
def _get_struct_Q5f10h():
    global _struct_Q5f10h
    if _struct_Q5f10h is None:
        _struct_Q5f10h = struct.Struct("<Q5f10h")
    return _struct_Q5f10h
