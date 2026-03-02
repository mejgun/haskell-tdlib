module TD.Query.AcceptOauthRequest
  (AcceptOauthRequest(..)
  , defaultAcceptOauthRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Accepts an OAuth authorization request. Returns an HTTP URL to open after successful authorization. May return an empty link if just a toast about successful login has to be shown. Returns 'TD.Data.HttpUrl.HttpUrl'
data AcceptOauthRequest
  = AcceptOauthRequest
    { url                       :: Maybe T.Text -- ^ URL of the OAuth deep link
    , match_code                :: Maybe T.Text -- ^ The matching code chosen by the user
    , allow_write_access        :: Maybe Bool   -- ^ Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to send them messages
    , allow_phone_number_access :: Maybe Bool   -- ^ Pass true if the current user allowed the bot that was returned in getOauthLinkInfo, to access their phone number
    }
  deriving (Eq, Show)

instance I.ShortShow AcceptOauthRequest where
  shortShow
    AcceptOauthRequest
      { url                       = url_
      , match_code                = match_code_
      , allow_write_access        = allow_write_access_
      , allow_phone_number_access = allow_phone_number_access_
      }
        = "AcceptOauthRequest"
          ++ I.cc
          [ "url"                       `I.p` url_
          , "match_code"                `I.p` match_code_
          , "allow_write_access"        `I.p` allow_write_access_
          , "allow_phone_number_access" `I.p` allow_phone_number_access_
          ]

instance AT.ToJSON AcceptOauthRequest where
  toJSON
    AcceptOauthRequest
      { url                       = url_
      , match_code                = match_code_
      , allow_write_access        = allow_write_access_
      , allow_phone_number_access = allow_phone_number_access_
      }
        = A.object
          [ "@type"                     A..= AT.String "acceptOauthRequest"
          , "url"                       A..= url_
          , "match_code"                A..= match_code_
          , "allow_write_access"        A..= allow_write_access_
          , "allow_phone_number_access" A..= allow_phone_number_access_
          ]

defaultAcceptOauthRequest :: AcceptOauthRequest
defaultAcceptOauthRequest =
  AcceptOauthRequest
    { url                       = Nothing
    , match_code                = Nothing
    , allow_write_access        = Nothing
    , allow_phone_number_access = Nothing
    }

