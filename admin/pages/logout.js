import React, { useEffect, useState } from 'react';

export default function Logout() {
  // this is for mocking the logout
  const [deleted, setDeleted] = useState(null);

  useEffect(() => {
    if(sessionStorage != 'undefined') {
      sessionStorage.clear();
      setDeleted(true)
    }
  }, []);

  if(sessionStorage == 'undefined') {
    return null
  }

  return window.location.href = "/";
}
