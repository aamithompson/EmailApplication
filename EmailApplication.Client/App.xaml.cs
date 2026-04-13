using EmailApplication.Client;
using EmailApplication.Client.ViewModel;
using EmailApplication.Client.APIServices;
using Microsoft.Extensions.DependencyInjection;
using System.Net.Http;
using System.Windows;

namespace EmailApplication {
    public partial class App : Application {
        private ServiceProvider _serviceProvider;

        protected override void OnStartup(StartupEventArgs e) {
            base.OnStartup(e);

            var services = new ServiceCollection();
            ConfigureServices(services);
            _serviceProvider = services.BuildServiceProvider();

            var mainWindow = _serviceProvider.GetRequiredService<MainWindow>();
            mainWindow.Show();
        }

        private void ConfigureServices(IServiceCollection services) {
            // HttpClient — single instance for the whole app
            services.AddSingleton<HttpClient>(new HttpClient {
                //BaseAddress = new Uri("http://localhost:5139/api/")
                BaseAddress = new Uri("https://localhost:7160/api/")
            });

            // Client side services
            services.AddSingleton<Session>();

            // API client services
            services.AddTransient<IAccountAPIService, AccountAPIService>();
            services.AddTransient<IEmailAPIService, EmailAPIService>();

            // ViewModels
            services.AddTransient<AccountCreationViewModel>();
            services.AddTransient<AccountNameViewModel>();
            services.AddTransient<AccountProfileViewModel>();
            services.AddTransient<AccountSecurityViewModel>();
            services.AddTransient<CreateMailViewModel>();
            services.AddTransient<EmailViewModel>();
            services.AddTransient<FileViewModel>();
            services.AddTransient<InboxEmailViewModel>();
            services.AddTransient<InboxViewModel>();

            // Windows
            services.AddTransient<MainWindow>();
            services.AddTransient<AccountCreationUserControl>();
            services.AddTransient<AccountLoginUserControl>();
            services.AddTransient<CreateMailControl>();
            services.AddTransient<InboxControl>();
            services.AddTransient<ViewMailControl>();
        }

        protected override void OnExit(ExitEventArgs e) {
            _serviceProvider.Dispose();
            base.OnExit(e);
        }
    }
}
