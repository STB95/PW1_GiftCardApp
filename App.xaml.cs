using BL.Interfaces;
using BL.Services;
using DL.DatabaseConfiguration;
using DL.Repositories;
using GiftcardApp.Domain;
using System.Windows;
using Presentation_WPF;

namespace GiftcardApp
{
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e) { 
            base.OnStartup(e);

            // 1. Connection string
            string connectionString = DatabaseConfig.connectionString;

            // 2. Repositories aanmaken
            var customerRepo = new CustomerRepository(connectionString);
            var giftCardRepo = new GiftCardRepository(connectionString);
            var consumptionRepo = new ConsumptionRepository(connectionString);
            var paymentRepo = new PaymentRepository(connectionString);
            var themeRepo = new ThemeRepository(connectionString);

            // 3. DomainManager bundelt alles
            var domainManager = new DomainManager(
                customerRepo,
                giftCardRepo,
                consumptionRepo,
                paymentRepo,
                themeRepo
            );

            // 4. UI - hoofdvenster
            var mainWindow = new MainWindow(domainManager);

            // 5. Start het hoofdvenster
            mainWindow.Show();
        }
    }
}
