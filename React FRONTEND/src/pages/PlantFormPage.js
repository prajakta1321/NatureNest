import React, { useState } from 'react';
import './css/PlantFormPage.css'; 
function PlantFormPage() {
  const [plant, setPlant] = useState({
    pname: '',
    ptype: '',
    season: '',
    care: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setPlant(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const plantJson = [plant]; // Wrapping the plant object in an array

    fetch('http://127.0.0.1:8000/add_plants/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(plantJson), // Converting the JavaScript array to a JSON string
    })
    .then(response => {
      if (response.ok) {
        return response.json(); // Parsing the JSON response body
      }
      throw new Error('Network response was not ok.'); // Handle the error response
    })
    .then(data => {
      console.log('Success:', data);
      // Here you can handle the success response, such as updating the UI or redirecting the user
    })
    .catch((error) => {
      console.error('Error:', error);
      // Here you can handle the error, such as displaying an error message to the user
    });
  };
  return (
    <div className="plant-form-container">
      <form onSubmit={handleSubmit} className="plant-form">
        <h2>Add Plant</h2>
        <div className="form-group">
          <label htmlFor="pname">Plant Name:</label>
          <input type="text" id="pname" name="pname" value={plant.pname} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="ptype">Plant Type:</label>
          <input type="text" id="ptype" name="ptype" value={plant.ptype} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="season">Season:</label>
          <input type="text" id="season" name="season" value={plant.season} onChange={handleChange} />
        </div>
        <div className="form-group">
          <label htmlFor="care">Care Instructions:</label>
          <textarea id="care" name="care" value={plant.care} onChange={handleChange} />
        </div>
        <button type="submit" className="submit-button">Add Plant</button>
      </form>
    </div>
  );
}


export default PlantFormPage;
