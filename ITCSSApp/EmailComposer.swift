//
//  EmailComposer.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 6/10/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import MessageUI

class EmailComposer {
    
    var emailDetails: EmailDetails
    init(emailDetails: EmailDetails)
    {
    self.emailDetails = emailDetails
    }
    func configuredMailComposeViewController(mailDelegate: MFMailComposeViewControllerDelegate) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = mailDelegate // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([emailDetails.toRecipient!])
        mailComposerVC.setSubject(emailDetails.subject!)
        mailComposerVC.setMessageBody(emailDetails.messageBody!, isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    

}