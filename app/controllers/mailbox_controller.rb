class MailboxController < ApplicationController
before_action :authenticate_user!

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
    @unread_count=mailbox.inbox(:read => false).count(:id).to_s
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
  end
end
