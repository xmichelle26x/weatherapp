const express = require('express');
const { json } = require('express');
const { get } = require('axios');
const cors = require('cors');

const app = express();
const port = 3001;

app.use(express.json());
app.use(cors());

app.get('/weather', async (req, res) => {
  const { city } = req.query;
  const apiKey = 'adf950d8313edec8e909fb8eb2680c1c';

  try {
    const response = await get(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}`);
    
    if (response.data && response.data.main && response.data.weather) {
      const weatherData = {
        temperature: response.data.main.temp - 273.15,
        weatherCondition: response.data.weather[0].main,
        cityName: response.data.name,
      };
      res.json(weatherData);
    } else {
      res.status(500).json({ error: 'Invalid data received from OpenWeatherMap API' });
    }
  } catch (error) {
    console.error('Error fetching weather data:', error);
    res.status(500).json({ error: 'Error fetching weather data', details: error.message });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
