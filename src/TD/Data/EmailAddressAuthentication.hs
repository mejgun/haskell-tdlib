module TD.Data.EmailAddressAuthentication
  (EmailAddressAuthentication(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains authentication data for an email address
data EmailAddressAuthentication
  = EmailAddressAuthenticationCode -- ^ An authentication code delivered to a user's email address
    { code :: Maybe T.Text -- ^ The code
    }
  | EmailAddressAuthenticationAppleId -- ^ An authentication token received through Apple ID
    { token :: Maybe T.Text -- ^ The token
    }
  | EmailAddressAuthenticationGoogleId -- ^ An authentication token received through Google ID
    { token :: Maybe T.Text -- ^ The token
    }
  deriving (Eq, Show)

instance I.ShortShow EmailAddressAuthentication where
  shortShow EmailAddressAuthenticationCode
    { code = code_
    }
      = "EmailAddressAuthenticationCode"
        ++ I.cc
        [ "code" `I.p` code_
        ]
  shortShow EmailAddressAuthenticationAppleId
    { token = token_
    }
      = "EmailAddressAuthenticationAppleId"
        ++ I.cc
        [ "token" `I.p` token_
        ]
  shortShow EmailAddressAuthenticationGoogleId
    { token = token_
    }
      = "EmailAddressAuthenticationGoogleId"
        ++ I.cc
        [ "token" `I.p` token_
        ]

instance AT.FromJSON EmailAddressAuthentication where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emailAddressAuthenticationCode"     -> parseEmailAddressAuthenticationCode v
      "emailAddressAuthenticationAppleId"  -> parseEmailAddressAuthenticationAppleId v
      "emailAddressAuthenticationGoogleId" -> parseEmailAddressAuthenticationGoogleId v
      _                                    -> mempty
    
    where
      parseEmailAddressAuthenticationCode :: A.Value -> AT.Parser EmailAddressAuthentication
      parseEmailAddressAuthenticationCode = A.withObject "EmailAddressAuthenticationCode" $ \o -> do
        code_ <- o A..:?  "code"
        pure $ EmailAddressAuthenticationCode
          { code = code_
          }
      parseEmailAddressAuthenticationAppleId :: A.Value -> AT.Parser EmailAddressAuthentication
      parseEmailAddressAuthenticationAppleId = A.withObject "EmailAddressAuthenticationAppleId" $ \o -> do
        token_ <- o A..:?  "token"
        pure $ EmailAddressAuthenticationAppleId
          { token = token_
          }
      parseEmailAddressAuthenticationGoogleId :: A.Value -> AT.Parser EmailAddressAuthentication
      parseEmailAddressAuthenticationGoogleId = A.withObject "EmailAddressAuthenticationGoogleId" $ \o -> do
        token_ <- o A..:?  "token"
        pure $ EmailAddressAuthenticationGoogleId
          { token = token_
          }
  parseJSON _ = mempty

instance AT.ToJSON EmailAddressAuthentication where
  toJSON EmailAddressAuthenticationCode
    { code = code_
    }
      = A.object
        [ "@type" A..= AT.String "emailAddressAuthenticationCode"
        , "code"  A..= code_
        ]
  toJSON EmailAddressAuthenticationAppleId
    { token = token_
    }
      = A.object
        [ "@type" A..= AT.String "emailAddressAuthenticationAppleId"
        , "token" A..= token_
        ]
  toJSON EmailAddressAuthenticationGoogleId
    { token = token_
    }
      = A.object
        [ "@type" A..= AT.String "emailAddressAuthenticationGoogleId"
        , "token" A..= token_
        ]

