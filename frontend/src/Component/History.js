import { Select, Table } from 'antd';
import 'antd/dist/antd.css';
import axios from 'axios';
import { useEffect, useState } from 'react';

const History = ({ userID }) => {

    const [historyData, setHistoryData] = useState([])

    useEffect(() => {
      axios.get('http://127.0.0.1:8000/api/seestrategy')
      .then((res) => { 
        setHistoryData(res.data)
      })
      .catch((error) => { console.log(error) })
    },[])
    /*Sid = unit.sid
     budget = unit.budget
     Company_id = unit.Company_id
     Creator_id = unit.Creator_id
     strategy_type = unit. strategy_type */
    const columns = [
      {
        title: '策略ID',
        dataIndex: 'sid',
        key: 'sid',
      },
      {
        title: '預算',
        dataIndex: 'budget',
        key: 'budget',
      },
      {
        title: '創建者ID',
        dataIndex: 'creator_id',
        key: 'creator_id',
      },
      {
        title: '使用指標',
        dataIndex: 'strategy_type',
        key: 'strategy_type',
      }
    ];

      return(
        <Table columns={columns} dataSource={historyData} />
      );

}



export default History
