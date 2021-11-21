import '../App.css'
import { Space, Button } from 'antd'

const MenuSet = ( { setClickDeal, setClickCreate, setClickInd, setClickCompany, setClickCheck, setCreateComplete, setWatchHistory } ) => {

    return (
        <div class='header'>
            <div id ='project'>投資決策測試系統</div>
                <div class='button' onClick={()=>{setClickDeal(true); setClickCreate(false); setClickInd(false); setClickCheck(false); setClickCompany(false); setCreateComplete(false); setWatchHistory(false);}}>個股資訊</div>
                <div class='button' onClick={()=>{setClickCreate(true); setClickDeal(false); setClickCompany(false); setClickInd(false); setClickCheck(false); setCreateComplete(false); setWatchHistory(false);}}>創建投資組合</div>
      
        </div>
    )

}

export default MenuSet
/* const [LR, setLR] = useState(true)
  const [login, setLogin] = useState(false)
  const [registerPage, setRegisterPage] = useState(false)
  const [register, setRegister] = useState(false)
  const [menuset, setMenuset] = useState(false)
  const [clickDeal, setClickDeal] = useState(false)
  const [clickCreate, setClickCreate] = useState(false)
  const [clickInd, setClickInd] = useState(false)         //選擇指標的確定鍵
  const [clickCheck, setClickCheck] = useState(false)     //創建投資組合頁面的回測鍵
  const [clickCompany, setClickCompany] = useState(false) //個股資訊頁面的選擇公司鍵
  const [createComplete, setCreateComplete] = useState(false)//創建策略
  const [watchHistory, setWatchHistory] = useState(false) //觀看歷史所設策略*/