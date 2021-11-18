import { Select, Table } from 'antd';
import 'antd/dist/antd.css';
import axios from 'axios';
import { useEffect, useState } from 'react';

const { Option } = Select;

const GetDealInfo = ({ company }) => {

    const [dealInfo, setDealInfo] = useState([])

    useEffect(() => {
      axios.post('http://127.0.0.1:8000/api/stockinformation', {     //某個function，傳入公司資料，便回傳剩下所需資訊
        "cname": company
      })
      .then((res) => { 
        setDealInfo(res.data)
      })
      .catch((error) => { console.log(error) })
    },[])
    
    const columns = [
      {
        title: 'CompanyID',
        dataIndex: 'cid',
        key: 'cid',
      },
      {
        title: 'CompanyName',
        dataIndex: 'companyname',
        key: 'companyname',
      },
      {
        title: 'Owner',
        dataIndex: 'owner',
        key: 'owner',
      },
      {
        title: '本益比',
        dataIndex: 'roe',
        key: 'roe',
      },
      {
        title: '殖利率',
        dataIndex: 'dividend_yield',
        key: 'dividend_yield',
      },
      {
        title: 'Type',
        dataIndex: 'type',
        key: 'type',
      }
    ];

      return(
        <Table columns={columns} dataSource={dealInfo} />
      );

}



export default GetDealInfo
