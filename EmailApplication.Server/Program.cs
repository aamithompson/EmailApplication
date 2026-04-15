using EmailApplication.Server.Data;
using EmailApplication.Server.Repositories;
using EmailApplication.Server.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();

// Database
builder.Services.AddScoped<DatabaseConnection>();
Console.WriteLine(builder.Configuration.GetConnectionString("DefaultConnection"));

// Repositories
builder.Services.AddScoped<IAccountRepository, AccountRepository>();
builder.Services.AddScoped<IEmailRepository, EmailRepository>();
builder.Services.AddScoped<IEmailRoReceiverRepository, EmailToReceiverRepository>();
builder.Services.AddScoped<IInboxEmailRepository, InboxEmailRepository>();

// Services
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<IEmailService, EmailService>();

// Swagger
builder.Services.AddSwaggerGen(options => {
    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "Enter: Bearer {your token}"
    });

    options.AddSecurityRequirement(document =>
        new OpenApiSecurityRequirement
        {
            [new OpenApiSecuritySchemeReference("Bearer", document)] = []
        }
    );
});

//HttpLogging
builder.Services.AddHttpLogging(options => { });

// Register JWT authentication
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options => {
    options.TokenValidationParameters = new TokenValidationParameters {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    };

    options.Events = new JwtBearerEvents {
        OnAuthenticationFailed = context => {
            System.Diagnostics.Debug.WriteLine("AUTH FAILED:");
            System.Diagnostics.Debug.WriteLine(context.Exception.GetType().Name);
            System.Diagnostics.Debug.WriteLine(context.Exception.Message);
            return Task.CompletedTask;
        },
        OnTokenValidated = context => {
            System.Diagnostics.Debug.WriteLine("TOKEN VALIDATED");
            return Task.CompletedTask;
        }
    };
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpLogging();

//app.UseHttpsRedirection();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

int retries = 10;
while (retries > 0) {
    try {
        using var conn = app.Services.CreateScope()
            .ServiceProvider
            .GetRequiredService<DatabaseConnection>()
            .GetConnection();
        conn.Open();
        Console.WriteLine("Database connection successful.");
        break;
    } catch (Exception ex) {
        retries--;
        Console.WriteLine($"Database not ready, retrying... ({retries} attempts left)");
        Thread.Sleep(3000);
    }
}

app.Run();