module TD.Data.EmailAddressAuthenticationCodeInfo
  (EmailAddressAuthenticationCodeInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data EmailAddressAuthenticationCodeInfo
  = EmailAddressAuthenticationCodeInfo -- ^ Information about the email address authentication code that was sent
    { email_address_pattern :: Maybe T.Text -- ^ Pattern of the email address to which an authentication code was sent
    , _length               :: Maybe Int    -- ^ Length of the code; 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow EmailAddressAuthenticationCodeInfo where
  shortShow EmailAddressAuthenticationCodeInfo
    { email_address_pattern = email_address_pattern_
    , _length               = _length_
    }
      = "EmailAddressAuthenticationCodeInfo"
        ++ I.cc
        [ "email_address_pattern" `I.p` email_address_pattern_
        , "_length"               `I.p` _length_
        ]

instance AT.FromJSON EmailAddressAuthenticationCodeInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emailAddressAuthenticationCodeInfo" -> parseEmailAddressAuthenticationCodeInfo v
      _                                    -> mempty
    
    where
      parseEmailAddressAuthenticationCodeInfo :: A.Value -> AT.Parser EmailAddressAuthenticationCodeInfo
      parseEmailAddressAuthenticationCodeInfo = A.withObject "EmailAddressAuthenticationCodeInfo" $ \o -> do
        email_address_pattern_ <- o A..:?  "email_address_pattern"
        _length_               <- o A..:?  "length"
        pure $ EmailAddressAuthenticationCodeInfo
          { email_address_pattern = email_address_pattern_
          , _length               = _length_
          }
  parseJSON _ = mempty

