{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ReportReason where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the reason why a chat is reported
data ReportReason
  = -- | The chat contains spam messages
    ReportReasonSpam
  | -- | The chat promotes violence
    ReportReasonViolence
  | -- | The chat contains pornographic messages
    ReportReasonPornography
  | -- | The chat has child abuse related content
    ReportReasonChildAbuse
  | -- | The chat contains copyrighted content
    ReportReasonCopyright
  | -- | The location-based chat is unrelated to its stated location
    ReportReasonUnrelatedLocation
  | -- | The chat represents a fake account
    ReportReasonFake
  | -- | The chat has illegal drugs related content
    ReportReasonIllegalDrugs
  | -- | The chat contains messages with personal details
    ReportReasonPersonalDetails
  | -- | A custom reason provided by the user
    ReportReasonCustom
  deriving (Eq)

instance Show ReportReason where
  show ReportReasonSpam =
    "ReportReasonSpam"
      ++ U.cc
        []
  show ReportReasonViolence =
    "ReportReasonViolence"
      ++ U.cc
        []
  show ReportReasonPornography =
    "ReportReasonPornography"
      ++ U.cc
        []
  show ReportReasonChildAbuse =
    "ReportReasonChildAbuse"
      ++ U.cc
        []
  show ReportReasonCopyright =
    "ReportReasonCopyright"
      ++ U.cc
        []
  show ReportReasonUnrelatedLocation =
    "ReportReasonUnrelatedLocation"
      ++ U.cc
        []
  show ReportReasonFake =
    "ReportReasonFake"
      ++ U.cc
        []
  show ReportReasonIllegalDrugs =
    "ReportReasonIllegalDrugs"
      ++ U.cc
        []
  show ReportReasonPersonalDetails =
    "ReportReasonPersonalDetails"
      ++ U.cc
        []
  show ReportReasonCustom =
    "ReportReasonCustom"
      ++ U.cc
        []

instance T.FromJSON ReportReason where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "reportReasonSpam" -> parseReportReasonSpam v
      "reportReasonViolence" -> parseReportReasonViolence v
      "reportReasonPornography" -> parseReportReasonPornography v
      "reportReasonChildAbuse" -> parseReportReasonChildAbuse v
      "reportReasonCopyright" -> parseReportReasonCopyright v
      "reportReasonUnrelatedLocation" -> parseReportReasonUnrelatedLocation v
      "reportReasonFake" -> parseReportReasonFake v
      "reportReasonIllegalDrugs" -> parseReportReasonIllegalDrugs v
      "reportReasonPersonalDetails" -> parseReportReasonPersonalDetails v
      "reportReasonCustom" -> parseReportReasonCustom v
      _ -> mempty
    where
      parseReportReasonSpam :: A.Value -> T.Parser ReportReason
      parseReportReasonSpam = A.withObject "ReportReasonSpam" $ \_ -> return ReportReasonSpam

      parseReportReasonViolence :: A.Value -> T.Parser ReportReason
      parseReportReasonViolence = A.withObject "ReportReasonViolence" $ \_ -> return ReportReasonViolence

      parseReportReasonPornography :: A.Value -> T.Parser ReportReason
      parseReportReasonPornography = A.withObject "ReportReasonPornography" $ \_ -> return ReportReasonPornography

      parseReportReasonChildAbuse :: A.Value -> T.Parser ReportReason
      parseReportReasonChildAbuse = A.withObject "ReportReasonChildAbuse" $ \_ -> return ReportReasonChildAbuse

      parseReportReasonCopyright :: A.Value -> T.Parser ReportReason
      parseReportReasonCopyright = A.withObject "ReportReasonCopyright" $ \_ -> return ReportReasonCopyright

      parseReportReasonUnrelatedLocation :: A.Value -> T.Parser ReportReason
      parseReportReasonUnrelatedLocation = A.withObject "ReportReasonUnrelatedLocation" $ \_ -> return ReportReasonUnrelatedLocation

      parseReportReasonFake :: A.Value -> T.Parser ReportReason
      parseReportReasonFake = A.withObject "ReportReasonFake" $ \_ -> return ReportReasonFake

      parseReportReasonIllegalDrugs :: A.Value -> T.Parser ReportReason
      parseReportReasonIllegalDrugs = A.withObject "ReportReasonIllegalDrugs" $ \_ -> return ReportReasonIllegalDrugs

      parseReportReasonPersonalDetails :: A.Value -> T.Parser ReportReason
      parseReportReasonPersonalDetails = A.withObject "ReportReasonPersonalDetails" $ \_ -> return ReportReasonPersonalDetails

      parseReportReasonCustom :: A.Value -> T.Parser ReportReason
      parseReportReasonCustom = A.withObject "ReportReasonCustom" $ \_ -> return ReportReasonCustom
  parseJSON _ = mempty

instance T.ToJSON ReportReason where
  toJSON ReportReasonSpam =
    A.object
      [ "@type" A..= T.String "reportReasonSpam"
      ]
  toJSON ReportReasonViolence =
    A.object
      [ "@type" A..= T.String "reportReasonViolence"
      ]
  toJSON ReportReasonPornography =
    A.object
      [ "@type" A..= T.String "reportReasonPornography"
      ]
  toJSON ReportReasonChildAbuse =
    A.object
      [ "@type" A..= T.String "reportReasonChildAbuse"
      ]
  toJSON ReportReasonCopyright =
    A.object
      [ "@type" A..= T.String "reportReasonCopyright"
      ]
  toJSON ReportReasonUnrelatedLocation =
    A.object
      [ "@type" A..= T.String "reportReasonUnrelatedLocation"
      ]
  toJSON ReportReasonFake =
    A.object
      [ "@type" A..= T.String "reportReasonFake"
      ]
  toJSON ReportReasonIllegalDrugs =
    A.object
      [ "@type" A..= T.String "reportReasonIllegalDrugs"
      ]
  toJSON ReportReasonPersonalDetails =
    A.object
      [ "@type" A..= T.String "reportReasonPersonalDetails"
      ]
  toJSON ReportReasonCustom =
    A.object
      [ "@type" A..= T.String "reportReasonCustom"
      ]
