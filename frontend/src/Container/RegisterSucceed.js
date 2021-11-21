import '../App.css'
import { Space, Button } from 'antd'
import { useState } from 'react'
import Register from "../Component/Register";

const Register_Succeed = ( { userID, password, name, phone, setRegister, setMenuset, setRegisterPage } ) => {

    return (
        <div className='login_register'>
            <Register userID={userID} password={password} name={name} phone={phone} setRegister={setRegister} setMenuset={setMenuset} setRegisterPage={setRegisterPage} />
            
        </div>
    )

}

export default Register_Succeed