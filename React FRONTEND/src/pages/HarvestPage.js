// pages/HarvestPage.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import styles from './css/HarvestPage.module.css';

function HarvestPage() {
  const [harvestData, setHarvestData] = useState([]);

  useEffect(() => {
    // Replace with the actual URL of your Django backend
    axios.get('http://127.0.0.1:8000/harvest/')
      .then(response => {
        setHarvestData(response.data.harvest);
      })
      .catch(error => {
        console.error('There was an error fetching the harvest data:', error);
      });
  }, []);

  return (
    <div className={styles.tableContainer}>
      <h1>Harvest Data</h1>
      <table className={styles.table}>
        <thead>
          <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Quantity</th>
            <th>Plant ID</th>
            <th>Plot ID</th>
            <th>Member ID</th>
          </tr>
        </thead>
        <tbody>
          {harvestData.map(item => (
            <tr key={item.h_id}>
              <td>{item.h_id}</td>
              <td>{item.date}</td>
              <td>{item.quantity}</td>
              <td>{item.plant_id}</td>
              <td>{item.plot_id}</td>
              <td>{item.member_id}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default HarvestPage;
