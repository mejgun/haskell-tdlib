module TD.Data.AuthenticationCodeInfo
  (AuthenticationCodeInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.AuthenticationCodeType as AuthenticationCodeType

data AuthenticationCodeInfo
  = AuthenticationCodeInfo -- ^ Information about the authentication code that was sent
    { phone_number :: Maybe T.Text                                        -- ^ A phone number that is being authenticated
    , _type        :: Maybe AuthenticationCodeType.AuthenticationCodeType -- ^ The way the code was sent to the user
    , next_type    :: Maybe AuthenticationCodeType.AuthenticationCodeType -- ^ The way the next code will be sent to the user; may be null
    , timeout      :: Maybe Int                                           -- ^ Timeout before the code can be re-sent, in seconds
    }
  deriving (Eq, Show)

instance I.ShortShow AuthenticationCodeInfo where
  shortShow AuthenticationCodeInfo
    { phone_number = phone_number_
    , _type        = _type_
    , next_type    = next_type_
    , timeout      = timeout_
    }
      = "AuthenticationCodeInfo"
        ++ I.cc
        [ "phone_number" `I.p` phone_number_
        , "_type"        `I.p` _type_
        , "next_type"    `I.p` next_type_
        , "timeout"      `I.p` timeout_
        ]

instance AT.FromJSON AuthenticationCodeInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "authenticationCodeInfo" -> parseAuthenticationCodeInfo v
      _                        -> mempty
    
    where
      parseAuthenticationCodeInfo :: A.Value -> AT.Parser AuthenticationCodeInfo
      parseAuthenticationCodeInfo = A.withObject "AuthenticationCodeInfo" $ \o -> do
        phone_number_ <- o A..:?  "phone_number"
        _type_        <- o A..:?  "type"
        next_type_    <- o A..:?  "next_type"
        timeout_      <- o A..:?  "timeout"
        pure $ AuthenticationCodeInfo
          { phone_number = phone_number_
          , _type        = _type_
          , next_type    = next_type_
          , timeout      = timeout_
          }
  parseJSON _ = mempty

