const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000;

// เสิร์ฟไฟล์ HTML
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});