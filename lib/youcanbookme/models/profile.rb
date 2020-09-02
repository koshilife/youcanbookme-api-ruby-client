# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Profile model.
  class Profile
    include ModelUtils

    ASSOCIATION = {
      actions: Action,
      afterwards: ProfileAfterwards,
      appointmentTypes: ProfileAppointmentTypes,
      availableAccounts: ProfileLocalAccount,
      calendars: ProfileCalendars,
      cancelOrReschedule: ProfileCancelOrReschedule,
      databaseVersion: Profile,
      display: ProfileDisplay,
      payments: ProfilePayments,
      questions: Question,
      remoteReminders: ProfileRemoteReminder,
      services: ProfileAppointmentTypes,
      teamMembers: ProfileTeamMembers,
      tentative: ProfileTentative,
      times: ProfileTimes,
      vouchers: ProfileVouchers
    }.freeze

    # @return [String]
    attr_accessor :accessCode
    # @return [Boolean]
    attr_accessor :accountCanAccessRestrictedFeatures
    # @return [String]
    attr_accessor :accountEmail
    # @return [String]
    attr_accessor :accountId
    # @return [String]
    attr_accessor :accountLocale
    # @return [String]
    attr_accessor :accountMobile
    # @return [String]
    attr_accessor :accountTimeZone
    # @return [Array<YouCanBookMe::Action>]
    attr_accessor :actions
    # @return [YouCanBookMe::ProfileAfterwards]
    attr_accessor :afterwards
    # @return [YouCanBookMe::ProfileAppointmentTypes]
    attr_accessor :appointmentTypes
    # @return [Array<YouCanBookMe::ProfileLocalAccount>]
    attr_accessor :availableAccounts
    # @return [Array<YouCanBookMe::ProfileCalendars>]
    attr_accessor :calendars
    # @return [YouCanBookMe::ProfileCancelOrReschedule]
    attr_accessor :cancelOrReschedule
    # @return [Boolean]
    attr_accessor :captchaActive
    # @return [String]
    attr_accessor :createdAt
    # @return [YouCanBookMe::Profile]
    attr_accessor :databaseVersion
    # @return [String]
    attr_accessor :datesPattern
    # @return [String]
    attr_accessor :description
    # @return [YouCanBookMe::ProfileDisplay]
    attr_accessor :display
    # @return [Boolean]
    attr_accessor :htmlAllowed
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :locale
    # @return [String]
    attr_accessor :logo
    # @return [String]
    attr_accessor :parentId
    # @return [String]
    attr_accessor :password
    # @return [YouCanBookMe::ProfilePayments]
    attr_accessor :payments
    # @return [Boolean]
    attr_accessor :protectedByAccessCode
    # @return [Array<YouCanBookMe::Question>]
    attr_accessor :questions
    # @return [String]
    attr_accessor :realtimeTopic
    # @return [Array<YouCanBookMe::ProfileRemoteReminder>]
    attr_accessor :remoteReminders
    # @return [String]
    attr_accessor :requestedAction
    # @return [YouCanBookMe::ProfileAppointmentTypes]
    attr_accessor :services
    # @return [String]
    attr_accessor :status
    # @return [String]
    attr_accessor :subdomain
    # @return [YouCanBookMe::ProfileTeamMembers]
    attr_accessor :teamMembers
    # @return [YouCanBookMe::ProfileTentative]
    attr_accessor :tentative
    # @return [String]
    attr_accessor :timeZone
    # @return [Boolean]
    attr_accessor :timeZoneOverride
    # @return [YouCanBookMe::ProfileTimes]
    attr_accessor :times
    # @return [String]
    attr_accessor :timesPattern
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :updatedAt
    # @return [YouCanBookMe::ProfileVouchers]
    attr_accessor :vouchers
  end
end
