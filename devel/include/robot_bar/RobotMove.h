// Generated by gencpp from file robot_bar/RobotMove.msg
// DO NOT EDIT!


#ifndef ROBOT_BAR_MESSAGE_ROBOTMOVE_H
#define ROBOT_BAR_MESSAGE_ROBOTMOVE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robot_bar
{
template <class ContainerAllocator>
struct RobotMove_
{
  typedef RobotMove_<ContainerAllocator> Type;

  RobotMove_()
    : tavolo(0)
    , x(0.0)
    , y(0.0)  {
    }
  RobotMove_(const ContainerAllocator& _alloc)
    : tavolo(0)
    , x(0.0)
    , y(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _tavolo_type;
  _tavolo_type tavolo;

   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;





  typedef boost::shared_ptr< ::robot_bar::RobotMove_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_bar::RobotMove_<ContainerAllocator> const> ConstPtr;

}; // struct RobotMove_

typedef ::robot_bar::RobotMove_<std::allocator<void> > RobotMove;

typedef boost::shared_ptr< ::robot_bar::RobotMove > RobotMovePtr;
typedef boost::shared_ptr< ::robot_bar::RobotMove const> RobotMoveConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_bar::RobotMove_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_bar::RobotMove_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robot_bar::RobotMove_<ContainerAllocator1> & lhs, const ::robot_bar::RobotMove_<ContainerAllocator2> & rhs)
{
  return lhs.tavolo == rhs.tavolo &&
    lhs.x == rhs.x &&
    lhs.y == rhs.y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robot_bar::RobotMove_<ContainerAllocator1> & lhs, const ::robot_bar::RobotMove_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robot_bar

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robot_bar::RobotMove_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_bar::RobotMove_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_bar::RobotMove_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_bar::RobotMove_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_bar::RobotMove_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_bar::RobotMove_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_bar::RobotMove_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4483cf2c7cbd5e40cc80bd9b27d40621";
  }

  static const char* value(const ::robot_bar::RobotMove_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4483cf2c7cbd5e40ULL;
  static const uint64_t static_value2 = 0xcc80bd9b27d40621ULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_bar::RobotMove_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_bar/RobotMove";
  }

  static const char* value(const ::robot_bar::RobotMove_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_bar::RobotMove_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 tavolo\n"
"float32 x\n"
"float32 y\n"
;
  }

  static const char* value(const ::robot_bar::RobotMove_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_bar::RobotMove_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.tavolo);
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotMove_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_bar::RobotMove_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_bar::RobotMove_<ContainerAllocator>& v)
  {
    s << indent << "tavolo: ";
    Printer<int32_t>::stream(s, indent + "  ", v.tavolo);
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_BAR_MESSAGE_ROBOTMOVE_H
