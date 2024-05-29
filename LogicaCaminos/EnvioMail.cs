using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Configuration;

namespace LogicaSiscon
{
    class EnvioMail
    {
        public enum PRIORITY
        {
            Baja = 0,
            Normal = 1,
            Alta = 2
        }
        public static void SendMail(string subject, string content, PRIORITY priority,
                                string to, string copy = "", string bcc = "", string attach = "")
        {
            try
            {
                MailAddressCollection mails = null;
                MailMessage message = new MailMessage();//from, to
                message.From = new MailAddress(ConfigurationManager.AppSettings["De_Mail"]);
                mails = GetValidMails(to);
                foreach (MailAddress address in mails)
                {
                    message.To.Add(address);
                }

                copy = copy.Trim();
                if (!string.IsNullOrEmpty(copy))
                {
                    mails = GetValidMails(copy);
                    foreach (MailAddress address in mails)
                    {
                        message.CC.Add(address);
                    }
                }

                bcc = bcc.Trim();
                if (!string.IsNullOrEmpty(bcc))
                {
                    mails = GetValidMails(bcc);
                    foreach (MailAddress address in mails)
                    {
                        message.Bcc.Add(address);
                    }
                }
                message.Subject = subject;
                message.Body = content;
                message.IsBodyHtml = false;
                if (priority == PRIORITY.Alta)
                    message.Priority = MailPriority.High;
                else if (priority == PRIORITY.Baja)
                    message.Priority = MailPriority.Low;
                else message.Priority = MailPriority.Normal;

                if (attach.Trim().Length > 0 && System.IO.File.Exists(attach))
                    message.Attachments.Add(new Attachment(attach));

                SmtpClient smtp = new SmtpClient();
                NetworkCredential credential = new NetworkCredential(ConfigurationManager.AppSettings["UsuarioMail"], ConfigurationManager.AppSettings["PasswordMail"]);
                smtp.Credentials = credential;
                smtp.Host = ConfigurationManager.AppSettings["ServerMail"];
                smtp.Port = Convert.ToInt32(ConfigurationManager.AppSettings["PuertoMail"]);
                smtp.EnableSsl = true;
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                //throw ex;
            }
        }

        private static string ValidMails(string emails)
        {
            string[] vectormails = emails.Split(';');
            string validmails = string.Empty;
            foreach (string email in vectormails)
            {
                if (IsValidMail(email))
                    validmails += email + ";";
            }
            if (validmails.Length > 0)
                validmails = validmails.Substring(0, validmails.Length - 1);
            return validmails;
        }

        private static bool IsValidMail(string email)
        {
            string expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
                return (Regex.Replace(email, expresion, String.Empty).Length == 0);
            return false;
            //return Regex.IsMatch(mail, @"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))" + @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$");
        }

        private static MailAddressCollection GetValidMails(string mails)
        {
            MailAddressCollection mailscollection = new MailAddressCollection();
            string[] vector = mails.Split(';');
            foreach (string mail in vector)
            {
                if (IsValidMail(mail))
                    mailscollection.Add(new MailAddress(mail));
            }
            return mailscollection;
        }
    }
}
