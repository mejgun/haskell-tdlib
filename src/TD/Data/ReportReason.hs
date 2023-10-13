module TD.Data.ReportReason (ReportReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ReportReason -- ^ Describes the reason why a chat is reported
  = ReportReasonSpam -- ^ The chat contains spam messages
  | ReportReasonViolence -- ^ The chat promotes violence
  | ReportReasonPornography -- ^ The chat contains pornographic messages
  | ReportReasonChildAbuse -- ^ The chat has child abuse related content
  | ReportReasonCopyright -- ^ The chat contains copyrighted content
  | ReportReasonUnrelatedLocation -- ^ The location-based chat is unrelated to its stated location
  | ReportReasonFake -- ^ The chat represents a fake account
  | ReportReasonIllegalDrugs -- ^ The chat has illegal drugs related content
  | ReportReasonPersonalDetails -- ^ The chat contains messages with personal details
  | ReportReasonCustom -- ^ A custom reason provided by the user
  deriving (Eq)

instance Show ReportReason where
  show ReportReasonSpam
      = "ReportReasonSpam"
  show ReportReasonViolence
      = "ReportReasonViolence"
  show ReportReasonPornography
      = "ReportReasonPornography"
  show ReportReasonChildAbuse
      = "ReportReasonChildAbuse"
  show ReportReasonCopyright
      = "ReportReasonCopyright"
  show ReportReasonUnrelatedLocation
      = "ReportReasonUnrelatedLocation"
  show ReportReasonFake
      = "ReportReasonFake"
  show ReportReasonIllegalDrugs
      = "ReportReasonIllegalDrugs"
  show ReportReasonPersonalDetails
      = "ReportReasonPersonalDetails"
  show ReportReasonCustom
      = "ReportReasonCustom"

instance AT.FromJSON ReportReason where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reportReasonSpam"              -> pure ReportReasonSpam
      "reportReasonViolence"          -> pure ReportReasonViolence
      "reportReasonPornography"       -> pure ReportReasonPornography
      "reportReasonChildAbuse"        -> pure ReportReasonChildAbuse
      "reportReasonCopyright"         -> pure ReportReasonCopyright
      "reportReasonUnrelatedLocation" -> pure ReportReasonUnrelatedLocation
      "reportReasonFake"              -> pure ReportReasonFake
      "reportReasonIllegalDrugs"      -> pure ReportReasonIllegalDrugs
      "reportReasonPersonalDetails"   -> pure ReportReasonPersonalDetails
      "reportReasonCustom"            -> pure ReportReasonCustom
      _                               -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON ReportReason where
  toJSON ReportReasonSpam
      = A.object
        [ "@type" A..= AT.String "reportReasonSpam"
        ]
  toJSON ReportReasonViolence
      = A.object
        [ "@type" A..= AT.String "reportReasonViolence"
        ]
  toJSON ReportReasonPornography
      = A.object
        [ "@type" A..= AT.String "reportReasonPornography"
        ]
  toJSON ReportReasonChildAbuse
      = A.object
        [ "@type" A..= AT.String "reportReasonChildAbuse"
        ]
  toJSON ReportReasonCopyright
      = A.object
        [ "@type" A..= AT.String "reportReasonCopyright"
        ]
  toJSON ReportReasonUnrelatedLocation
      = A.object
        [ "@type" A..= AT.String "reportReasonUnrelatedLocation"
        ]
  toJSON ReportReasonFake
      = A.object
        [ "@type" A..= AT.String "reportReasonFake"
        ]
  toJSON ReportReasonIllegalDrugs
      = A.object
        [ "@type" A..= AT.String "reportReasonIllegalDrugs"
        ]
  toJSON ReportReasonPersonalDetails
      = A.object
        [ "@type" A..= AT.String "reportReasonPersonalDetails"
        ]
  toJSON ReportReasonCustom
      = A.object
        [ "@type" A..= AT.String "reportReasonCustom"
        ]
