const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Level 4 EKS CI/CD pipeline is working 🚀');
});

app.listen(3000, () => {
  console.log('App running on port 3000');
});