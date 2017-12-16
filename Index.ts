import * as Hapi from 'hapi';
const app = new Hapi.Server();
app.connection({ port: 3000 });
app.route({
  path: '/',
  method: 'GET',
  handler: (req, reply) => {
    reply('OK');
  },
});

app.start(() => console.log('server running at 3000'));
