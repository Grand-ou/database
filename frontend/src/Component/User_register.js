import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { Input } from 'antd';
import { Space } from 'antd';

const User_register = ({ setUserID, setPassword, setName, setPhone }) => {
    
      const onChangeID = (value) => {
        console.log(`selected ${value}`);
        setUserID(value)
      }
      const onChangePwd = (value) => {
        console.log(`selected ${value}`);
        setPassword(value)
      }
      const onChangeName = (value) => {
        console.log(`selected ${value}`);
        setName(value)
      }
      const onChangePhone = (value) => {
        console.log(`selected ${value}`);
        setPhone(value)
     }
      
      return(
        <div>
            <Space className='stopLoss'>
                <h3>輸入帳號</h3>
                <Input placeholder="請輸入帳號"
                       onChange={onChangeID} />
                <h3>輸入密碼</h3>
                <Input placeholder="請輸入密碼"
                       onChange={onChangePwd} />
                <h3>輸入姓名</h3>
                <Input placeholder="請輸入姓名"
                       onChange={onChangeName} />
                <h3>輸入密碼</h3>
                <Input placeholder="請輸入電話"
                       onChange={onChangePhone} />
            </Space>
        </div>
      );

}

export default User_register
/*<h3>輸入帳號</h3>
                <Input placeholder="Basic usage"
                 />
                <h3>輸入密碼</h3>
                <Input placeholder="Basic usage" />*/