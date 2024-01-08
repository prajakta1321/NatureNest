import React from 'react';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
import './css/CarouselComponent.css';
import image1 from './Images/2 plant (1).jpg'; 
import image2 from './Images/plant 10.jpg'; 
import image3 from './Images/plant 3.jpg';
import image4 from './Images/plant 6.jpg';
import image5 from './Images/plant 11 (1).jpg';
import image6 from './Images/plant 9.jpg';
import image7 from './Images/plant 11 (1).jpg';
import image8 from './Images/plant 12.jpg';
import image9 from './Images/plant 13.jpg';
import image10 from './Images/plant 14.jpg';
class CarouselComponent extends React.Component {
    resetSearch = () => {
        this.setState({
            searchQuery: '',
            searchResults: []
        });
    };
    constructor(props) {
        super(props);
        this.state = {
            searchQuery: '',
            searchResults: [], // State to store search results
        };
    }

    handleChange = (e) => {
        this.setState({ searchQuery: e.target.value });
    };

    handleSearch = () => {
        const { searchQuery } = this.state;

        fetch('http://127.0.0.1:8000/search_plants/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ query: searchQuery }),
        })
        .then(response => response.json())
        .then(data => {
            this.setState({ searchResults: data }); // Update the searchResults state
        })
        .catch(error => {
            console.error('Error:', error);
        });
    };

    render() {
        const { searchResults } = this.state;
        const settings = {
            dots: true,
            infinite: true,
            speed: 500,
            slidesToShow: 1,
            slidesToScroll: 1
        };

        return (
            <>
            <div className="search-container">
                <input
                    type="text"
                    className="search-input"
                    placeholder="Search For Plants!"
                    value={this.state.searchQuery}
                    onChange={this.handleChange}
                />
                <button className="search-button" onClick={this.handleSearch}>Search</button>
                <button className="reset-button" onClick={this.resetSearch}>Reset</button>
            </div>

            {searchResults.length > 0 && (
                <div className="search-results-table">
                    <table>
                        <thead>
                            <tr>
                                <th>Plant Name</th>
                                <th>Type</th>
                                <th>Season</th>
                                <th>Care Instructions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {searchResults.map(plant => (
                                <tr key={plant.plant_id}>
                                    <td>{plant.pname}</td>
                                    <td>{plant.ptype}</td>
                                    <td>{plant.season}</td>
                                    <td>{plant.care}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}

            <div>
                    <div className="carousel-container">
                        <div className="carousel-half">
                            <Slider {...settings}>
                                <div>
                                    <img src={image1} alt="Image 1" />
                                </div>
                                <div>
                                    <img src={image2} alt="Image 2" />
                                </div>
                            </Slider>
                        </div>
                        <div className="carousel-half">
                            <p>Welcome to NatureNest,
                                where green thumbs unite and nature's beauty blossoms in a thriving digital community</p>
                        </div>
                    </div>

                    {/* New section with reversed layout */}
                    <div className="carousel-container reversed">
                        <div className="carousel-half">
                            <p>NatureNest is a digital haven fostering a vibrant community of gardening enthusiasts.
                                Seamlessly integrating gardening wisdom, plant care insights,
                                and interactive tools, it's a hub for nurturing green spaces and
                                cultivating connections.
                            </p>
                        </div>
                        <div className="carousel-half">
                            <Slider {...settings}>
                                <div>
                                    <img src={image3} alt="Image 1" />
                                </div>
                                <div>
                                    <img src={image4} alt="Image 2" />
                                </div>
                            </Slider>
                        </div>
                    </div>

                    <div className="carousel-container">
                        <div className="carousel-half">
                            <Slider {...settings}>
                                <div>
                                    <img src={image5} alt="Image 1" />
                                </div>
                                <div>
                                    <img src={image6} alt="Image 2" />
                                </div>
                            </Slider>
                        </div>
                        <div className="carousel-half">
                            <p>Dive into a world where nature thrives,
                                where sharing, learning, and growing are at the heart of a sustainable,
                                collaborative gardening ecosystem</p>
                        </div>
                    </div>

                    {/* New section with reversed layout */}
                    <div className="carousel-container reversed">
                        <div className="carousel-half">
                            <p>NatureNest promotes eco-conscious practices,
                                encouraging sustainable gardening methods that contribute to preserving biodiversity,
                                reducing carbon footprints, and fostering a healthier environment</p>
                        </div>
                        <div className="carousel-half">
                            <Slider {...settings}>
                                <div>
                                    <img src={image7} alt="Image 1" />
                                </div>
                                <div>
                                    <img src={image8} alt="Image 2" />
                                </div>
                            </Slider>
                        </div>
                    </div>


                    <div className="carousel-container">
                        <div className="carousel-half">
                            <Slider {...settings}>
                                <div>
                                    <img src={image9} alt="Image 1" />
                                </div>

                            </Slider>
                        </div>
                        <div className="carousel-half">
                            <p>Through our shared knowledge and cultivation practices, NatureNest empowers individuals to create biodiverse gardens that act as sanctuaries for local flora and fauna
                                Through our shared knowledge and cultivation practices, NatureNest empowers individuals to create biodiverse gardens that act as sanctuaries for local flora and fauna.</p>
                        </div>
                    </div>

                    <div className="carousel-container reversed">
                        <div className="carousel-half">
                            <p>By advocating for organic gardening techniques and the use of eco-friendly materials, we aim to minimize environmental impact while maximizing the beauty and resilience of our green spaces.
                                Together, we're sowing the seeds for a greener, more sustainable world, one garden at a time.</p>
                        </div>
                        <div className="carousel-half">
                            <Slider {...settings}>
                                <div>
                                    <img src={image10} alt="Image 2" />
                                </div>
                            </Slider>
                        </div>
                    </div>


                </div></>
        );
    }
}


export default CarouselComponent ;

