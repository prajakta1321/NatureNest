import React, { useState, useEffect } from 'react';
import axios from 'axios';
import styles from './css/HarvestPage.module.css';

function PlotPage() {
  const [plotData, setPlotData] = useState([]);

  useEffect(() => {
    axios.get('http://127.0.0.1:8000/plots/')
      .then(response => {
        setPlotData(response.data.plots); // Ensure this matches the key in the response JSON
      })
      .catch(error => {
        console.error('There was an error fetching the plot data:', error);
      });
  }, []);

  return (
    <div className={styles.tableContainer}>
      <h1>Plot Data</h1>
      <table className={styles.table}>
        <thead>
          <tr>
            <th>Plot ID</th>
            <th>Location</th>
            <th>Size</th>
            <th>Status</th>
            <th>Member ID</th>
          </tr>
        </thead>
        <tbody>
          {plotData.map(item => (
            <tr key={item.plot_id}>
              <td>{item.plot_id}</td>
              <td>{item.location}</td>
              <td>{item.size}</td>
              <td>{item.status}</td> {/* Assuming 'status' is the correct field name */}
              <td>{item.member_id}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default PlotPage;
