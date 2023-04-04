using Infracstructures;
using WebAPI;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.


builder.Services.AddWebAPIService(builder.Configuration);
builder.Services.AddInfractstructure(builder.Configuration);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
}

app.UseSwagger();
app.UseSwaggerUI();
app.UseHttpsRedirection();

app.UseCors("_myAllowSpecificOrigins");
app.UseAuthorization();

app.MapControllers();

app.Run();
