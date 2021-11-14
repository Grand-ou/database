import { Select, Table } from 'antd';
import 'antd/dist/antd.css';
import axios from 'axios';
import { useEffect, useState } from 'react';

const History = ({ userID }) => {

    const [historyData, setHistoryData] = useState([])

    useEffect(() => {
      axios.post('../history', {     //某個function，傳入userID，傳回歷史資料
        "UserID": userID
      })
      .then((res) => { 
        setHistoryData(res.data)
      })
      .catch((error) => { console.log(error) })
    },[])
    
    const columns = [
      {
        title: '公司名稱',
        dataIndex: 'company',
        key: 'company',
      },
      {
        title: '使用指標',
        dataIndex: 'indicator',
        key: 'indicator',
      },
      {
        title: '指標數值1',
        dataIndex: 'num1',
        key: 'num1',
      },
      {
        title: '指標數值2',
        dataIndex: 'num2',
        key: 'num2',
      },
      {
        title: '停利點',
        dataIndex: 'stop_profit',
        key: 'stop_profit',
      },
      {
        title: '停損點',
        dataIndex: 'stop_loss',
        key: 'stop_loss',
      }
    ];

      return(
        <Table columns={columns} dataSource={historyData} />
      );

}



export default History