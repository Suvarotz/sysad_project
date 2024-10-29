const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000;

// เสิร์ฟไฟล์ Static จากโฟลเดอร์ที่ deploy
app.use(express.static('/var/www/myapp'));

// เสิร์ฟไฟล์ HTML
app.get('/', (req, res) => {
  res.sendFile(path.join('/var/www/myapp', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
