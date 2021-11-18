import axios from 'axios';
import { useState, useEffect } from 'react';

const Login = ({ userID, password, setLoginStr }) => {

  useEffect(() => {
    axios.post('http://127.0.0.1:8000/api/login', {         //某種function，傳入使用者帳密進入資料庫中，並確認是否有重複使用者ID(假設回傳一個字串)
      "username": userID,
      "password": password
    })
    .then((res) => { 
      setLoginStr(res.data)
    })
    .catch((error) => { console.log(error) })
  },[])

  return <>
  </>
}

export default Login
