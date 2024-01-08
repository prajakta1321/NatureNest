import React, { useState } from 'react';
import './css/MemberFormPage.css';
function MemberFormPage() {
  const [member, setMember] = useState({
 // This field is not typically user-entered, but included for completeness
    first_name: '',
    last_name: '',
    email: '',
    phone: '',
    address: '',
    join_date: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setMember(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const memberJson = [member]; // Wrapping the member object in an array

    fetch('http://127.0.0.1:8000/add_members/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(memberJson), // Converting the JavaScript array to a JSON string
    })
    .then(response => {
      if (response.ok) {
        return response.json(); // Parsing the JSON response body
      }
      throw new Error('Network response was not ok.'); // Handle the error response
    })
    .then(data => {
      console.log('Success:', data);
      // Handle the success response, such as updating the UI or redirecting the user
    })
    .catch((error) => {
      console.error('Error:', error);
      // Handle the error, such as displaying an error message to the user
    });
  };

  return (
    <div className="member-form-container">
      <form onSubmit={handleSubmit} className="member-form">
        <h2>Add Member</h2>
        {/* Removed Member ID since it's not typically user-entered */}
        <div className="form-group">
          <label htmlFor="first_name">First Name:</label>
          <input type="text" id="first_name" name="first_name" value={member.first_name} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="last_name">Last Name:</label>
          <input type="text" id="last_name" name="last_name" value={member.last_name} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input type="email" id="email" name="email" value={member.email} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="phone">Phone:</label>
          <input type="tel" id="phone" name="phone" value={member.phone} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="address">Address:</label>
          <input type="text" id="address" name="address" value={member.address} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="join_date">Join Date:</label>
          <input type="date" id="join_date" name="join_date" value={member.join_date} onChange={handleChange} />
        </div>
        <button type="submit" className="submit-button">Add Member</button>
      </form>
    </div>
  );
}
export default MemberFormPage;
