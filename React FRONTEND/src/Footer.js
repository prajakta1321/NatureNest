import React from 'react';
import './css/Footer.css';

function Footer() {
  return (
    <footer className="footer">
      <div className="footer-column">
        <div className="footer-title">ABOUT US</div>
        <a href="#" className="footer-link">Our Story</a>
        <a href="#" className="footer-link">Careers</a>
        <a href="#" className="footer-link">Contact Us</a>
        <a href="#" className="footer-link">Locate Stores</a>
        <a href="#" className="footer-link">Own Grown</a>
        <a href="#" className="footer-link">Garden Services & Maintenance</a>
      </div>

      <div className="footer-column">
        <div className="footer-title">CUSTOMER CARE</div>
        <a href="#" className="footer-link">Terms and Conditions</a>
        <a href="#" className="footer-link">Privacy Policy</a>
        <a href="#" className="footer-link">FAQs</a>
        <a href="#" className="footer-link">Terms of Service</a>
      </div>

      <div className="footer-column">
        <div className="footer-title">GET IN TOUCH</div>
        <div>Call: +91 1234567890</div>
        <div>Email: email@example.com</div>
      </div>
    </footer>
  );
}

export default Footer;
