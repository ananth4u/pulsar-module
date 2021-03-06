var express = require('express');
const Pulsar = require('pulsar-client')
var router = express.Router();
(async () => {
  // Create a client
  const client = new Pulsar.Client({
    serviceUrl: 'pulsar://34.93.225.83:6650',
  });

  // Create a producer
  const producer = await client.createProducer({
    topic: 'my-topic',
  });

  // Send messages
  for (let i = 0; i < 10; i += 1) {
    const msg = `my-message-${i}`;
    producer.send({
      data: Buffer.from(msg),
    });
    console.log(`Sent message: ${msg}`);
  }
  await producer.flush();

  await producer.close();
  await client.close();
})();

module.exports = router;
