import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import HarvestPage from './pages/HarvestPage';
import MembersPage from './pages/MembersPage';
import PlotPage from './pages/plotTable';

function App() {
  return (
    <Router>
      <nav>
        <Link to="/">Home</Link>
        <Link to="/harvest">Harvest</Link>
        <Link to="/members">Second Table</Link>
        <Link to="/plots">Third Table</Link>
      </nav>

      <Routes>
        <Route path="/harvest" element={<HarvestPage />} />
        <Route path="/members" element={<MembersPage />} />
        <Route path="/plots" element={<PlotPage />} />


        <Route path="/" element={<div>Welcome to the homepage!</div>} />
      </Routes>
    </Router>
  );
}

export default App;
