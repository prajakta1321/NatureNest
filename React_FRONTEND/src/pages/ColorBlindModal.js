import React from 'react';

const ColorBlindModal = ({ isOpen, onClose, onChoose }) => {
  if (!isOpen) return null;

  return (
    <div className="modal">
      <div className="modal-content">
        <h2>Choose Your Preference</h2>
        <p>Select the UI that best suits your needs:</p>
        <button onClick={() => onChoose('colorBlind')}>Color Blind Friendly UI</button>
        <button onClick={() => onChoose('normal')}>Normal UI</button>
        <button onClick={onClose}>Close</button>
      </div>
    </div>
  );
};

export default ColorBlindModal;
