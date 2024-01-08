import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import HarvestPage from './pages/HarvestPage';
import MembersPage from './pages/MembersPage';
import PlotPage from './pages/plotTable';
import RegisterPage from './pages/PlantFormPage';
import './css/App.css';
import HeaderImage from './tomato.png'; // Import your header image here
import Footer from './Footer';
import './css/PlantFormPage.css';
import PlantFormPage from './pages/PlantFormPage';
import MemberFormPage from './pages/signupPAGE' ; 
import CarouselComponent from './pages/CarouselComponent'; 
import HomePage from './pages/HomePage';
import { useState, useEffect } from 'react';

function ColorBlindnessModal({ onClose, onColorBlindnessResponse }) {
  return (
    <div className="modal-backdrop">
      <div className="modal">
      <div className="color-blindness-buttons">
  <button onClick={() => onColorBlindnessResponse('Monochromatism')} style={{ backgroundColor: '#808080' }}>
  <p>Are You color blind</p>  <p style={{ fontSize: '12px' }}>Monochromatism</p>



  </button>
  <button onClick={() => onColorBlindnessResponse('Dichromatism')} style={{ backgroundColor: '#0000FF' }}>
    <p>Are You color blind</p> <p style={{ fontSize: '12px' }}>Dichromatism</p>
  </button>
  <button onClick={() => onColorBlindnessResponse('Anomalous Trichromatism')} style={{ backgroundColor: '#009688' }}>
    <p>Are You color blind</p>  <p style={{ fontSize: '12px' }}>Anomalous Trichromatism</p>
  </button>
  <button onClick={() => onColorBlindnessResponse('No')} style={{ backgroundColor: '#dbdbd7', color: 'black' }}>
    <p style={{ fontSize: '14px' }}>No I am not color blind</p>
  </button>
</div>
      </div>
    </div>
  );
}
function App() {
  const [showModal, setShowModal] = useState(true);
  const [colorBlindMode, setColorBlindMode] = useState('');

  // Define default styles
  const defaultStyle = {
    background: '#FFFFFF',
    text: '#000000',
    buttonBackground: '#007BFF',
    buttonText: '#FFFFFF',
    borderColor: '#DDDDDD'
  };

  // Define styles for monochromatism
  const monochromatismStyle = {
    
    background: '#FFFFFF',
    text: '#000000',
    buttonBackground: '#555555',
    buttonText: '#FFFFFF',
    borderColor: '#000000',
  };

  // Define styles for anomalous trichromatism
  const anomalousTrichromatismStyle = {
    background: '#545a5c', 
    text: '#ffffff',
    primaryButton: '#8e44ad', 
    secondaryButton: '#3498db', 
    borderColor: '#cccccc'
  };

  const Dichromatism = {
    background: '#ffffff', 
    text: '#000000',
    primaryButton: '#8e44ad', 
    secondaryButton: '#3498db', 
    borderColor: '#cccccc'
  };
  

  const [style, setStyle] = useState(defaultStyle);
  const handleColorBlindnessResponse = (response) => {
    setColorBlindMode(response);
    setShowModal(false);

    // Adjust styles and add grayscale class based on the response
    if (response === 'Monochromatism') {
      document.documentElement.classList.add('grayscale-mode');
      setStyle(monochromatismStyle);
    } else if (response === 'Anomalous Trichromatism') {
      //Trichromatism-mode
      document.documentElement.classList.add('Trichromatism-mode');
      setStyle(anomalousTrichromatismStyle);
    } 
    else if (response === 'Dichromatism') {
      //Trichromatism-mode
      document.documentElement.classList.add('filter-dichromatism');
      setStyle(Dichromatism);}
    else {
      setStyle(defaultStyle);
    }
  };

  // Define combinedClassName based on colorBlindMode
  const combinedClassName = colorBlindMode === 'Trichromatism-mode' 
  ? 'grayscale-images' 
  : (colorBlindMode === 'Dichromatism' ? 'dichromatism-images' : '');


  return (
    <div className={combinedClassName} style={{ backgroundColor: style.background, color: style.text,  }}>
    <Router>

  {showModal && (
    <ColorBlindnessModal
      onColorBlindnessResponse={handleColorBlindnessResponse}
    />
  )}
      
      <div className="header-container">
        <img src={HeaderImage} alt="Garden" className="header-image"/>
        <div className="image-overlay"></div> {/* Overlay */}
        <div className="header-title">NATURE NEST</div>
      </div>

      <nav className="nav-bar">
        <Link to="/">Home</Link>
        {/* Existing Dropdown for Register/Sign Up */}
        <div className="dropdown">
        <Link to="/">Sign Up</Link>
          <div className="dropdown-content">
            <Link to="/register">Plant Register</Link>
            <Link to="/signUP">Member Sign up</Link>
          </div>
        </div>
        

        {/* Dropdown for Community */}
        <div className="dropdown">
        <Link to="/">Community</Link>
          <div className="dropdown-content">
            <Link to="/comments">Comments</Link>
            <Link to="/forum">Discussion Forum</Link>
            <Link to="/helps">Helps</Link>
            <Link to="/blogs">Blogs</Link>
            <Link to="/members">Admin</Link>
          </div>
        </div>
       
      </nav>



      <main>
        <Routes>
          <Route path="/" element={ <CarouselComponent />} />
          <Route path="/harvest" element={<HarvestPage />} />
          <Route path="/members" element={<MembersPage />} />
          <Route path="/plots" element={<PlotPage />} />
          <Route path="/register" element={<PlantFormPage />} /> 
          <Route path="/signUP" element={<MemberFormPage />} /> 
        </Routes>
        
      </main>
      <div className='space'></div>
      <Footer />
    </Router>
    </div>
  );
}

export default App;
