+++
title = 'Temp'
date = 2024-11-11T15:23:41-05:00
+++

```java
const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 3000;

// Enable CORS for cross-origin requests
app.use(cors());

// Middleware to parse JSON requests
app.use(express.json());

// Mock data
const mockData = {
  page: "1",
  total: "18",
  records: "342",
  summaries: [
    {
      ptsTransferRqstID: "506327",
      id: "1",
      fromIssuer: {
        issuerId: "3663",
        issuerName: "M&T BANK",
      },
      toIssuer: {
        issuerId: "1555",
        issuerName: "GUILD MORTGAGE COMPANY",
      },
      gmpUserId: "I_twu23663",
      ptsTransferRqstTyp: "Standard-Partial",
      ptsTrnsfrRqstDt: "12/01/2024",
      ptsSaleDt: "11/21/2024",
      ptsTransferRqstStatus: "Validation with Errors",
      ptsTransferRqstCode: "PVF",
      ptsBuyerSellerFlag: "S",
      rowCount: 342,
      rowNum: 1,
      assAgreementDocId: null,
      appLetterDocId: null,
      hecmIssrFlag: "N",
    },
  ],
};

// Define API endpoint
app.get("/pts/services/v1/transfers", (req, res) => {
  // Extract query parameters (optional)
  const {
    issuerId,
    page = "1",
    sellingIssuer,
    buyingIssuer,
    transferType,
    transferDate,
    transferStatus,
    transferNumber,
  } = req.query;

  console.log("Query Parameters:", req.query);

  // Return the mock data
  res.json(mockData);
});

// Start the server
app.listen(PORT, () => {
  console.log(`Mock server is running at http://localhost:${PORT}`);
});

```