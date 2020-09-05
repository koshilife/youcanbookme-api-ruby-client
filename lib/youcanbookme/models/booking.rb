# frozen_string_literal: true

module YouCanBookMe
  class Booking
    include ModelUtils

    ASSOCIATION = {
      actions: Action,
      answers: Answer,
      appointmentTypes: ProfileAppointmentType,
      databaseVersion: Booking,
      event: Event,
      lobby: BookingLobby,
      profile: Profile,
      services: ProfileAppointmentType,
      teamMember: ProfileTeamMember
    }.freeze

    # @return [String]
    attr_accessor :acceptedAt
    # @return [String]
    attr_accessor :accountId
    # @return [Array<YouCanBookMe::Action>]
    attr_accessor :actions
    # @return [Array<YouCanBookMe::Answer>]
    attr_accessor :answers
    # @return [Array<String>]
    attr_accessor :appointmentTypeIds
    # @return [Array<YouCanBookMe::ProfileAppointmentType>]
    attr_accessor :appointmentTypes
    # @return [Array<String>]
    attr_accessor :appointmentTypesIds
    # @return [String]
    attr_accessor :bookerSecret
    # @return [Boolean]
    attr_accessor :cancelReasonRequired
    # @return [Boolean]
    attr_accessor :cancellable
    # @return [String]
    attr_accessor :cancellationCode
    # @return [String]
    attr_accessor :cancellationReason
    # @return [Boolean]
    attr_accessor :cancelled
    # @return [String]
    attr_accessor :cancelledAt
    # @return [String]
    # ['BOOKER', 'OWNER']
    attr_accessor :cancelledBy
    # @return [String]
    attr_accessor :createdAt
    # @return [String]
    attr_accessor :currency
    # @return [Integer]
    attr_accessor :currencyFactor
    # @return [YouCanBookMe::Booking]
    attr_accessor :databaseVersion
    # @return [String]
    attr_accessor :displayBookerEndsAtMediumShort
    # @return [String]
    attr_accessor :displayBookerStartsAtMediumShort
    # @return [String]
    attr_accessor :displayCreatedAtMedium
    # @return [String]
    attr_accessor :displayCreatedAtShortShort
    # @return [String]
    attr_accessor :displayDurationFull
    # @return [String]
    attr_accessor :displayDurationShort
    # @return [String]
    attr_accessor :displayEndsAtMediumShort
    # @return [String]
    attr_accessor :displayLocale
    # @return [String]
    attr_accessor :displayPrice
    # @return [String]
    attr_accessor :displayStartsAtFullShortAndDurationFull
    # @return [String]
    attr_accessor :displayStartsAtMediumShort
    # @return [String]
    attr_accessor :displayTimeZone
    # @return [Integer]
    attr_accessor :durationMinutes
    # @return [String]
    attr_accessor :endsAt
    # @return [String]
    attr_accessor :endsAtUTC
    # @return [YouCanBookMe::Event]
    attr_accessor :event
    # @return [Integer]
    attr_accessor :expectedPrice
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :initiatedAt
    # @return [String]
    attr_accessor :ip
    # @return [String]
    attr_accessor :linkFields
    # @return [YouCanBookMe::BookingLobby]
    attr_accessor :lobby
    # @return [String]
    attr_accessor :lobbyPassword
    # @return [String]
    attr_accessor :locale
    # @return [Integer]
    attr_accessor :numberOfSlots
    # @return [String]
    attr_accessor :ownerSecret
    # @return [String]
    attr_accessor :paymentId
    # @return [Boolean]
    attr_accessor :preview
    # @return [Integer]
    attr_accessor :price
    # @return [YouCanBookMe::Profile]
    attr_accessor :profile
    # @return [String]
    attr_accessor :profileAccessCode
    # @return [String]
    attr_accessor :profileId
    # @return [String]
    attr_accessor :profilePassword
    # @return [String]
    attr_accessor :recaptchaResponse
    # @return [String]
    attr_accessor :ref
    # @return [String]
    attr_accessor :rejectedAt
    # @return [String]
    attr_accessor :remoteId
    # @return [String]
    attr_accessor :rescheduledAt
    # @return [String]
    # ['BOOKER', 'OWNER']
    attr_accessor :rescheduledBy
    # @return [String]
    attr_accessor :reviewAt
    # @return [Array<String>]
    attr_accessor :serviceIds
    # @return [Array<YouCanBookMe::ProfileAppointmentType>]
    attr_accessor :services
    # @return [String]
    attr_accessor :startRescheduledFrom
    # @return [Instant]
    attr_accessor :startRescheduledFromUTC
    # @return [String]
    attr_accessor :startsAt
    # @return [String]
    attr_accessor :startsAtUTC
    # @return [String]
    attr_accessor :stripeToken
    # @return [YouCanBookMe::ProfileTeamMember]
    attr_accessor :teamMember
    # @return [String]
    attr_accessor :teamMemberId
    # @return [String]
    # ['NOT_USED', 'UNDECIDED', 'REJECTED', 'ACCEPTED']
    attr_accessor :tentative
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :timeline
    # @return [String]
    attr_accessor :title
    # @return [Integer]
    attr_accessor :units
    # @return [String]
    attr_accessor :updatedAt
  end
end
