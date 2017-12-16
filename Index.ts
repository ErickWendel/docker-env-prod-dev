import * as Hapi from 'hapi';
const app = new Hapi.Server();
console.log('process.env.PORT', process.env.PORT);
app.connection({ port: process.env.PORT });
app.route({
  path: '/',
  method: 'GET',
  handler: (req, reply) => {
    reply('OK');
  },
});

app.start(() => console.log(`server running at ${process.env.PORT}`));
