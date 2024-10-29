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

// เปลี่ยนการฟังพอร์ตเป็น 0.0.0.0 เพื่อให้เข้าถึงได้จาก IP อื่น ๆ
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server is running on http://192.168.1.100:${PORT}`);
});
