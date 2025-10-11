String notificationImage(String image){
  if(image== 'order_assigned.png'){
    return 'assets/images/notification_icons/order_assigned.jpg';
  }else if(image == 'order_delivered.png'){
    return 'assets/images/notification_icons/order_delivered.jpg';
  } else if(image == 'order_cancelled.png'){
    return 'assets/images/notification_icons/order_cancelled.jpg';
  } else if(image == 'promotion_notify.png'){
    return 'assets/images/notification_icons/promotion_nootify.jpg';
  } else if(image == 'promotion_marketplace.png'){
    return 'assets/images/notification_icons/promotion_marketplace.jpg';
  } else if(image == 'support_personnel.png'){
    return 'assets/images/notification_icons/support_peersonnel.jpg';
  } else {
    return 'assets/images/notification_icons/support_peersonnel.jpg';
  }
}