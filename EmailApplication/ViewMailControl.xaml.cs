using EmailApplication.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EmailApplication {
    /// <summary>
    /// Interaction logic for ViewMailControl.xaml
    /// </summary>
    public partial class ViewMailControl : UserControl {
        private MainWindow _mainWindow;
        public ViewMailControl(MainWindow mainWindow, int mailID) {
            InitializeComponent();
            _mainWindow = mainWindow;
            EmailService service = new EmailService(
                new EmailRepository(),
                new AccountRepository(),
                new EmailToReceiverRepository(),
                new InboxEmailRepository()
            );

            this.DataContext = service.GetEmailViewModel(mailID);
        }

        private void BackButton_Click(object sender, RoutedEventArgs e) {
            _mainWindow.ShowInbox();
        }
    }
}
