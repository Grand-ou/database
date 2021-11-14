import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { Input } from 'antd';
import { Space } from 'antd';

const User = ({ setUserID, setPassword }) => {
    
      const onChangeID = (value) => {
        console.log(`selected ${value}`);
        setUserID(value)
      }
      const onChangePwd = (value) => {
        console.log(`selected ${value}`);
        setPassword(value)
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
            </Space>
        </div>
      );

}

export default User
/*<h3>輸入帳號</h3>
                <Input placeholder="Basic usage"
                 />
                <h3>輸入密碼</h3>
                <Input placeholder="Basic usage" />*/