import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { Input, InputNumber } from 'antd';
import { Space } from 'antd';

const User_register = ({ setUserID, setPassword, setName, setPhone, setRegister }) => {
    
      const onChangeID = (e) => {
        console.log(`selected ${e}`);
        setUserID(e.target.value);
        setRegister(false);
      }
      const onChangePwd = (e) => {
        console.log(`selected ${e}`);
        setPassword(e.target.value);
        setRegister(false);
      }
      const onChangeName = (e) => {
        console.log(`selected ${e}`);
        setName(e.target.value);
        setRegister(false);
      }
      const onChangePhone = (e) => {
        console.log(`selected ${e}`);
        setPhone(e.target.value);
        setRegister(false);
     }
      
      return(
        <div>
          <div>
            <Space className='stopLoss'>
                <h3>輸入帳號</h3>
                <Input defaultValue='123'
                       onChange={onChangeID} />
            </Space>
            </div><div>
            <Space className='stopLoss'>
                <h3>輸入密碼</h3>
                <Input defaultValue='123'
                       onChange={onChangePwd} />
            </Space>
            </div><div>
            <Space className='stopLoss'>
                <h3>輸入姓名</h3>
                <Input defaultValue='123'
                       onChange={onChangeName} />
            </Space>
            </div><div>
            <Space className='stopLoss'>
                <h3>輸入電話</h3>
                <Input defaultValue='123'
                       onChange={onChangePhone} />
            </Space>
            </div>
        </div>
      );

}

export default User_register
/*<h3>輸入帳號</h3>
                <Input placeholder="Basic usage"
                 />
                <h3>輸入密碼</h3>
                <Input placeholder="Basic usage" />*/