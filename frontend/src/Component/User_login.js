import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { Input } from 'antd';
import { Space } from 'antd';

const User = ({ setUserID, setPassword, setLogin }) => {
    
  const onChangeID = (e) => {
    console.log(`selected ${e}`);
    setUserID(e.target.value);
    setLogin(false);
  }
  const onChangePwd = (e) => {
    console.log(`selected ${e}`);
    setPassword(e.target.value);
    setLogin(false);
  }
      
      return<>
        <div>
          <div >
            <Space className='stopLoss'>
                <h3>輸入帳號</h3>
                <Input placeholder="請輸入帳號"
                       defaultValue='123'
                       onChange={onChangeID} />
            </Space>
            </div><div>
            <Space className='stopLoss'>
                <h3>輸入密碼</h3>
                <Input placeholder="請輸入密碼"
                       defaultValue='123'
                       onChange={onChangePwd} />
            </Space>
            </div>
        </div>
      </>

}

export default User
/*<h3>輸入帳號</h3>
                <Input placeholder="Basic usage"
                 />
                <h3>輸入密碼</h3>
                <Input placeholder="Basic usage" />*/