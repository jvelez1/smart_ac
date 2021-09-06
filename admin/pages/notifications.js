import React, { useEffect, useState } from 'react';
import { ToastContainer, toast } from 'react-toastify';
import axios from 'axios';

import 'react-toastify/dist/ReactToastify.css';

async function fetNotificationsByUser() {
  return axios.get('http://localhost:4567/user_notifications')
              .then(data => data.data)
              .catch(e => {console.log(e)})
}


async function updateNotication(id) {
  return axios.post(`http://localhost:4567/user_notifications/${id}/read`, {})
              .then(data => data.data)
              .catch(e => {console.log(e)})
}


function Notifications(){
  const options = {
    autoClose: false,
  }

  useEffect(async () => {
    const interval = setInterval(async () => {
      const awaitNotifications = await fetNotificationsByUser()
      if(awaitNotifications){
        iterateNotifications(awaitNotifications)
      }
    }, 1000);
    return () => clearInterval(interval);
  }, []);
  
  const iterateNotifications = (notifications)=> {
    notifications.data.map((notification) => {
      const onCloseToast = () => {
        return () => { updateNotication(notification.id) }
      }
      toast.error(
        `${notification.attributes.topic}: ${notification.attributes.message}`,
        {
          ...options,
          toastId: notification.id,
          onClose: onCloseToast()
        }
      );
    })
  }

  return (
    <div>
      <ToastContainer />
    </div>
  );
}

export default Notifications