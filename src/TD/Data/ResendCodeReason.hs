module TD.Data.ResendCodeReason
  (ResendCodeReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes the reason why a code needs to be re-sent
data ResendCodeReason
  = ResendCodeReasonUserRequest -- ^ The user requested to resend the code
  | ResendCodeReasonVerificationFailed -- ^ The code is re-sent, because device verification has failed
    { error_message :: Maybe T.Text -- ^ Cause of the verification failure, for example, PLAY_SERVICES_NOT_AVAILABLE, APNS_RECEIVE_TIMEOUT, or APNS_INIT_FAILED
    }
  deriving (Eq, Show)

instance I.ShortShow ResendCodeReason where
  shortShow ResendCodeReasonUserRequest
      = "ResendCodeReasonUserRequest"
  shortShow ResendCodeReasonVerificationFailed
    { error_message = error_message_
    }
      = "ResendCodeReasonVerificationFailed"
        ++ I.cc
        [ "error_message" `I.p` error_message_
        ]

instance AT.FromJSON ResendCodeReason where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "resendCodeReasonUserRequest"        -> pure ResendCodeReasonUserRequest
      "resendCodeReasonVerificationFailed" -> parseResendCodeReasonVerificationFailed v
      _                                    -> mempty
    
    where
      parseResendCodeReasonVerificationFailed :: A.Value -> AT.Parser ResendCodeReason
      parseResendCodeReasonVerificationFailed = A.withObject "ResendCodeReasonVerificationFailed" $ \o -> do
        error_message_ <- o A..:?  "error_message"
        pure $ ResendCodeReasonVerificationFailed
          { error_message = error_message_
          }
  parseJSON _ = mempty

instance AT.ToJSON ResendCodeReason where
  toJSON ResendCodeReasonUserRequest
      = A.object
        [ "@type" A..= AT.String "resendCodeReasonUserRequest"
        ]
  toJSON ResendCodeReasonVerificationFailed
    { error_message = error_message_
    }
      = A.object
        [ "@type"         A..= AT.String "resendCodeReasonVerificationFailed"
        , "error_message" A..= error_message_
        ]

