import '../App.css'
import { Space, Button } from 'antd'
import { useState } from 'react'
import Register from "../Component/Register";


const Register_Succeed = ( { userID, password, name, phone, setRegister, setLR, setRegisterPage } ) => {

    return (
        <div className='header'>
            <Register userID={userID} password={password} name={name} phone={phone} setRegister={setRegister} setLR={setLR} setRegisterPage={setRegisterPage} />
            
        </div>
    )

}

export default Register_Succeed