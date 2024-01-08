// pages/MembersPage.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import styles from './css/HarvestPage.module.css'; // Import the CSS module

function MembersPage() {
  const [membersData, setMembersData] = useState([]);

  useEffect(() => {
    axios.get('http://127.0.0.1:8000/members/') // Replace with your actual API endpoint
      .then(response => {
        setMembersData(response.data.members);
      })
      .catch(error => {
        console.error('There was an error fetching the members data:', error);
      });
  }, []);

  return (
    <div>
      <h1>Members Data</h1>
      <div className={styles.tableContainer}>
        <table className={styles.table}>
          <thead>
            <tr>
              <th>Member ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Email</th>
            </tr>
          </thead>
          <tbody>
            {membersData.map(member => (
              <tr key={member.member_id}>
                <td>{member.member_id}</td>
                <td>{member.first_name}</td>
                <td>{member.last_name}</td>
                <td>{member.email}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default MembersPage;
