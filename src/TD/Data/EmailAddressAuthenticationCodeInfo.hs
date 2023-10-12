module TD.Data.EmailAddressAuthenticationCodeInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data EmailAddressAuthenticationCodeInfo
  = EmailAddressAuthenticationCodeInfo -- ^ Information about the email address authentication code that was sent
    { email_address_pattern :: Maybe T.Text -- ^ Pattern of the email address to which an authentication code was sent
    , _length               :: Maybe Int    -- ^ Length of the code; 0 if unknown
    }
  deriving (Eq)

instance Show EmailAddressAuthenticationCodeInfo where
  show EmailAddressAuthenticationCodeInfo
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

instance AT.ToJSON EmailAddressAuthenticationCodeInfo where
  toJSON EmailAddressAuthenticationCodeInfo
    { email_address_pattern = email_address_pattern_
    , _length               = _length_
    }
      = A.object
        [ "@type"                 A..= AT.String "emailAddressAuthenticationCodeInfo"
        , "email_address_pattern" A..= email_address_pattern_
        , "length"                A..= _length_
        ]
