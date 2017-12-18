// // <copyright file="AccountControllerTest.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2017-12-18 10:36</date>

using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using ReAl.Lumino.Encuestas.Controllers;
using ReAl.Lumino.Encuestas.Models;
using Xunit;

namespace ReAl.Lumino.Encuestas.Test
{
    public class PrimeWebDefaultRequestShould
    {
        private readonly TestServer _server;
        private readonly HttpClient _client;
        private db_encuestasContext _context;
        public PrimeWebDefaultRequestShould()
        {
            // Arrange
            _server = new TestServer(new WebHostBuilder()
                .UseStartup<Startup>());
            _client = _server.CreateClient();
            
            var optionsBuilder = new DbContextOptionsBuilder<db_encuestasContext>(); 
            optionsBuilder.UseInMemoryDatabase(); 
            _context = new db_encuestasContext(optionsBuilder.Options);
        }

        [Fact]
        public async Task ReturnHelloWorld()
        {
            // Act
            //var response = await _client.GetAsync("/");
            var response = await _server.CreateRequest("/")
                .SendAsync("GET");
            
            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            // Assert
            Assert.Equal("Hello World!",
                responseString);
        }
        
        [Fact]
        public void Login()
        {
            AccountController sut = new AccountController(_context);
 
            IActionResult result = sut.Login();
 
            Assert.IsType<ViewResult>(result);
        }
    }
}