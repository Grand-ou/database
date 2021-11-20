import { Select, Table } from 'antd';
import 'antd/dist/antd.css';
import axios from 'axios';
import { useEffect, useState } from 'react';

const { Option } = Select;

const GetDealInfo = ({ company }) => {

    const [dealInfo, setDealInfo] = useState([])
    const json = JSON.stringify({"cname": company})

    useEffect(() => {
      axios.post('http://127.0.0.1:8000/api/stockinformation', {"cname": company})
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
        dataIndex: 'cname',
        key: 'cname',
      },
      {
        title: 'Owner',
        dataIndex: 'cowner',
        key: 'cowner',
      },
      {
        title: '殖利率',
        dataIndex: 'cyield',
        key: 'cyield',
      },
      {
        title: '本益比',
        dataIndex: 'pe_ratio',
        key: 'pe_ratio',
      },
      {
        title: 'Type',
        dataIndex: 'industry_type',
        key: 'industry_type',
      }
    ];

      return<>
        <Table columns={columns} dataSource={dealInfo} />

      </>

}



export default GetDealInfo
